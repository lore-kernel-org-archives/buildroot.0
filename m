Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B06ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6244F40248;
	Sun, 30 Oct 2022 20:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6244F40248
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DeVDEpC9356S; Sun, 30 Oct 2022 20:26:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA10A400D2;
	Sun, 30 Oct 2022 20:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA10A400D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E19861BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99CD580FAE
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99CD580FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ThYzFBLjTfvO for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:25:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2B6280FAF
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2B6280FAF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD7838764E; Sun, 30 Oct 2022 20:25:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 21:22:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d70fac1350a88a8e0e87d0d1b0bcf80eeeb5cf3
X-Git-Newrev: eb9906b1290b11cd9f159f493b199c0d4e0d1102
X-Patchwork-Hint: ignore
Message-Id: <20221030202515.BD7838764E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pathspec: new packages
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb9906b1290b11cd9f159f493b199c0d4e0d1102
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                   |  1 +
 package/python-pathspec/python-pathspec.hash |  5 +++++
 package/python-pathspec/python-pathspec.mk   | 14 ++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2047b77b82..2c33726c77 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1391,6 +1391,7 @@ F:	package/python-logstash/
 F:	package/python-maturin/
 F:	package/python-multidict/
 F:	package/python-mypy-extensions/
+F:	package/python-pathspec/
 F:	package/python-pep517/
 F:	package/python-pycares/
 F:	package/python-pydyf/
diff --git a/package/python-pathspec/python-pathspec.hash b/package/python-pathspec/python-pathspec.hash
new file mode 100644
index 0000000000..91e4fb85b7
--- /dev/null
+++ b/package/python-pathspec/python-pathspec.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pathspec/json
+md5  6f4fde5e701d328a2846d206edb63aa9  pathspec-0.10.1.tar.gz
+sha256  7ace6161b621d31e7902eb6b5ae148d12cfd23f4a249b9ffb6b9fee12084323d  pathspec-0.10.1.tar.gz
+# Locally computed sha256 checksums
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/python-pathspec/python-pathspec.mk b/package/python-pathspec/python-pathspec.mk
new file mode 100644
index 0000000000..ccb794cce9
--- /dev/null
+++ b/package/python-pathspec/python-pathspec.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pathspec
+#
+################################################################################
+
+PYTHON_PATHSPEC_VERSION = 0.10.1
+PYTHON_PATHSPEC_SOURCE = pathspec-$(PYTHON_PATHSPEC_VERSION).tar.gz
+PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/24/9f/a9ae1e6efa11992dba2c4727d94602bd2f6ee5f0dedc29ee2d5d572c20f7
+PYTHON_PATHSPEC_LICENSE = MPL-2.0
+PYTHON_PATHSPEC_LICENSE_FILES = LICENSE
+PYTHON_PATHSPEC_SETUP_TYPE = setuptools
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
