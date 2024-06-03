Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA7FC25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 16:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3632B605D8;
	Mon,  3 Jun 2024 16:57:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2j2L8fx3lQ61; Mon,  3 Jun 2024 16:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7114D605DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7114D605DE;
	Mon,  3 Jun 2024 16:57:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D9621BF397
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4836840681
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqvmwQYQE2Ry for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 16:57:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18CC940654
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18CC940654
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18CC940654
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:57:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.115.134]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVvL5-1s3tRg3CDd-00RqQG; Mon, 03
 Jun 2024 18:57:02 +0200
Message-ID: <ec99ecde-ff6e-40c6-9622-f4440462a026@gmx.de>
Date: Mon, 3 Jun 2024 18:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Athaariq Ardhiansyah <foss@athaariq.my.id>, buildroot@buildroot.org
References: <20240603074049.28426-1-foss@athaariq.my.id>
 <20240603084617.38508-1-foss@athaariq.my.id>
 <20240603084617.38508-2-foss@athaariq.my.id>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240603084617.38508-2-foss@athaariq.my.id>
X-Provags-ID: V03:K1:RrBiY+vXMwxbwPXAzTvXdc4P4yzYwwf4Fn95f1XHscAj8CCax01
 bZJDvKusqEpTEHlXjI3UJGaN4QvBfTUVi0ye3BVwet8IjhKkX5NEM6TbcjKdmCyGa4kRJfE
 1wEHhFney1DwzZLIZKaCDi7+V0VwXWmB6ChtoOYl3fMcUkMmmkRxPNO5seRVfx562d1PXW7
 En3vFTuNcEjt/O8jqp1Fw==
UI-OutboundReport: notjunk:1;M01:P0:n9gVdEULOxg=;VJYVlE1o8cNwZtW9CbTrt6nCkTI
 84uuA8g6k+z0Om7NIEA2kej8jY5BHM/vKNjc+SpOU/eaZvWc43cBzC1D73HB+P8Skt8f528km
 11kRniO6HCbX2gATncXGoDRZLTSYNGMNODehuvKtmthFsK+bxq8g3n7pU25AlFR/wVt3tQyQC
 Nq9yk0AiNjwCJTabNwCEuDGooF02kKopY8UxOOptdElAnl75hfT5W/LAJ9hPcvG6AKZpNJ7GQ
 m7CGMTLIWNZIu8A7CmqIVy02h025kfjhsd54DegqBXydqdHTw25ZMvG+K/xnI8C/pPHcr0gjW
 jVvqr3TtoMuSB8scA7EigbSNncGT2hCDLDKtEc/gsAu06o7vPJkkG4K0xTT68rJainpmRG0fg
 HeCA3CVw7Om2uTDDdkeDIVBGzfXzavV1dVYTvql6ulXPJtzOV6vMxgjeNC37+yiQZ9XhSE5mV
 hZUjzemq8MexIPtXGiwg4q9LImKJprQuyQaCtkcv0wSjKRHCwKtOsS3j4pHEZ13l9mDdUL3vg
 iSgtpRhJrCY3/RxvKFkXXqGLvymQGUY7D83Tqqs01WOnz7bn1zX4REst8F9sSnd0nLULmSGym
 Z6ly1LOGJ8SfnrgZrH4I+gns8p4poyFTa5+j78xHUaHNcMNy2/7bf47fdMJp6sPF7HjIRCqoC
 E7DbiECOBihx5k9hZ58aK7L5JwP5yzzE4t77ZHXEOVwKmGsf2+atxCdVlNF3X58rryYVFDWhn
 WFae6m9T0LJHmt52RWVJYVHJoZQxTvJh8XmM7r0nojuonKtNDifIe1Khc9b9J7apw00HoJMAj
 qJYveLOfHLIx36imiHBbP4ifOvqhJaeJWn0lNHWUbJX0Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1717433822; x=1718038622; i=fiona.klute@gmx.de;
 bh=HKi7oL2REPMjnevIDs8KzujyeANyRKQOy1SfR2gp6xY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=JWc9IJavaX5rH+NtGhUR2ZXMsAV1bRfPKCRhfKjP61nG3L8IdAUCwnGSKe+s/lcS
 7kfYTC8XyY1ziXjXmPH1aFpCJBD/HhFJly0jTrHotDoCz4T+/raVBnNDuNOYung/2
 5GZSOdAvmr8WoksUzzXF2Cwd8fSOtSo4c1NeEQjb6VHNDweXnb5qCUfo7H4U37o7Q
 xZE2vqsQCks3WQY65U9Cc9ZhowYkKm7VsE67oVqZTMRZUsZ733PE6Yale/OjsMBBu
 YIZJLbpuZR0o+HU9Q80F0sJfGbFg68MSDIGWjywt9ijHS1t1LnkCHkgpPr+K8bQHW
 jj6ysQSKkiex7P/EQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=JWc9IJav
