Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63F8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 13:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24F58404C0;
	Sat, 25 Dec 2021 13:49:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dEydrioKlOgg; Sat, 25 Dec 2021 13:49:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A40D401C5;
	Sat, 25 Dec 2021 13:49:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1B2D1BF5A9
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 13:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBA8D401C5
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 13:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpMzy8cEN0ij for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 13:49:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5ED640166
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 13:49:51 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id x21so24593995lfa.5
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 05:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fmdbkvp+87FIDVBsfUfYEz6G4SS7K5+o/xCTUW7Kq/E=;
 b=C8vekkn7yy3t1wwLKyq0PVk3ra/KLUOSXq++hAmMaroALgHWQYmoVoRaFPI6pil0/Z
 nc3ZQuxS2vx9CLbKdQHM1VZ6xuoNI2deasF81a6kDUVvH9nx5w8KDuvyZM1zIPunQqbV
 Unc4G5Sozsak//Mzrn7NOW5vYy4KRKNk6Lsq37k4H2lRaE5xdCG+4R+Z1l+sab+pkYgl
 yu63BJFWiTx2X8ql8+pxxtaS4vrMYevkBxX/SdI+y6vME8UsZIljXAjXaGGwaNXq8io3
 3DAY4Caa4iwkE7CAvTbLu+Wgqey3Mfzxa/MIv3DqZewDMEnNKDN0g/2ydzVaEnS2XnJH
 9L6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fmdbkvp+87FIDVBsfUfYEz6G4SS7K5+o/xCTUW7Kq/E=;
 b=qb7WRLo+S5dfAjTCME2YPJreuVPmeozeubDZCe6RhSeOUqxq36LBTRIG98Fv9vfgZ/
 ctbn0VVmRc/SvX34T7jngHyl6GQ/9U0CxDWr6yvF9sWqO+SEdset5KFVbNH6Cjv1uc6j
 d41Dr1yuIyX02sfKObB0SrtrS3+Gi8s5K4N9DtpFGCi8KmTXqVnk1HuYzOazCOqNp9uW
 ibKn1M+NNV4eGjpf+r/m87hAD0HhQU77njifhiM7WkOyeLOero/l1Ogs67U1JU627jD7
 3DFiQitqOPhGBCGT+59peU16GiYqDf8eKQ8oyWfdcUf5jJlnkYsu+o4yBTGLrz5XTRZz
 8dPg==
X-Gm-Message-State: AOAM533U5Y0EFZjFL4kxArbWPimBtWfFQSjwoSEfWu++CQ+tvtuyDZRY
 UZuac2qiwiu5kBQhIrM25jA=
X-Google-Smtp-Source: ABdhPJxW6d3Hu+sGX3LyNbjMwnL9tGO7rhEZlT3QSQRzd7I9Az5qD8c57nhHiaY+2Jb2uN3ZVrI6/g==
X-Received: by 2002:ac2:5388:: with SMTP id g8mr8430004lfh.64.1640440189643;
 Sat, 25 Dec 2021 05:49:49 -0800 (PST)
Received: from curiosity ([5.188.167.245])
 by smtp.gmail.com with ESMTPSA id u2sm1109676lfg.300.2021.12.25.05.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 05:49:49 -0800 (PST)
Date: Sat, 25 Dec 2021 16:49:48 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <YcchfJG1EDtyepcy@curiosity>
References: <20211219142035.6220-1-peter@korsgaard.com>
 <20211219142035.6220-2-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211219142035.6220-2-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 2/2] board/*/genimage.cfg: use
 partition-table-type = "gpt" for genimage-15
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Gerome Burlats <gerome.burlats@smile.fr>, Michael Walle <michael@walle.cc>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

> Genimage 15 deprecated the gpt option and now prints a warning when it is
> used:
> 
> INFO: hdimage(sdcard.img): The option 'gpt' is deprecated. Use 'partition-table-type' instead
> 
> So change the genimage configuration files to use that instead.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

...

> diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
> index f51ce3f854..aee9719ae4 100644
> --- a/board/orangepi/orangepi-zero-plus2/genimage.cfg
> +++ b/board/orangepi/orangepi-zero-plus2/genimage.cfg
> @@ -13,7 +13,7 @@ image boot.vfat {
>  image sdcard.img {
>  	hdimage {
>  		# for root=PARTLABEL support
> -		gpt = true
> +		partition-table-type = "gpt"
>  		# default GPT location conflicts with bootloaders, move it after
>  		gpt-location = 1M
>  	}

Build still fails for orangepi-zero-plus2 with this patch. I get the
following subsequent error messages from genimage:

ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type

After changing 'partition-type' entries to the appropriate 'partition-type-uuid',
genimage complains about overlaps:

ERROR: hdimage(sdcard.img): partition [GPT array] (offset 0x100000, size 0x4000) overlaps previous partition u-boot (offset 0x2000, size 0x102000)
ERROR: hdimage(sdcard.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.

It looks like new genimage is able to keep track of partition table.
IIUC this can be fixed either using new 'holes' feature or just updating
size of the bootloader file. For instance, with the following patch
applied orangepi-pc-plus builds and boots fine:

diff --git a/board/orangepi/orangepi-pc-plus/genimage.cfg b/board/orangepi/orangepi-pc-plus/genimage.cfg
index 7c3b4cd746..8930adfc2a 100644
--- a/board/orangepi/orangepi-pc-plus/genimage.cfg
+++ b/board/orangepi/orangepi-pc-plus/genimage.cfg
@@ -15,7 +15,7 @@ image boot.vfat {
 image sdcard.img {
        hdimage {
                # for root=PARTLABEL support
-               gpt = true
+               partition-table-type = "gpt"
                # default GPT location conflicts with bootloaders, move it after
                gpt-location = 1M
        }
@@ -24,11 +24,11 @@ image sdcard.img {
                in-partition-table = "no"
                image = "u-boot-sunxi-with-spl.bin"
                offset = 8K
-               size = 1032K # 1MB - 8KB + 16KB(GPT)
+               size = 1016K # 1MB - 8KB
        }

        partition boot {
-               partition-type = 0xC
+               partition-type-uuid  = F
                bootable = "true"
                image = "boot.vfat"
        }
@@ -36,7 +36,7 @@ image sdcard.img {
        # 'rootfs' will be used as the partition label, used
        # with root=PARTLABEL=rootfs kernel command line
        partition rootfs {
-               partition-type = 0x83
+               partition-type-uuid = L
                image = "rootfs.ext4"
                size = 512M
        }


Do you want me to send this orange-pc-plus patch separately
or you plan to respin yours ?

Regards,
Sergey


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
