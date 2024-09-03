Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9359E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B6A484D04;
	Fri,  6 Sep 2024 20:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P2fF9d2HTMCR; Fri,  6 Sep 2024 20:08:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE06484CF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE06484CF2;
	Fri,  6 Sep 2024 20:08:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3095C1BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E6C440978
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EpiT5rrOYeWf for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54732409F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54732409F2
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5248F828EF; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Sep 2024 00:28:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e85104d37622fe04b35c890d455804e6b90bee5
X-Git-Newrev: 2b560082ba31d67ca1b0e463ec9918c3c4392ba9
X-Patchwork-Hint: ignore
Message-Id: <20240906195900.5248F828EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-fast-yaml: renamed from
 erlang-p1-yaml
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b560082ba31d67ca1b0e463ec9918c3c4392ba9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream project has been renamed from p1_yaml to fast_yaml. Use the
same name so packages that depends on it, find its content in the
fast_yaml/ directory.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                     |  8 ++++++++
 DEVELOPERS                                           |  2 +-
 package/Config.in                                    |  2 +-
 package/ejabberd/Config.in                           |  2 +-
 package/ejabberd/ejabberd.mk                         |  2 +-
 .../{erlang-p1-yaml => erlang-fast-yaml}/Config.in   |  6 +++---
 .../erlang-fast-yaml.hash}                           |  2 +-
 package/erlang-fast-yaml/erlang-fast-yaml.mk         | 20 ++++++++++++++++++++
 package/erlang-p1-yaml/erlang-p1-yaml.mk             | 20 --------------------
 package/erlang-p1-yconf/Config.in                    |  2 +-
 package/erlang-p1-yconf/erlang-p1-yconf.mk           |  2 +-
 11 files changed, 38 insertions(+), 30 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4bce971630..7f3bfc9d24 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2024.11"
 
+config BR2_PACKAGE_ERLANG_P1_YAML
+	bool "erlang-p1-yaml has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_ERLANG_FAST_YAML
+	help
+	  The erlang-p1-yaml package has been renamed to
+	  erlang-fast-yaml.
+
 config BR2_PACKAGE_ERLANG_P1_XMPP
 	bool "erlang-p1-xmpp has been renamed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 69efcbf465..333b242f24 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1665,6 +1665,7 @@ F:	package/ejabberd/
 F:	package/erlang-base64url/
 F:	package/erlang-eimp/
 F:	package/erlang-fast-xml/
+F:	package/erlang-fast-yaml/
 F:	package/erlang-goldrush/
 F:	package/erlang-idna/
 F:	package/erlang-jiffy/
@@ -1679,7 +1680,6 @@ F:	package/erlang-p1-sip/
 F:	package/erlang-p1-stringprep/
 F:	package/erlang-p1-tls/
 F:	package/erlang-p1-utils/
-F:	package/erlang-p1-yaml/
 F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
 F:	package/erlang-stun/
diff --git a/package/Config.in b/package/Config.in
index 4b139a43d8..27bdf4a9fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -674,6 +674,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-base64url/Config.in"
 	source "package/erlang-eimp/Config.in"
 	source "package/erlang-fast-xml/Config.in"
+	source "package/erlang-fast-yaml/Config.in"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-idna/Config.in"
 	source "package/erlang-jiffy/Config.in"
@@ -688,7 +689,6 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-stringprep/Config.in"
 	source "package/erlang-p1-tls/Config.in"
 	source "package/erlang-p1-utils/Config.in"
-	source "package/erlang-p1-yaml/Config.in"
 	source "package/erlang-p1-yconf/Config.in"
 	source "package/erlang-p1-zlib/Config.in"
 	source "package/erlang-stun/Config.in"
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index e631e665d1..f46e40035d 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_EJABBERD
 	depends on BR2_INSTALL_LIBSTDCPP # jiffy, stringprep
 	select BR2_PACKAGE_ERLANG_EIMP
 	select BR2_PACKAGE_ERLANG_FAST_XML
+	select BR2_PACKAGE_ERLANG_FAST_YAML
 	select BR2_PACKAGE_ERLANG_IDNA # runtime
 	select BR2_PACKAGE_ERLANG_JIFFY # runtime
 	select BR2_PACKAGE_ERLANG_JOSE # runtime
@@ -17,7 +18,6 @@ config BR2_PACKAGE_EJABBERD
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
-	select BR2_PACKAGE_ERLANG_P1_YAML
 	select BR2_PACKAGE_ERLANG_P1_YCONF # runtime
 	select BR2_PACKAGE_ERLANG_P1_ZLIB
 	select BR2_PACKAGE_ERLANG_STUN
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 3824f2a530..58b544fb84 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -12,7 +12,7 @@ EJABBERD_CPE_ID_VENDOR = process-one
 EJABBERD_DEPENDENCIES = getent openssl erlang-eimp host-erlang-lager \
 	erlang-lager erlang-p1-cache-tab erlang-p1-sip \
 	erlang-p1-stringprep erlang-stun erlang-p1-tls \
-	erlang-p1-utils erlang-fast-xml erlang-xmpp erlang-p1-yaml \
+	erlang-p1-utils erlang-fast-xml erlang-xmpp erlang-fast-yaml \
 	erlang-p1-zlib host-erlang-p1-utils host-erlang-xmpp
 
 # 0001-Makefile.in-do-not-download-or-compile-dependencies.patch
