Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8CFCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 20:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D450581BC6;
	Sun, 15 Oct 2023 20:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D450581BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wXWCuRWJwdE8; Sun, 15 Oct 2023 20:16:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FE8D81E14;
	Sun, 15 Oct 2023 20:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FE8D81E14
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D26E11BF83B
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC0C2611A3
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 20:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC0C2611A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJluZ1s-5T2k for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 20:16:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C86DD60F44
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 20:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C86DD60F44
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4F4E85AB8; Sun, 15 Oct 2023 20:16:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 22:14:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc84952eb38bf1ef63fc8718dc2ced200a3e52dd
X-Git-Newrev: 560f9dbc88f1dc68ba8dc4db8b9459d902786993
X-Patchwork-Hint: ignore
Message-Id: <20231015201648.B4F4E85AB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libite: bump to v2.6.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=560f9dbc88f1dc68ba8dc4db8b9459d902786993
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
 - New APIs introduced in v2.6.0, for details, see
   https://github.com/troglobit/libite/releases/tag/v2.6.0
 - FTBFS fix for uClibc and musl libc, v2.6.1
   https://github.com/troglobit/libite/releases/tag/v2.6.1

Packaging:
 - LICENSE hash changed due to bump in copyright years
 - Disable doxygen (html docs) in build, introduced in v2.4.1

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libite/libite.hash | 4 ++--
 package/libite/libite.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 7dac198ab8..3abad09b0a 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,7 +1,7 @@
 # Upstream .sha256 from GitHub
-sha256  ca086adc7ebf0c2ebf2ed7a6787f9567fb802db8583576228dd5dd5ddfb7bb97  libite-2.5.3.tar.xz
+sha256  0185c3e76874c5821825deaf17cd45e81ce49aaa424e09de5f3665243c59026b  libite-2.6.1.tar.xz
 
 # Locally calculated
-sha256  20db0601195f708d68ff7907907b3cd3b25808efa8332e064b11f00c839a5d2f  LICENSE
+sha256  3a2b964c1772d03ab17b73a389ecce9151e0b190a9247817a2c009b16d356422  LICENSE
 sha256  c2882adb51555b836f35babc59f618d9ddceadcaa2d1dc80bbd4699614d2cd14  src/chomp.c
 sha256  bff7fa7b74324f13a24d56ebb8b49bc9c63ea01836a1c8b5a6afcbbabed62918  src/pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index 1cef992e53..e4bd845487 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.5.3
+LIBITE_VERSION = 2.6.1
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
 LIBITE_LICENSE_FILES = LICENSE src/chomp.c src/pidfile.c
 LIBITE_INSTALL_STAGING = YES
-LIBITE_CONF_OPTS = --without-symlink
+LIBITE_CONF_OPTS = --without-symlink --disable-doxygen-doc
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
