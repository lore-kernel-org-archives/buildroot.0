Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B329C02183
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 11:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A45880516;
	Tue, 14 Jan 2025 11:32:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jt6PSl9s18pT; Tue, 14 Jan 2025 11:32:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9595780A65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9595780A65;
	Tue, 14 Jan 2025 11:32:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 516BB94B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E0FE40433
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYIt0jiPStSS for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 11:32:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B09E40AF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B09E40AF0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B09E40AF0
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 11:32:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.28]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKsj7-1tqYv506DF-00JvPI; Tue, 14
 Jan 2025 12:32:22 +0100
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 12:32:06 +0100
Message-ID: <20250114113212.1791033-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:nnKAto39Rariqgk8coKsjQWXw0HB+2Rf0tAAMpIHJpY+SPeHX66
 AU69MMG2wqKzaggAL9QjvyPgMLw34/Z2N2uSJGrXr4ptNeHVixQaCnEK4VJ/IKCGMppoXK5
 GtZyBF5htsMSGhxMJu+1MMLec/DYtkWdzdmY3+wfH1QIxMGzLuSCtIIxD5IRWUGhQNphMiE
 VV15+q+hJGgNE+K2eApyA==
UI-OutboundReport: notjunk:1;M01:P0:dpSMXMSeifo=;aUakEkQ9P24HJiKmMdi04Tac3ie
 anVReyOFGY7tK2HT1J5CjOLlMNmrtUL+gSqKPqS+pismIt1cyroNk0MflZFmUYJ2GPp7QK7hZ
 9XC8FeRvq0lVPtmMN450YLxM/JUyNFhevFprx5fxIG9PciKqy3iwUmbdcK9cfKdetcj8wIc2b
 gQ7bsqVXDjbt5Sd2cysVroLMxkfGPTSYpb0gP+bKvtfOp1DhprzfTKo7DXee6feD4cQvnUrXl
 lMFkaxDHZBHfGgW0WxB8pp1BYJ1bPwMEF6cSbRhgqVQDes3GfBCKjn+Bk/a7bi5KhdkxAzFWr
 LJbTJ/THWJVuhSevcdMgDmbwzP+Z+oeoPAf/vKw4Qu1yDEd1teW6vWIKIZQ4btgXH/MW1DeBk
 PAXsjfOMiVoBP5Gk9dUQzP8iKtMGnQkJRnYM3/4hQ8+V6xnMs7RXEwFhPx+VPR2t+QE3967Gi
 09ZFgrK2C90J6i91A0CUP/QWFrYj2TQKC3xZA8MvWt21762C2S3K6A83XUHpYBn/n7u3TOUd0
 Gg6VXXxy6FdN2iBBcE3QBt0sTEZD7pxcz7/vtZ64I1KwpGRnIFP5XcMuXg+Mzkd+MvgDfARKi
 Lup1svw2NHfybwDBydjBrEd3z191ukpjeppCds6cv6cwlm0bM1PFs09hBdK0Fn3uD7yeW+mn2
 FGSsnHWVmfhOcZhZLK8DtW4YUD4ihcPKP8Jqcbxy1ifQuOxWEtIdNQQOtNIRuru/a6ANZ/Lzl
 Hk0i9+12acAJG5hS44IGZH7X4E9NT8adpQbsWf1Kn5tZ6mNEP/x3NGUMs1dl9ixW3bnpSNy5C
 B4CnYj8vvvarsqtcB9qgA1gdxsrnNM1ao9jGqND4jwucuiE85Zf8cZjhRC0L4qo9rB96UXJZw
 CGv9Mjsy9xrFom3RBq1K8qnoKNY7QSskwUbimnGl6arPsbnQLD/JLUuTl4yKpopxhcotXsq7+
 9uMFkjJraLXCMqxKTICJ9RF3OJv1Pb/coPP7+5pkL+L8bZ4dQEeZyywVrb6ukaVqUFKP1TDtP
 1LvVBPaa0Cb2JZWaN+eUZ+LIBGWXaLL9IQi6eSRO+GieKzgLGfK1EFbAYNJB7gpDCNMItjfbp
 +QcN7XpuXd/NxjC8BpXKjCavf/m6mE
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736854342; x=1737459142; i=fiona.klute@gmx.de;
 bh=xLBZl5lp7hS42LfNpYdwqpJA6SHtgJwATCZL6eh4XNc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=PpZ/txpsJ/8kxp7IqfjSMvLmWDEWPs3N9DkuKYT+DiJX2uvlMg+QX0Guvz8Zw87q
 7V0xMpEK52/TcvE+Ng+XeaDc8msckWJALflGQaJfNfdiQz680MwHWxB6RzRUybvG9
 +sqbaiSp+Gfia0oRqzt7A4FbrEhIgcuAVwzwJ87G89PTG8o37zS3TAcdGyk7q09QM
 B1yX3lhRhB9D5ZWEMJQnK98pjXX3vcNCfRqk3GKBrsV9zdKrZE6aCvsb44YpUJ2RT
 t99ZzxaOKJx8AcCS9Hw8qvrGgUcCiFQIgADEI/n0UB0JivyAVaAuqM8tKoQZ3s+7Q
 wm0SCu2A7YHHgrv+Gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=PpZ/txps
Subject: [Buildroot] [PATCH v8 0/6] libglib2 2.82 series with bootstrap
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


Changes v7 -> v8 (Fiona):
* Move json-glib bump to start of series, to avoid broken state after
  GOI bump
* Split python-gobject build with musl from version bump
* Clarify commit message for NM GOI support

Series v7 for reference:
https://patchwork.ozlabs.org/project/buildroot/list/?series=440156

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

Fiona Klute (WIWA) (5):
  package/json-glib: bump to version 1.10.6
  package/{gobject-introspection, libglib2}: bump to {1.82.0, 2.82.4}
  package/python-gobject: allow build with musl
  package/python-gobject: bump to version 3.50.0
  package/network-manager: add optional dependency on
    gobject-introspection

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
