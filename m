Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FFEC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF41140135;
	Mon,  5 Feb 2024 17:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF41140135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SWCXcQzY1l4g; Mon,  5 Feb 2024 17:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF96740A61;
	Mon,  5 Feb 2024 17:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF96740A61
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 655F61BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7AF54048E
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7AF54048E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IveGlBrgD-yy for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:42:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC1C24018B
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC1C24018B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D96FE86D97; Mon,  5 Feb 2024 17:42:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 18:39:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88d3e8ca112cc932b39da21cdf4268b580a35f8d
X-Git-Newrev: cec6ed4e5ef8c5438c05691c109efd1cf2b8208e
X-Patchwork-Hint: ignore
Message-Id: <20240205174221.D96FE86D97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-can: bump to version 4.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=cec6ed4e5ef8c5438c05691c109efd1cf2b8208e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer used python-aenum runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Peter: drop python-setuptools as pointed out by Marcus Hoffmann]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-can/Config.in       | 2 --
 package/python-can/python-can.hash | 4 ++--
 package/python-can/python-can.mk   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index 68a9ffca71..a00c9263cf 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_PYTHON_CAN
 	bool "python-can"
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
-	select BR2_PACKAGE_PYTHON_AENUM # runtime
 	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
diff --git a/package/python-can/python-can.hash b/package/python-can/python-can.hash
index 35e752ea54..4e706519be 100644
--- a/package/python-can/python-can.hash
+++ b/package/python-can/python-can.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-can/json
-md5  26d799fe952cb590fba03f3d26ee66a4  python-can-4.2.2.tar.gz
-sha256  6ad50f4613289f3c4d276b6d2ac8901d776dcb929994cce93f55a69e858c595f  python-can-4.2.2.tar.gz
+md5  a84ace55fdeca8efd50986deacfba584  python-can-4.3.1.tar.gz
+sha256  008bea1c12e31586e1aa76971126b831bf01056a900e91862a11360e011ab933  python-can-4.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index 012c82682c..c7100e3dda 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_CAN_VERSION = 4.2.2
-PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/dd/f1/327caaf05b6bca594250053058a2adac537a88dfb5c41bb5498cfda9de78
+PYTHON_CAN_VERSION = 4.3.1
+PYTHON_CAN_SITE = https://files.pythonhosted.org/packages/02/fc/d5fd33ee93f17a4eb0dcd75aebf522396e3f511bf474058e99e86ae4e33f
 PYTHON_CAN_SETUP_TYPE = setuptools
 PYTHON_CAN_LICENSE = LGPL-3.0
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
