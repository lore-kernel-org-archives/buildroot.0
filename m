Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4484C369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1E9F81A24;
	Sat, 19 Apr 2025 14:43:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cxa4qvoPvHZq; Sat, 19 Apr 2025 14:43:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B49698195C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B49698195C;
	Sat, 19 Apr 2025 14:43:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A332D22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0772406C4
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TNXat0X_A2R for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6D6E4065E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6D6E4065E
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:43:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D438285AB0; Sat, 19 Apr 2025 14:43:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 16:38:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44c11a6862aa41ae025aa0cf248e2e7236b46d21
X-Git-Newrev: 9af9b4b304a38a28d6f81ba209f0ff63f528b571
X-Patchwork-Hint: ignore
Message-Id: <20250419144348.D438285AB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ubus: bump version to afa57cc
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

commit: https://git.buildroot.net/buildroot/commit/?id=9af9b4b304a38a28d6f81ba209f0ff63f528b571
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

 - afa57cc libubus: add support for using channels
 - d996988 libubus: close file descriptor after sending it from a request
 - 252a9b0 libubus: Make UBUS_* macros work cleanly in C++
 - 65bb027 CMakeLists.txt: bump minimum cmake version
 - f84eb59 libubus: fix initial subscribe with autosubscribe
 - 2b39a27 libubus: fix reconnect with auto subscribe
 - b3e8c4e Add auto subscribe support

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ubus/ubus.hash | 2 +-
 package/ubus/ubus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ubus/ubus.hash b/package/ubus/ubus.hash
index af70e86e46..e35f37b03d 100644
--- a/package/ubus/ubus.hash
+++ b/package/ubus/ubus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0020c808d0ba74b1f4c9514e2b3dfa98ec13a142c97b86b9c229479c560aca19  ubus-f787c97b34894a38b15599886cacbca01271684f-git4.tar.gz
+sha256  ba7602c660cb2c15c0e04942414e4cf3d96622622406c5fc3b88895694aebb9f  ubus-afa57cce0aff82f4a7a0e509d4387ebc23dd3be7-git4.tar.gz
 sha256  a3caa6c0e90c87b7c97c2ac3d0c0d416082ef777215faec2e9b24ea6e68f6988  ubusd_acl.h
diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
index cc2ed81786..913c0e3e39 100644
--- a/package/ubus/ubus.mk
+++ b/package/ubus/ubus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UBUS_VERSION = f787c97b34894a38b15599886cacbca01271684f
+UBUS_VERSION = afa57cce0aff82f4a7a0e509d4387ebc23dd3be7
 UBUS_SITE = https://git.openwrt.org/project/ubus.git
 UBUS_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
