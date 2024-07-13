Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA89C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 13:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1241683F67;
	Sat, 13 Jul 2024 13:12:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmaRLLIVlrRz; Sat, 13 Jul 2024 13:12:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0029C82082
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0029C82082;
	Sat, 13 Jul 2024 13:12:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F24EE1BF400
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 13:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD30F400DD
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 13:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QrBkyAHSnZs1 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 13:12:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C666400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C666400A4
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C666400A4
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:12:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DCF6FF804
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:12:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sScYO-00Cuvm-1P
 for buildroot@buildroot.org; Sat, 13 Jul 2024 15:12:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 15:12:44 +0200
Message-ID: <871q3xfnar.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.02.4 released
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
(https://buildroot.org).

Buildroot 2024.02.4 is released - Go download it at:

https://buildroot.org/downloads/buildroot-2024.02.4.tar.gz

or

https://buildroot.org/downloads/buildroot-2024.02.4.tar.xz

Or get it from Git:

https://gitlab.com/buildroot.org/buildroot.git (2024.02.4 tag)

Buildroot 2024.02.4 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2024.02.3 release.

- Infrastructure: Ensure a custom tar program specified with make
  TAR=/path/to/custom/tar is used everwhere

- Defconfigs: Pine64 rockpro64: Build ethernet driver in kernel rather
  than as module

- Security fixes for apache, fluent-bit, ghostscript, glibc, openssh,
  openvpn, php, vlc, znc

- Fixes for download/compilation/runtime/license issues in composer,
  daq, liblockfile, libmad, libopenssl, mesa3d, network-manager, ntp,
  octave, openssh, python3, qt6base, raspberrypi-usbboot, redis,
  sentry-cli, systemd, tor, xmrig

For more details, see the CHANGES file:

https://gitlab.com/buildroot.org/buildroot/-/blob/2024.02.4/CHANGES

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -s -n 2024.02.3..

    15  Yann E. MORIN
    12  Bernd Kuhls
     8  Dario Binacchi
     6  Peter Korsgaard
     3  Julien Olivain
     2  Brandon Maier
     1  Aleksandr Makarov
     1  Fiona Klute
     1  Fiona Klute (WIWA)
     1  Francois Perrad
     1  James Hilliard
     1  Joachim Wiberg
     1  Kilian Zinnecker
     1  Roy Kollen Svendsen
     1  Titouan Christophe
     1  Vincent Fazio

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
