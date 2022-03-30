Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6264CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 17:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1690341D6F;
	Wed, 30 Mar 2022 17:29:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id COxBM0e7dMSf; Wed, 30 Mar 2022 17:29:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E502C41C86;
	Wed, 30 Mar 2022 17:29:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0F991BF47E
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEF9661272
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:29:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K1hwt7IQk0vB for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 17:29:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 835986126E
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 17:29:51 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout07.t-online.de (Postfix) with SMTP id 28958478A
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 19:29:17 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.188.174]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nZc8C-1m85Q10; Wed, 30 Mar 2022 19:29:16 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:55606)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nZc8B-0002kD-MD
 for buildroot@buildroot.org; Wed, 30 Mar 2022 19:29:15 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 19:29:15 +0200
Message-Id: <20220330172915.265828-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1648661356-0000F5B3-F19E5108/0/0 CLEAN NORMAL
X-TOI-MSGID: 5637e37d-8918-49fd-a325-eb650da31836
Subject: [Buildroot] [PATCH 1/1] package/libzlib: security bump version to
 1.2.12
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

Fixes CVE-2018-25032.

Release notes:
http://madler.net/pipermail/zlib-announce_madler.net/2022/000012.html

Changelog: https://github.com/madler/zlib/blob/master/ChangeLog

Updated license hash due to version bump, reformatted hashes:
https://github.com/madler/zlib/commit/21767c654d31d2dccdde4330529775c6c5fd5389

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libzlib/libzlib.hash | 4 ++--
 package/libzlib/libzlib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libzlib/libzlib.hash b/package/libzlib/libzlib.hash
index e3736b1011..e6ca974e2f 100644
--- a/package/libzlib/libzlib.hash
+++ b/package/libzlib/libzlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256 4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066  zlib-1.2.11.tar.xz
+sha256  7db46b8d7726232a621befaab4a1c870f00a90805511c0e0090441dac57def18  zlib-1.2.12.tar.xz
 # License files, locally calculated
-sha256 7960b6b1cc63e619abb77acaea5427159605afee8c8b362664f4effc7d7f7d15  README
+sha256  fc2c3368901700f0acdeb1d8afeaca5923296768ec6824ecdf627aac396001fd  README
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index a10fc748d1..933732d6ba 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZLIB_VERSION = 1.2.11
+LIBZLIB_VERSION = 1.2.12
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
 LIBZLIB_SITE = http://www.zlib.net
 LIBZLIB_LICENSE = Zlib
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
