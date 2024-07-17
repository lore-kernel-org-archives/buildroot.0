Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76B1C3DA4B
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 15:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BFAE60771;
	Wed, 17 Jul 2024 15:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ssv5wYwI3uh5; Wed, 17 Jul 2024 15:52:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EFDC607ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EFDC607ED;
	Wed, 17 Jul 2024 15:52:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58B181BF3E3
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 15:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44B6C810BE
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 15:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buyrVPjKNJNs for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 15:52:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70BFF80DAE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70BFF80DAE
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 15:52:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66BEB86C89; Wed, 17 Jul 2024 15:52:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 17:47:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f30386f50868be278fe50f07dcce255851d84d08
X-Git-Newrev: e67ab71bf68c378fe3ea430fd325003d0b16c5b6
X-Patchwork-Hint: ignore
Message-Id: <20240717155217.66BEB86C89@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/graphene: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e67ab71bf68c378fe3ea430fd325003d0b16c5b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

a dependency for gtk4

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/graphene/Config.in     |  6 ++++++
 package/graphene/graphene.hash |  3 +++
 package/graphene/graphene.mk   | 44 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e181382fe9..fb4955351c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1148,6 +1148,7 @@ F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
+F:	package/graphene/
 F:	package/janet/
 F:	package/libtomcrypt/
 F:	package/libtommath/
diff --git a/package/Config.in b/package/Config.in
index 4a38c282a3..5823ab1b76 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1662,6 +1662,7 @@ menu "Graphics"
 	source "package/giblib/Config.in"
 	source "package/giflib/Config.in"
 	source "package/granite/Config.in"
+	source "package/graphene/Config.in"
 	source "package/graphite2/Config.in"
 	source "package/gtkmm3/Config.in"
 	source "package/gtksourceview/Config.in"
diff --git a/package/graphene/Config.in b/package/graphene/Config.in
new file mode 100644
index 0000000000..60f6073a10
--- /dev/null
+++ b/package/graphene/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_GRAPHENE
+	bool "graphene"
+	help
+	  A thin layer of types for graphic libraries.
+
+	  https://ebassi.github.io/graphene/
diff --git a/package/graphene/graphene.hash b/package/graphene/graphene.hash
new file mode 100644
index 0000000000..7d2b569456
--- /dev/null
+++ b/package/graphene/graphene.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  922dc109d2dc5dc56617a29bd716c79dd84db31721a8493a13a5f79109a4a4ed  graphene-1.10.8.tar.gz
+sha256  cfd9fd7b2be592d2c0910d32dc1d8910c08dc0670b1d9ce417a82fa9eb788df9  LICENSE.txt
diff --git a/package/graphene/graphene.mk b/package/graphene/graphene.mk
new file mode 100644
index 0000000000..efdae91409
--- /dev/null
+++ b/package/graphene/graphene.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# graphene
+#
+################################################################################
+
+GRAPHENE_VERSION = 1.10.8
+GRAPHENE_SITE = $(call github,ebassi,graphene,$(GRAPHENE_VERSION))
+GRAPHENE_LICENSE = MIT
+GRAPHENE_LICENSE_FILES = LICENSE.txt
+GRAPHENE_INSTALL_STAGING = YES
+
+GRAPHENE_CONF_OPTS = \
+	-Dtests=false \
+	-Dinstalled_tests=false \
+	-Dgtk_doc=false
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+GRAPHENE_CONF_OPTS += -Dgobject_types=true
+GRAPHENE_DEPENDENCIES += libglib2
+else
+GRAPHENE_CONF_OPTS += -Dgobject_types=false
+endif
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GRAPHENE_CONF_OPTS += -Dintrospection=enabled
+GRAPHENE_DEPENDENCIES += gobject-introspection
+else
+GRAPHENE_CONF_OPTS += -Dintrospection=disabled
+endif
+
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+GRAPHENE_CONF_OPTS += -Dsse2=true
+else
+GRAPHENE_CONF_OPTS += -Dsse2=false
+endif
+
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+GRAPHENE_CONF_OPTS += -Darm_neon=true
+else
+GRAPHENE_CONF_OPTS += -Darm_neon=false
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
