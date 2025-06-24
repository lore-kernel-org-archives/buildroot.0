Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8CDC77B7C
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 12:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB40D60BF1;
	Tue, 24 Jun 2025 12:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHJczBeBZfXy; Tue, 24 Jun 2025 12:10:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E99B760B36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E99B760B36;
	Tue, 24 Jun 2025 12:10:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CAED767
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 12:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19469820A7
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 12:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xyD-JO2Kbc4M for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 12:10:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC1D681F10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC1D681F10
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC1D681F10
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 12:10:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.116.4]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWics-1uEjbv216G-00VdYQ; Tue, 24
 Jun 2025 14:10:19 +0200
Message-ID: <ff205425-ef38-4e02-beff-46394b51801d@gmx.de>
Date: Tue, 24 Jun 2025 14:10:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250623215546.1850256-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250623215546.1850256-1-thomas.petazzoni@bootlin.com>
X-Provags-ID: V03:K1:+odlAGfyPlmkZWUEspzTLfX3FNmdyXP10fU3O9Wkoxw9ONIkTHq
 f6vyo2gge+zu7bnemmWCxUHX7aAShtdNKmQH7yk8AqKVC3B1AHfoEjfowmOPNISy0DFtAFx
 pEH2mjyd7Kgl7oFCuUKxigZAo9iaBGBU3d8WmWt1ZFzvkWXZY40hY+3DxbaPa1JFFuJt78/
 ilAp0Rl5g0s0GtYGu7DYQ==
