Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0677C46CCA
	for <buildroot@archiver.kernel.org>; Tue, 14 Nov 2023 20:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65C01416E5;
	Tue, 14 Nov 2023 20:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65C01416E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7dyjfjIqFNbL; Tue, 14 Nov 2023 20:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40A4040223;
	Tue, 14 Nov 2023 20:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40A4040223
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7EF41BF2CD
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 20:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A11C161456
 for <buildroot@lists.busybox.net>; Tue, 14 Nov 2023 20:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A11C161456
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id skqe-pehyJnY for <buildroot@lists.busybox.net>;
 Tue, 14 Nov 2023 20:30:17 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16A5D61451
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 20:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16A5D61451
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E89660002
 for <buildroot@buildroot.org>; Tue, 14 Nov 2023 20:30:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r3033-00CURY-1N
 for buildroot@buildroot.org; Tue, 14 Nov 2023 21:30:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Nov 2023 21:30:13 +0100
Message-ID: <87cywccc2y.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] Buildroot 2023.02.7 released
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

Buildroot 2023.02.7 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2023.02.7.tar.gz

or

http://buildroot.org/downloads/buildroot-2023.02.7.tar.xz

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2023.02.7 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2023.02.6 release.

- Per-package builds: Unbreak SDK relocation logic. Only drop the hard
  links for the final host / target directory, fixing a build time /
  size regression in 2023.02.6.

- Packages where a free-form version/site can be specified (E.G. Linux,
  U-Boot, ..) can now have the corresponding tarballs of these custom
  downloads checked by the download infrastructure based on .hash files
  in the global patch directory. These hashes are optional unless
  BR2_DOWNLOAD_FORCE_CHECK_HASHES is enabled.

  A utils/add-custom-hashes helper script has been added to
  assist in managing such hash files.

- Defconfigs: stm32mp157a-dk1, stm32mp157c-dk2: Unbreak TF-A build,
  stm32mp157c-odessey: Use a fixed TF-A version for reproducibility

- Security fixes for apache, arm-trusted-firmware, clamav, cups-filters,
  go, ksmbd-tools, minizip-zlib, nghttp2, opencv4, python-django,
  python-urllib3, python-web2py, rabbitmq-c, redis, suricata, tiff, tor,
  traceroute, vim, wireshark, wolfssl, xen, xlib_libX11, xlib_libXpm,
  zchunk

- Fixes for download/compilation/runtime/license issues in aufs,
  aufs-util, azure-iot-sdk, cjson, dhcpcd, freeradius-server, htop,
  kvmtool, libgdiplus, libopenssl, libosmium, libtommath, libupnp,
  libzlib, lxc, mender, mpd, mxsldr, nano, nettle, network-manager,
  nodejs, opencv4-contrib, openjdk-bin, openvpn, opusfile, paho-mqtt-c,
  perl-lwp-protocol-https, php, riscv64-elf-toolchain, tar, websocketpp,
  xdg-dbus-proxy, zabbix

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2023.02.7

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2023.02.6..

    35  Fabrice Fontaine
    22  Peter Korsgaard
    10  Yann E. MORIN
     8  Bernd Kuhls
     6  Adam Duskett
     2  Adrian Perez de Castro
     2  Angelo Compagnucci
     2  Scott Fan
     2  Woodrow Douglass
     1  Andreas Ziegler
     1  Andrew Donnellan
     1  Brandon Maier
     1  Christian Hitz
     1  Fabien Thomas
     1  Francois Perrad
     1  Giulio Benetti
     1  Kalpesh Panchal
     1  Maxim Kochetkov
     1  Michael Nosthoff
     1  Oleg Lyovin
     1  Thomas Petazzoni
     1  Titouan Christophe

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
