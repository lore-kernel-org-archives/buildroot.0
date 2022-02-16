Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE74C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 13:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86F8E409D7;
	Wed,  9 Mar 2022 13:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kBRpQLdfe0QA; Wed,  9 Mar 2022 13:33:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB2CF40AF0;
	Wed,  9 Mar 2022 13:33:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03AEA1BF9C2
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1695760D4D
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ropjlvZ0GPM6 for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 13:30:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4898360F97
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 13:30:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B4D8283917; Wed,  9 Mar 2022 13:21:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 22:22:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29a12eb86aee706082f344a25d2e563984b9aa1a
X-Git-Newrev: cc60c732a19548cfbd3543d3521324ef5faaa116
X-Patchwork-Hint: ignore
Message-Id: <20220309132156.B4D8283917@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tinycss2: bump to version
 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc60c732a19548cfbd3543d3521324ef5faaa116
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This update drops distutils support and requires flit package
infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-tinycss2/Config.in            | 2 ++
 package/python-tinycss2/python-tinycss2.hash | 4 ++--
 package/python-tinycss2/python-tinycss2.mk   | 6 +++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-tinycss2/Config.in b/package/python-tinycss2/Config.in
index a34717e002..4d6dcca663 100644
--- a/package/python-tinycss2/Config.in
+++ b/package/python-tinycss2/Config.in
@@ -3,3 +3,5 @@ config BR2_PACKAGE_PYTHON_TINYCSS2
 	select BR2_PACKAGE_PYTHON_WEBENCODINGS # runtime
 	help
 	  A tiny CSS parser.
+
+	  https://www.courtbouillon.org/tinycss2
diff --git a/package/python-tinycss2/python-tinycss2.hash b/package/python-tinycss2/python-tinycss2.hash
index eeb3754752..e8e1d93f83 100644
--- a/package/python-tinycss2/python-tinycss2.hash
+++ b/package/python-tinycss2/python-tinycss2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinycss2/json
-md5  7caf513c4e87fc2449dcfbf407a8416f  tinycss2-1.1.0.tar.gz
-sha256  fbdcac3044d60eb85fdb2aa840ece43cf7dbe798e373e6ee0be545d4d134e18a  tinycss2-1.1.0.tar.gz
+md5  60272f58f8d5834b2e09ffbc9bd5de53  tinycss2-1.1.1.tar.gz
+sha256  b2e44dd8883c360c35dd0d1b5aad0b610e5156c2cb3b33434634e539ead9d8bf  tinycss2-1.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6b94acee20ec9f2709333134f3ba70322535fb420af0ce8c1455d9cbe297f1d5  LICENSE
diff --git a/package/python-tinycss2/python-tinycss2.mk b/package/python-tinycss2/python-tinycss2.mk
index 4bf5b97766..e4fc5dc9c5 100644
--- a/package/python-tinycss2/python-tinycss2.mk
+++ b/package/python-tinycss2/python-tinycss2.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_TINYCSS2_VERSION = 1.1.0
+PYTHON_TINYCSS2_VERSION = 1.1.1
 PYTHON_TINYCSS2_SOURCE = tinycss2-$(PYTHON_TINYCSS2_VERSION).tar.gz
-PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/ce/d3/ece7a98d5826bd134e269a3a3030153d30482194fca71d95a3041812aab8
-PYTHON_TINYCSS2_SETUP_TYPE = distutils
+PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/1e/5a/576828164b5486f319c4323915b915a8af3fa4a654bbb6f8fc8e87b5cb17
+PYTHON_TINYCSS2_SETUP_TYPE = flit
 PYTHON_TINYCSS2_LICENSE = BSD-3-Clause
 PYTHON_TINYCSS2_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