Subject: Re: [Buildroot] [PATCH v2 2/3] package/raspberrypi-usbboot: bump
 version to 20221215-105525
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Athaariq!

Am 03.06.24 um 10:46 schrieb Athaariq Ardhiansyah:
> Latest raspberrypi-usbboot package has Raspberry Pi 5 support.
>
> Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
>
> ---
> Changes v1 -> v2:
>    - Fix missing description due to terminal issue
>    - Use the latest commit instead of the latest tag
> ---
>   ...akefile-allow-passing-CFLAGS-LDFLAGS.patch | 25 ++++++++++---------
>   .../raspberrypi-usbboot.hash                  |  2 +-
>   .../raspberrypi-usbboot.mk                    |  4 +--
>   3 files changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
> index d482b0b9d4..ea53f8360a 100644
> --- a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
> +++ b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
> @@ -1,30 +1,31 @@
> -From 38b730c00f45abf324caf687b5b00662ff4252c2 Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Date: Fri, 2 Dec 2016 23:09:44 +0100
> +From e09c92d68efa4efbd48a3366f9053a4f8c275091 Mon Sep 17 00:00:00 2001
> +From: Athaariq Ardhiansyah <foss@athaariq.my.id>
> +Date: Mon, 3 Jun 2024 15:35:49 +0700
>   Subject: [PATCH] Makefile: allow passing CFLAGS/LDFLAGS
>
> -This might be needed to pass some custom CFLAGS/LDFLAGS when building
> -rpiboot.
> +This might be needed to pass some custom CFLAGS/LDFLAGS when building rpiboot.
>
>   Submitted-upstream: https://github.com/raspberrypi/usbboot/pull/2
>   Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -[Rebased on 9324fd7]
>   Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
>   ---
>    Makefile | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
>
>   diff --git a/Makefile b/Makefile
> -index 822e714..875e717 100755
> +index 4479b1b..076ae43 100755
>   --- a/Makefile
>   +++ b/Makefile
> -@@ -1,5 +1,5 @@
> - rpiboot: main.c msd/bootcode.h msd/start.h msd/bootcode4.h msd/start4.h
> --	$(CC) -Wall -Wextra -g -o $@ $< -lusb-1.0
> -+	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ $< -lusb-1.0 $(LDFLAGS)
> +@@ -3,7 +3,7 @@ GIT_VER=$(shell git rev-parse HEAD 2>/dev/null | cut -c1-8 || echo "")
> + INSTALL_PREFIX?=/usr
> +
> + rpiboot: main.c bootfiles.c msd/bootcode.h msd/start.h msd/bootcode4.h msd/start4.h
> +-	$(CC) -Wall -Wextra -g -o $@ main.c bootfiles.c `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" -DINSTALL_PREFIX=\"$(INSTALL_PREFIX)\"
> ++	$(CC) -Wall -Wextra -g $(CFLAGS) -o $@ main.c bootfiles.c `pkg-config --cflags --libs libusb-1.0` -DGIT_VER="\"$(GIT_VER)\"" -DPKG_VER="\"$(PKG_VER)\"" -DINSTALL_PREFIX=\"$(INSTALL_PREFIX)\" $(LDFLAGS)
>
>    %.h: %.bin ./bin2c
>    	./bin2c $< $@
>   --
> -2.31.1
> +2.45.2
>
> diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
> index cedc5fb7e1..1a183bf47f 100644
> --- a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
> +++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  4565314b38e7c7505b7d32a3b51b49f79c7dd5767d45b86d38e5255ae7489a43  raspberrypi-usbboot-2021.07.01.tar.gz
> +sha256  2182a6bf5ca9cd54ee3bca2d7667758ceac685fa78a3a6ae663762bde03e781a  raspberrypi-usbboot-4a3d31171769f87d919340778e5aaeaba01e10b5.tar.gz
>
>   # License files
>   sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
> diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
> index 2e4194da0b..7eef7df600 100644
> --- a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
> +++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>
> -RASPBERRYPI_USBBOOT_VERSION = 2021.07.01
> +RASPBERRYPI_USBBOOT_VERSION = 4a3d31171769f87d919340778e5aaeaba01e10b5

This commit is (as of typing) the latest commit on the master branch of
the GitHub repository, not version 20221215-105525. I sent a patch to
update to 20221215-105525 in late April because I need it for certain
CM4 devices, so I noticed the difference. Including RPi 5 support as
well makes sense to me, but the commit message should mention the actual
version.

Best regards,
Fiona

>   RASPBERRYPI_USBBOOT_SITE = \
> -	$(call github,raspberrypi,usbboot,v$(RASPBERRYPI_USBBOOT_VERSION))
> +	$(call github,raspberrypi,usbboot,$(RASPBERRYPI_USBBOOT_VERSION))
>   RASPBERRYPI_USBBOOT_LICENSE = Apache-2.0
>   RASPBERRYPI_USBBOOT_LICENSE_FILES = LICENSE
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
