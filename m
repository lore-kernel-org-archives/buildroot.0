Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14706C369AA
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 09:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF3B061119;
	Wed, 25 Sep 2024 09:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoPmK-47afrn; Wed, 25 Sep 2024 09:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65F0860724
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65F0860724;
	Wed, 25 Sep 2024 09:05:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3CF1BF865
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 09:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36B9740443
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 09:05:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgJPL2MDX_Uo for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 09:05:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C8384010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C8384010F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C8384010F
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 09:05:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.185]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McpNo-1sJUyu35pi-00lFLc; Wed, 25
 Sep 2024 11:05:38 +0200
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 11:05:18 +0200
Message-ID: <20240925090526.3462217-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:gdvdvGPHj/0eauI9uuBxIVBFlcx1g/SxaWkPR7HWTYQRa312ZUR
 GilI5fTg45XKzhf+40qi6pJ3vhiHp7Qszu5Hfapx3N3j0GZjglyzJcA2iVkicQI/E8jThTa
 xPXIte8DvMmj6o+/HMEiZTbKXJ83En/AduwhpI8pl3oS9CQOh8320Xii4k2vQ/vbTfLjeOg
 MFo0txQvTEjuSy75D7acg==
UI-OutboundReport: notjunk:1;M01:P0:TN9d6NoBPdo=;KrqMA4x8iMxDSSv0ZeHR/yOLsyc
 aapU01BBZoJyg2TSVPyq4Uhh+LVCnM4bC2acFNGKcBsK8/UKp5QpZkj+tssD7iuROY9qDlY2s
 DoHQGiCto7cDxlAMXqnFAXgNI3Fm3UYkmqpzofQSMcyjFWb8M36eMYOP73foFRqEspE/v6GAq
 juciZCI9aptaDvbOELgFqLA38kg66kjWfinpD7pxwrR2PZ8TqZKMrdu4I99pUdeJ9bIj8JEuq
 rgHJELJJ6BwVh5tx9X6M3fkcMBxiMSbu/DOvU3Ji4XGIcmpdmmFe4NQSF965eorBIUYC2MahV
 PmdKHZlNs9DOsCBiNatmEUiAOMiUecNxOjUf3Npj13w7kI7LBgKDNIy9y18rm3xTX/C1URq5p
 u3AU8SQ9KBSM2ww5SYU4HZQzsLkwEqKkROmdAwYh+Lp6QiQmU+9r/Ub2D1uzRQqm+3kXxda9r
 v+2G1ClqzS2oXroHwEf3lh6/CW49OKvT8nkoMFuGsW+5yFfFD+k9EY0IA9AugqnNEG+skt785
 bTSaiPLH4rAqGGGobERLpAretlXDMrHH6oLCBaaSX2m7FKvzqChFil/3udn54a169mdrUf8fS
 y1j+4jOSAhdEC7+uSmzhDnP6+I2RqCzGaMKvChoYv//ZFZ3ix2YH5j480s4IF0rY1JU/+Y+jn
 o1vW+Q+jSyQLR5jVbcC8kvCKUN/gqiFGQ3oG7r1Vc6Mg5sKHjlBioY5chYgLr499aEeuzpoEE
 joo8Rv7dMuzqKOA/ddnV+T/wcgJtm3YCvolsurASMAf2hNTPUltn0wRyx3ivhoFzm/dKlM77h
 d98cqOSJPvSYnnlACg1dUI9g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1727255139; x=1727859939; i=fiona.klute@gmx.de;
 bh=RVtzkUhP0YnIVV6M5sWk664ZNpP+YlVBqaRXDB8SlyQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=BIGoC2k54wRzQ4vTHO7a4sEzhZkt77SVeloxU/fhlGid6ZTOt/u2lbwW/rshkfyR
 x7O0YJi1PrQDso7QX6uyMtKLOl9qavCLUpj6Rjo4ktfI1ndbE5LKOWLNSvuKZitO/
 RxKKcSf47fxoImM6sZE0w9maEhxfxLEJbR3m/eIYYdnAvkYpfOrnNU41pRpkMO0ZE
 an6r9Tp7ZLUKuFFo3kMWE0do+m6hDEV/htAActcNrcUGutwbbsCAKH2ToQpBXAqxV
 +4rKQK4ETHUUwgRCW4LMUDmzNaWWAnVtzgJGcesGgizZfoxckGSreCFaoDGnt5Ks/
 g1inICdgTNKaTl2V/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=BIGoC2k5
Subject: [Buildroot] [PATCH v4 0/7] libglib2 2.82 series with bootstrap
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Hello All!

Since 2.79.0 libglib2 needs to be bootstrapped without introspection
support before gobject-introspection can be built, the added
libglib2-bootstrap sub-package takes care of that. See NEWS:

    https://gitlab.gnome.org/GNOME/glib/-/blob/17d1bf3c4962d942feea0830aeee6833104fef5d/NEWS#L429-438

