Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0081C02184
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 20:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E9B1607C5;
	Mon, 13 Jan 2025 20:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtPsuYddOBBh; Mon, 13 Jan 2025 20:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A189F607DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A189F607DB;
	Mon, 13 Jan 2025 20:05:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CF2B940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CFF940511
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFn9d7lU5XAW for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 20:05:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5AF9840505
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AF9840505
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AF9840505
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:05:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.64]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VD8-1tVnvK0CS2-00tZte; Mon, 13
 Jan 2025 21:05:24 +0100
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 21:04:49 +0100
Message-ID: <20250113200454.3108562-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:N5n9LQkma/pVK6cujDifH/Uc3FUYjo2PCIxJJr07xRcje72EYqx
 XGrO6OAOg6NUfbHNxGFGYKJZwhIVhNFY+slb5UccFx3ce8s6BzCxuQlqc+SDH3u7tAVXziz
 Qwj6zkqP6+1E4vbcu1WUaelZ11jtXan0UAP7Sdt8iC5JjPQ3zzpYatR01+EJ+UM/suC5k2A
 9dG53QLlAInByJ+CTNXwQ==
UI-OutboundReport: notjunk:1;M01:P0:CS7baFraNVM=;3u0sySl1hRRBx02uR1TTXD0nLga
 qYgCt/vmjJkBWhpsvirafQFztnLPR4npKOufCSGAEhoP7QGxM0+REOQVJTGzZrL/hPhw3IsnJ
 AJwLqh/VEkLY/UiQ8xHRUbnwqbvUz5VNg1RzI7V4nwg0nce2SRVDD+6bjbOgHhYvzpIdJ7Nmm
 mgqqsZicNTslbCJsQQ3T4eipw3QSGg63aOgoxh5X20jEhmU3bnGrbTRHbm+6X+bgPNSqFceFw
 HU06gzmtRmtcQaRfUbsExazvyJpH2++/WzMRhJsT9dTJ8P08p3h+nchdFbEachvpM8lGTZ6Qi
 A5Bu9YumPvVwfEONbJWkn4xiZ9475fa4jPf1Wp3DfoCh5T2BhxQnGefA/G4wDtYTTno+hxg+g
 jCU96WPn990hxtS6p+74/u3GyjkymenDxXUzcp67BUK2mCqiopuWWz9ahBXvaTrvkpv5PkSJH
 FuTFHOGxLx1ARyl60IsAMpF36OCgjJyGaGzbrfQmTp8HjR2HB6l3sJJv8nO2ox1wt4pWXV0ET
 Zo++hyMiVKWAS4aTl+9ULd9iAawWkbyb+Pc2UD/Txh9Y6S8wZTA5dqL1swEu4Kbu+9QjBUes5
 vOWp60jc3vcSrtPgwl4/YcdrBIBTpz8lvw+tygUsm5WSbssGEEvZ8eOolnXf31Y2rRv4xi2Nz
 KZXolklVoDATSK8jZ0Es3RRdRHWDQ/Guvw3RrUg5v2aBx/COyO5ex1i05crwGYOPOW6RwgLzi
 yD0j0UYIVekJoW5YJzw6KyLoOEpXaLg+W8eZpsVZhjmbVvea6J6f/FJwnmGXA+sUoUOBmjwH2
 wQQkkylMgPjaJsttH20SR1Nme0iH1xFWvpTxL4rLSejpveeV06gBkwayP7ZUtHenYOXZj59DQ
 I32pdYLhdA4YHxZBN2CsbLCz+nDYtRIef8wbuAYg5WAX7uRrqe2xp7b+HMq9A3eKIzA/KwD4V
 dTfKq0eodO+CD0noK7kM936f7cpxl6jCae8Fbn2WkJ1tslD6dBaK3P82CM0iueSDyAcs8H5V9
 MUwK2EBZk6N+SSyEDYamS++rIVID07Iq2S8mdbgGPzMtmC7pChSK1J1RUUbirtoi2VpxDSKU4
 9Bv4+/Hwsky2bNoyPYCQ/a2pvPbLu/
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736798724; x=1737403524; i=fiona.klute@gmx.de;
 bh=ksLqCnAPfqsDQ0ACe4uENVqinJjoRjzlDEQo5OtdxRI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=fGf1e805DquwtdFbj4DkcUCZbCM8HT3JCSlhhEoTkexz38wVoX2eTGQlAkPdfutE
 KTWb9rJvP+0AhaHb4oHxFloNzUFon6QVdYs41bvNIExAn7f7hN0xYHIuWP7jOWeDd
 Ufl0TabCp/BZeusq4cJ06piwKxgPD3E3JQEGREWiKl4D/RZMRobKl58205babxI55
 6hOBC8pbK4zNlZDTN6kTTolkiasrvPZheZX6jVhuFphFKxSguw1djmdj6i2bzF0iw
 LE0jqfhG6MR5o1SgVtMJ4Vl2iWjLbaKKQxD+xEDh2Pc4BuAhH7rMj3EnD3SEQX/sn
 bYdtrKkewK0qSzkqZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=fGf1e805
