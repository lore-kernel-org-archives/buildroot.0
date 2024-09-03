Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B47CD37B5
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 22:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EA4E8110C;
	Tue,  3 Sep 2024 22:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1ETsrdReHu3; Tue,  3 Sep 2024 22:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32B6281169
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32B6281169;
	Tue,  3 Sep 2024 22:44:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D8831BF576
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBC6940396
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hlKjxRofz3H for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 22:43:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D7214011F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D7214011F
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 22:43:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED31486D76; Tue,  3 Sep 2024 22:43:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Sep 2024 00:27:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3d6ca60f8de9fe6fbfd412194534e312c97adce1
X-Git-Newrev: 8298cfbe2eff4d4db4fbb3a4284da91058b97b0c
X-Patchwork-Hint: ignore
Message-Id: <20240903224340.ED31486D76@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/erlang-fast-xml:
 renamed from erlang-p1-xml
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

commit: https://git.buildroot.net/buildroot/commit/?id=8298cfbe2eff4d4db4fbb3a4284da91058b97b0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package has been renamed to avoid patching other packages that
expect to find its content in a fast_xml/ directory. Remove the
corresponding patch from the erlang-p1-xmpp package.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[yann.morin.1998@free.fr: update .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                    |  1 -
 Config.in.legacy                                       |  7 +++++++
 DEVELOPERS                                             |  2 +-
 package/Config.in                                      |  2 +-
 package/ejabberd/Config.in                             |  2 +-
 package/ejabberd/ejabberd.mk                           |  2 +-
 package/erlang-fast-xml/Config.in                      |  8 ++++++++
 .../erlang-fast-xml.hash}                              |  2 +-
 package/erlang-fast-xml/erlang-fast-xml.mk             | 18 ++++++++++++++++++
 package/erlang-p1-xml/Config.in                        |  8 --------
 package/erlang-p1-xml/erlang-p1-xml.mk                 | 18 ------------------
 package/erlang-p1-xmpp/0001-fix-includes.patch         | 16 ----------------
 package/erlang-p1-xmpp/Config.in                       |  2 +-
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk               |  6 +++---
 14 files changed, 42 insertions(+), 52 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 69742fcef0..338ec9873c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -473,7 +473,6 @@ package/elftosb/0001-fixes-includes.patch lib_patch.Upstream
 package/elftosb/0002-force-cxx-compiler.patch lib_patch.Upstream
 package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch lib_patch.Upstream
 package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch lib_patch.Upstream
-package/erlang-p1-xmpp/0001-fix-includes.patch lib_patch.Upstream
 package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch lib_patch.Upstream
 package/espeak/0001-Fix-build-of-shared-library-on-architectures-needing.patch lib_patch.Upstream
 package/espeak/0002-tr_languages-cast-string_ordinal-init-values.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 909e597fc5..e441627949 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.11"
 
+config BR2_PACKAGE_ERLANG_P1_XML
+	bool "erlang-p1-xml has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_ERLANG_FAST_XML
+	help
+	  The erlang-p1-xml package has been renamed to erlang-fast-xml.
+
 config BR2_PACKAGE_ERLANG_P1_STUN
 	bool "erlang-p1-stun has been renamed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 46b61ca5bd..6741d0b1d7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1664,6 +1664,7 @@ N:	Johan Oudinet <johan.oudinet@gmail.com>
 F:	package/ejabberd/
 F:	package/erlang-base64url/
 F:	package/erlang-eimp/
+F:	package/erlang-fast-xml/
 F:	package/erlang-goldrush/
 F:	package/erlang-idna/
 F:	package/erlang-jiffy/
@@ -1678,7 +1679,6 @@ F:	package/erlang-p1-sip/
 F:	package/erlang-p1-stringprep/
 F:	package/erlang-p1-tls/
 F:	package/erlang-p1-utils/
-F:	package/erlang-p1-xml/
 F:	package/erlang-p1-xmpp/
 F:	package/erlang-p1-yaml/
 F:	package/erlang-p1-yconf/
diff --git a/package/Config.in b/package/Config.in
index 46f37c82e3..88c74d54b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -673,6 +673,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-base64url/Config.in"
 	source "package/erlang-eimp/Config.in"
+	source "package/erlang-fast-xml/Config.in"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-idna/Config.in"
 	source "package/erlang-jiffy/Config.in"
