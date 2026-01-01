Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EEAEED603
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 15:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C5676078D;
	Thu,  1 Jan 2026 15:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brNlnwJdhB-Y; Thu,  1 Jan 2026 15:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8EBA60AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767280076;
	bh=9QhNoqeNrXr35YLswWKV/wfLaHm+kAtVZeCUwq5eEGY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OD6qhh4+dxF0hSvv+53IexnxXmyd1SLCfIwhtadDOU0A+QgnsoCqN4u8xWasJuO9f
	 4w1BRZa5FfLiV3zb2tk61Pne30joQE+IHYEEuOsi0CeCH2p+EHqnxgZbM3ER1YZb1y
	 F8ZDpWqDmILOHbsIeMJDVZ7A80kqs2pH4UhFhgdhIcQ5wceKqpuy1WFdknG3mcGyaO
	 LWpkb77vkdDxWvT4NdK9WAOWNL76L41LZvIBcUBfWfGSmT/Rhg51+f18WvWfLPEU0g
	 o0Tk1QuUgJzX7/+O/Zcdld+LakMLFSkL/OeT0Qix5Jy6ZZ6diRKAlZ2X2S72d83M8O
	 ySIjRbEon0IOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8EBA60AA1;
	Thu,  1 Jan 2026 15:07:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 743E0351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BFAB4070C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNuVxAhGLwNj for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 15:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B4D040703
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B4D040703
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 15:07:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7600C87DCF; Thu,  1 Jan 2026 15:07:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 15:33:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63d0611b0c4eeb7ac7c4f07defca637d566043b1
X-Git-Newrev: c2cf998b8d610b9894467e0a6e4e57397e99ed34
X-Patchwork-Hint: ignore
Message-Id: <20260101150751.7600C87DCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburcu: bump version to 0.15.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c2cf998b8d610b9894467e0a6e4e57397e99ed34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://git.lttng.org/?p=userspace-rcu.git;a=blob;f=ChangeLog;h=4833f6a67efb4cf0c4e56c9e4153b3ded6d89d34;hb=refs/heads/stable-0.15

Added MIT license and updated other license files and hashes due to
upstream commits:
https://git.lttng.org/?p=userspace-rcu.git;a=commitdiff;h=29b2b11ef53eee2848dd06fba8c49003e17c539f
https://git.lttng.org/?p=userspace-rcu.git;a=commit;h=d001c88633f6a58e94eb73f4814976d13f61bd77

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/liburcu/liburcu.hash | 12 ++++++------
 package/liburcu/liburcu.mk   |  8 ++++++--
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/package/liburcu/liburcu.hash b/package/liburcu/liburcu.hash
index a78b196ef6..5b5947f6b8 100644
--- a/package/liburcu/liburcu.hash
+++ b/package/liburcu/liburcu.hash
@@ -1,8 +1,8 @@
-# http://www.lttng.org/files/urcu/userspace-rcu-0.14.0.tar.bz2.sha256
-sha256  ca43bf261d4d392cff20dfae440836603bf009fce24fdc9b2697d837a2239d4f  userspace-rcu-0.14.0.tar.bz2
+# From https://lttng.org/files/urcu/userspace-rcu-0.15.5.tar.bz2.sha256
+sha256  b2f787a8a83512c32599e71cdabcc5131464947b82014896bd11413b2d782de1  userspace-rcu-0.15.5.tar.bz2
 
 # Hash for license files
-sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  lgpl-2.1.txt
-sha256  8ef8121eddd2fc0779d94331a1d0f1ead9c796343d845e564cd8c8c4ae3d6f6e  lgpl-relicensing.txt
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
-sha256  e8c070cb093be4b2eaf938a5f1c11621163b2d9cfa2790460cf925d81e442fa7  LICENSE
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-or-later.txt
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
+sha256  5f968522edc611ac568371336609170b00dca5159211a87d2e136b837222826b  LICENSE.md
diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index bb5e2c0ec7..656dfb2408 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -4,11 +4,15 @@
 #
 ################################################################################
 
-LIBURCU_VERSION = 0.14.0
+LIBURCU_VERSION = 0.15.5
 LIBURCU_SITE = http://lttng.org/files/urcu
 LIBURCU_SOURCE = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 LIBURCU_LICENSE = LGPL-2.1+ (library), MIT-like (few source files listed in LICENSE), GPL-2.0+ (test), GPL-3.0 (few *.m4 files)
-LIBURCU_LICENSE_FILES = lgpl-2.1.txt lgpl-relicensing.txt gpl-2.0.txt LICENSE
+LIBURCU_LICENSE_FILES = \
+	LICENSES/GPL-2.0-or-later.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/MIT.txt \
+	LICENSE.md
 
 LIBURCU_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
