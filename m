Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D15C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9B4B4ECC5;
	Mon, 20 Feb 2023 21:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B4B4ECC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gPUCRkAT9783; Mon, 20 Feb 2023 21:54:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F6254ECC2;
	Mon, 20 Feb 2023 21:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F6254ECC2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FB671BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12255416A3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12255416A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l9ryUIzWiwHs for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 254E1416A1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 254E1416A1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 182B4828C8; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:28:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1eeac3dbfe32130bd15b9e9675891e68b12c38d0
X-Git-Newrev: 09c966af735ca53b447f52965d123c21e43ae522
X-Patchwork-Hint: ignore
Message-Id: <20230220205201.182B4828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-can: bump to
 version 4.1.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=09c966af735ca53b447f52965d123c21e43ae522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop spurious setuptools runtime dependency.

Add new msgpack runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-can/Config.in       | 2 +-
 package/python-can/python-can.hash | 5 +++--
 package/python-can/python-can.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index e92d9668e0..5d21e29d88 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_CAN
 	bool "python-can"
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_AENUM # runtime
+	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_WRAPT # runtime
diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index dd8a9b107d..73be230201 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/python-can
-sha256  59d92846ffb981e634e9e0f2d14a6b4967a875e3869bd2ba168c92c4db6b8b5d  python-can-4.0.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/python-can/json
+md5  d8365b7a09e49f47dac0da75d8518808  python-can-4.1.0.tar.gz
+sha256  3f2b6b0dc5f459591d171ee0c0136dce79acedc2740ce695024aa3444e911bb9  python-can-4.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index 9284a9cf99..ba98337d5d 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 4.0.0
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/1f/f7/a643cba269d59e108fe4c1854a8e71d5cdadadd4de1b9c8862b190171122
+PYTHON_CAN_VERSION = 4.1.0
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/90/55/898e69e37d5d4692bf21ba8750e095493d2ecbb29be7394d5cb735f0ab0f
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
