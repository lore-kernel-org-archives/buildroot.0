Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A978C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:22:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D251E60F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D251E60F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6A1982ACA;
	Tue,  3 Aug 2021 21:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZmeRmTyzxq4; Tue,  3 Aug 2021 21:22:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E7FA82C8E;
	Tue,  3 Aug 2021 21:22:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07BA71BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E30660830
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHp7WT-8U93e for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F3D46067E
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D9CDA8B43E; Tue,  3 Aug 2021 21:09:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 18 May 2021 22:18:49 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 576beb7c0afc46e2b711a84358977e1ecca4cd6f
X-Git-Newrev: 3f0eb2782c66f5cd0d97eacb02b67109e2341b1e
X-Patchwork-Hint: ignore
Message-Id: <20210803210940.D9CDA8B43E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xlib_libX11:
 security bump version to 1.7.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=3f0eb2782c66f5cd0d97eacb02b67109e2341b1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes CVE-2021-31535:
https://lists.x.org/archives/xorg-announce/2021-May/003088.html

Release notes:
https://lists.x.org/archives/xorg-announce/2021-May/003089.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index 5b1162f4c5..b87b2498e8 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2020-November/003065.html
-sha256  36c8f93b6595437c8cfbc9f08618bcb3041cbd303e140a0013f88e4c2977cb54  libX11-1.7.0.tar.bz2
-sha512  f661ca90350fd8a94f054b00f12f5122cea068ebff706acfd399462236c189a296a2358d17d16166635101cf56cc19303dd407873a159932d093c9f33556f9fb  libX11-1.7.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-May/003089.html
+sha256  e64e43deaa562cbfb0d5ada64670ec09c6fac7935262dcd77bbc6d984a535d47  libX11-1.7.1.tar.bz2
+sha512  a76f0a82fce6f9b50646a7cd7ec5ee046650f225816050226068a7548fa083ef07d146d40faaf44e033c59c17b0fda5ffdee3a127dac3ab56cee02133819aa3d  libX11-1.7.1.tar.bz2
 
 # Locally computed
 sha256  2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 8fefbc492a..39d9dc2cc7 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.7.0
+XLIB_LIBX11_VERSION = 1.7.1
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
