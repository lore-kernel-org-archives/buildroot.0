Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC010C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 11:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A07460BDC;
	Wed,  9 Mar 2022 11:20:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fEJ226s11R-4; Wed,  9 Mar 2022 11:20:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 891AA60AEA;
	Wed,  9 Mar 2022 11:20:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E77F41BF86B
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 11:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3FCC8412D
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 11:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yFj6XytxFFVJ for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 11:20:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E74C8410A
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 11:20:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 581AF4000B
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 11:20:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1nRuMM-0029XX-36
 for buildroot@buildroot.org; Wed, 09 Mar 2022 12:20:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 09 Mar 2022 12:20:02 +0100
Message-ID: <87y21j1ifx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.02 released
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Buildroot 2022.02 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2022.02.tar.gz

or

http://buildroot.net/downloads/buildroot-2022.02.tar.xz

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

Again a very active development cycle with almost 2000 changes and
contributions from 148 unique contributors!

Of noteworthy new features/changes we have:

- Toolchain:
  - glibc: Optional support for compatibility shims for running
           on older kernels than what glibc has been built against
  - uClibc: Use uClibc-ng 1.0.40
  - External toolchains: Update Bootlin toolchains to 2021.11-1
    version

- Python 2.7 and python 2.x specific packages removed as python 2.x is
  EOL since April 2020. Likewise a number of python3 specific host
  packages has been renamed (host-python-foo instead of
  host-python3-foo) now host-python is always python 3.x.

- Cargo (Rust) package infrastructure added. Vendoring support added to
  golang package infrastructure.

- New defconfigs: FriendlyARM NanoPi R2S, Kontron BL i.MX8M Mini,
  Microchip Sama7g7ek, Olimex STMP157 OlinuXino LIME2, QEMU PPC Bamboo,
  PPC64 PowerNV, Raspberry Pi Zero 2W, Spike Riscv64, Xilinx zcu102

- New packages: ace, alchemy, alfred, bat, bento4, bmx7, bpftool,
  brcmfmac_sdio-firmware-rpi, cfm, cups-pk-helper, davinci-bootcount,
  dbus-cxx, embiggen-disk, freeipmi, gdk-pixbuf-xlib gocryptfs,
  kodi-pvr-plutotv, kodi-pvr-waipu, ksmbd-tools, libcamera-apps, libest,
  libexecinfo, libfutils, libglvnd, libks, libmd, libopenaptx, libpeas,
  libshdata, liburing, lilv, lua-argon2, lua-cffi, lua-inotify, lv2,
  mali-driver, moby-buildkit, modsecurity2, networkd-dispatcher, pahole,
  php-apcu, php-lua, php-pam, python-argon2-cffi-bindings,
  python-cssselect2, python-distro, python-fonttools, python-gnupg,
  python-installer, python-memory-profiler, python-mpd2, python-pep517,
  python-pydyf, python-pypa-build, python-pyphen, python-tinycss2,
  python-tomli, python-weasyprint, python-zopfli,
  qoriq-cadence-dp-firmware, riscv-isa-sim, rockchip-mali,
  rpi-rgb-led-matrix, sdbus-cpp, sentry-cli, serd, simple-mail, sord,
  sratom, sunxi-mali-utgard, sunxi-mali-utgard-driver, tinifier, ulog,
  vulkan-headers, xlib_libxcvt, zabbix, zchunk, zynaddsubfx

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2022.02

Upgrading from 2021.02.x:

In addition to these changes, for people upgrading from 2021.02.x the
most noteworthy changes since that release are:

- FORTIFY_SOURCE, PIC/PIE, RELRO and SSP security hardening options are
  now enabled by default.

- The minimal host cmake version has been bumped to 3.16

- support/download: Fix tarball generation (from git/svn repos)
  including symlinks pointing to ./<something>. Fix svn download for
  <1.9 clients or repos using CVS-style keywords.

- Infrastructure: Expose CONFIG_DIR to post-build/post-image scripts, so
  they can call the Buildroot Makefile in the correct directory
  for both in-tree / out-of-tree builds.

- support/scripts/gen-missing-cpe: A script to query the list of CPE IDs
  for the packages enabled in the current configuration and:

  - for CPE IDs that do not have any matching entry in the CPE
    database, it emits a warning

  - for CPE IDs that do have a matching entry, but not with the same
    version, it generates a snippet of XML that can be used to propose
    an updated version to NIST.

- support/scripts/cve.py: Use the (significantly) faster yajl2 ijson
  backend for older (< 2.5) ijson versions rather than the slow python
  default, speeding up pkg-stats by ~2x.

- CPE meta data has been added for a large number of packages

- Toolchain: Add support for gcc 11.x, gcc 10.x is now the default,
  removed gcc 8.x support except for PowerPC SPE.

  Support for gdb 11.x added, gdb 10.x now the default.

  Add support for binutils 2.37, binutils 2.36.x is now the default,
  binutils 2.34 removed.

  Glibc updated to 2.34

- Bootloaders/firmware: support for building the EDK II UEFI
  firmware, support for building AT91Bootstrap 4.x.

- New BR2_ENABLE_RUNTIME_DEBUG option, that controls whether packages
  should be compiled with runtime debugging information (which is
  different than debugging symbols).

- Many features of the bluez5_utils package have been made optional, and
  default to disabled. Users of bluez5_utils are encouraged to
  review their configuration.

- Many packages (over 70) updated to enable the appropriate SELinux
  refpolicy module when SELinux support is enabled.

- Many packages updated to select the appropriate OpenSSL features after
  many OpenSSL ciphers/features have been made optional.

- Filesystems:
  - new OCI filesystem type, to build container images
    compatible with the Open Container Initiative standard
  - support for hybrid ISO9660 images added, which work on
    legacy and EFI BIOS machines

Future:

This release will be become our new long term support releases, which
means it will be supported with security and other important fixes until
2023.02 is out. The previous 2021.02.x LTS release will see atleast one
more update before it becomes EOL in April, so start migration to
2022.02 soon.

The next release will be 2022.05. Expect the first release candidate
in early May and the final release at the end of the month.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
