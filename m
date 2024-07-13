Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EC5C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 12:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37BB640105;
	Sat, 13 Jul 2024 12:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqYpnoLL6VY5; Sat, 13 Jul 2024 12:10:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00E2D403AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00E2D403AF;
	Sat, 13 Jul 2024 12:10:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E97861BF309
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6FEB6065F
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 12:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHKqhcS-Fuvl for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 12:10:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2F3EE60650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F3EE60650
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F3EE60650
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:10:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FC24E0004
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:10:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sSbZj-00Cooz-2K
 for buildroot@buildroot.org; Sat, 13 Jul 2024 14:10:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 14:10:03 +0200
Message-ID: <87ed7xfq78.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.05.1 released
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

Buildroot 2024.05.1 is released - Go download it at:

https://buildroot.org/downloads/buildroot-2024.05.1.tar.gz

or

https://buildroot.org/downloads/buildroot-2024.05.1.tar.xz

Or get it from Git:

https://gitlab.com/buildroot.org/buildroot.git (2024.05.1 tag)

Buildroot 2024.05.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2024.05 release.

- Infrastructure: Ensure support/scripts/apply-patches can be used
  outside Buildroot (regression in 2024.05).

- Defconfigs: Pine64 rockpro64: Build ethernet driver in kernel rather
  than as module. QEMU sh4: Change to initramfs to workaround regression
  in QEMU. Visionfive2: Correct kernel headers version

- Security fixes for apache, ghostscript, glibc, openssh, openvn, php,
  vlc, znc

- Fixes for download/compilation/runtime/license issues in avro-c, daq,
  dav1d, fluent-bit, glibc, libmad, libopenssl, linux-firmware, mesa3d,
  network-manager, ntp, nut, octave, openssh, raspberrypi-usbboot,
  redis, sentry-cli, tor, uuu, xmrig

For more details, see the CHANGES file:

https://gitlab.com/buildroot.org/buildroot/-/blob/2024.05.1/CHANGES

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -s -n 2024.05..

    14  Bernd Kuhls
    10  Dario Binacchi
     4  Julien Olivain
     4  Peter Korsgaard
     3  Yann E. MORIN
     2  Fabrice Fontaine
     1  Aleksandr Makarov
     1  Brandon Maier
     1  Fiona Klute
     1  Fiona Klute (WIWA)
     1  Francois Perrad
     1  Joachim Wiberg
     1  Lance Fredrickson
     1  Thomas Devoogdt
     1  Titouan Christophe
     1  Waldemar Brodkorb

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
