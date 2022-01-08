Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79246C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30B0A81433;
	Sat,  8 Jan 2022 18:04:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j_HScRSIATsx; Sat,  8 Jan 2022 18:04:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 518AA8143A;
	Sat,  8 Jan 2022 18:04:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 89EAA1BF95D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 748B760804
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w2NP0sRtrGpI for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:04:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC22E607F2
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641665055;
 bh=YeHNxb7/BM3kb/9IyA6+iKIJ0RkKnSJcynXGTLJDlgY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=MNB1YtTVa++zgncv7lsFOwKLfRFWk0/rIm1PMDt54ZdWxrVui7b4MNKe/bSo0deO2
 rnG//GucAs6coymTF40hTEM/YjX9jTjh8s10oRwxPjbstdGXHqzsBg5MovxbmchaJi
 uDkmgayJvv2KiOtvvwchOVEHf8Nup9ojsqd5M9O4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.8]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDQiS-1nGkCf06T8-00AS5S; Sat, 08
 Jan 2022 19:04:15 +0100
Date: Sat, 8 Jan 2022 19:04:14 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220108190414.6b638ea8@gmx.net>
In-Reply-To: <20220108162146.2735403-1-fontaine.fabrice@gmail.com>
References: <20220108162146.2735403-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:qR7GLyfhEDEoJVYsaOZ8UZlGpdCxMXRMeB/385XxuxCA00TKRfe
 yS/PQqQIBxZyrtPFdkT4h2Y6cmCuR/OgjPlxeB6GHextYoHAi+6Oz7/GhDneZgC37mgC/GA
 vM5oCol0GILtHHmBQJtim2juXMRYA6+ngFougwXM6JjdiUotFCHm3BcSl3z11M7RXARtgJp
 8puQOqkSOlb9ldMwedCTg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d/lKxS4+rA8=:U7bWntDnZPHRjiN15m6Pwh
 FuiTAzZCRKZk8sOF2QAST+b92GGnzVle/jHpE6t+Mur+WbaFf3Z3RIrFkianopPsIASqdKEwx
 XtPz7tL9YwOqSMvG/3FwtYOhjnvTGluoqKM8/Rtbq5L3+JQiBDwDaVrl5op6I5ALpEUz+tPb5
 6eCg29991YnpBkzlopJ8DiLgtsMfLuNmlC112UFMBazzFEv6Tgi8SPXgaLObSN3YjxuUmTcI7
 1JdErMn0I0mJy3m8MAk0Q5adm9yfRzI9zudo3aU5kF9F9CiqOwUcOjdhLikHt38Fu8+WzQtOg
 tPxxPS76UN7x7Af4vJ9hgiugrdxATmtw26egURZChd6o7tN2+O8OvJCOiAh+fDUTi7qkgl0y7
 OL331YtyTOiE5evH3o69p6D1B5Ocwg7Wj6rSjhIKXmdCIFTE2w25BbkAfU0gI7b8xh0y6IMZa
 FKb7VejvQcS0lAcK1JKr/rKSxSscXY5DtQHSQYvpKCuxtDSBEan37+RRbSH0F0etDjw99f1Pw
 8MSRQkJQYxX+yBTK9L5v4GwoT8FNovQ1AjbrqBQaYZKem3SvvyLJCkCpFDHCVZM2QSscZ5pjm
 cETGDKBmDhULP23HeyleRl/bkrDwEurBm1X6gGehg0FQc9ibGdYv3CT60hFEUD1ou0/2MoQ6c
 yu+kkTlDBCWuzsM1cLhQlLagj+qozflonI4Rdmigep2v2IXh4e3BL2a/da3qkGDJvA8XqvjC9
 iA2S+Yb13PqDTyyMzLCrPfhqqLvJwNZtHv860LZOl+AeIfwPwjHDkG9BgU8WoU7KTfuQhDWFo
 y2iv8NWNDRLMNOaoh4W9KE2XMKeDueNvMYNzhhKGq2iMXDdKu9T5EM7i+yobIB6Bez5mHqJlY
 m8dXiLDloBp6lgnGqq1y5EYP23t91KHbOIp85EOcbayTivPMHfRE02+rhohKkgm1nILjUQxhW
 4cKHB27VI9DRzLc8mjhE4YlWF1HqgT+VZemJQA/KyKlGFUGNiGwT961vlzWY6vL6boHxveO8P
 vlZsCHAhhGtj218m+tj3aNhtrrP/pNBPZcfD/aSrTTLZftCbCHdKbsLnTlOOyPpCvo+k/fKIB
 H1O59zRX3orfoE=
