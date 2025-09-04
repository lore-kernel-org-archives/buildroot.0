Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15691CA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 17:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF1126067F;
	Thu,  4 Sep 2025 17:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kB6Nafx1m4po; Thu,  4 Sep 2025 17:00:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 065826066C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 065826066C;
	Thu,  4 Sep 2025 17:00:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF761AE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 17:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE73D6066C
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 17:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kD9dE3bnVoux for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 17:00:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E5D0160616
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5D0160616
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5D0160616
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 17:00:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E3ED75FFB4;
 Thu,  4 Sep 2025 19:00:33 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Sep 2025 19:00:33 +0200
MIME-Version: 1.0
Date: Thu, 04 Sep 2025 19:00:33 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?=
 <jezz@sysmic.org>
In-Reply-To: <20250829131304.1845147-2-thomas.petazzoni@bootlin.com>
References: <20250829131304.1845147-1-thomas.petazzoni@bootlin.com>
 <20250829131304.1845147-2-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ec1719278ff2340db021e159767b717f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757005236;
 bh=0uz3SA/jmUsSkoM96t/GA02Rjs4xJnXx2euRfUpcjIM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J9vK8A/O1ovaO+fVd+3tSCe44UWJ6cQYCma6bKnnvguW6Ewd+dtPQqwhJPCvAoaNz
 6hNt8hD69PHc7f0PjCYD1Xwf/ARYyH0W5LgxbLFH3mxYR9f1nKdaLYziOlzDPs3uwo
 bE7nlMLm4BT7sNtaJKK6s9SWrbLuU8h1QOMyGfxdidJR9bkoyJfYP6QOxc0GvLey8d
 JhSdzLES1Fq8lPxfyyQSEtQCbfhOVo8Sn9Q9mULEPOFQEyr/Synw53nJhU0YD2+jl1
 7y4RDfJGF2Cv7Kg8ByaL5NB4DtgcpqTcSlAnnjYIDcQlQmeFXYY8E8r2mQrla3woyp
 Rar3odb7/HWlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J9vK8A/O
Subject: Re: [Buildroot] [PATCH 2/2] package/apitrace: bump to version 13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 29/08/2025 15:13, Thomas Petazzoni via buildroot wrote:
> We're bumping from version 10 to 13.
> 
> Version 11 doesn't really have release notes.
> 
> Version 12: https://github.com/apitrace/apitrace/releases/tag/12.0
> 
> Version 13: https://github.com/apitrace/apitrace/releases/tag/13.0
> 
> Patch 0001-thirdparty-libbacktrace-backtrace-h-include-config.h.patch
> no longer makes sense: config.h no longer exists, and building with
> musl works fine without it.
> 
> Both patches 0002 and 0003 were backport from upstream, so they can be
> dropped.
> 
> We must switch from downloaded the auto-generated Github tarball to
> fetching using Git, as fetching submodules is now mandatory to get
> some bundled thirdparty libraries (yerk).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to next (after cherry-picking patch 1/2 from master).
Thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
