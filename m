Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E4FC7115A
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 09:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABE474076A;
	Sun, 22 Jun 2025 09:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoyTHAfQfwCX; Sun, 22 Jun 2025 09:45:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F157340A6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F157340A6F;
	Sun, 22 Jun 2025 09:45:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CE38C8
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 09:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F2FB40A6F
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 09:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFbhQW7xn_uw for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 09:45:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5579D4076A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5579D4076A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5579D4076A
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 09:45:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id EA7E6780511;
 Sun, 22 Jun 2025 11:45:23 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Jun 2025 11:45:23 +0200
MIME-Version: 1.0
Date: Sun, 22 Jun 2025 11:45:23 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
In-Reply-To: <20250621191521.564813-1-bernd@kuhls.net>
References: <20250621191521.564813-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <2dc1b1f88608bc73c61034c27d726a69@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750585527;
 bh=KAeAatO5xZWbogDMZQd2HqgcApBzxCL9OKPh2MylL6E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vH6GRFa8zosb5lgJPMOkBtchSfplmtHzMgF0qbwCYPh++XUR9CtFye49QX0MGFmf8
 tRGdVCq15D7+knAQD8XkLdzepwvNqTKqlDYuv0uRDeWzPEq9V3D2L3/aOmh/6fSbvH
 ahYH888fMPxmvMX2rUBXZITrjmaA7b/o/BNnZlMf0p4+ayOVwR+pxDkkQ/52Hh/gTH
 hJB1FoevuqxlU1bIii1OeCrycWR2i/9CYnNcC8XxKaThzg773HXyGZcbG6O7qo1EJe
 l6DSQ6os8kmLuEe883XdiIUp0A261pU4IeIS4bBbskSFYYynynyRtsg6EVDtPfEij7
 zFDLdQ+P+UMqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vH6GRFa8
Subject: Re: [Buildroot] [PATCH 1/1] package/{opencv4,
 opencv4-contrib}: bump version to 4.11.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 21/06/2025 21:15, Bernd Kuhls wrote:
> Changelog:
> https://github.com/opencv/opencv/wiki/OpenCV-Change-Logs#version4110
> 
> Added comments to both packages to keep the version number in sync.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
