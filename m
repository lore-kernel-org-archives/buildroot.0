Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397E3C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04283407DD;
	Thu,  9 May 2024 16:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MU48s-XzPuWn; Thu,  9 May 2024 16:19:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B88440937
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B88440937;
	Thu,  9 May 2024 16:19:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A6611BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EACD340937
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OrL2UmzP6lqf for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15AC3407DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15AC3407DD
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:19:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87F7586C78; Thu,  9 May 2024 16:19:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:19:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 105f0398c76f3288b2668e0b3ec722b2ebe55a0b
X-Git-Newrev: 571eceed7aac268d8ce2bbf2c6993b4a4e4a2b5d
X-Patchwork-Hint: ignore
Message-Id: <20240509161946.87F7586C78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymodbus: bump to version
 3.6.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=571eceed7aac268d8ce2bbf2c6993b4a4e4a2b5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year range update:
https://github.com/pymodbus-dev/pymodbus/commit/131d30391efd9c64f1fec857ae0372746374e6d2

Drop no longer required python-six runtime dependency.

Drop no longer required python-serial runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pymodbus/Config.in            | 6 ++----
 package/python-pymodbus/python-pymodbus.hash | 6 +++---
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/python-pymodbus/Config.in b/package/python-pymodbus/Config.in
index 0ba6fb88f0..dac6716b87 100644
--- a/package/python-pymodbus/Config.in
+++ b/package/python-pymodbus/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYMODBUS
 	bool "python-pymodbus"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_SERIAL # runtime
 	help
-	  Pymodbus is a full Modbus protocol implementation.
+	  A fully featured modbus protocol stack in python.
 
-	  https://github.com/riptideio/pymodbus
+	  https://github.com/pymodbus-dev/pymodbus/
diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index d9337ffe84..4595246efc 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  89da6585b27b8c4b3887eb9f7d1e950b  pymodbus-3.0.2.tar.gz
-sha256  704cb7fb90631c45f9c3a70b89d0c990fe0e208ac56f14a5c449e21bebd1e201  pymodbus-3.0.2.tar.gz
+md5  809260ecaaef548c7ac327755d7d2d25  pymodbus-3.6.8.tar.gz
+sha256  abb214716b56fc62bc0d5d9d964e2249439341746287e918d175f0e3ee241407  pymodbus-3.6.8.tar.gz
 # Locally computed sha256 checksums
-sha256  796a47993313691ea404d8af7e4c0f9daf1d2760e3900938985b59c9008eee2f  LICENSE
+sha256  47f904249172e795a6b32de91f471073297befffd74e17cafc288d348a55972e  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 54879d38e9..a96edecc54 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.0.2
+PYTHON_PYMODBUS_VERSION = 3.6.8
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/94/f7/6149a1b107fa54378a7adec83db7cd3679bf02216a6f5c83b37f55335897
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/62/c1/f18b090dcc45d34b6a0e3563acde71b407ef96a36fa965c508a84f755355
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
