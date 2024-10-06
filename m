Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10663CFB424
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 21:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEFDC80C36;
	Sun,  6 Oct 2024 21:37:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6vDR_vR36eBh; Sun,  6 Oct 2024 21:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6EC380D8F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6EC380D8F;
	Sun,  6 Oct 2024 21:37:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CC591BF40F
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 21:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58CD960711
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 21:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cGAfeLcYobq for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 21:37:37 +0000 (UTC)
X-Greylist: delayed 340 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 06 Oct 2024 21:37:37 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14DE460683
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14DE460683
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.30.189.100;
 helo=iodev.co.uk; envelope-from=ismael@iodev.co.uk; receiver=<UNKNOWN> 
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14DE460683
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 21:37:36 +0000 (UTC)
Received: from localhost (modemcable084.187-58-74.mc.videotron.ca
 [74.58.187.84]) by iodev.co.uk (Postfix) with ESMTPSA id E4C9D357999;
 Sun, 06 Oct 2024 23:31:55 +0200 (CEST)
From: Ismael Luceno <ismael@iodev.co.uk>
To: buildroot@buildroot.org
Date: Sun,  6 Oct 2024 23:31:33 +0200
Message-ID: <20241006213134.2423-2-ismael@iodev.co.uk>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=iodev.co.uk
Subject: [Buildroot] [PATCH] package/mawk: bump version to 1.3.4-20240905
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
Cc: Ismael Luceno <ismael@iodev.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
---
 package/mawk/mawk.hash | 3 ++-
 package/mawk/mawk.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mawk/mawk.hash b/package/mawk/mawk.hash
index 31a74cab606e..227c2b1b17d2 100644
--- a/package/mawk/mawk.hash
+++ b/package/mawk/mawk.hash
@@ -1,2 +1,3 @@
-sha256  a8e319a83744b1f1fb6988dfa189d61887f866e9140cc9a49eb003b2b0655e88  mawk-1.3.4-20240123.tgz
+sha256  a39967927dfa1b0116efc45b944a0f5b5b4c34f8e842a4b223dcdd7b367399e0  mawk-1.3.4-20240905.tgz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+
diff --git a/package/mawk/mawk.mk b/package/mawk/mawk.mk
index 9aadf6d9727e..1a5e80ae8e57 100644
--- a/package/mawk/mawk.mk
+++ b/package/mawk/mawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAWK_VERSION = 1.3.4-20240123
+MAWK_VERSION = 1.3.4-20240905
 MAWK_SITE = https://invisible-mirror.net/archives/mawk
 MAWK_SOURCE = mawk-$(MAWK_VERSION).tgz
 MAWK_LICENSE = GPL-2.0
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