@@ -687,7 +688,6 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-stringprep/Config.in"
 	source "package/erlang-p1-tls/Config.in"
 	source "package/erlang-p1-utils/Config.in"
-	source "package/erlang-p1-xml/Config.in"
 	source "package/erlang-p1-xmpp/Config.in"
 	source "package/erlang-p1-yaml/Config.in"
 	source "package/erlang-p1-yconf/Config.in"
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index fb35a87306..295b0e7744 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_EJABBERD
 	depends on BR2_PACKAGE_ERLANG
 	depends on BR2_INSTALL_LIBSTDCPP # jiffy, stringprep
 	select BR2_PACKAGE_ERLANG_EIMP
+	select BR2_PACKAGE_ERLANG_FAST_XML
 	select BR2_PACKAGE_ERLANG_IDNA # runtime
 	select BR2_PACKAGE_ERLANG_JIFFY # runtime
 	select BR2_PACKAGE_ERLANG_JOSE # runtime
@@ -16,7 +17,6 @@ config BR2_PACKAGE_EJABBERD
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
-	select BR2_PACKAGE_ERLANG_P1_XML
 	select BR2_PACKAGE_ERLANG_P1_XMPP
 	select BR2_PACKAGE_ERLANG_P1_YAML
 	select BR2_PACKAGE_ERLANG_P1_YCONF # runtime
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 1df8145496..e49560d3a7 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -12,7 +12,7 @@ EJABBERD_CPE_ID_VENDOR = process-one
 EJABBERD_DEPENDENCIES = getent openssl erlang-eimp host-erlang-lager \
 	erlang-lager erlang-p1-cache-tab erlang-p1-sip \
 	erlang-p1-stringprep erlang-stun erlang-p1-tls \
-	erlang-p1-utils erlang-p1-xml erlang-p1-xmpp erlang-p1-yaml \
+	erlang-p1-utils erlang-fast-xml erlang-p1-xmpp erlang-p1-yaml \
 	erlang-p1-zlib host-erlang-p1-utils host-erlang-p1-xmpp
 
 # 0001-Makefile.in-do-not-download-or-compile-dependencies.patch
