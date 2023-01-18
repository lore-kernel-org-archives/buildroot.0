Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7DDC38147
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 16:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3441260FEA;
	Wed, 18 Jan 2023 16:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3441260FEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4SEY8DdL_RH; Wed, 18 Jan 2023 16:36:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7806560FDF;
	Wed, 18 Jan 2023 16:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7806560FDF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 827341BF578
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 16:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EAD040B2E
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 16:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EAD040B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTr_hspObh9C for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 16:36:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E954A40B05
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E954A40B05
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 16:36:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E8E9940004
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 16:36:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1pIBQV-009KJL-Um
 for buildroot@buildroot.org; Wed, 18 Jan 2023 17:36:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Jan 2023 17:36:39 +0100
Message-ID: <87edrrer54.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.02.9 released
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

Buildroot 2022.02.9 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2022.02.9.tar.gz

or

http://buildroot.org/downloads/buildroot-2022.02.9.tar.xz

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2022.02.9 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2022.02.8 release.

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
  libksba, libpjsip, mbedtls, php, ruby, sqlite, tiff,
  tor, wayland, wireshark, xserver_xorg-server

- Fixes for download/compilation/runtime/license issues in bearssl,
  check, checkpolicy, exempi, exfat, exfat-utils, fmc, fmlib,
  glib-networking, gobject-introspection, gperf, i2pd, ima-evm-utils,
  imx-alsa-plugins, imx-kobs, imx-lib, imx-m4fwloader, imx-mkimage,
  janus-gateway, libftdi1, libmbim, libmng, libtalloc, libuwsc,
  libxkbcommon, linux, lpeg, lrzsz, lttng-tools, lua-cqueues, mfgtools,
  mutt, policycoreutils, polkit, postgresql, pptp-linux,
  qcom-db410c-firmware, qoriq-rcw, qt5virtualkeyboard, rhash, rtl_433,
  swupdate, tekui, tinyxml, wpa_supplicant, xdriver_xf86-video-imx-viv,
  xr819-xradio, xxhash, zip

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2022.11.1

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2022.02.8..

    32  Julien Olivain
    28  Fabrice Fontaine
    21  Ricardo Martincoski
    15  Bernd Kuhls
     8  Peter Korsgaard
     5  Christian Stewart
     4  Quentin Schulz
     3  Yann E. MORIN
     2  Francois Perrad
     2  Lang Daniel
     2  Nicolas Carrier
     2  Peter Seiderer
     1  Bartosz Golaszewski
     1  Casey Reeves
     1  James Hilliard
     1  Maxim Kochetkov
     1  Michael Nosthoff
     1  Nevo Hed
     1  Norbert Lange
     1  Thomas Claveirole

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