UI-OutboundReport: notjunk:1;M01:P0:E/OtrGbeq2M=;nqGN10ucBT+iv3siWSx3ZktjbdW
 HKTJmDnLDO1PMAMrm8E44R5la5FRqIFJu5z3a7aA5lC3384hixvyjSeGMBihAQeD8t0cExqCe
 +JKlkMH+6/0uYmPnSkO9Kf9qfr2aSY1Nmwb384RQMUhpQIas7G20mN0ZdzCCV8PQNF2+nocMK
 s/UJE81SSkQ0qtl+S4MHI9OCou0B5ixQyieOet16YWHW+ykYHs+YrO+wd+/gV1bogDb8s8mk/
 S7RR/2/HbXdfajQolgCuStDJxQBW+8XldFo+sZ07xSCRwOyaTPCBTbD/U0OMhkocZ572ZyloX
 4bpzv7mkU3Iu5liiKjUzToAD21D4yx+KLQf0FvbgB33Ub1/Y8tlq0RcDYTEwWOWfGr3Ww7x+0
 4DGZ7Zly4uuV2sYhogiMpb5jNXpBq4FSgGRgP6t21lkqmaIz2MDHyaEvUSmRlcB97hCrmoXAX
 aj37aojpGZgYbHpeXzO+KeBMOriF9czy6R6I22edfe6HOM16Elm3EjoDiZaexWkYBfXy/ydAw
 VCUrUJXkyinvpnnYTURSAM5nVL1yfkp+KAlB3P78WzyXCz2dGOkz1qG/JNa9KCiRQkF2kRef3
 L7gsqBYovcdavHzKFbz8F9xRaFpViMRHUYDBkBDgTsG5cfU93q8lpRvcLPuYwx5lGtDlIL33q
 37i6iryhYU87CElMCaM5qPYPAElyaUI9kYtGHowwT3rBrlOMKvGr6Ym/nSpLrBOvNtcwbzC37
 1SE0714EziUKQbZEWfTaKljTEh9AOZZZMmYcmNiS5SxL3Y//aVGfHsIoYypPOonvN4jx3jVVb
 Zh3yLlAq1ylWhwhcOwTtwuqNHq/1cxGuZi/89nKrc7rCbLW5rDEmHm/Hbdaa1KGcFlN/O4kYJ
 K83Ow7psy6HmyQHJRiMHf32kntOdlO9SSE2aazqI8fo2sp+uOgDUSnEC7/oJHwF7ATyNFHB7B
 A/PuoKgSBx6qLcteBGG3Tcx2psg2A9MiyD8zGi6ZK97s7TR/1fww4w1VwZbYAnjNktRnSeh8E
 P3TR6H+ZSi4rEQuLLHP1b7hqPYykMqZkkP4cRCYdM3IX5cpCryUJg5Ri+YV80rP9+8/5v4FIo
 JbMgjcSsZKQ0tCsvUrosGDH2V4UUHEI6V4QpsLo5E0tiyGle7c23lpqfLsFPQJ4LMjN55FE13
 b+Ea/HP3CwL+5N0gQ9ftaBH0z4vXkye3jUzmtCNg2foNMKCNbMVV5RfCWBQkfGJPb64Do4mpR
 gSSnlGBEdQRtqIxggRpOzuNxmVySN9jdv+zbdij5i8bJHSrfyBIB9orVxKgce8YBIMpj8bLgG
 3/534fXlFQPWN/S8DHYDWeNSYPW3l91pO7xovGbemTDp3O9CC1N0gR1oiP38KYvic4er/MzNn
 B6St+gZr28L69LOUyKcJvPLaDe/Z16684pZCNR9T4ryoSO693KngG5cTMf4lKca+Zh+Tn6son
 tiTjlZqcOH4hJWDBsMhAR7d16mUxLSQkkWsEvuNXsaIuMV8q634HWA99hpGYkU/qlBQv4f660
 6pNOYP0vWCsPu9mBHN++ZFp4sb54hVtrXH1/N1i5pF7MxO3SMOEY5HOxsO7FUCp+xGGEE3qMr
 LknSbU0bkoAg2pQSuO3WDRe1RNCcKlNPDUYz45x5pXC6H3xP8wUEpkrYgW9K3cfxcakQA2COw
 8+UzRJxo2DqG1+DmFFu59vZHpGR2l/50V9iJFPG8cbCzKnxdrtvOn8TeeUVYSNu0NzTRrdzTH
 KiC3D7ENmduU9CLD0WP6sE5aUOJNcdzWWfGgghghSYqU0KpW89gJCAUcnk/V6DciB0uliALSG
 L6jUna6iroIiQNa5E3rcfgDc1BuW+LmP3XTBQvjN9kFHIzF+pdvnkm1b8+9b44w3RIspSl5il
 OlwcueMgD8P3pvcxSZeWjThvsPgvGo2drvfHpFfttEXG7dIuQSyG5BT33jDsJIbl8adY2KFde
 WTXOgCKTFEpQDjZGjtQye4WYS+bhJy0UQewdh2Roy2D+UI+ypnTsctzEgRqy8xUVUjXK+VSmD
 bqX7+8JYahi/X5j5MpYkkh7e6LihlMrvTArA4lTuFEDAlCz44IOy8iuj8EEIkRp+DGw9AZYt/
 7lpMvApQMhwTSNNj1fExU4hkgbenUZdeRqzITwB+5arZ8g3XdIQciaTTwvjpgVW6NWrGlRxSA
 BD7EXDFU//3KVFqKHpF+PY1K0mZVigyqRzw0KJgtR+XAUFR6X4TW76Mb9iVmYWI6jyIEQTgbH
 PSKm4yv0bJ2VTYmxCf2IQmm3YFBzfrNxHEEOy4Cdn19mUlE8KktDctAYoPNWRfDY3yWJUH8qZ
 NjimWlduWV3SyBJ2mP/Ndj/Fq7Nqogz74esiEYBDc1L7BK5UNoQq424aBvAxwSsIU9gbN8WK5
 Zop0ymCZfz+iLjXWYyiGz53DjH9ZPbnZy4vH4fJzBoDY1e8BtBk9Dlji23NL0oWIhRQLWs/i3
 r6YutQ0Gv1TcJiun42oB8L9u/n4a8oFT9ot33ZKp7kawM+0ZioZRkQYNJiZ3w3fa4vRgIL+/n
 LTbkbVUOxILA9wIheJWiLhB1/8modJPkopx9HuX/6pK3dGU+3G0cOLXeJXj3lh47GfJk6Mvkb
 4+f44NrFBuvMIm13AJ7rbjdvzdcJWjt2qzLlKinES68SJURwmAJvpOike8HTd9l+0YCs4BLlQ
 QqRxhFdmBuJ8LELZ3Na/TGsLvcgh8RYZJKYJ0ZipQ2/e8v21RjdIPOg1KNKVdZ/vgWtFNGjre
 D16Y4fPeQAtXhUFPrdyNLBgJsUs/fYxTRRT/YNVIXp3eJv1bKs5M0lVi5YsPO1WPHGSgTfods
 JrrLX1LXUPAiXIBsR0AR5RF7LSdfmGlZyB5pGzJyNn7CLcA3+5ThfLSh18d727hiYiGroF5Pt
 EkLWiKsZdXZ8iO12sMdt3GD+L/edutib3txrSbPDqpFzKGiUtRNt2nxHoyXQQiPbn/tf9VtHQ
 0F3rMpwbhGVOf6EBdGd/d+4cEb7d53o8NTSxKvhhI79Iu1wcakDmYcJ6vI2gIKQwh33nuEe4m
 HWmFjOiVGA33ibFNqJ2qmVXNq6iGsUzZzbeLfGwfWTA1oFMYD8r6uREJlaw9rl1PqZgibzhGa
 ww1JNDKmp6JbHrxtKVnQG/NBB8nTSD5o8OcnOFwzJdmUBb21bJW1MmXTWaMLOjBNUueU5F6Te
 w8K4PmOJJbdLrfZV3+tShoUjAhnperzD5bwpqzMFGFuIwfh60aiea1ZQqFVDFRZGh8f9buoLz
 z2PG7nWtLJfIbXwEelCg+0DaFt5g2jhI7Bgz+oG07NdexPGW+QJSEPM0VTNf7k1rklDSsnsSr
 BziIyE8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1750767019; x=1751371819; i=fiona.klute@gmx.de;
 bh=uwmN+tQYg0KGZz2yiIw7Te15tB1D0i2HLbcEgKn1Iyg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=WFwgqtHCIdhJgxwNGWWOPT5G+nkAqH5YGa/F2Qq97mCd79fLibEbp9lUZO5TYJVs
 VdJ31ElTaVAKem9wH3PjTaXmgfHi56JgU3G1a4m3unbSyhY4Ymd7Y/XHjhOWHJdbc
 u1mfX30ziAOh0PPYBdAMhom1jBSJACvByxJiDNAzhO9LZhBrCJiuN1aE4/t1RuI2Z
 OHeutrDpuR16PCUscnapF15V9vdPya24pRJXwmPyh0hQecGdcWpCZDH7hzZ07LdmA
 gAXt+NEj8TU5d9v+l34aiFZw9TC3VLIA97lKk1daLI6jN/vNmVDoTcKyY+cKFrhNJ
 uGNT6wSL4DGtaaLBgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=WFwgqtHC
