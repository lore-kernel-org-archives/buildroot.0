Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599CCCF11F8
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 13:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB8824100E;
	Thu, 10 Oct 2024 13:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-WJXooQGE0C; Thu, 10 Oct 2024 13:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8BA641005
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8BA641005;
	Thu, 10 Oct 2024 13:53:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F3311BF427
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ED56810F1
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqewU7ojGHHL for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 13:53:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 94EA0810F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94EA0810F0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94EA0810F0
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 13:53:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.249]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2DxE-1tyrLh1CiU-0100db; Thu, 10
 Oct 2024 15:53:47 +0200
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 15:53:07 +0200
Message-ID: <20241010135318.3064224-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:Qaabn7hR1tZO0qQu92R/j61SEVOVZYXi/kcvjpfFLyOZB6I4lMU
 k7T1TrUnWPBLQp2WCfrWt1nkA3aVQxBH5QiomP3GEA3URYXAsEXU1cZVyYjhqQvRTtuzjjW
 8Wux0aA00PiKTHIz7FzFznVmbEm21S3IBqYTwHZ3QMHqBsef0UMPfC/USF4jyH+0RT3gPg6
 /kGyxNX3qBeijSlImkqFg==
UI-OutboundReport: notjunk:1;M01:P0:/vEdOxH8JRw=;N6xhP/BbTpo6ZRio/uSdEpjN/pR
 7JOR3fO1yKajEMxUzgZtrTHUGZ4vku5JaDNXvGQHstj3k0mmsS5RVQCsQydvcx3VqEjUl9yn3
 Fp1gfU6v9q2t5+4oPNdCaZoq/y5QRYrP3ReFFhMQ7GiR/6enOs4uo/DztGV7rlXiLhKFtqx7v
 NMmw8JixbIkLfL2oOVcbAD++tkXazqFBjOareSC9RpiymGzfZC9NYRVvMBkl0Mevffzo8TpSj
 xhRQftVgzDVfTRmFUpB2GS7AKKp1mXShtxuUj3A/BuFdv84rVb+SgZPoQ71UPRjypFdfxKSNr
 P0Vsejez09HiQdBiF4aGmM+1LMvlFZVmWo3BjBSH/aaOR0p5rUzZTsySiKXn3L7hUyoaddL9R
 PQEy+Q2dlON9v2NaEEa9rJkrRU8RbNBaV7Uu+Ztt+rcJAkvezB+mKm8gHf7TydVr6maLmQrhl
 udlMZQEFcyvju65EZ/k9nO2Kc8XaNBKkOmT8u0rjaWvgp5g1ACSx+Wc73odIteNtvSGRLUald
 3SnPtlNWu5HmL2duBWmr9ja6DBwQ5l4YxM7KbQFovpN796S5BzJiofGMwsSHx9KzHY6TRwImA
 NH3pRkHVaWeqiF+EL064pYBlxM/EHjJITicJ86aLuhcPrYUaImEgEckEi6DdvRgoVgfguirtb
 1YbMnUbm71cpeDAXfmzYFG3m4K4GueqVPGYD1MiBhjOKIUk1+/MHYhvrplDnxbm4Fy0xywu7e
 tw93Rl1U/cPssjZHhYFffLYeGbIyWu+krons/IQjcNjYtUp7h41RfPIvXIWFIIytehHzrWEII
 dsgWbmhcygIbOL/SFjZeYj7GG3TySFegb6qvNEyqeBVKk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1728568427; x=1729173227; i=fiona.klute@gmx.de;
 bh=xTM2fUL8Szh57/X8fE3nAK7MvmhDZzKsZcMSD4JMFr8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=hcfqJhRYUU4u8r8q05lp6hhPgh0qxTLrm0tUm2S2GTiDfHuHqMSJgrW44RKDIC3p
 QUJH6PJ7IkYY/CJuo00+elXQvuzrHkm7d65F/e/ZVY13ONyVlG3nSJNL1seuk4zmo
 H56Tqls2icubNNqwpee7j1l8R6h4V50rJH6K79uBShsS+s3tyOd941GbJG2Wr0VJZ
 BrFra6suIG+wShJHBWT4rAJjRgch3KFEP3kOHpulbKLTiYYVVLua9vksj00CAroqC
 MXJvX7jmuhsv+qsGzR+gP4QLSbP+zsSSlssyklpEH/HIrB9PqEfQouJTqJEGkYvKO
 77ciqRtKIYRrxAFnpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=hcfqJhRY
Subject: [Buildroot] [PATCH v5 0/7] libglib2 2.82 series with bootstrap
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
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
  package/{gobject-introspection, libglib2}: bump to {1.82.0, 2.82.0}
  package/python-gobject: bump to version 3.50.0
  package/network-manager: optional gobject-introspection
  package/json-glib: bump to version 1.10.0

Yann E. MORIN (3):
  package/gobject-introspection: don't depend on cairo
  package/gobject-introspection: update homepage
  package/gobject-introspection: works with musl now

 ...-dependency-on-distutils.msvccompile.patch | 104 ------------------
 package/gobject-introspection/Config.in       |  10 +-
 .../gobject-introspection.hash                |   4 +-
 .../gobject-introspection.mk                  |  22 ++--
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
 package/libglib2/libglib2.mk                  |  30 ++++-
 package/network-manager/network-manager.mk    |   7 +-
 package/python-gobject/Config.in              |   8 +-
 package/python-gobject/python-gobject.hash    |   4 +-
 package/python-gobject/python-gobject.mk      |   4 +-
 24 files changed, 187 insertions(+), 502 deletions(-)
 delete mode 100644 package/gobject-introspection/0003-giscanner-remove-dependency-on-distutils.msvccompile.patch
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