diff --git a/package/erlang-p1-yaml/Config.in b/package/erlang-fast-yaml/Config.in
similarity index 51%
rename from package/erlang-p1-yaml/Config.in
rename to package/erlang-fast-yaml/Config.in
index 2ab78d1296..8c9d47f044 100644
--- a/package/erlang-p1-yaml/Config.in
+++ b/package/erlang-fast-yaml/Config.in
@@ -1,8 +1,8 @@
-config BR2_PACKAGE_ERLANG_P1_YAML
-	bool "erlang-p1-yaml"
+config BR2_PACKAGE_ERLANG_FAST_YAML
+	bool "erlang-fast-yaml"
 	select BR2_PACKAGE_ERLANG_P1_UTILS
 	select BR2_PACKAGE_LIBYAML
 	help
 	  Erlang wrapper for libyaml C library
 
-	  https://github.com/processone/p1_yaml
+	  https://github.com/processone/fast_yaml
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.hash b/package/erlang-fast-yaml/erlang-fast-yaml.hash
similarity index 80%
rename from package/erlang-p1-yaml/erlang-p1-yaml.hash
rename to package/erlang-fast-yaml/erlang-fast-yaml.hash
index 0138f82047..da2ccf13c9 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.hash
+++ b/package/erlang-fast-yaml/erlang-fast-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6794470ef35fb3985c4e9aa0ed8d3a0b44e7a5c7bf4c5a1efbeca42060db6806  erlang-p1-yaml-1.0.36.tar.gz
+sha256  6794470ef35fb3985c4e9aa0ed8d3a0b44e7a5c7bf4c5a1efbeca42060db6806  erlang-fast-yaml-1.0.36.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-fast-yaml/erlang-fast-yaml.mk b/package/erlang-fast-yaml/erlang-fast-yaml.mk
new file mode 100644
index 0000000000..861706b547
--- /dev/null
+++ b/package/erlang-fast-yaml/erlang-fast-yaml.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# erlang-fast-yaml
+#
+################################################################################
+
+ERLANG_FAST_YAML_VERSION = 1.0.36
+ERLANG_FAST_YAML_SITE = $(call github,processone,fast_yaml,$(ERLANG_FAST_YAML_VERSION))
+ERLANG_FAST_YAML_LICENSE = Apache-2.0
+ERLANG_FAST_YAML_LICENSE_FILES = LICENSE.txt
+ERLANG_FAST_YAML_DEPENDENCIES = libyaml erlang-p1-utils
+
+define ERLANG_FAST_YAML_REMOVE_PATHS
+	$(SED) "s/ -I\/usr\/local\/include//" $(@D)/rebar.config
+	$(SED) "s/ -L\/usr\/local\/lib//" $(@D)/rebar.config
+endef
+
+ERLANG_FAST_YAML_POST_PATCH_HOOKS = ERLANG_FAST_YAML_REMOVE_PATHS
+
+$(eval $(rebar-package))
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.mk b/package/erlang-p1-yaml/erlang-p1-yaml.mk
deleted file mode 100644
index 17f4910ee1..0000000000
--- a/package/erlang-p1-yaml/erlang-p1-yaml.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# erlang-p1-yaml
-#
-################################################################################
-
-ERLANG_P1_YAML_VERSION = 1.0.36
-ERLANG_P1_YAML_SITE = $(call github,processone,fast_yaml,$(ERLANG_P1_YAML_VERSION))
-ERLANG_P1_YAML_LICENSE = Apache-2.0
-ERLANG_P1_YAML_LICENSE_FILES = LICENSE.txt
-ERLANG_P1_YAML_DEPENDENCIES = libyaml erlang-p1-utils
-
-define ERLANG_P1_YAML_REMOVE_PATHS
-	$(SED) "s/ -I\/usr\/local\/include//" $(@D)/rebar.config
-	$(SED) "s/ -L\/usr\/local\/lib//" $(@D)/rebar.config
-endef
-
-ERLANG_P1_YAML_POST_PATCH_HOOKS = ERLANG_P1_YAML_REMOVE_PATHS
-
-$(eval $(rebar-package))
diff --git a/package/erlang-p1-yconf/Config.in b/package/erlang-p1-yconf/Config.in
index 3777ebbe14..987b511878 100644
--- a/package/erlang-p1-yconf/Config.in
+++ b/package/erlang-p1-yconf/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_ERLANG_P1_YCONF
 	bool "erlang-p1-yconf"
-	select BR2_PACKAGE_ERLANG_P1_YAML
+	select BR2_PACKAGE_ERLANG_FAST_YAML
 	help
 	  YAML configuration processor.
diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.mk b/package/erlang-p1-yconf/erlang-p1-yconf.mk
index 81f7462884..bc72f282a9 100644
--- a/package/erlang-p1-yconf/erlang-p1-yconf.mk
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.mk
@@ -8,6 +8,6 @@ ERLANG_P1_YCONF_VERSION = 1.0.15
 ERLANG_P1_YCONF_SITE = $(call github,processone,yconf,$(ERLANG_P1_YCONF_VERSION))
 ERLANG_P1_YCONF_LICENSE = Apache-2.0
 ERLANG_P1_YCONF_LICENSE_FILES = LICENSE
-ERLANG_P1_YCONF_DEPENDENCIES = erlang-p1-yaml
+ERLANG_P1_YCONF_DEPENDENCIES = erlang-fast-yaml
 
 $(eval $(rebar-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
