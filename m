Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3008C54ED1
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 09:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E3C1844FC;
	Sat, 28 Jun 2025 09:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZuPCAv46G7D; Sat, 28 Jun 2025 09:31:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B561C81FF5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B561C81FF5;
	Sat, 28 Jun 2025 09:31:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 869131C9
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 09:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 788C9400BB
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 09:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 40I0RKXrrpuI for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 09:30:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 35420400A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35420400A2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35420400A2
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 09:30:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 370C3B00548;
 Sat, 28 Jun 2025 11:30:52 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Jun 2025 11:30:52 +0200
MIME-Version: 1.0
Date: Sat, 28 Jun 2025 11:30:52 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250627145819.432279-1-giulio.benetti@benettiengineering.com>
References: <20250627145819.432279-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4bc76f52bd841425e2a46a65412d2837@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751103053;
 bh=APhoRJouC2cqplZqnpcXklWNPsNTIKdXHteU3AtBrok=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qAFuQCdGVPdoG6wszEoDi0yaRpx2wOhpa0kqDGupe3JJCpRm1zNhs78s//LiPLoQ5
 DTPeuMCbqCViING9GfHsIHX2CZS5PFdPde9FOPImjXitBBrNLySGlZ6bjvtgI9bBL4
 X6YKJAQia0YXD9FCw3hmtdIy7G4Qw5bLd7z/xCpycgGPimUGsSTjC3BrcGg1lDQRyT
 adVocZrZ93xqoWWyavP9s84r//oyutHVI96hOf/mYTyYcuhqu2xkYaCd94AjPp/HCE
 qh13aTWXBYoXYrEDyHUd1LCwJjtKz2ki/ZMn9T/PDfMVO05aRwH9qwI6l19KniLOee
 m7gBIpSQXoY9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qAFuQCdG
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.0
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

On 27/06/2025 16:58, Giulio Benetti wrote:
> Rearrange license files according to upstream.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

For info, I did minor changes. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/a717d998038262fbbdc80ef2cbb3e7ed78ea1c66

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
