Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3E0C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 07:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEB4240133;
	Tue, 20 Dec 2022 07:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEB4240133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zD581Okroe4E; Tue, 20 Dec 2022 07:17:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25FFE405BA;
	Tue, 20 Dec 2022 07:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25FFE405BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 586CA1BF909
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 07:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3381B813FD
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 07:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3381B813FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xoAD1vHs7gxV for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 07:17:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10A23813F5
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 07:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10A23813F5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F116086A0F; Tue, 20 Dec 2022 07:17:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Dec 2022 08:16:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ddf15854deb5f03a4c98afa6c86f9f3b4d6893c
X-Git-Newrev: 7dbe844bae38aba8e6080da3b650b89f702c0f1c
X-Patchwork-Hint: ignore
Message-Id: <20221220071703.F116086A0F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unifdef: add new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=7dbe844bae38aba8e6080da3b650b89f702c0f1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A small package that does "Selectively remove C preprocessor conditionals".

The package will be needed for the upcoming webkitgtk 2.40.0 release.
I personally added it to get started with 2.39.2.

See: https://github.com/WebKit/WebKit/commit/f76a7e30e5749af897b83cc75b2534b1afa32552
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
[Peter: use prefix=]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Makefile-fix-error-on-install.patch       | 31 ++++++++++++++++++++++
 package/unifdef/unifdef.hash                       |  3 +++
 package/unifdef/unifdef.mk                         | 20 ++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/package/unifdef/0001-Makefile-fix-error-on-install.patch b/package/unifdef/0001-Makefile-fix-error-on-install.patch
new file mode 100644
index 0000000000..c959a41c5a
--- /dev/null
+++ b/package/unifdef/0001-Makefile-fix-error-on-install.patch
@@ -0,0 +1,31 @@
+From b5e4229918c13bc0c11a523105cdb3a464337b37 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas.devoogdt@barco.com>
+Date: Mon, 12 Dec 2022 12:59:59 +0100
+Subject: [PATCH] Makefile: fix error on install
+
+ln: failed to create symbolic link '/home/thomas/Documents/buildroot/output/host/share/man/man1/unifdefall.1': File exists
+
+Seen while trying to add this package to buildroot.org.
+
+(upstream: https://github.com/fanf2/unifdef/pull/16)
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 36c7028..485927a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -28,7 +28,7 @@ install: unifdef unifdefall.sh unifdef.1
+ 	: manual
+ 	install -m 755 -d  ${man1dest}
+ 	install -m 644 unifdef.1  ${man1dest}/
+-	ln -s unifdef.1  ${man1dest}/unifdefall.1
++	ln -f -s unifdef.1  ${man1dest}/unifdefall.1
+ 
+ clean:
+ 	rm -f unifdef version.h
+-- 
+2.38.1
+
diff --git a/package/unifdef/unifdef.hash b/package/unifdef/unifdef.hash
new file mode 100644
index 0000000000..c3a6b7465c
--- /dev/null
+++ b/package/unifdef/unifdef.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  fba564a24db7b97ebe9329713ac970627b902e5e9e8b14e19e024eb6e278d10b  unifdef-2.12.tar.gz
+sha256  37ed46a39446b15b08af418fda23b75c27a769d5aad236d817ee7522cc9caeee  COPYING
diff --git a/package/unifdef/unifdef.mk b/package/unifdef/unifdef.mk
new file mode 100644
index 0000000000..7d10595d1b
--- /dev/null
+++ b/package/unifdef/unifdef.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# unifdef
+#
+################################################################################
+
+UNIFDEF_VERSION = 2.12
+UNIFDEF_SITE = https://dotat.at/prog/unifdef
+UNIFDEF_LICENSE = BSD-2-Clause
+UNIFDEF_LICENSE_FILES = COPYING
+
+define HOST_UNIFDEF_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define HOST_UNIFDEF_INSTALL_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
