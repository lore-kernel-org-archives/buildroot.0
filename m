Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4E8C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3512740231;
	Sun,  9 Jan 2022 22:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lXl6knA456Q0; Sun,  9 Jan 2022 22:50:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F82740305;
	Sun,  9 Jan 2022 22:50:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DF451BF969
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E96E740385
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hVXn5ioPqArX for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:49:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCD7A4010E
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:49:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6F02C8324A; Sun,  9 Jan 2022 22:42:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 23:45:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f51c6f6b5c75499bb55be913b5c3533d5a8f648
X-Git-Newrev: 7be02d67a939a42e323cd199798f215197bf5f87
X-Patchwork-Hint: ignore
Message-Id: <20220109224247.6F02C8324A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-argon2-cffi-bindings: new
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7be02d67a939a42e323cd199798f215197bf5f87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/python-argon2-cffi-bindings/Config.in      | 11 ++++++++++
 .../python-argon2-cffi-bindings.hash               |  5 +++++
 .../python-argon2-cffi-bindings.mk                 | 25 ++++++++++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e715d8d353..2aeb80844e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1291,6 +1291,7 @@ F:	package/python-aiorwlock/
 F:	package/python-aiosignal/
 F:	package/python-aiozipkin/
 F:	package/python-argon2-cffi/
+F:	package/python-argon2-cffi-bindings/
 F:	package/python-async-lru/
 F:	package/python-async-timeout/
 F:	package/python-bidict/
diff --git a/package/Config.in b/package/Config.in
index 5e01187b83..c9d099bd39 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -928,6 +928,7 @@ menu "External python modules"
 	source "package/python-ansicolors/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-argon2-cffi/Config.in"
+	source "package/python-argon2-cffi-bindings/Config.in"
 	source "package/python-arrow/Config.in"
 	source "package/python-asgiref/Config.in"
 	source "package/python-asn1crypto/Config.in"
diff --git a/package/python-argon2-cffi-bindings/Config.in b/package/python-argon2-cffi-bindings/Config.in
new file mode 100644
index 0000000000..3d409759e0
--- /dev/null
+++ b/package/python-argon2-cffi-bindings/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_ARGON2_CFFI_BINDINGS
+	bool "python-argon2-cffi-bindings"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_USE_MMU # libargon2
+	depends on !BR2_STATIC_LIBS # libargon2
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_LIBARGON2
+	help
+	  Low-level CFFI bindings for Argon2.
+
+	  https://github.com/hynek/argon2-cffi-bindings
diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
new file mode 100644
index 0000000000..e088d3dad1
--- /dev/null
+++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/argon2-cffi-bindings/json
+md5  f1591e1af7dea9ef3e5b982e2c196c1d  argon2-cffi-bindings-21.2.0.tar.gz
+sha256  bb89ceffa6c791807d1305ceb77dbfacc5aa499891d2c55661c6459651fc39e3  argon2-cffi-bindings-21.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  9c158d4f433627f48ac24b6b4d37970afe4172514673c5318014d7cca157c6df  LICENSE
diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
new file mode 100644
index 0000000000..f0d71e803a
--- /dev/null
+++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# python-argon2-cffi-bindings
+#
+################################################################################
+
+PYTHON_ARGON2_CFFI_BINDINGS_VERSION = 21.2.0
+PYTHON_ARGON2_CFFI_BINDINGS_SOURCE = argon2-cffi-bindings-$(PYTHON_ARGON2_CFFI_BINDINGS_VERSION).tar.gz
+PYTHON_ARGON2_CFFI_BINDINGS_SITE = https://files.pythonhosted.org/packages/b9/e9/184b8ccce6683b0aa2fbb7ba5683ea4b9c5763f1356347f1312c32e3c66e
+PYTHON_ARGON2_CFFI_BINDINGS_SETUP_TYPE = setuptools
+PYTHON_ARGON2_CFFI_BINDINGS_LICENSE = MIT
+PYTHON_ARGON2_CFFI_BINDINGS_LICENSE_FILES = LICENSE
+PYTHON_ARGON2_CFFI_BINDINGS_DEPENDENCIES = \
+	host-python-cffi \
+	host-python-setuptools-scm \
+	libargon2
+PYTHON_ARGON2_CFFI_BINDINGS_ENV = ARGON2_CFFI_USE_SYSTEM=1
+
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+PYTHON_ARGON2_CFFI_BINDINGS_ENV += ARGON2_CFFI_USE_SSE2=1
+else
+PYTHON_ARGON2_CFFI_BINDINGS_ENV += ARGON2_CFFI_USE_SSE2=0
+endif
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
