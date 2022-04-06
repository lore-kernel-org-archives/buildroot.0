Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865DAC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 16:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F47260B9A;
	Wed,  6 Apr 2022 16:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KNq3JY5V_vvQ; Wed,  6 Apr 2022 16:02:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51AFA6103F;
	Wed,  6 Apr 2022 16:02:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17B151BF59E
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 16:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0602A40517
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 16:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ICcd-Xu9vfLT for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 16:02:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C5DE40383
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 16:02:20 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C0ACBE0002
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 16:02:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1nc86q-00HWY7-Lc
 for buildroot@buildroot.org; Wed, 06 Apr 2022 18:02:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 06 Apr 2022 18:02:16 +0200
Message-ID: <87a6cyurnb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.02.12 released; 2021.02.x EOL
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

Buildroot 2021.02.12 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2021.02.12.tar.gz

or

http://buildroot.org/downloads/buildroot-2021.02.12.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2021.02.12 is a bugfix release on the previous long term
release, fixing a number of important / security related issues
discovered since the 2021.02.11 release.

Notice that the 2021.02.x series is now end of life unless somebody
steps up to take over maintenance. Please migrate to the 2022.02 series
instead which will be supported until April 2023.

- pkg-stats: Limit memory use for CPE matching

- Security fixes for libzlib, matio, nbd, netatalk, python-paramiko,
  python-twisted, urandom-scripts, vim

- Fixes for download/compilation/runtime/license issues in gdk-pixbuf,
  jack2, opus, python-treq, unbound, wireshark, zlib-ng, zziplib

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2021.02.12

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2021.02.11..

    15  Fabrice Fontaine
     4  Thomas Petazzoni
     2  Peter Korsgaard
     2  Peter Seiderer
     1  Andreas Ziegler
     1  Bernd Kuhls
     1  Gwenhael Goavec-Merou
     1  Jason A. Donenfeld
     1  Kyle Harding
     1  Markus Mayer
     1  Romain Naour
     1  Thomas Huth

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
