Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71358C004D4
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 09:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED0BA416AD;
	Wed, 18 Jan 2023 09:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED0BA416AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SBLkXlRQyrot; Wed, 18 Jan 2023 09:52:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8BB24180F;
	Wed, 18 Jan 2023 09:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8BB24180F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 576FB1BF3F4
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 09:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F98681E7A
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 09:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F98681E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28hzSsG89989 for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 09:52:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 899CA81E6C
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 899CA81E6C
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 09:52:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A6C09240009
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 09:52:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1pI570-009Cfe-Jv
 for buildroot@buildroot.org; Wed, 18 Jan 2023 10:52:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Jan 2023 10:52:06 +0100
Message-ID: <87ilh4dvax.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.11.1 released
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

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2022.11.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2022.11.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2022.11.1.tar.xz

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2022.11.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2022.11 release.

- Br2-external: Fix make performance issue when many (> 6) external
  trees are used together.

- Erofs: Use fixed timestamp and UUID when BR2_REPRODUCIBLE is used.

- Go: Ensure our go build and module cache is used, even for the
  download step.

- Legal-info: Stop warning about not saving sources for local / override
  packages if <PKG>_REDISTRIBUTE is set to NO.

- Linux: Fix build of < 5.6 kernels with host-gcc >= 10.

- A large number of NXP related packages and defconfigs have been
  updated as upstream moved the git repositories to Github.

- Defconfigs: zcu106, kria kv260: Fix U-Boot build

- Security fixes for asterisk, botan, cairo, capnproto, connman,
  containerd, docker-cli, docker-engine, go, intel-microcode, libcurl,
  libksba, libpjsip, mbedtls, moby-buildkit, php, ruby, sqlite, tiff,
  tor, webkitgtk, wireshark, wpewebkit, xserver_xorg-server

- Fixes for download/compilation/runtime/license issues in bearssl,
  dbus-cxx, check, checkpolicy, crun, exempi, exfat, exfat-utils,
  falcosecurity-libs, fluidsynth, fmc, fmlib, freeradius-server, gcc,
  glib-networking, gobject-introspection, gperf, i2pd, ima-evm-utils,
  imx-alsa-plugins, imx-kobs, imx-lib, imx-m4fwloader, imx-mkimage,
  janus-gateway, libdeflate, libftdi1, libkcapi, libmbim, libmng,
  libtalloc, libuwsc, libxkbcommon, linux, lpeg, lrzsz, lttng-tools,
  lua-cqueues, mali-driver, mfgtools, mutt, opensc, policycoreutils,
  polkit, postgresql, pptp-linux, qcom-db410c-firmware, qoriq-rcw,
  qt5virtualkeyboard, redis, rhash, rtl8189es, rtl8192eu, rtl_433,
  swupdate, tealdeer, tekui, tinyxml, wpa_supplicant,
  xdriver_xf86-video-imx-viv, xr819-xradio, xxhash, zip

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2022.11.1

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2022.11..

    38  Julien Olivain
    32  Fabrice Fontaine
    22  Ricardo Martincoski
    16  Bernd Kuhls
     9  Christian Stewart
     6  Peter Korsgaard
     5  Giulio Benetti
     5  Yann E. MORIN
     4  Neal Frager
     3  Lang Daniel
     3  Quentin Schulz
     2  Francois Perrad
     2  Nicolas Carrier
     2  Peter Seiderer
     1  Adrian Perez de Castro
     1  Bartosz Golaszewski
     1  Casey Reeves
     1  Danilo Bargen
     1  Gleb Mazovetskiy
     1  James Hilliard
     1  Maxim Kochetkov
     1  Michael Nosthoff
     1  Nevo Hed
     1  Norbert Lange
     1  Tan En De
     1  Thomas Claveirole
     1  Thomas Devoogdt
     1  Titouan Christophe

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
