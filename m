Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B84CECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 17:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75A2E40160;
	Tue, 13 Sep 2022 17:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75A2E40160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L9qYhybYVfta; Tue, 13 Sep 2022 17:42:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2627940173;
	Tue, 13 Sep 2022 17:42:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2627940173
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C48D1BF853
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 17:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 283784025F
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 17:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 283784025F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 67Hp1ZFcIgrw for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 17:41:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3F4A40222
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3F4A40222
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 17:41:47 +0000 (UTC)
Received: from houde.tangerine ([185.213.154.234]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1M6UqP-1of3nV3pxR-006wl4; Tue, 13 Sep 2022 19:41:45 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 19:40:39 +0200
Message-Id: <20220913174039.182887-3-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913174039.182887-1-thomas.claveirole@green-communications.fr>
References: <20220913174039.182887-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Se4wodvU/2juNf8CqugEWb0kyFtXjJCp6TI3YNEnYEnwsGON+PH
 k2rA0hBoCp6oHIg7f5UV/JJ8SWRgZw8ZG8M2jKl9iCyScVRMnOaXOlqxYOAsWVghd6IBxmc
 erHSAXndog7qAe3X18lwytACqBDbok1Y/CrV3IwuLe12oYV62R+SoBhd2oIGvh3NGlOjI06
 KJJu5w5VPaIwc8duHD8hg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WieyV/EX0Uc=:tBQZcwZBuGUophercF0RTm
 uOHNAEalFxHD1f0LVmVA2i0Om31XCyXiB817ofxOoG2rHmP9O1+nYelJ3Bv351ZgQsMPTzQAz
 4EkiWc2YrukEgvqaYDUHMLsEMTRXlJGs9htUPkkfW87RMf6FtYGvcJ4nX55R6BGDgcDAe8n8y
 6SLTkwem4rEeuEe+8qDxwgjRse+4Vp61xHlXAhp1YqnCi5NvZrgveo63wc3x7tViLlM2JxZI9
 JdiNNWPxleRnF2rnqfml0ENHsY1Q64/EQy19mYDpwRRc0kQCJjOXworbmPihCMz0GiSVAriRs
 O33koyGz/xSzEHdqKY9imx9d/dy2rlSDSLCzFtiHMwPVwgEFHiwWTPj/BpxKMVv39gXm0ni94
 nYP3wl/wyOypvEo7IgGcRY9Cx0uNgPaGnwQU6Pyg140NeBeGU/kz9Zz1wQgUir5mBFipq62iz
 ZegIamnjxifwax1GlWLrGOP3aIAYMWcdfCaBxDpI49l1SAtl4IhMw7FNbwBbsMbBsX+pAuEOG
 6mgsU4ug+p8HbrTLTxIvIoPQji1HPpfZ/hEoxoUCmuUHBO8imTgC0vczEnm0XejyCx0WmrBoC
 nq0hy9xNhg9lC31E7x1cJiFd91U/4/AR0xSDtpkKzBj/b+HP+XGgAZvlcZgK2H+RHZQTKrnzF
 6Z+e+4pcSUt7VuFAkdJnPNy64oY6i15GUGF775uNeNtnEr3x6vb3niSFi6GLsivFjGrv0YXNo
 +DzBOkGRsuSnmO6gkR+0XdAOaFVY+KDFtx1mUH/dPPTaB7DtEhmgM+MVqUFiU8xtficZ9S9ry
 UrI7CTCL9JiZ3Id8mavcoA3evfPi0LE8y9zQ7YsvCvwJlW7BLQ=
Subject: [Buildroot] [PATCH 2/2] package/vuejs: bump to version 3.2.39
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Martin Bark <martin@barkynet.com>, Johan Oudinet <johan.oudinet@gmail.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 DEVELOPERS                                         |  1 +
 ...hardcode-build-commit-to-v3.2.39-f79c4236.patch | 13 +++++++++++++
 package/vuejs/Config.in                            |  4 ++++
 package/vuejs/vuejs.hash                           |  2 +-
 package/vuejs/vuejs.mk                             | 14 ++++++++++----
 5 files changed, 29 insertions(+), 5 deletions(-)
 create mode 100644 package/vuejs/0001-hardcode-build-commit-to-v3.2.39-f79c4236.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index a707b0e5e1..fd32716282 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2818,6 +2818,7 @@ F:	package/x265/
 N:	Thomas Claveirole <thomas.claveirole@green-communications.fr>
 F:	package/fcgiwrap/
 F:	package/openlayers/
+F:	package/vuejs/
 F:	package/vuejs-router/
 
 N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
diff --git a/package/vuejs/0001-hardcode-build-commit-to-v3.2.39-f79c4236.patch b/package/vuejs/0001-hardcode-build-commit-to-v3.2.39-f79c4236.patch
new file mode 100644
index 0000000000..11a84e5c83
--- /dev/null
+++ b/package/vuejs/0001-hardcode-build-commit-to-v3.2.39-f79c4236.patch
@@ -0,0 +1,13 @@
+diff --git a/scripts/build.js b/scripts/build.js
+index efa5d7f0..f577dc61 100644
+--- a/scripts/build.js
++++ b/scripts/build.js
+@@ -31,7 +31,7 @@ const sourceMap = args.sourcemap || args.s
+ const isRelease = args.release
+ const buildTypes = args.t || args.types || isRelease
+ const buildAllMatching = args.all || args.a
+-const commit = execa.sync('git', ['rev-parse', 'HEAD']).stdout.slice(0, 7)
++const commit = "f79c4236"
+ 
+ run()
+ 
diff --git a/package/vuejs/Config.in b/package/vuejs/Config.in
index 6456d288f9..5413de0a01 100644
--- a/package/vuejs/Config.in
+++ b/package/vuejs/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_VUEJS
 	bool "vuejs"
+	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS # host-nodejs
+	depends on BR2_HOST_GCC_AT_LEAST_8 # host-nodejs
+	select BR2_PACKAGE_HOST_NODEJS
+	select BR2_PACKAGE_HOST_NODEJS_COREPACK
 	help
 	  VueJS web application framework.
 
diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
index c53364e97d..5218cce0b2 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  042033a2a8e6d45f750924953f03c34058d5afd9cc1571fbaf1827eaf04f6943  vue-3.2.33.tgz
+sha256  de7ce8e2493ac8f78f7cc0c31a4c7c3874ca9392bfa38dfb1ef5471e65adde31  vuejs-3.2.39.tar.gz
 sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index d544124bbc..3e80d5519b 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,15 +4,21 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 3.2.33
-VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
-VUEJS_SITE = https://registry.npmjs.org/vue/-
+VUEJS_VERSION = 3.2.39
+VUEJS_SITE = $(call github,vuejs,core,v$(VUEJS_VERSION))
 VUEJS_LICENSE = MIT
 VUEJS_LICENSE_FILES = LICENSE
 
+VUEJS_DEPENDENCIES = host-nodejs
+
+# See https://github.com/vuejs/core/blob/main/.github/contributing.md#development-setup
+define VUEJS_BUILD_CMDS
+	cd $(@D) && $(PNPM) install && $(NPM) run build -- vue -f global
+endef
+
 # Install .prod.js as .js
 define VUEJS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 644 -D $(@D)/dist/vue.global.prod.js \
+	$(INSTALL) -m 644 -D $(@D)/packages/vue/dist/vue.global.prod.js \
 		$(TARGET_DIR)/var/www/vue.js
 endef
 
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
