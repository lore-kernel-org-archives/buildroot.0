Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA535D59F73
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7F4240185;
	Wed,  6 Nov 2024 20:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7eDUs2QhiDc; Wed,  6 Nov 2024 20:41:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27CF74011E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27CF74011E;
	Wed,  6 Nov 2024 20:41:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 130DD3B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F277E80F03
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_7BfPNSUizm for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:41:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3CC6B80E9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CC6B80E9E
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CC6B80E9E
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:41:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.161]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Hdw-1t631H0Hz0-006IIP; Wed, 06
 Nov 2024 21:41:21 +0100
To: buildroot@buildroot.org
Date: Wed,  6 Nov 2024 21:41:03 +0100
Message-ID: <20241106204108.4039479-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:B4SbQjsjHu8/p1fK6hy0sIcwhdv9zoUTyag4GT2ti7o929pW5WV
 WXN19cp472gsyOw5V5xh501u7K00vM/nfFvLIUHxHvJsFSeHYuVL6Zzh9nqW2jIF28pIUW7
 LMoiiI521YtjsjYw9+iwTJH7BzSVgOXKwfq1aMYLcEiMAm+sDJ54t3mach3sQB4pysu9k31
 9JOzf3YH4V2bQmZudtXIw==
UI-OutboundReport: notjunk:1;M01:P0:DfUym2qYesY=;OXAMaFcKoDhhmhqrL6Fat5Y/pnd
 YfVDWbB4Ko7qXClqJBpqu7iNRrlBdRztY27Md8WC79uTLTw1Sy2SsOZU2M5HBdgDR1mx15NS5
 zmKyGyXviFm3RMPj74XcJ5LW0B7AHAG9g9c6ejtgT9HRgsTt8p0fy35p74dzNVBek6PjIcQ+X
 tEoFMbhAJkma/0DZWWquxjElw8qNL1C62LmuyE8okV2yxdDLoQHSt+j6u8ahL+MRocuDa/yLR
 IQ9UQ0odyyIy0GTakoJOLm2BZXGNh3Vo5lRzf2DYokOgBbDnR4tVhNuCpQZ/NGTJue7D0euEt
 WWAtFESi3capkrYv1mmgbn2Fi0hEngEYlEiUVwD1I3c98CbQlpF/aT3uyDqV1u4hiTOhtYjwM
 kV3jTf0VFzD2FMDkIwCdq02kAu/GmPug3HkXQmqjnhKux4dnaBnHirEcq7o74DRk+ZoK7Itr1
 Jgh0mdlWzXUuyHGjPsaZK6lpjjb3i0Xngop/kRrnCGNyNT+orlWZH6EJKIaR6EJHFNpVvIOw0
 0zx/Ju5eqzXPYYG2va1bPxO/qagqvhl9ul7DAAuFgOuEShh6V3J4+1RBCRwZGLAMx1prwZPax
 Fkvay/yhkGLqkzOk4PNB0vFg0gRk7pw7R6eLXl14GGe+MPJ7i3EKJM1bbxUtUyIwaCXDzSKPT
 5U0U9BTEDHOuaKWttn7Ms1LEK0Ul+SRGuCDSAmHt0KUYwFXrQLIv+jonvwqPXH5V5p5joX2Y/
 hSYmktsK/eb/QiJOgWaVoq6uLoHlcILP3iaEcW8SWaRreQbGAIjjL9cpySloIJo29xRO7uscU
 Vm5PO/IIwN63VfKf9X07Sbvg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730925681; x=1731530481; i=fiona.klute@gmx.de;
 bh=M8W4sgyZ2JEpxQo104B8SG6gPmZzohOXLmfHtndclHg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=JvzU4TK4e9HIlGLOH8b9n2B3GJ1J3XcL0g+ZaO0fNnkkkUOXH2Jz5omb8ofSt9Gr
 OImzgmk/7UYcfXOxP3Av0v6dbL2oUoi7/vYVlPHYGLmuIqEe/0bDb+SCm9NE6KfGA
 Z7bc8XcQVeeM1HibqFZ1n5ujZjJlUmIxIAS4owrBSUax9FtyVLlROY9p0iY5Nl1ne
 yPJ45iTaqZNXdGXNvxoThs1JrvMIgIMenz5FrmBsU1hwpDLqqyZdyOoP9N4ZFL1RS
 ex3/UKzx4vg/Hn5bcbyPvI+wUOpp7f6GAPKgHbXVv1TbcBWiT9RtyH+FBeI+/tWBT
 sNH/OhcLt4b10L/0Cg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=JvzU4TK4
Subject: [Buildroot] [PATCH v6 0/5] libglib2 2.82 series with bootstrap
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
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
  package/{gobject-introspection, libglib2}: bump to {1.82.0, 2.82.2}
  package/python-gobject: bump to version 3.50.0
  package/network-manager: optional gobject-introspection
  package/json-glib: bump to version 1.10.0

Yann E. MORIN (1):
  package/gobject-introspection: works with musl now

 package/Config.in.host                        |   1 +
 ...-dependency-on-distutils.msvccompile.patch | 104 ------------------
 package/gobject-introspection/Config.in       |   9 +-
 package/gobject-introspection/Config.in.host  |   2 +
 .../gobject-introspection.hash                |   4 +-
 .../gobject-introspection.mk                  |  17 ++-
 package/json-glib/json-glib.hash              |   4 +-
 package/json-glib/json-glib.mk                |   2 +-
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
 26 files changed, 197 insertions(+), 496 deletions(-)
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
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
