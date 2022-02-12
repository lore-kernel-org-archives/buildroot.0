Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32034C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 14:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B341B4015F;
	Sat, 12 Feb 2022 14:32:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id twY3kROmSd4v; Sat, 12 Feb 2022 14:32:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33BF540329;
	Sat, 12 Feb 2022 14:32:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 738991BF954
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F1EA40391
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bv9vQbGREnsi for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 14:32:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 600DA40329
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 14:32:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 464E682B3B; Sat, 12 Feb 2022 14:25:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 15:27:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b501e1a43d9f08e461937984a939f7afbc726336
X-Git-Newrev: e55f57b3d367213ef4b667988e42f7d26c6b23c9
X-Patchwork-Hint: ignore
Message-Id: <20220212142506.464E682B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/serd: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e55f57b3d367213ef4b667988e42f7d26c6b23c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/serd/Config.in |  8 ++++++++
 package/serd/serd.hash |  4 ++++
 package/serd/serd.mk   | 20 ++++++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a91dccd1e0..ece07026bc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1336,6 +1336,7 @@ F:	package/python-tomli/
 F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
+F:	package/serd/
 F:	package/zchunk/
 
 N:	James Knight <james.knight@collins.com>
diff --git a/package/Config.in b/package/Config.in
index 7aff9e7cb7..a8f408844d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1699,6 +1699,7 @@ menu "JSON/XML"
 	source "package/rapidjson/Config.in"
 	source "package/rapidxml/Config.in"
 	source "package/raptor/Config.in"
+	source "package/serd/Config.in"
 	source "package/tinyxml/Config.in"
 	source "package/tinyxml2/Config.in"
 	source "package/valijson/Config.in"
diff --git a/package/serd/Config.in b/package/serd/Config.in
new file mode 100644
index 0000000000..7633a979e2
--- /dev/null
+++ b/package/serd/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SERD
+	bool "serd"
+	help
+	  Serd is a lightweight C library for RDF syntax which
+	  supports reading and writing Turtle, TriG, NTriples, and
+	  NQuads.
+
+	  https://drobilla.net/software/serd.html
diff --git a/package/serd/serd.hash b/package/serd/serd.hash
new file mode 100644
index 0000000000..d64a2aa271
--- /dev/null
+++ b/package/serd/serd.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# http://download.drobilla.net/serd-0.30.10.tar.bz2.sig
+sha256  affa80deec78921f86335e6fc3f18b80aefecf424f6a5755e9f2fa0eb0710edf  serd-0.30.10.tar.bz2
+sha256  e06562d6bcf0341b2ac2ad0f0ca36801d2ebf388d5ef297011625e4c36e963f0  COPYING
diff --git a/package/serd/serd.mk b/package/serd/serd.mk
new file mode 100644
index 0000000000..85b16f6866
--- /dev/null
+++ b/package/serd/serd.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# serd
+#
+################################################################################
+
+SERD_VERSION = 0.30.10
+SERD_SITE = https://download.drobilla.net
+SERD_SOURCE = serd-$(SERD_VERSION).tar.bz2
+SERD_LICENSE = ISC
+SERD_LICENSE_FILES = COPYING
+SERD_INSTALL_STAGING = YES
+
+SERD_CONF_OPTS += --largefile --no-coverage
+
+ifeq ($(BR2_STATIC_LIBS),y)
+SERD_CONF_OPTS += --static --no-shared --static-progs
+endif
+
+$(eval $(waf-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
