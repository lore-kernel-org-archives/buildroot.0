Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91017CD37B1
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 22:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 510C780F53;
	Tue,  3 Sep 2024 22:44:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T20ty3jzYpTW; Tue,  3 Sep 2024 22:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66069810E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66069810E4;
	Tue,  3 Sep 2024 22:43:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CFAC1BF576
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A3C7402EE
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:43:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZF33Oqnt2BB for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 22:43:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D648C402AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D648C402AE
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 22:43:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBA2086D76; Tue,  3 Sep 2024 22:43:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Sep 2024 00:26:01 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1e7f27adf99712c02f52853922f3f4ff32b88934
X-Git-Newrev: 7251f07b4581bd6b8cdd62e6341bf02936292516
X-Patchwork-Hint: ignore
Message-Id: <20240903224340.CBA2086D76@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/erlang-stun: renamed
 from erlang-p1-stun
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

commit: https://git.buildroot.net/buildroot/commit/?id=7251f07b4581bd6b8cdd62e6341bf02936292516
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package is renamed to avoid fixing other packages that expect to
find its content inside a stun/ directory instead of p1_stun/. Thus,
remove the corresponding patch from the erlang-p1-sip package.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[yann.morin.1998@free.fr: update .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 Config.in.legacy                                   |  7 +++++
 DEVELOPERS                                         |  2 +-
 package/Config.in                                  |  2 +-
 package/ejabberd/Config.in                         |  2 +-
 package/ejabberd/ejabberd.mk                       |  2 +-
 package/erlang-p1-sip/0001-correct-include.patch   | 31 ----------------------
 package/erlang-p1-sip/Config.in                    |  2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk             |  2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk           | 14 ----------
 package/{erlang-p1-stun => erlang-stun}/Config.in  |  4 +--
 .../erlang-stun.hash}                              |  2 +-
 package/erlang-stun/erlang-stun.mk                 | 14 ++++++++++
 13 files changed, 30 insertions(+), 55 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e86fd390e9..69742fcef0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -473,7 +473,6 @@ package/elftosb/0001-fixes-includes.patch lib_patch.Upstream
 package/elftosb/0002-force-cxx-compiler.patch lib_patch.Upstream
 package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch lib_patch.Upstream
 package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch lib_patch.Upstream
-package/erlang-p1-sip/0001-correct-include.patch lib_patch.Upstream
 package/erlang-p1-xmpp/0001-fix-includes.patch lib_patch.Upstream
 package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch lib_patch.Upstream
 package/espeak/0001-Fix-build-of-shared-library-on-architectures-needing.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index bbfc6b359e..909e597fc5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.11"
 
+config BR2_PACKAGE_ERLANG_P1_STUN
+	bool "erlang-p1-stun has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_ERLANG_STUN
+	help
+	  The erlang-p1-stun package has been renamed to erlang-stun.
+
 config BR2_PACKAGE_FBV_GIF
 	bool "fbv GIF support has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 0a5dd3f64d..46b61ca5bd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1676,7 +1676,6 @@ F:	package/erlang-p1-oauth2/
 F:	package/erlang-p1-pkix/
 F:	package/erlang-p1-sip/
 F:	package/erlang-p1-stringprep/
-F:	package/erlang-p1-stun/
 F:	package/erlang-p1-tls/
 F:	package/erlang-p1-utils/
 F:	package/erlang-p1-xml/
@@ -1684,6 +1683,7 @@ F:	package/erlang-p1-xmpp/
 F:	package/erlang-p1-yaml/
 F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
+F:	package/erlang-stun/
 F:	package/forge/
 F:	package/nginx-dav-ext/
 F:	package/vis-network/
diff --git a/package/Config.in b/package/Config.in
index b3665a7569..46f37c82e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -685,7 +685,6 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-pkix/Config.in"
 	source "package/erlang-p1-sip/Config.in"
 	source "package/erlang-p1-stringprep/Config.in"
-	source "package/erlang-p1-stun/Config.in"
 	source "package/erlang-p1-tls/Config.in"
 	source "package/erlang-p1-utils/Config.in"
 	source "package/erlang-p1-xml/Config.in"
@@ -693,6 +692,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-yaml/Config.in"
 	source "package/erlang-p1-yconf/Config.in"
 	source "package/erlang-p1-zlib/Config.in"
+	source "package/erlang-stun/Config.in"
 endmenu
 endif
 	source "package/execline/Config.in"
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index e24c7fee6b..fb35a87306 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -14,7 +14,6 @@ config BR2_PACKAGE_EJABBERD
 	select BR2_PACKAGE_ERLANG_P1_PKIX # runtime
 	select BR2_PACKAGE_ERLANG_P1_SIP
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
-	select BR2_PACKAGE_ERLANG_P1_STUN
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
 	select BR2_PACKAGE_ERLANG_P1_XML
@@ -22,6 +21,7 @@ config BR2_PACKAGE_EJABBERD
 	select BR2_PACKAGE_ERLANG_P1_YAML
 	select BR2_PACKAGE_ERLANG_P1_YCONF # runtime
 	select BR2_PACKAGE_ERLANG_P1_ZLIB
+	select BR2_PACKAGE_ERLANG_STUN
 	select BR2_PACKAGE_GETENT
 	select BR2_PACKAGE_OPENSSL
 	help
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 574f9492e8..1df8145496 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -11,7 +11,7 @@ EJABBERD_LICENSE_FILES = COPYING
 EJABBERD_CPE_ID_VENDOR = process-one
 EJABBERD_DEPENDENCIES = getent openssl erlang-eimp host-erlang-lager \
 	erlang-lager erlang-p1-cache-tab erlang-p1-sip \
