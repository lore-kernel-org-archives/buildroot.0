Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9884BECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 17:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADDF560640;
	Tue, 13 Sep 2022 17:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADDF560640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olZQpptLe-DW; Tue, 13 Sep 2022 17:41:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4025605EE;
	Tue, 13 Sep 2022 17:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4025605EE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6C8C1BF853
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 17:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92A6C40222
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 17:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92A6C40222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rhz1yjaFQ_lf for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 17:41:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32DBB4025F
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32DBB4025F
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 17:41:44 +0000 (UTC)
Received: from houde.tangerine ([185.213.154.234]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1Mt7Ll-1pREVh3UYj-00tQju; Tue, 13 Sep 2022 19:41:41 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 19:40:38 +0200
Message-Id: <20220913174039.182887-2-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913174039.182887-1-thomas.claveirole@green-communications.fr>
References: <20220913174039.182887-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:U4gdKKSr9tOKBvUPJMfdU+wbqNM1tEku6sVPextL4bz57lPQrTW
 54Kwneugjlq2o2q+g/B5UdOX9vOSEg1woNtSx9OICwgZzaYr3IJinVTbxdwxP7FcLbFWXFW
 rrKgWi4CHciB80cPU8gdwpq3oatZAQp4MsC9ASHaa4CmA6Hpz5g8QlBbsRE4qX/0/BOVxuw
 RUejZTLCPUnFz7CFVdpsA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/AwNCaVx/3s=:fC7jWA1FcE9pois+a700FP
 r+mRQcSApHgGxOQuts8kqyrbrloegvQV967kUIat1XtVDeK1guVdYDMamNUSa8S4UZksGCJCJ
 WgB4jWxQ+cp8I1Byzajm+tWoYa2Ccc8lIkY81CMEEQKtX9lhqIRFS/si6KyL5paIbN8T033UR
 a0KO23avPBkT3R1hUel2NBByzU5zCuIpy0O0ss75eHHu96Jw/4Ce5BcqbdZTTGe/g3aAneEto
 D/boZ+HsAIWwQAsjld6GrzXNvkpCDkeQzfUCydzHrGJ+GiQRUxjuLQhAUEqnC+UykSB8JTFtM
 dIUNlGJ9nwigKU/5SuUShcVrzQ/spX5sX11K/cxita6Sur5t29rKot+Wq3aA2s87blSRoDICB
 OUaEpAF8VWofY+rVQBUrNl2SZQ7ukp80iyqhUgY7LCFGBANUoCVRJopbHN3YKPL6NYn0M+3W9
 b3kb2SxM5XsDBUPqKIrocykd8nSvGg7YpHRwmZhfcQRsB+a7tLy0GK3CHxIXrFo2RFojl/T/U
 Ncy3iq9/vfRcGvE+Ln4eN8mp339rKE101g3I6h+kJZX0SDypeHkxDe9U0Qi3dnh8/b5AQmg4x
 RHM1Iafe/dx3MAsYjgkzRs1ER/prtIq9hvsJ+Z9muScCaG8rr9oJ1Y6H7apnIQurb0qeO44H4
 Z2A0u8wABjbjstoLWUmpla8OVdUrnavUhQNfFSe2fYqGaff+4cO7eCkzFWlXWyVXhXB8gxqWK
 orxVAq+w5X+gwmDbXfa3zD4tAwkMuq7bMg3erHEOqKJDDRSCrCwE07Wrg872my8ZjbSUQ2eLM
 TZNUnaky4MWshkgO+z2kMrXEVbeulGxOGm0SMqJcLNvhBnHfCA=
Subject: [Buildroot] [PATCH 1/2] package/nodejs: introduce
 BR2_PACKAGE_HOST_NODEJS_COREPACK
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

Corepack is a zero-runtime-dependency Node.js script that acts as a
bridge between Node.js projects and the package managers.  It ships
with Node.js but is disabled by default.

Some JavaScript packages, such as vuejs and vuejs-router can benefit
from having Corepack installed on the host.  Therefore, add an option
to enable Corepack with host-nodejs.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/nodejs/Config.in.host | 23 ++++++++++++++++++++---
 package/nodejs/nodejs.mk      | 21 +++++++++++++++++----
 2 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
index 4ceaf0c73e..316a02d9d6 100644
--- a/package/nodejs/Config.in.host
+++ b/package/nodejs/Config.in.host
@@ -1,3 +1,7 @@
+comment "host nodejs needs a host gcc >= 8"
+	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_8
+
 config BR2_PACKAGE_HOST_NODEJS
 	bool "host nodejs"
 	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
@@ -13,6 +17,19 @@ config BR2_PACKAGE_HOST_NODEJS
 
 	  http://nodejs.org/
 
-comment "host nodejs needs a host gcc >= 8"
-	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
-	depends on !BR2_HOST_GCC_AT_LEAST_8
+if BR2_PACKAGE_HOST_NODEJS
+
+config BR2_PACKAGE_HOST_NODEJS_COREPACK
+	bool "Corepack"
+	help
+	  Enable Corepack with host nodejs.
+
+	  Corepack is a zero-runtime-dependency Node.js script that
+	  acts as a bridge between Node.js projects and the package
+	  managers they are intended to be used with during
+	  development. In practical terms, Corepack will let you use
+	  Yarn and pnpm without having to install them - just like
+	  what currently happens with npm, which is shipped by Node.js
+	  by default.
+
+endif
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 3154dcd7ec..1a95e1351f 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -117,6 +117,12 @@ define HOST_NODEJS_BUILD_CMDS
 		$(HOST_NODEJS_MAKE_OPTS)
 endef
 
+ifeq ($(BR2_PACKAGE_HOST_NODEJS_COREPACK),y)
+define HOST_NODEJS_ENABLE_COREPACK
+	$(COREPACK) enable
+endef
+endif
+
 define HOST_NODEJS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
@@ -125,6 +131,7 @@ define HOST_NODEJS_INSTALL_CMDS
 	$(foreach f,$(NODEJS_HOST_TOOLS), \
 		$(INSTALL) -m755 -D $(@D)/out/Release/$(f) $(HOST_DIR)/bin/$(f)
 	)
+	$(HOST_NODEJS_ENABLE_COREPACK)
 endef
 
 ifeq ($(BR2_i386),y)
@@ -235,8 +242,7 @@ endef
 NODEJS_MODULES_LIST= $(call qstrip,\
 	$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
 
-# Define NPM for other packages to use
-NPM = $(TARGET_CONFIGURE_OPTS) \
+NODEJS_BIN_ENV = $(TARGET_CONFIGURE_OPTS) \
 	LDFLAGS="$(NODEJS_LDFLAGS)" \
 	LD="$(TARGET_CXX)" \
 	npm_config_arch=$(NODEJS_CPU) \
@@ -244,8 +250,15 @@ NPM = $(TARGET_CONFIGURE_OPTS) \
 	npm_config_build_from_source=true \
 	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
 	npm_config_prefix=$(TARGET_DIR)/usr \
-	npm_config_cache=$(BUILD_DIR)/.npm-cache \
-	$(HOST_DIR)/bin/npm
+	npm_config_cache=$(BUILD_DIR)/.npm-cache
+
+# Define various packaging tools for other packages to use
+NPM = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/npm
+ifeq ($(BR2_PACKAGE_HOST_NODEJS_COREPACK),y)
+COREPACK = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/corepack
+PNPM = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/pnpm
+YARN = $(NODEJS_BIN_ENV) $(HOST_DIR)/bin/yarn
+endif
 
 #
 # We can only call NPM if there's something to install.
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
