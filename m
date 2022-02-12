Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FDEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 14:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41FE180F73;
	Sat, 12 Feb 2022 14:33:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmlDiyDZaZEP; Sat, 12 Feb 2022 14:33:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 431DD80BAD;
	Sat, 12 Feb 2022 14:33:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 111191BF954
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 570E760B8F
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jlq78RTY8j4d for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 14:32:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82BC761B89
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 14:32:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6C37582B3B; Sat, 12 Feb 2022 14:25:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 15:30:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b066f1756f9af4a8577321ec09c17796bfb153d7
X-Git-Newrev: 47c0176b39f7fd4eeebf19a6c29c5c967a229674
X-Patchwork-Hint: ignore
Message-Id: <20220212142506.6C37582B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sratom: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=47c0176b39f7fd4eeebf19a6c29c5c967a229674
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/sratom/Config.in   | 10 ++++++++++
 package/sratom/sratom.hash |  4 ++++
 package/sratom/sratom.mk   | 21 +++++++++++++++++++++
 5 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5573c62f0b..356e74d51f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1339,6 +1339,7 @@ F:	package/python-yarl/
 F:	package/python-zopfli/
 F:	package/serd/
 F:	package/sord/
+F:	package/sratom/
 F:	package/zchunk/
 
 N:	James Knight <james.knight@collins.com>
diff --git a/package/Config.in b/package/Config.in
index d95257e7aa..86c654e3fc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1362,6 +1362,7 @@ menu "Audio/Sound"
 	source "package/spandsp/Config.in"
 	source "package/speex/Config.in"
 	source "package/speexdsp/Config.in"
+	source "package/sratom/Config.in"
 	source "package/taglib/Config.in"
 	source "package/tinyalsa/Config.in"
 	source "package/tremor/Config.in"
diff --git a/package/sratom/Config.in b/package/sratom/Config.in
new file mode 100644
index 0000000000..771e82073d
--- /dev/null
+++ b/package/sratom/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SRATOM
+	bool "sratom"
+	select BR2_PACKAGE_LV2
+	select BR2_PACKAGE_SERD
+	select BR2_PACKAGE_SORD
+	help
+	  Sratom is a library for serialising LV2 atoms to and from
+	  RDF, particularly the Turtle syntax.
+
+	  https://drobilla.net/software/sratom.html
diff --git a/package/sratom/sratom.hash b/package/sratom/sratom.hash
new file mode 100644
index 0000000000..64d460b2ea
--- /dev/null
+++ b/package/sratom/sratom.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking signature
+# https://download.drobilla.net/sratom-0.6.8.tar.bz2.asc
+sha256  3acb32b1adc5a2b7facdade2e0818bcd6c71f23f84a1ebc17815bb7a0d2d02df  sratom-0.6.8.tar.bz2
+sha256  3fc429d6b944fa20306357196a28bb4dd7c25e2d67edebec771f44de5bd7f9e8  COPYING
diff --git a/package/sratom/sratom.mk b/package/sratom/sratom.mk
new file mode 100644
index 0000000000..e1e0f4e033
--- /dev/null
+++ b/package/sratom/sratom.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# sratom
+#
+################################################################################
+
+SRATOM_VERSION = 0.6.8
+SRATOM_SITE = https://download.drobilla.net
+SRATOM_SOURCE = sratom-$(SRATOM_VERSION).tar.bz2
+SRATOM_LICENSE = ISC
+SRATOM_LICENSE_FILES = COPYING
+SRATOM_DEPENDENCIES = host-pkgconf lv2 serd sord
+SRATOM_INSTALL_STAGING = YES
+
+SRATOM_CONF_OPTS += --no-coverage
+
+ifeq ($(BR2_STATIC_LIBS),y)
+SRATOM_CONF_OPTS += --static --no-shared
+endif
+
+$(eval $(waf-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
