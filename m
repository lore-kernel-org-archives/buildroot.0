Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F941D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B8C380C71;
	Fri, 12 Dec 2025 07:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qzp1aSSEfVVy; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 485F98154B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526139;
	bh=ner7fSAKpNHRvlAUVv2FsLAx2PWg5j3NsUVxlUA6o7k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Sh4PpljT0CK70DPjyz8y3gtUOLxY79551f9jiSAUAAn80GJypJWBeQHHQ302ip8qF
	 kDSWum5Ju/xTP5e/0PRq0fiKzbcpsgxbz66r1BRl1flYejU9IoXM6Y63wehZTmuLEm
	 M3VVlxnRn6ub237nDEQRR0wcTby9JH02R7T8SNmYXtD3RWYQGHvxA2wSbLsxkQovqs
	 1fEQsEUwUsQEjr7t8tC+gJDOkAyg4OLeNnOSUs0XA8Igj8m9VJq3bGn5/GYQ8lpd+y
	 uO4xyYDQA06iX0Ovc6DizmrLmBRR4+nK4RhpylmTxTNwsF0LFUFOt76GOEd1RP1SqD
	 Ky/2BcWvPM29Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 485F98154B;
	Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13D85E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6C3341142
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuHWxrNUm2nW for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 847BE410F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 847BE410F7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 761AA86C94; Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 13:37:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e296a151195f9d32dbfd62d6c75d08b822be6dd
X-Git-Newrev: b243b77ebe5eedf8fbc683d5539d9bf386da4420
X-Patchwork-Hint: ignore
Message-Id: <20251212075534.761AA86C94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gpiod: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b243b77ebe5eedf8fbc683d5539d9bf386da4420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds the python bindings of libgpiod for version 2+.
While the python bindings for v1 were optionally built and
installed as part of the main libgpiod build, for v2 they have now been
published to pypi.org for easier consumption in the general python
ecosystem.

We need to set LINK_SYSTEM_LIBGPIOD=1 to actually build against the
system version of libgpiod which we install and not use a separate
bundled copy.

The package is licensed as libgpiod, but as published to pypi doesn't
include the LICENSE file that's part of upstream repository.
Reference pyproject.toml as that has the license identifier as a
workaround.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-gpiod/Config.in         | 15 +++++++++++++++
 package/python-gpiod/python-gpiod.hash |  5 +++++
 package/python-gpiod/python-gpiod.mk   | 17 +++++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index db001d6bb0..62d1e7f914 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2263,6 +2263,7 @@ F:	package/picotool/
 F:	package/python-apscheduler/
 F:	package/python-crc/
 F:	package/python-django/
+F:	package/python-gpiod/
 F:	package/python-immutabledict/
 F:	package/python-jc/
 F:	package/python-log-rate-limit/
diff --git a/package/Config.in b/package/Config.in
index 12f327cb27..53fda7e086 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1136,6 +1136,7 @@ menu "External python modules"
 	source "package/python-google-api-core/Config.in"
 	source "package/python-google-auth/Config.in"
 	source "package/python-googleapis-common-protos/Config.in"
+	source "package/python-gpiod/Config.in"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
 	source "package/python-grpc-requests/Config.in"
diff --git a/package/python-gpiod/Config.in b/package/python-gpiod/Config.in
new file mode 100644
index 0000000000..8f67178ae7
--- /dev/null
+++ b/package/python-gpiod/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_GPIOD
+	bool "python-gpiod"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 # libgpiod2
+	depends on !BR2_PACKAGE_LIBGPIOD # libgpiod2
+	select BR2_PACKAGE_LIBGPIOD2
+	help
+	  Python bindings for libgpiod (v2+).
+
+	  https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/bindings/python/
+
+comment "python-gpiod needs kernel headers >= 5.10"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+
+comment "python-gpiod is incompatible with libgpiod"
+	depends on BR2_PACKAGE_LIBGPIOD
diff --git a/package/python-gpiod/python-gpiod.hash b/package/python-gpiod/python-gpiod.hash
new file mode 100644
index 0000000000..bbcc7181ff
--- /dev/null
+++ b/package/python-gpiod/python-gpiod.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/gpiod/json
+md5  62cf044aa3214d0ebee6aef78db2aa52  gpiod-2.4.0.tar.g
+sha256  9243a1a59d084ec749d1df4a1e2f238ffb9d94515b0d9f5335460175143c3aa1  gpiod-2.4.0.tar.gz
+# Locally computed
+sha256  a2b24e2158144b22a77a6a404fc5a05911612c5b99d7ab6d0e2addcaeb7514a3  pyproject.toml
diff --git a/package/python-gpiod/python-gpiod.mk b/package/python-gpiod/python-gpiod.mk
new file mode 100644
index 0000000000..8ab901972e
--- /dev/null
+++ b/package/python-gpiod/python-gpiod.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-gpiod
+#
+################################################################################
+
+PYTHON_GPIOD_VERSION = 2.4.0
+PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
+PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/0c/dc/5a6bd309345bd9cfa7e098174ab7e65367e408539b6c1998e4f267c673cd
+PYTHON_GPIOD_SETUP_TYPE = setuptools
+PYTHON_GPIOD_LICENSE = LGPL-2.1+
+# The package license follows libgpiod's license but doesn't include the LICENSE text in the pypi distrobuted package again
+PYTHON_GPIOD_LICENSE_FILES = pyproject.toml
+PYTHON_GPIOD_DEPENDENCIES = libgpiod2
+PYTHON_GPIOD_ENV = LINK_SYSTEM_LIBGPIOD=1
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
