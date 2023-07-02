Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC27EEB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 15:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2933A60E15;
	Sun,  2 Jul 2023 15:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2933A60E15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kUGNEwuV1-o5; Sun,  2 Jul 2023 15:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7630460E09;
	Sun,  2 Jul 2023 15:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7630460E09
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7882B1BF32A
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 15:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50D75415DF
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 15:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50D75415DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tt7I_f2n7ZcR for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 15:47:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8F5C415D6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8F5C415D6
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 15:47:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 541C6A4C01A0
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 17:47:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47502)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qFzIC-0004JT-08
 for buildroot@buildroot.org; Sun, 02 Jul 2023 17:47:16 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Jul 2023 17:47:15 +0200
Message-Id: <20230702154715.3422865-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688312836;
 bh=Ll4obcFyf7BtLvxDHMNNRTDs6ogP8DEjGXYnxRFx6x8=;
 h=From:To:Subject:Date:From;
 b=O0hIsn+0knJgqHtnC3lO7vlTlcJZsOzpvVMrD9IhtBJdPxSYhY2MphLccH/YNTebT
 52pb6CDZOo7EiroKQAwY+IFhn8YjX3SIfmr4ROtTZCi/WnRc1NUQoF5DIEB9Q7Pyy3
 qTxKD5eR6BMXO9lnG8cw/aXYhHxZ6Wovh9aFjM17msf1y0m/2bzMmiWdx024QAsOFS
 uJmAMuiDwp3BgBAQA1KJ5hugpK3FsMIdW0OaG8IBnGg+iM+puOwpD0hvEIfgD4lfjY
 8AsPpXVQdLIBm8ChCtFi8ywPSxMWz7IBd1828Ik8Qey+Ss3yesF5WSyZuV7H6U8VJv
 K9oGxJztarn/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=O0hIsn+0
Subject: [Buildroot] [PATCH 1/1] package/autoconf-archive: bump version to
 2023.02.20
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

Added sha1 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/autoconf-archive/autoconf-archive.hash | 4 +++-
 package/autoconf-archive/autoconf-archive.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/autoconf-archive/autoconf-archive.hash b/package/autoconf-archive/autoconf-archive.hash
index ff7710dc2b..c4658e6f91 100644
--- a/package/autoconf-archive/autoconf-archive.hash
+++ b/package/autoconf-archive/autoconf-archive.hash
@@ -1,4 +1,6 @@
+# From https://lists.gnu.org/archive/html/autoconf-archive-announce/2023-02/msg00000.html
+sha1  e26d15db0f1ec60e9ea8ff024cf3ee895fa2eabd  autoconf-archive-2023.02.20.tar.xz
 # Computed locally
-sha256  e07454f00d8cae7907bed42d0747798927809947684d94c37207a4d63a32f423  autoconf-archive-2022.09.03.tar.xz
+sha256  71d4048479ae28f1f5794619c3d72df9c01df49b1c628ef85fde37596dc31a33  autoconf-archive-2023.02.20.tar.xz
 sha256  e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYING
 sha256  23ed0b84fa023bfa33433b498192cd08a3bfb1f4864a8ed791a84f3eb48b2dd2  COPYING.EXCEPTION
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index 0ffdf61ddf..07ac7e9743 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_ARCHIVE_VERSION = 2022.09.03
+AUTOCONF_ARCHIVE_VERSION = 2023.02.20
 AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPL-3.0+ with exception
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
