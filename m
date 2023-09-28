Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B42E743C0
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 20:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BCF0615AB;
	Thu, 28 Sep 2023 20:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BCF0615AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ib4rauIaotn1; Thu, 28 Sep 2023 20:44:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B6946150B;
	Thu, 28 Sep 2023 20:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B6946150B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2721BF990
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 20:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 444E7404EC
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 20:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 444E7404EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jn6muWK2uCyr for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 20:44:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73ABD40C1E
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 20:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73ABD40C1E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6198E82B52; Thu, 28 Sep 2023 20:44:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 22:43:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8cea23ce4c2462000a3dd01304ba613a39253d5
X-Git-Newrev: 0a164527045a2a1bda576ab9cb72122b5cbf2f67
X-Patchwork-Hint: ignore
Message-Id: <20230928204400.6198E82B52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] unifdef: add target package
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a164527045a2a1bda576ab9cb72122b5cbf2f67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Reviewed-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                 | 1 +
 package/Config.in          | 1 +
 package/unifdef/Config.in  | 9 +++++++++
 package/unifdef/unifdef.mk | 9 +++++++++
 4 files changed, 20 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e8b78a8d46..defeb502ab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -513,6 +513,7 @@ F:	package/iftop/
 F:	package/ncdu/
 
 N:	Brandon Maier <brandon.maier@collins.com>
+F:	package/unifdef/
 F:	package/vmtouch/
 
 N:	Brock Williams <brock@cottonwoodcomputer.com>
diff --git a/package/Config.in b/package/Config.in
index e8dbadadf3..e70479059e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -201,6 +201,7 @@ menu "Development tools"
 	source "package/sed/Config.in"
 	source "package/subversion/Config.in"
 	source "package/tree/Config.in"
+	source "package/unifdef/Config.in"
 	source "package/yasm/Config.in"
 endmenu
 
diff --git a/package/unifdef/Config.in b/package/unifdef/Config.in
new file mode 100644
index 0000000000..a1a44d9f5a
--- /dev/null
+++ b/package/unifdef/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_UNIFDEF
+	bool "unifdef"
+	help
+	  The unifdef utility selectively processes conditional C
+	  preprocessor #if and #ifdef directives. It removes from a file
+	  both the #directives and the additional text that they
+	  delimit, while otherwise leaving the file alone.
+
+	  http://dotat.at/prog/unifdef/
diff --git a/package/unifdef/unifdef.mk b/package/unifdef/unifdef.mk
index fd74455894..6761e32b69 100644
--- a/package/unifdef/unifdef.mk
+++ b/package/unifdef/unifdef.mk
@@ -9,6 +9,14 @@ UNIFDEF_SITE = https://dotat.at/prog/unifdef
 UNIFDEF_LICENSE = BSD-2-Clause, BSD-3-Clause
 UNIFDEF_LICENSE_FILES = COPYING
 
+define UNIFDEF_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define UNIFDEF_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(TARGET_DIR) install
+endef
+
 define HOST_UNIFDEF_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
@@ -17,4 +25,5 @@ define HOST_UNIFDEF_INSTALL_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
 endef
 
+$(eval $(generic-package))
 $(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