Subject: [Buildroot] [PATCH v7 0/5] libglib2 2.82 series with bootstrap
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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


Changes v6 -> v7 (Fiona):
* Bump libglib2 to version 2.82.4
* Bump json-glib to version 1.10.6

Series v6 for reference:
https://patchwork.ozlabs.org/project/buildroot/list/?series=431629

Changes v5 -> v6 (Fiona):
* Drop former patches 1 & 2, already applied
* Enable introspection for host-libglib2 only if required by config
  (which is the case if target libglib2 is to be built with
  introspection), skip bootstrap otherwise
* Bump libglib2 to version 2.82.2

Series v5 for reference:
https://patchwork.ozlabs.org/project/buildroot/list/?series=427481

Changes v4 -> v5 (Fiona):
* package/gobject-introspection: Drop patch backported for
  compatibility with current setuptools with update.
* Drop "Fixes" tag in patch 3, already fixed by said backported patch.

Series v4 for reference:
https://patchwork.ozlabs.org/project/buildroot/list/?series=425356

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
  package/{gobject-introspection, libglib2}: bump to {1.82.0, 2.82.4}
  package/python-gobject: bump to version 3.50.0
  package/network-manager: optional gobject-introspection
  package/json-glib: bump to version 1.10.6

Yann E. MORIN (1):
  package/gobject-introspection: works with musl now

 package/Config.in.host                        |   1 +
 ...-dependency-on-distutils.msvccompile.patch | 104 ------------------
 package/gobject-introspection/Config.in       |   9 +-
 package/gobject-introspection/Config.in.host  |   2 +
 .../gobject-introspection.hash                |   4 +-
 .../gobject-introspection.mk                  |  17 ++-
 package/json-glib/json-glib.hash              |   4 +-
 package/json-glib/json-glib.mk                |   4 +-
 ...rmat-in-gio-gunixconnection.c-part-2.patch |  93 ----------------
 ...documentation-generation-with-gtk_do.patch |  96 ----------------
 ...ion-of-a-system-provided-proxy-libin.patch |  53 ---------
 ...05-meson-try-iconv-in-libintl-lookup.patch |  53 ---------
 .../0006-link-with-latomic-when-needed.patch  |  52 ---------
 ...girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch |  38 ++++---
 package/libglib2/Config.in                    |   4 +
 package/libglib2/libglib2-bootstrap/2.82.0    |   1 +
 package/libglib2/libglib2-bootstrap/Config.in |   9 ++
 .../libglib2-bootstrap.hash                   |   1 +
 .../libglib2-bootstrap/libglib2-bootstrap.mk  |  77 +++++++++++++
 package/libglib2/libglib2-qemu-wrapper.in     |   9 ++
 package/libglib2/libglib2.hash                |   4 +-
 package/libglib2/libglib2.mk                  |  37 ++++++-
 package/network-manager/network-manager.mk    |   7 +-
 package/python-gobject/Config.in              |   8 +-
 package/python-gobject/python-gobject.hash    |   4 +-
 package/python-gobject/python-gobject.mk      |   4 +-
 26 files changed, 198 insertions(+), 497 deletions(-)
 delete mode 100644 package/gobject-introspection/0003-giscanner-remove-dependency-on-distutils.msvccompile.patch
 create mode 100644 package/gobject-introspection/Config.in.host
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
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
