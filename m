Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BB6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 14:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50B5A403BE;
	Sat, 12 Feb 2022 14:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a23TxxWYvRBy; Sat, 12 Feb 2022 14:32:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 341EA40391;
	Sat, 12 Feb 2022 14:32:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C8381BF5A1
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B5E660B8F
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AypZD7NvzgTj for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 14:32:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E45760BBF
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 14:32:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 53C6382B40; Sat, 12 Feb 2022 14:25:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 15:27:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e55f57b3d367213ef4b667988e42f7d26c6b23c9
X-Git-Newrev: 0d4c8ce8a2f26989e0e2d95b977d60e450c090a9
X-Patchwork-Hint: ignore
Message-Id: <20220212142506.53C6382B40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sord: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d4c8ce8a2f26989e0e2d95b977d60e450c090a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/sord/Config.in |  8 ++++++++
 package/sord/sord.hash |  4 ++++
 package/sord/sord.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 39 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ece07026bc..bdea8142e0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1337,6 +1337,7 @@ F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
 F:	package/serd/
+F:	package/sord/
 F:	package/zchunk/
 
 N:	James Knight <james.knight@collins.com>
diff --git a/package/Config.in b/package/Config.in
index a8f408844d..0b533ce999 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1700,6 +1700,7 @@ menu "JSON/XML"
 	source "package/rapidxml/Config.in"
 	source "package/raptor/Config.in"
 	source "package/serd/Config.in"
+	source "package/sord/Config.in"
 	source "package/tinyxml/Config.in"
 	source "package/tinyxml2/Config.in"
 	source "package/valijson/Config.in"
diff --git a/package/sord/Config.in b/package/sord/Config.in
new file mode 100644
index 0000000000..91dfb41d0b
--- /dev/null
+++ b/package/sord/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SORD
+	bool "sord"
+	select BR2_PACKAGE_SERD
+	help
+	  Sord is a lightweight C library for storing RDF data in
+	  memory.
+
+	  https://drobilla.net/software/sord.html
diff --git a/package/sord/sord.hash b/package/sord/sord.hash
new file mode 100644
index 0000000000..af175f91f0
--- /dev/null
+++ b/package/sord/sord.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# https://download.drobilla.net/sord-0.16.8.tar.bz2.asc
+sha256  7c289d2eaabf82fa6ac219107ce632d704672dcfb966e1a7ff0bbc4ce93f5e14  sord-0.16.8.tar.bz2
+sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
diff --git a/package/sord/sord.mk b/package/sord/sord.mk
new file mode 100644
index 0000000000..f805805e9d
--- /dev/null
+++ b/package/sord/sord.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# sord
+#
+################################################################################
+
+SORD_VERSION = 0.16.8
+SORD_SITE = https://download.drobilla.net
+SORD_SOURCE = sord-$(SORD_VERSION).tar.bz2
+SORD_LICENSE = ISC
+SORD_LICENSE_FILES = COPYING
+SORD_DEPENDENCIES = host-pkgconf serd
+SORD_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+SORD_DEPENDENCIES += pcre
+endif
+
+SORD_CONF_OPTS += --no-coverage
+
+ifeq ($(BR2_STATIC_LIBS),y)
+SORD_CONF_OPTS += --static --no-shared --static-progs
+endif
+
+$(eval $(waf-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