Subject: Re: [Buildroot] [PATCH] package/squashfs: bump to version 4.7
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

thanks for looking at this update!

Am 23.06.25 um 23:55 schrieb Thomas Petazzoni via buildroot:
> See https://github.com/plougher/squashfs-tools/releases/tag/4.7 for
> details:
> 
> 1. Mksquashfs now reads files in parallel from the input directories
> 2. Rewritten and improved help system (Mksquashfs/Unsquashfs)
> 3. New options for building reproducible filesystems (Mksquash/Sqfstar)
> 4. Elimination of "fragment block stall" and -(not-)reproducible options
> 5. Other improvements for Mksquashfs/Sqfstar
> 6. Other improvements for Unsquashfs/Sqfscat
> 7. New environment variable SQFS_CMDLINE (Mksquashfs/Unsquashfs)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Building fails with musl due to missing includes, upstream already has 
patches for that (both need to be applied):

https://github.com/plougher/squashfs-tools/commit/b6e9f4b62cc3e762ceeddc0fc099f7d65f7b7361
https://github.com/plougher/squashfs-tools/commit/05a895b3f996d1ac157d95b04980f5f047e7dbf7

I also noticed a bug that blocks excluding files >1407 KiB when building 
a squashfs image, which broke building a certain (intentionally broken) 
test image for me: https://github.com/plougher/squashfs-tools/issues/316
It's easy enough to work around by filtering the tar archive though, so 
I'm not sure if it needs to hold up the update.

Best regards,
Fiona

> ---
>   package/squashfs/squashfs.hash | 4 ++--
>   package/squashfs/squashfs.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
> index c921d638bb..5593502836 100644
> --- a/package/squashfs/squashfs.hash
> +++ b/package/squashfs/squashfs.hash
> @@ -1,5 +1,5 @@
> -# Locally computed
> -sha256  94201754b36121a9f022a190c75f718441df15402df32c2b520ca331a107511c  squashfs-tools-4.6.1.tar.gz
> +# From https://github.com/plougher/squashfs-tools/releases/tag/4.7
> +sha256  f1605ef720aa0b23939a49ef4491f6e734333ccc4bda4324d330da647e105328  squashfs-tools-4.7.tar.gz
>   
>   # License files
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
> index f2cb0ab25e..f3c72e068b 100644
> --- a/package/squashfs/squashfs.mk
> +++ b/package/squashfs/squashfs.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SQUASHFS_VERSION = 4.6.1
> +SQUASHFS_VERSION = 4.7
>   SQUASHFS_SOURCE = squashfs-tools-$(SQUASHFS_VERSION).tar.gz
>   SQUASHFS_SITE = https://github.com/plougher/squashfs-tools/releases/download/$(SQUASHFS_VERSION)
>   SQUASHFS_LICENSE = GPL-2.0+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
