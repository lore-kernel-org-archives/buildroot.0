Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B016DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 21:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F202818EC;
	Mon, 28 Feb 2022 21:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aE17yZgNlrL0; Mon, 28 Feb 2022 21:06:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D00C81493;
	Mon, 28 Feb 2022 21:06:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F1121BF2FF
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F380404B6
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 21:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N3agSmBe2a3X for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 21:06:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C75824049F
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 21:06:02 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 30FDD40006
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 21:05:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1nOnDS-00EFKh-Hb
 for buildroot@buildroot.org; Mon, 28 Feb 2022 22:05:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 22:05:58 +0100
Message-ID: <8735k2zop5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.02.10 released
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

Buildroot 2021.02.10 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2021.02.10.tar.gz

or

http://buildroot.org/downloads/buildroot-2021.02.10.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2021.02.10 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2021.02.9 release.

- Defconfigs: Andes ae3xx, Intel galileo: Fix build with host gcc >= 10,
  ROC-RK3399-PC: Bump rootfs size to fix build issue.

- Add conditional patching logic to fix build issues for older U-Boot /
  Linux kernel versions when built with a host gcc >= 10.

- Security fixes for connman, expat, go, libarchive, prosody,
  python-django, tiff, util-linux, vim, xen

- Fixes for download/compilation/runtime/license issues in casync,
  cgilua, gauche, gensio, gst-omx, gst1-devtools, gst1-libav,
  gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
  gst1-plugins-ugly, gst1-python, gst1-rtsp-server, gst1-vaapi,
  gstreamer1, gstreamer1-editing-services, kf5-extra-cmake-modules,
  kodi, linux, log4cxx, mpd, nfs-utils, pistache, rtl8723bu,

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2021.02.10

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2021.02.9..

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
