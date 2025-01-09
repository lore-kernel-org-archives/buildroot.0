Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B31FE77199
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 14:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CA7580C25;
	Thu,  9 Jan 2025 14:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mP-Q2Cgb9i1b; Thu,  9 Jan 2025 14:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ACF080C27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ACF080C27;
	Thu,  9 Jan 2025 14:02:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E909E76C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 14:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA7CD60AE6
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 14:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Lf_u4Sw3Qjp for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 14:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 894A360AE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 894A360AE1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 894A360AE1
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 14:02:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B040C1BF206
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 14:02:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tVt7D-005Ks7-0V
 for buildroot@buildroot.org; Thu, 09 Jan 2025 15:02:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 09 Jan 2025 15:02:27 +0100
Message-ID: <8734hsjdak.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.02.10 released
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(https://buildroot.org).

Buildroot 2024.02.10 is released - Go download it at:

https://buildroot.org/downloads/buildroot-2024.02.10.tar.gz

or

https://buildroot.org/downloads/buildroot-2024.02.10.tar.xz

Or get it from Git:

https://gitlab.com/buildroot.org/buildroot.git (2024.02.10 tag)

Buildroot 2024.02.10 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2024.02.9 release.

- Ensure CONFIG_TRIM_UNUSED_KSYMS is disabled when building external
  Linux kernel modules

- Security fixes for apr, gst1-plugins-base, iperf3, libcurl,
  libsndfile, libsoup3, netatalk, opensc, python-django, python3,
  subversion, wget, wireshark

- Fixes for download/compilation/runtime/license issues in bc, cdrkit,
  cryptodev-linux, freeipmi, gdb, gnupg2, gnutls, go,
  gobject-introspection, grub2, gst-omx, gst1-devtools, gst1-libav,
  gst1-plugins-bad, gst1-plugins-good, gst1-plugins-ugly, gst1-python,
  gst1-rtsp-server, gst1-vaapi, gstreamer1, gstreamer1-editing-services,
  libsha1, libvirt, libxcrypt, linux, linux-pam, mosquitto, nettle,
  octave, perl, pixman, procps-ng, qt6base, samba4, skeleton, tzdata,
  v4l2loopback, webkitgtk, zic

For more details, see the CHANGES file:

https://gitlab.com/buildroot.org/buildroot/-/blob/2024.02.10/CHANGES

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -s -n 2024.02.9..

    46  Peter Korsgaard
    16  Thomas Petazzoni
     9  Bernd Kuhls
     8  Julien Olivain
     7  Yann E. MORIN
     3  Akhilesh Nema
     3  Francois Perrad
     2  Thomas Bonnefille
     2  Thomas Devoogdt
     1  Bartosz Bilas
     1  Brandon Maier
     1  Christian Stewart
     1  Reza Arbab

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
