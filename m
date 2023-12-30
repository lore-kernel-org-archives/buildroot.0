Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87958C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4453C60A7D;
	Sat, 30 Dec 2023 18:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4453C60A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2as0bA32V7c; Sat, 30 Dec 2023 18:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73D3060F24;
	Sat, 30 Dec 2023 18:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73D3060F24
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DE7D1BF2F8
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7751681B7B
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7751681B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N1ZBORBxfQTY for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:01:08 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64E8181B71
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64E8181B71
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78A3B240002;
 Sat, 30 Dec 2023 18:01:06 +0000 (UTC)
Date: Sat, 30 Dec 2023 19:01:04 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231230190104.741dbcda@windsurf>
In-Reply-To: <20231230162111.349884-1-fontaine.fabrice@gmail.com>
References: <20231230162111.349884-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703959266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4dmNb/fe81APCiAdNgLyxilqaG3IFI5rD7aK3BTu4U=;
 b=izJnRB4t6sS/oPAiXNG4G+d6934ed3/BaP98/nPLBcuhkGqZEC3P9gCQXmH2GUYhHnSJ0/
 4ySbUrM6RhO7Iwsf0Da1xrZjS68YBHL+BAjShblY/rjXjQ7nbDQ7psPx8zd/cddjKCGR4Z
 bDkmXn0KXOrH517yNrf2jx78+v65ZudAwrRdA+4SPvLYLi3bZKFglaQi/o/C+IzWSUtuvr
 Pw7lLV5ZtEYwR4p+1rYHlgOIgyGI6lWxwlYxrnyAWVolbCmjyQrx41vxhhT9iTHbpGpFmu
 qPTRJxnK+JSmRVaAVSQJbXaV3AELS3N46tJMD0xOmiHq12WR1dQ5ZVh2VkkfCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=izJnRB4t
Subject: Re: [Buildroot] [PATCH 1/1] package/catatonit: bump to version 0.2.0
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 30 Dec 2023 17:21:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop first patch (already in version)
> - Update second patch
> - License changed to GPL-2.0+:
>   https://github.com/openSUSE/catatonit/commit/fe191ef859c6365d44a4d7f4ac9765dee825d78c
> 
> https://github.com/openSUSE/catatonit/releases/tag/v0.2.0
> https://github.com/openSUSE/catatonit/compare/v0.1.7...v0.2.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  1 -
>  ...e.ac-call-AM_INIT_AUTOMAKE-only-once.patch | 41 -------------------
>  ...h => 0001-fix-build-with-kernel-5.9.patch} | 15 +++----
>  package/catatonit/catatonit.hash              |  4 +-
>  package/catatonit/catatonit.mk                |  4 +-
>  5 files changed, 10 insertions(+), 55 deletions(-)
>  delete mode 100644 package/catatonit/0001-configure.ac-call-AM_INIT_AUTOMAKE-only-once.patch
>  rename package/catatonit/{0002-fix-build-with-kernel-5.9.patch => 0001-fix-build-with-kernel-5.9.patch} (83%)

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
