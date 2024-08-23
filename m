Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E1EC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D2D1808AF;
	Fri, 23 Aug 2024 17:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llF9RFVS7MTv; Fri, 23 Aug 2024 17:35:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92A61810E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92A61810E5;
	Fri, 23 Aug 2024 17:35:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 357031BF3F3
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21D4E412F6
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78HPevTFfahk for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:35:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2838F412F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2838F412F4
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:35:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 152DB86497; Fri, 23 Aug 2024 17:35:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:35:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 33b9374d222598230802025dc3025692cc4e3653
X-Git-Newrev: 7866b382bc7e1adc93925076f0b9719d78886e40
X-Patchwork-Hint: ignore
Message-Id: <20240823173553.152DB86497@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-can: add option
 to install the viewer tool
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7866b382bc7e1adc93925076f0b9719d78886e40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enabling the option correctly select the python-curses module dependency
of the viewer tool.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-can/Config.in     | 10 ++++++++++
 package/python-can/python-can.mk |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index 61955a2b00..34ba35bad2 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -11,3 +11,13 @@ config BR2_PACKAGE_PYTHON_CAN
 	  Python.
 
 	  https://github.com/hardbyte/python-can
+
+if BR2_PACKAGE_PYTHON_CAN
+
+config BR2_PACKAGE_PYTHON_CAN_VIEWER
+	bool "python-can-viewer"
+	select BR2_PACKAGE_PYTHON3_CURSES # runtime
+	help
+	  Also install the viewer tool (requires ncurses).
+
+endif
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index b6547a4d3f..bc67be4f8c 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -11,4 +11,11 @@ PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
 
+ifneq ($(BR2_PACKAGE_PYTHON_CAN_VIEWER),y)
+define PYTHON_CAN_REMOVE_VIEWER
+	rm -f $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/can/viewer.py
+endef
+PYTHON_CAN_POST_INSTALL_TARGET_HOOKS += PYTHON_CAN_REMOVE_VIEWER
+endif
+
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
