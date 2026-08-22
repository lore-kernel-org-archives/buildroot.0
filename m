Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E97C5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 22:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2ED96071D;
	Sat, 22 Aug 2026 22:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atxUk7BLoxol; Sat, 22 Aug 2026 22:19:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787437165;
	bh=GqVL3+/i2cs265XtoqVgw5+W6YyRn3ZCPCDYOvWTEWU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W9P6PvrhhWI7o/TgqOpBlMqLgFRn/AInoU2R+zMv4uXuwagmibXtR4vFJZeD2YgpA
	 PH172oNwFSFYdYR4BKT/739X0KA8mYSgxxRDtJCgy3V09ic79ljrnN1/Elv/wHLhPw
	 nRIciPA8nlAJnX/CqkImAktF6IxK1meN5Nv3eYolLvw/5DrN0yPGkmpVjo33HUFZJ5
	 82pq7PLcGosLIAiGqCMeH3y+hzb+SIy/k/1sG/my4l8OGc3xlcHopeIF8ws/CKnMwp
	 gx5oKDW/oZZtUiZDKyk/UdPQMbEUWJGE4xhtoYx0R5P6pmL1H18s2NuF7K7PDlQnzn
	 J6CSOY533IonA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF35C606EB;
	Sat, 22 Aug 2026 22:19:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5045D29B
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 22:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40AF1606EB
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 22:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_Wc88q6MmG3 for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 22:19:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A1A4606CF
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 22:19:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 80F9C78035B;
 Sun, 23 Aug 2026 00:19:18 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Aug 2026 00:19:18 +0200
MIME-Version: 1.0
Date: Sun, 23 Aug 2026 00:19:18 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260822211311.2128659-1-thomas.petazzoni@bootlin.com>
References: <20260822211311.2128659-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <ffb4de8704f5a102b5ffccdcfc762d1b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/enscript: fix build issue with musl
 and gcc >= 15
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

On 22/08/2026 23:13, Thomas Petazzoni via buildroot wrote:
> enscript currently fails to build with musl with gcc >= 15. In order
> to fix this, we need to bring a number of patches from upstream, and
> add 2 others that were submitted upstream.
> 
> From upstream, we bring
> 0002-Add-CFLAG-std-c89-so-it-compiles-with-the-old-standa.patch, which
> switches to -std=c89 to get the compiler back to "old" behavior.
> 
> However, as this commit patches configure.ac, we need to autoreconf,
> but autoreconf is broken, so we also take
> 0003-Automake-1.12-and-up-no-longer-supports-pre-ANSI.patch from
> upstream, which drops a problematic autoconf macro.
> 
> However, once you drop this problematic autoconf macro, the PROTOTYPES
> define is never set by anything, causing the __P macro to no longer be
> defined properly. This is fixed by
> 0004-Fix-prototype-detection-when-__STDC__-is-defined-but.patch that
> we have submitted upstream.
> 
> Once you're there, you realize that switching to -std=c89 has the side
> effect that musl's <limits.h> no longer defines PATH_MAX, because it
> needs one of:
> 
>   #if defined(_POSIX_SOURCE) || defined(_POSIX_C_SOURCE) \
>    || defined(_XOPEN_SOURCE) || defined(_GNU_SOURCE) || 
> defined(_BSD_SOURCE)
> 
> and a side effect of -std=c89 is that none of these is defined
> anymore. So we introduce 0005-Use-std-gnu89-instead-of-std-c89.patch,
> which switches to -std=gnu89. This patch has also been submitted
> upstream.
> 
> With all of these efforts, we get a successful build on musl with gcc
>> = 15.
> 
> This commit needs to be backported to Buildroot versions that support
> gcc 15.x, so that means the currently maintained 2026.x branches, but
> not 2025.02 as only up to gcc 14.x was supported then.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/d39d14bbbb3a51d67fe962b877c7f66ff1204ecf/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
