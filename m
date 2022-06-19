Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E62CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 11:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73F60415CE;
	Sun, 19 Jun 2022 11:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73F60415CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3SLsaMs1u7Jf; Sun, 19 Jun 2022 11:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A1FF415A3;
	Sun, 19 Jun 2022 11:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A1FF415A3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4148A1BF59B
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 11:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 294E6415A3
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 11:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 294E6415A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SFtMpPAfQMq5 for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 11:08:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82B78410B6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82B78410B6
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 11:08:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7B3821BF207
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 11:08:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1o2smu-006CVg-JN
 for buildroot@buildroot.org; Sun, 19 Jun 2022 13:08:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 13:08:16 +0200
Message-ID: <877d5cvrkv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2022.02.3 released
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

Buildroot 2022.02.3 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2022.02.3.tar.gz

or

http://buildroot.org/downloads/buildroot-2022.02.3.tar.xz

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2022.02.3 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2022.02.2 release.

- Infrastructure: Fix building under paths containing regex characters
  (E.G. '+')

- Toolchain: Only allow ppc64le variants for which a glibc/musl/uclibc
  toolchain is supported.

- Security fixes for go, janet, mariadb, ntfs-3g, openjpeg, rsyslog,
  ruby, runc, tiff, uclibc, unrar, vim, webkitgtk, wpewebkit

- Fixes for download/compilation/runtime/license issues in
  arm-trusted-firmware, at91dataflashboot, boinc, dhcp, diffutils, edk2,
  fbv, gensio, glibc, go, gtest, iucode-tool, libcec, libcurl,
  libfreeimage, libnftnl, libodb-boost, linux, linux-tools,
  lttng-modules, memcached, mono, mutt, network-manager, nginx, ogre,
  openvpn, qemu, qpid-proton, qt5webengine, rauc, rockchip-mali, rustc,
  samba4, strace, xdriver_xf86-video-amdgpu, xdriver_xf86-video-ati,
  zlib-ng

- New packages: qt5webengine-chromium, qt5webengine-chromium-catapult

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2022.02.3

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2022.02.2..

    41  Fabrice Fontaine
     7  Adrian Perez de Castro
     4  James Hilliard
     4  Peter Korsgaard
     3  Baruch Siach
     3  Romain Naour
     2  Arnout Vandecappelle (Essensium/Mind)
     2  Bernd Kuhls
     2  Christian Stewart
     2  Joel Stanley
     2  Thomas Petazzoni
     2  Waldemar Brodkorb
     1  Charles Hardin
     1  Dimitar Tomov
     1  Francois Perrad
     1  Giulio Benetti
     1  Jarkko Sakkinen
     1  Kory Maincent
     1  Luca Ceresoli
     1  Markus Mayer
     1  Quentin Schulz
     1  Yann E. MORIN

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
