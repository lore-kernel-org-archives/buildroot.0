Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67405C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0CF660B70;
	Sun, 11 Dec 2022 13:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0CF660B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0CQIDxzMav2B; Sun, 11 Dec 2022 13:16:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21C1B60B21;
	Sun, 11 Dec 2022 13:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21C1B60B21
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E87921BF2BD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4B9160B21
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4B9160B21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5aS4wwAZdZm for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:16:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE1ED60B06
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE1ED60B06
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:16:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0AF2AFF804;
 Sun, 11 Dec 2022 13:16:19 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:16:19 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221211141619.5f163c25@windsurf>
In-Reply-To: <20221210174950.46867-1-fontaine.fabrice@gmail.com>
References: <20221210174950.46867-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670764580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zvq14++kb3FxLC89jJ+6E0JK7oJXJIu4qRQXq0ObYuc=;
 b=Ti0a4vUivnypIKrdWuE8eAgLm5XX5cqEtawbbujPhUDYBo3gf2b/KD5lC1VmPhiOTxW5Qu
 l7RZ9eYhUqYmr4NAnCzDPA4mA3221dMXg2WF8J6dbqFtGegGWCEk/9v9JGbhHU9DRwfwpf
 pJNKf05N10V4G6OfSFAtjdM8sXFMx71BvcNjJyZ0H77YTu4jAPru6B3s8vJ/4g/1ejCCxL
 HRntkgZdHGWuIa5zRIj/S9hdlr9yibVIUmXZkpRQE48fStbSOadNh8hCXM5K1l+ryUj6Gy
 3Z6aaCzQ5ZLkNueKLoSjmpGbLTddA+vShMcL++OU/NvEmzX2mPENHSqixaqZHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ti0a4vUi
Subject: Re: [Buildroot] [PATCH 1/1] package/exempi: bump to version 2.6.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Ilya Averyanov <averyanovin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 10 Dec 2022 18:49:50 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Samples can be disabled since version 2.6.2 and
> https://gitlab.freedesktop.org/libopenraw/exempi/-/commit/a8db9f4e7e4156ee7e52def01f1f83ca5fa7de40
> 
> This bump will fix the following build failure on arm with gcc 10 raised
> since bump to version 2.6.0 in commit
> 55f1d0a3592253df2a356c195e5131a970eade9b and
> https://gitlab.freedesktop.org/libopenraw/exempi/-/commit/0872e35a30457d2ecf746a1bebdb7d94636d0e2f
> https://github.com/adobe/XMP-Toolkit-SDK/commit/0872e35a30457d2ecf746a1bebdb7d94636d0e2f
> thanks to
> https://gitlab.freedesktop.org/libopenraw/exempi/-/commit/f26d77ba26a7245a95068bca2eea9608f4e79f80:
> 
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../XMPFiles/source/.libs/libXMPFiles.a(XMPFiles_Impl.o):(.rodata+0x5c): multiple definition of `typeinfo name for TXMPMeta<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >'; XMPFilesCoverage.o:(.rodata+0x0): first defined here
> 
> https://gitlab.freedesktop.org/libopenraw/exempi/-/blob/2.6.3/NEWS
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c440719de02a154c6bdae11bda06ea30c131c71d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/exempi/exempi.hash | 2 +-
>  package/exempi/exempi.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
