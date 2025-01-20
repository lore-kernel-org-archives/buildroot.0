Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ED4C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 21:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1EAE41458;
	Mon, 20 Jan 2025 21:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ofz208RZ4LFG; Mon, 20 Jan 2025 21:17:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 036E24145A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 036E24145A;
	Mon, 20 Jan 2025 21:17:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 457B095B
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2ACF44102E
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRmOywhMqjFo for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 21:17:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2ECB64003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2ECB64003A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2ECB64003A
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.125]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MY6Cl-1u1lGW2cnN-00Q6ro; Mon, 20
 Jan 2025 22:17:29 +0100
To: buildroot@buildroot.org
Date: Mon, 20 Jan 2025 22:17:01 +0100
Message-ID: <20250120211707.2381182-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:9Ix9sM+7dOgXwSsikAPOX4MsCnv30zMOc69pZ7fhgnbVSAFhRU/
 SY/JghZ1IGEKvlZHwvdd9MOLW5cB4Zt6/MXZojF9kgisl0n/OufzI0YEXoB9Ut44lUtWcEg
 wqPLfbx6aSpG9VP9ZFKtHIw5gpj89iMT/i0YKYfW2ceiWSAlQS2HIZAoBtxHcGxOP8VZa6h
 dNykCf0lvHW/faw4o0WRQ==
UI-OutboundReport: notjunk:1;M01:P0:ArTBVEA3RiA=;f+UYzlXE4AC6SZWLFDieXQILcMq
 sEqfbEsGowYhEKAuYAuZYEACC/YA4rpcv5UBxfgoCUbyRaiphGaMUHTAq9z+ismKVtoQYLAnd
 8fbGGIkO537GcHDmeHqRAv/9foE2s40ZSzKZIGPQ3PmrlQdRLORiIVd16R6+ClLPgjV+zYpTr
 gDHANPrq5JhM+5HyFG1Qr55rNsnxxgvImOdEwUQpiN0HIo5Wom5nNfiod44rJOetLVjhZUO49
 eN9lwOy7u3Dfcx00GOz9zmICdrttcAPaU8r5D5LGSuzrfwjYRP9li/RNxen8Rq3eVxkxVb596
 dgzQGf4c+0URi8jU1V//4owfEK7+gykodYiEczq3RrSRlC/QVuQrKVKVspxSb9SnPvQ0WnLj+
 ve9ffclbfTajEXQXUTDlBOsHs/CsxwbVR7u9nHQB3xcHs8hSY0q9v0dO5ixcAIus4Ns33XljR
 cG3wx9W/A1zaS5TQISAZ6VItPF+eoJTty/8ovd2DTk/PLe5FBEd6bU1GGHHkDzOijPuqi9GPC
 hbr2lJtudqQjq3565+gI9hyCkPdeoqasRiiFWsOqDCiXM+ld0WdfQGVvmwWxZCdTW8nBmP0RW
 imTj6ijzR2/giyKVkNLkKiieQBLUKBoh7RdYlkII34RLLMKGaegQ9zX/Mqz/V3XP0JeIJ/uGa
 iMMTpEY3xF7/QAOHCBcZXlel3fKjnq0gJ7I4Mq/17KTcBQmpn1wLaXHr+bz6d7jc+I3fvZOwG
 Rdx5yCbpSMaPaT+0EPC/HEgEUG4hpd7cgzfctQg20ZOXHzUh0FcF3Gg3Li/kL8mgXfHmez+LB
 DFMJF92861AUMOq8TckFNq+d7wjhJ21agwC5udq5beH667KD8ttwcE8yhqvbSlTebdtq4nXuQ
 rw1CwILUV5TWzIk1VSvGFtxJaFLbDhyJhmq+eg6SpPvlN4nGNb6jqnTyyNiNjwBf2DCVrYXZ9
 3XfDekd3aJj3HOrmToCAnUgwDmkb8K9jgFtVgblawhUZTCfd6S8c6ocBPnYUHIDvW4MOFbipD
 UbbObl3UzDaMKOvlsjevxRBv+pf29S1j+3hhUdLoGEFyG6RxwLMZmyL6P6FSpZv1h1tX+C9KE
 mRj31obwc/+TM8F9lNqLc0447W7s/qbwH2XPIc0xGEnqdSKgUQ9a6YySdlhq/95+IVKk9GXpA
 /38IvR9jJ4LyD+XSH/AhSr+edx9DbASwi76Zrg3wEWg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737407849; x=1738012649; i=fiona.klute@gmx.de;
 bh=eP8dbiTO7Xzl8EtmQqDGOyPGskcNeIs7BZX56Z//kd8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Ck8RJnDlDoVHVh+bEsQNZV4JMbxDqW3PEm9QW9yz2nQM8L6fpNSZZWZKKm85utGj
 KNlZtWrXjZaMcdUZkeOuN8AUJofFXd24XqWGP8BsFZ/troSHSWwFxZNytEc/qS4lZ
 kgT8LGUkOq4XcjkGnGD8jYoSmYh5QYgMqak11qvwu4RD0qN1nefvPsDVwwpYLzQHW
 m7cWyyPQqT4Nm/vTnzvKW3cYxViBmTuzXMfS675S7R9jQIFArdCXHW1D45gH8uPqn
 xzX5xZuLPLWFucPiZWP2YXlbuMus7www+Q+Zd7athJ2d4YCMbM2iv94xVMaV5bikX
 STyKJRvE1z925npgSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Ck8RJnDl
Subject: [Buildroot] [PATCH v9 0/6] libglib2 2.82 series with bootstrap
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
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


Changes v8 -> v9 (Fiona):
* Update json-glib and gobject-introspection license info & hashes

Series v8 for reference:
https://patchwork.ozlabs.org/project/buildroot/list/?series=440244

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
 .../gobject-introspection.hash                |   6 +-
 .../gobject-introspection.mk                  |  17 ++-
 package/json-glib/json-glib.hash              |  13 ++-
 package/json-glib/json-glib.mk                |  12 +-
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
 26 files changed, 212 insertions(+), 502 deletions(-)
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