Subject: Re: [Buildroot] [PATCH 1/1] package/raspberrypi-usbboot: bump to
 version 2021.07.01
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sat,  8 Jan 2022 17:21:46 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/raspberrypi-usbboot/raspberrypi-usbboot.hash | 2 +-
>  package/raspberrypi-usbboot/raspberrypi-usbboot.mk   | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
> index 3f66b12ff1..cedc5fb7e1 100644
> --- a/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
> +++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  e4a07df05c23e0eba100d4013367e7823e3b8bc72da7b79b031bd346616c6ae5  raspberrypi-usbboot-9324fd7034b9d3606aed8a27da74d6d57e066e7e.tar.gz
> +sha256  4565314b38e7c7505b7d32a3b51b49f79c7dd5767d45b86d38e5255ae7489a43  raspberrypi-usbboot-2021.07.01.tar.gz
>
>  # License files
>  sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
> diff --git a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
> index 5d7b433c64..2e4194da0b 100644
> --- a/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
> +++ b/package/raspberrypi-usbboot/raspberrypi-usbboot.mk
> @@ -4,8 +4,9 @@
>  #
>  ################################################################################
>
> -RASPBERRYPI_USBBOOT_VERSION = 9324fd7034b9d3606aed8a27da74d6d57e066e7e
> -RASPBERRYPI_USBBOOT_SITE = $(call github,raspberrypi,usbboot,$(RASPBERRYPI_USBBOOT_VERSION))
> +RASPBERRYPI_USBBOOT_VERSION = 2021.07.01

	$ git log --oneline --reverse
	[...]
9324fd7 Add native Raspberry Pi Imager port - beta
ead3e30 readme: add macOS build step

2048ae6 (2021.07.01) Merge pull request #83 from mrpollo/patch-1

6c4d444 Update Raspberry Pi 4 EEPROM to pieeprom-2021-07-06
59830ea Merge pull request #85 from timg236/pieeprom-2021-07-06
8b1ccc1 Update changelog
9a4887e Fix `install` and `uninstall` targets in Makefile.
3840f3b Merge pull request #86 from cpb-/feature/add-install-target-in-makefile
ff986e4 bootloader: Remove NVMe beta files
c2da05c Merge pull request #88 from peterharperuk/remove_nvme
4608d57 Update bootcode4.bin
76e856d Merge pull request #89 from peterharperuk/master_update
8bcd5ce Bump bootcode.bin
d1a9a5c beta: Add support for secure-boot - see Readme.md
6eb9976 secure-boot: Added example boot.img
78e1830 make-boot-image: Fix typo in docs AFT_SIZE -> FAT_SIZE
58bdaf4 make-boot-image: Use losetup instead of udisksctl
4bdd032 secure-boot BETA documentation updates
5247ffe Merge pull request #77 from nils-werner/patch-1
dc1b95f secure-boot: Move the example PEM file to secure-boot-example
80945ed secure-boot: Update recovery,bootcode4 + EEPROM to latest beta - 2021-10-27
a6e0d8b secure-boot: Update Readme to update max ramdisk size to 96MB
14e28be Corrected the board flag
7b429ab Merge pull request #96 from Dodain/master
09852a9 Corrected the -b flag in the readme.md
879641f Readme: Add docs for examining the contents of boot.img
5f8c233 secure-boot: Add more documentation about the RSA signatures and add optional public key argument
d1ad057 Merge pull request #98 from timg236/secure-boot-hsm
6154fe2 make-boot-image: Fix unmount and set GID
8b390fe make-boot-image: Enable the image size to be specified
fc4035e Update the default EEPROM image to 2021-11-22
a7ed8d1 rpi-eeprom-config: Pull in --edit fixes from rpi-eeprom repo
83c9a96 Merge pull request #103 from timg236/pieeprom-2021-11-22
396b98f secure-boot-recovery: Update to latest 2021-11-22 EEPROM
14ea684 msd: Fix non-2711 MSD support
515b972 Update the default EEPROM image to 2021-12-02
1aca6bc Merge pull request #104 from peterharperuk/update_dec
e5e4994 Remove imager beta release
8bb5820 Use pkg-config to locate libusb-1.0
6b05a3a bootloader: Enable revoke_devkey in secure-boot recovery.bin
a7d4ec4 (HEAD) Merge pull request #108 from timg236/secure-boot-revoke-devkey

The version bump to 2021.07.01 gains one readme update, why not bump
to head/latest (after testing the result)?

Regards,
Peter


> +RASPBERRYPI_USBBOOT_SITE = \
> +	$(call github,raspberrypi,usbboot,v$(RASPBERRYPI_USBBOOT_VERSION))
>  RASPBERRYPI_USBBOOT_LICENSE = Apache-2.0
>  RASPBERRYPI_USBBOOT_LICENSE_FILES = LICENSE
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