-	erlang-p1-stringprep erlang-p1-stun erlang-p1-tls \
+	erlang-p1-stringprep erlang-stun erlang-p1-tls \
 	erlang-p1-utils erlang-p1-xml erlang-p1-xmpp erlang-p1-yaml \
 	erlang-p1-zlib host-erlang-p1-utils host-erlang-p1-xmpp
 
diff --git a/package/erlang-p1-sip/0001-correct-include.patch b/package/erlang-p1-sip/0001-correct-include.patch
deleted file mode 100644
index 90d68b5184..0000000000
--- a/package/erlang-p1-sip/0001-correct-include.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5ad4f871df7cbbc973708cb7380c3410b20bde1c Mon Sep 17 00:00:00 2001
-From: Philipp Huebner <debalance@debian.org>
-Date: Tue, 1 Dec 2020 23:07:51 +0100
-Subject: [PATCH] correct include
-
-This part of the code was moved into it's own project and was packaged
-separately by me. To make the build process work, this small fix is
-necessary.
-
-Author: Philipp Huebner <debalance@debian.org>
-Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
----
- src/esip_socket.erl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/esip_socket.erl b/src/esip_socket.erl
-index 4154faa..db5fa92 100644
---- a/src/esip_socket.erl
-+++ b/src/esip_socket.erl
-@@ -37,7 +37,7 @@
- 
- -include("esip.hrl").
- -include("esip_lib.hrl").
---include_lib("stun/include/stun.hrl").
-+-include_lib("p1_stun/include/stun.hrl").
- 
- -define(TCP_SEND_TIMEOUT, 15000).
- -define(CONNECT_TIMEOUT, 20000).
--- 
-2.28.0
-
diff --git a/package/erlang-p1-sip/Config.in b/package/erlang-p1-sip/Config.in
index 70cf819a37..74494d3c94 100644
--- a/package/erlang-p1-sip/Config.in
+++ b/package/erlang-p1-sip/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_ERLANG_P1_SIP
 	bool "erlang-p1-sip"
-	select BR2_PACKAGE_ERLANG_P1_STUN
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
+	select BR2_PACKAGE_ERLANG_STUN
 	help
 	  SIP library for Erlang
 
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
index 61f728cb1b..45c70e8899 100644
--- a/package/erlang-p1-sip/erlang-p1-sip.mk
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -8,7 +8,7 @@ ERLANG_P1_SIP_VERSION = 1.0.49
 ERLANG_P1_SIP_SITE = $(call github,processone,esip,$(ERLANG_P1_SIP_VERSION))
 ERLANG_P1_SIP_LICENSE = Apache-2.0
 ERLANG_P1_SIP_LICENSE_FILES = LICENSE.txt
-ERLANG_P1_SIP_DEPENDENCIES = erlang-p1-stun erlang-p1-tls erlang-p1-utils
+ERLANG_P1_SIP_DEPENDENCIES = erlang-stun erlang-p1-tls erlang-p1-utils
 ERLANG_P1_SIP_INSTALL_STAGING = YES
 
 $(eval $(rebar-package))
diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
deleted file mode 100644
index 7438bd2186..0000000000
--- a/package/erlang-p1-stun/erlang-p1-stun.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# erlang-p1-stun
-#
-################################################################################
-
-ERLANG_P1_STUN_VERSION = 1.2.7
-ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
-ERLANG_P1_STUN_LICENSE = Apache-2.0
-ERLANG_P1_STUN_LICENSE_FILES = LICENSE.txt
-ERLANG_P1_STUN_DEPENDENCIES = erlang-p1-tls erlang-p1-utils
-ERLANG_P1_STUN_INSTALL_STAGING = YES
-
-$(eval $(rebar-package))
diff --git a/package/erlang-p1-stun/Config.in b/package/erlang-stun/Config.in
similarity index 71%
rename from package/erlang-p1-stun/Config.in
rename to package/erlang-stun/Config.in
index 70cdd91599..dcf3817a2d 100644
--- a/package/erlang-p1-stun/Config.in
+++ b/package/erlang-stun/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_ERLANG_P1_STUN
-	bool "erlang-p1-stun"
+config BR2_PACKAGE_ERLANG_STUN
+	bool "erlang-stun"
 	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
 	help
diff --git a/package/erlang-p1-stun/erlang-p1-stun.hash b/package/erlang-stun/erlang-stun.hash
similarity index 81%
rename from package/erlang-p1-stun/erlang-p1-stun.hash
rename to package/erlang-stun/erlang-stun.hash
index 49e1963ff0..85dc6a42fa 100644
--- a/package/erlang-p1-stun/erlang-p1-stun.hash
+++ b/package/erlang-stun/erlang-stun.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d7e9d3d591a88a91abf053c068f7152495e37d17f4c9ac58992c544d6f8f5e86  erlang-p1-stun-1.2.7.tar.gz
+sha256  d7e9d3d591a88a91abf053c068f7152495e37d17f4c9ac58992c544d6f8f5e86  erlang-stun-1.2.7.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-stun/erlang-stun.mk b/package/erlang-stun/erlang-stun.mk
new file mode 100644
index 0000000000..9def30a857
--- /dev/null
+++ b/package/erlang-stun/erlang-stun.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# erlang-stun
+#
+################################################################################
+
+ERLANG_STUN_VERSION = 1.2.7
+ERLANG_STUN_SITE = $(call github,processone,stun,$(ERLANG_STUN_VERSION))
+ERLANG_STUN_LICENSE = Apache-2.0
+ERLANG_STUN_LICENSE_FILES = LICENSE.txt
+ERLANG_STUN_DEPENDENCIES = erlang-p1-tls erlang-p1-utils
+ERLANG_STUN_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