Here's a defconfig that can be used to test Network-Manager i11n from
python in qemu:
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
    BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
    BR2_PER_PACKAGE_DIRECTORIES=y
    BR2_INIT_SYSTEMD=y
    BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
    BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
    BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_CUSTOM_VERSION=y
    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
    BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
    BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
    BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
    BR2_PACKAGE_PYTHON3=y
    BR2_PACKAGE_PYTHON_GOBJECT=y
    # BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
    BR2_PACKAGE_NETWORK_MANAGER=y
    BR2_PACKAGE_NETWORK_MANAGER_TUI=y
    BR2_PACKAGE_NETWORK_MANAGER_CLI=y
    BR2_PACKAGE_NETWORK_MANAGER_MODEM_MANAGER=y
    # BR2_PACKAGE_SYSTEMD_PSTORE is not set
    # BR2_PACKAGE_SYSTEMD_HOSTNAMED is not set
    # BR2_PACKAGE_SYSTEMD_MYHOSTNAME is not set
    # BR2_PACKAGE_SYSTEMD_NETWORKD is not set
    # BR2_PACKAGE_SYSTEMD_RESOLVED is not set
    # BR2_PACKAGE_SYSTEMD_TIMEDATED is not set
    # BR2_PACKAGE_SYSTEMD_TIMESYNCD is not set
    BR2_TARGET_ROOTFS_EXT2=y
    BR2_TARGET_ROOTFS_EXT2_4=y
    BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
    # BR2_TARGET_ROOTFS_TAR is not set

That can be run with the command line in:
    board/qemu/aarch64-virt/readme.txt

By running the test script there:
    https://networkmanager.dev/docs/developers/

Thanks in advance for the review,
Fiona
Yann


Changes v3 -> v4 (Fiona):
* Bump gobject-introspection to 1.82.0, fixes build with current
  setuptools. Note this failure happens with the current (master)
  package, too.
  Fixes: http://autobuild.buildroot.net/results/839/839c2bea1167fad5e66f91f7f584fd3d2c31ab46
* Bump package/json-glib to 1.10 to fix a build failure due to
  g-ir-scanner warnings
* Bump python-gobject to 3.50.0
* Patch 3: fix typos and outdated URL in libglib2.hash

Series v3 for reference:
https://patchwork.ozlabs.org/project/buildroot/list/?series=421875

Changes v2 -> v3: (Yann):
* split homepage and musl support to their own patches
* introduce qemu wrapper
* extend/rewite commit log for versions bumps
* add defconfig to test

Changes v1 -> v2:
* Update libglib2 to 2.82.0 instead of 2.80.4, drop one more patch
* make building introspection data for libglib2 conditional on
  BR2_PACKAGE_GOBJECT_INTROSPECTION=y
* skip bootstrap for target package when building without
  introspection, do not depend on Qemu in that case

Fiona Klute (WIWA) (4):
  package/{gobject-introspection, libglib2}: bump to {1.82.0, 2.82.0}
  package/python-gobject: bump to version 3.50.0
  package/network-manager: optional gobject-introspection
  package/json-glib: bump to version 1.10.0

Yann E. MORIN (3):
  package/gobject-introspection: don't depend on cairo
  package/gobject-introspection: update homepage
  package/gobject-introspection: works with musl now

 package/gobject-introspection/Config.in       | 10 +-
 .../gobject-introspection.hash                |  4 +-
 .../gobject-introspection.mk                  | 22 +++--
 package/json-glib/json-glib.hash              |  4 +-
 package/json-glib/json-glib.mk                |  2 +-
 ...rmat-in-gio-gunixconnection.c-part-2.patch | 93 ------------------
 ...documentation-generation-with-gtk_do.patch | 96 -------------------
 ...ion-of-a-system-provided-proxy-libin.patch | 53 ----------
 ...05-meson-try-iconv-in-libintl-lookup.patch | 53 ----------
 .../0006-link-with-latomic-when-needed.patch  | 52 ----------
 ...girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch | 38 ++++----
 package/libglib2/Config.in                    |  4 +
 package/libglib2/libglib2-bootstrap/2.82.0    |  1 +
 package/libglib2/libglib2-bootstrap/Config.in |  9 ++
 .../libglib2-bootstrap.hash                   |  1 +
 .../libglib2-bootstrap/libglib2-bootstrap.mk  | 77 +++++++++++++++
 package/libglib2/libglib2-qemu-wrapper.in     |  9 ++
 package/libglib2/libglib2.hash                |  4 +-
 package/libglib2/libglib2.mk                  | 30 +++++-
 package/network-manager/network-manager.mk    |  7 +-
 package/python-gobject/Config.in              |  8 +-
 package/python-gobject/python-gobject.hash    |  4 +-
 package/python-gobject/python-gobject.mk      |  4 +-
 23 files changed, 187 insertions(+), 398 deletions(-)
 delete mode 100644 package/libglib2/0002-Fix-error-format-in-gio-gunixconnection.c-part-2.patch
 delete mode 100644 package/libglib2/0003-meson-wrap-html-documentation-generation-with-gtk_do.patch
 delete mode 100644 package/libglib2/0004-meson-Fix-detection-of-a-system-provided-proxy-libin.patch
 delete mode 100644 package/libglib2/0005-meson-try-iconv-in-libintl-lookup.patch
 delete mode 100644 package/libglib2/0006-link-with-latomic-when-needed.patch
 rename package/libglib2/{ => 2.82.0}/0001-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch (53%)
 create mode 120000 package/libglib2/libglib2-bootstrap/2.82.0
 create mode 100644 package/libglib2/libglib2-bootstrap/Config.in
 create mode 120000 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.hash
 create mode 100644 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
 create mode 100644 package/libglib2/libglib2-qemu-wrapper.in

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
