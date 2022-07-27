Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA06C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06E2781777;
	Wed, 27 Jul 2022 07:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06E2781777
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BsPHH-ZDjD6r; Wed, 27 Jul 2022 07:24:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FEC180C36;
	Wed, 27 Jul 2022 07:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FEC180C36
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADC291BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8804060ACF
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8804060ACF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qqNxp9dXiZKz for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:24:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31D5D60ACC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31D5D60ACC
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:24:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EBFBE1BF205;
 Wed, 27 Jul 2022 07:24:13 +0000 (UTC)
Date: Wed, 27 Jul 2022 09:24:12 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220727092412.7fe418d1@windsurf>
In-Reply-To: <20220726214952.1075209-1-giulio.benetti@benettiengineering.com>
References: <20220726214952.1075209-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658906654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpoiyQ1Vl5rz3j2lOpWaesjzOvYD5+Q2CKWKA7f2Vjs=;
 b=jaw2IoZtjmvwCnfZK/33ZI3zy0pXtvl5v+kN9Mb0c3TQXUM8TujFjehub1zA2Qx6uGaQy0
 MWslkHqRUYYXZGOagvq+rhYLBC+VlVozNmqvSYU/50AqOhRTK/1PLUyjqWWWstEDWzqJDT
 DtcTqyE4/JmwZRSeVt2HtsfzXPYAPJ+3ZwnddSPc6auSIr9aBJij6UnFspvesYF49cosH3
 uTRgtsGSZ/4+3wYMFOAxil/hretdrCafzYfjZ6UJfRt4v70CJfyK4i6NVfE5G4PAjCUwow
 j7E25q96dDq1xUxn+jIIt/BCLQEV8ve7pr82M9c9UQ9+Ipj41XrCIpVJSCe79g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jaw2IoZt
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 5.0.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Jul 2022 23:49:52 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Since the major release changed I've built successfully all packages that
> have direct dependency to harfbuzz:
> - efl
> - libass
> - mupdf
> - pango
> - qt5base
> - sdl2_ttf
> - supertuxkart
> - vlc
> - webkitgtk
> - wpewebkit
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../0002-cplusplus-Fix-build-on-GCC-7.patch   | 50 ----------
>  .../0003-GSUB-Fix-build-on-GCC-7.patch        | 56 -----------
>  .../0004-GPOS-Fix-build-on-GCC-7.patch        | 97 -------------------
>  package/harfbuzz/harfbuzz.hash                |  2 +-
>  package/harfbuzz/harfbuzz.mk                  |  2 +-
>  5 files changed, 2 insertions(+), 205 deletions(-)
>  delete mode 100644 package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch
>  delete mode 100644 package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch
>  delete mode 100644 package/harfbuzz/0004-GPOS-Fix-build-on-GCC-7.patch

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