diff --git a/package/erlang-fast-xml/Config.in b/package/erlang-fast-xml/Config.in
new file mode 100644
index 0000000000..04d6634fe8
--- /dev/null
+++ b/package/erlang-fast-xml/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ERLANG_FAST_XML
+	bool "erlang-fast-xml"
+	select BR2_PACKAGE_ERLANG_P1_UTILS
+	select BR2_PACKAGE_EXPAT
+	help
+	  XML utilities for Erlang
+
+	  https://github.com/processone/fast_xml
diff --git a/package/erlang-p1-xml/erlang-p1-xml.hash b/package/erlang-fast-xml/erlang-fast-xml.hash
similarity index 81%
rename from package/erlang-p1-xml/erlang-p1-xml.hash
rename to package/erlang-fast-xml/erlang-fast-xml.hash
index 379ca7ef88..6592e282d6 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.hash
+++ b/package/erlang-fast-xml/erlang-fast-xml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  02bcdb0a4350080a10b52de85c11de982e5f7cf2150f5b1b888f7a95ccb31265  erlang-p1-xml-1.1.49.tar.gz
+sha256  02bcdb0a4350080a10b52de85c11de982e5f7cf2150f5b1b888f7a95ccb31265  erlang-fast-xml-1.1.49.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-fast-xml/erlang-fast-xml.mk b/package/erlang-fast-xml/erlang-fast-xml.mk
new file mode 100644
index 0000000000..c2b6205914
--- /dev/null
+++ b/package/erlang-fast-xml/erlang-fast-xml.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# erlang-fast-xml
+#
+################################################################################
+
+ERLANG_FAST_XML_VERSION = 1.1.49
+ERLANG_FAST_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_FAST_XML_VERSION))
+ERLANG_FAST_XML_LICENSE = Apache-2.0
+ERLANG_FAST_XML_LICENSE_FILES = LICENSE.txt
+ERLANG_FAST_XML_DEPENDENCIES = expat erlang-p1-utils
+HOST_ERLANG_FAST_XML_DEPENDENCIES = host-expat host-erlang-p1-utils
+ERLANG_FAST_XML_INSTALL_STAGING = YES
+
+ERLANG_FAST_XML_USE_AUTOCONF = YES
+
+$(eval $(rebar-package))
+$(eval $(host-rebar-package))
diff --git a/package/erlang-p1-xml/Config.in b/package/erlang-p1-xml/Config.in
deleted file mode 100644
index 504501d912..0000000000
--- a/package/erlang-p1-xml/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_ERLANG_P1_XML
-	bool "erlang-p1-xml"
-	select BR2_PACKAGE_ERLANG_P1_UTILS
-	select BR2_PACKAGE_EXPAT
-	help
-	  XML utilities for Erlang
-
-	  https://github.com/processone/xml
diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
deleted file mode 100644
index eee2c74c03..0000000000
--- a/package/erlang-p1-xml/erlang-p1-xml.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# erlang-p1-xml
-#
-################################################################################
-
-ERLANG_P1_XML_VERSION = 1.1.49
-ERLANG_P1_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_P1_XML_VERSION))
-ERLANG_P1_XML_LICENSE = Apache-2.0
-ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
-ERLANG_P1_XML_DEPENDENCIES = expat erlang-p1-utils
-HOST_ERLANG_P1_XML_DEPENDENCIES = host-expat host-erlang-p1-utils
-ERLANG_P1_XML_INSTALL_STAGING = YES
-
-ERLANG_P1_XML_USE_AUTOCONF = YES
-
-$(eval $(rebar-package))
-$(eval $(host-rebar-package))
diff --git a/package/erlang-p1-xmpp/0001-fix-includes.patch b/package/erlang-p1-xmpp/0001-fix-includes.patch
deleted file mode 100644
index f02037fdc1..0000000000
--- a/package/erlang-p1-xmpp/0001-fix-includes.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Without this patch, rebar fails to find include file fxml.hrl.
-
-Signed-off-by: Christophe Romain <cromain@process-one.net>
-
-diff --git a/include/xmpp.hrl b/include/xmpp.hrl
-index afa5f61..678858e 100644
---- a/include/xmpp.hrl
-+++ b/include/xmpp.hrl
-@@ -25,7 +25,7 @@
- -include("ns.hrl").
- -include("jid.hrl").
- -include("xmpp_codec.hrl").
---include_lib("fast_xml/include/fxml.hrl").
-+-include_lib("p1_xml/include/fxml.hrl").
-
- -type stanza() :: iq() | presence() | message().
diff --git a/package/erlang-p1-xmpp/Config.in b/package/erlang-p1-xmpp/Config.in
index c67dc832b7..9cd1a75198 100644
--- a/package/erlang-p1-xmpp/Config.in
+++ b/package/erlang-p1-xmpp/Config.in
@@ -4,8 +4,8 @@ comment "erlang-p1-xmpp needs a toolchain w/ C++"
 config BR2_PACKAGE_ERLANG_P1_XMPP
 	bool "erlang-p1-xmpp"
 	depends on BR2_INSTALL_LIBSTDCPP # erlang-p1-stringprep
+	select BR2_PACKAGE_ERLANG_FAST_XML
 	select BR2_PACKAGE_ERLANG_IDNA
-	select BR2_PACKAGE_ERLANG_P1_XML
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
index 2deb25b315..f8ec0b9823 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
@@ -9,9 +9,9 @@ ERLANG_P1_XMPP_SITE = $(call github,processone,xmpp,$(ERLANG_P1_XMPP_VERSION))
 ERLANG_P1_XMPP_LICENSE = Apache-2.0
 ERLANG_P1_XMPP_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_XMPP_INSTALL_STAGING = YES
-ERLANG_P1_XMPP_DEPENDENCIES = erlang-p1-xml erlang-p1-stringprep \
-	erlang-p1-tls erlang-p1-utils erlang-p1-zlib host-erlang-p1-xml
-HOST_ERLANG_P1_XMPP_DEPENDENCIES = host-erlang-p1-xml
+ERLANG_P1_XMPP_DEPENDENCIES = erlang-fast-xml erlang-p1-stringprep \
+	erlang-p1-tls erlang-p1-utils erlang-p1-zlib host-erlang-fast-xml
+HOST_ERLANG_P1_XMPP_DEPENDENCIES = host-erlang-fast-xml
 
 $(eval $(rebar-package))
 $(eval $(host-rebar-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
