Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A92C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32B70820C8;
	Tue,  6 Feb 2024 13:07:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HrgvnoTHZjRq; Tue,  6 Feb 2024 13:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38F33820CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38F33820CF;
	Tue,  6 Feb 2024 13:07:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D6251BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAF3F611CA
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAF3F611CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNdf2Rwz4Qjt for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:07:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DCBE6118F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DCBE6118F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09785825C3; Tue,  6 Feb 2024 13:07:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 14:04:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 606b56c0f0510c15f006bc82243d65ca2cd1a30d
X-Git-Newrev: 1229b824ad97efd49747770a35d24b9f4218c6be
X-Patchwork-Hint: ignore
Message-Id: <20240206130733.09785825C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-matplotlib-inline: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1229b824ad97efd49747770a35d24b9f4218c6be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                          |  1 +
 package/python-matplotlib-inline/Config.in                 |  7 +++++++
 .../python-matplotlib-inline/python-matplotlib-inline.hash |  5 +++++
 .../python-matplotlib-inline/python-matplotlib-inline.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 97f590e2b7..728bd03b80 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1181,6 +1181,7 @@ menu "External python modules"
 	source "package/python-marshmallow/Config.in"
 	source "package/python-marshmallow-sqlalchemy/Config.in"
 	source "package/python-matplotlib/Config.in"
+	source "package/python-matplotlib-inline/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-memory-profiler/Config.in"
 	source "package/python-midiutil/Config.in"
diff --git a/package/python-matplotlib-inline/Config.in b/package/python-matplotlib-inline/Config.in
new file mode 100644
index 0000000000..2ea9f4d966
--- /dev/null
+++ b/package/python-matplotlib-inline/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MATPLOTLIB_INLINE
+	bool "python-matplotlib-inline"
+	select BR2_PACKAGE_PYTHON_TRAITLETS # runtime
+	help
+	  Inline Matplotlib backend for Jupyter.
+
+	  https://github.com/ipython/matplotlib-inline
diff --git a/package/python-matplotlib-inline/python-matplotlib-inline.hash b/package/python-matplotlib-inline/python-matplotlib-inline.hash
new file mode 100644
index 0000000000..7382fc3406
--- /dev/null
+++ b/package/python-matplotlib-inline/python-matplotlib-inline.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/matplotlib-inline/json
+md5  aded9a57e2f526f76b3a4851d5528d4f  matplotlib-inline-0.1.6.tar.gz
+sha256  f887e5f10ba98e8d2b150ddcf4702c1e5f8b3a20005eb0f74bfdbd360ee6f304  matplotlib-inline-0.1.6.tar.gz
+# Locally computed sha256 checksums
+sha256  8521b036c6448e0e0aa7213d4713b6fdee0f4c64c9f320450f77346bf5c0e8e4  LICENSE
diff --git a/package/python-matplotlib-inline/python-matplotlib-inline.mk b/package/python-matplotlib-inline/python-matplotlib-inline.mk
new file mode 100644
index 0000000000..c9c22605ca
--- /dev/null
+++ b/package/python-matplotlib-inline/python-matplotlib-inline.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-matplotlib-inline
+#
+################################################################################
+
+PYTHON_MATPLOTLIB_INLINE_VERSION = 0.1.6
+PYTHON_MATPLOTLIB_INLINE_SOURCE = matplotlib-inline-$(PYTHON_MATPLOTLIB_INLINE_VERSION).tar.gz
+PYTHON_MATPLOTLIB_INLINE_SITE = https://files.pythonhosted.org/packages/d9/50/3af8c0362f26108e54d58c7f38784a3bdae6b9a450bab48ee8482d737f44
+PYTHON_MATPLOTLIB_INLINE_SETUP_TYPE = setuptools
+PYTHON_MATPLOTLIB_INLINE_LICENSE = BSD-3-Clause
+PYTHON_MATPLOTLIB_INLINE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
