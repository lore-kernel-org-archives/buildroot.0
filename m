Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742FCCD37B5
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 22:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BD8281189;
	Tue,  3 Sep 2024 22:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_-Zfbg4GN_l; Tue,  3 Sep 2024 22:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0ACB8117F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0ACB8117F;
	Tue,  3 Sep 2024 22:45:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB30D1BF576
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C183340454
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 22:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlAE44-x3OmX for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 22:43:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA6EF40A7D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA6EF40A7D
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 22:43:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5D1786D81; Tue,  3 Sep 2024 22:43:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Sep 2024 00:33:33 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f46a473a796bd77283a1b706e5a11701bda7f571
X-Git-Newrev: c000e858e62ded26d33838cf35159ee4130ea745
X-Patchwork-Hint: ignore
Message-Id: <20240903224341.E5D1786D81@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ejabberd: bump version
 to 24.07
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

commit: https://git.buildroot.net/buildroot/commit/?id=c000e858e62ded26d33838cf35159ee4130ea745
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

and update the two patches accordingly. Ejabberd now uses rebar3 by
default, so use the --with-rebar configure option to set the correct
rebar binary to use.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[yann.morin.1998@free.fr: update .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                   |  2 --
 ...e.in-do-not-download-or-compile-dependencies.patch | 19 +++++++++----------
 package/ejabberd/0002-fix-ejabberdctl.patch           | 15 +++++++--------
 package/ejabberd/ejabberd.hash                        |  4 ++--
 package/ejabberd/ejabberd.mk                          |  5 +++--
 5 files changed, 21 insertions(+), 24 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 36ed0705be..1b0b0c885a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -464,8 +464,6 @@ package/efl/0001-ecore_evas-engines-drm-meson.build-use-gl_deps-as-en.patch lib_
 package/efl/0002-ecore_evas-engines-drm-meson.build-fix-gl_drm-includ.patch lib_patch.Upstream
 package/efl/0003-ecore_fb-fix-build-with-tslib.patch lib_patch.Upstream
 package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch lib_patch.Upstream
-package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch lib_patch.Upstream
-package/ejabberd/0002-fix-ejabberdctl.patch lib_patch.Upstream
 package/ejabberd/S50ejabberd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/ejabberd/check-erlang-lib Shellcheck
 package/elftosb/0001-fixes-includes.patch lib_patch.Upstream
diff --git a/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch b/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
index abcc8975b2..75bfcc2e23 100644
--- a/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
+++ b/package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
@@ -1,37 +1,36 @@
-From bf3571da4a68a6a857ab7ad8256f8276b3687a38 Mon Sep 17 00:00:00 2001
+From bfcc72e5bb96fc9fc1f3558191a1a3f40c7f159a Mon Sep 17 00:00:00 2001
 From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Fri, 13 May 2022 14:22:37 +0200
+Date: Fri, 2 Aug 2024 17:32:37 +0200
 Subject: [PATCH] Makefile.in: do not download or compile dependencies
 
 Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
-[Bernd: updated for version 23.04]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+Upstream: N/A, not upstreamable
 ---
  Makefile.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index ab0e9d967..6e54168a7 100644
+index 5adf241d5..74aad3156 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -155,7 +155,7 @@ else
- endif
- endif
+@@ -201,7 +201,7 @@ endif
+ #' main targets
+ #
  
 -all: scripts deps src
 +all: scripts src
  
  deps: $(DEPSDIR)/.got
  
-@@ -169,7 +169,7 @@ $(DEPSDIR)/.built: $(DEPSDIR)/.got
+@@ -215,7 +215,7 @@ $(DEPSDIR)/.got:
  $(DEPSDIR)/.built: $(DEPSDIR)/.got
  	$(REBAR) compile && :> $(DEPSDIR)/.built
  
 -src: $(DEPSDIR)/.built
 +src:
  	$(REBAR) $(SKIPDEPS) compile
+ 	$(EXPLICIT_ELIXIR_COMPILE)
  
- update:
 -- 
 2.34.1
 
diff --git a/package/ejabberd/0002-fix-ejabberdctl.patch b/package/ejabberd/0002-fix-ejabberdctl.patch
index ae28f3a632..589640ba4c 100644
--- a/package/ejabberd/0002-fix-ejabberdctl.patch
+++ b/package/ejabberd/0002-fix-ejabberdctl.patch
@@ -1,30 +1,29 @@
-From 4283f675f21d3923e200092cec6418014a03ad52 Mon Sep 17 00:00:00 2001
+From d403c0bca48f2678c70763c3faca41c9adc76658 Mon Sep 17 00:00:00 2001
 From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Thu, 26 Dec 2019 17:06:34 +0100
+Date: Fri, 2 Aug 2024 17:39:07 +0200
 Subject: [PATCH] fix ejabberdctl
 
 Change default values so ejabberdctl run commands as ejabberd user.
 
 Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
-[Bernd: updated for version 23.04]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+Upstream: N/A (specific to buildroot)
 ---
  ejabberdctl.template | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ejabberdctl.template b/ejabberdctl.template
-index a940c3df7..5166e5a27 100755
+index 83ec7e1bd..513c48c25 100755
 --- a/ejabberdctl.template
 +++ b/ejabberdctl.template
-@@ -17,7 +17,7 @@ SCRIPT_DIR=$(cd "${0%/*}" && pwd)
+@@ -17,7 +17,7 @@ ERTS_VSN="{{erts_vsn}}"
  ERL="{{erl}}"
- IEX="{{bindir}}/iex"
  EPMD="{{epmd}}"
+ IEX="{{iexpath}}"
 -INSTALLUSER="{{installuser}}"
 +INSTALLUSER=ejabberd
  
  # check the proper system user is used
  case $(id -un) in
 -- 
-2.20.1
+2.34.1
 
diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
index 15e879be19..e6d9b2560e 100644
--- a/package/ejabberd/ejabberd.hash
+++ b/package/ejabberd/ejabberd.hash
@@ -1,4 +1,4 @@
-# From https://static.process-one.net/ejabberd/downloads/23.04/ejabberd-23.04.tar.gz.sum
-sha256  6ff1d41a1ff6261a0c846193647d8ec143e82142859bf1cfdc62299022ceb2ad  ejabberd-23.04.tar.gz
+# From https://static.process-one.net/ejabberd/downloads/24.07/ejabberd-24.07.tar.gz.sum
+sha256  c0fb746acba81a5db41de97c03968c1f681a13b1b6c1a895b7182e33820c18d9  ejabberd-24.07.tar.gz
 # Locally computed
 sha256  469bb8cfa3ef22c102875ff31932450c075e6908ff3f7d36893485c0c30898eb  COPYING
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 58b544fb84..df9fc1c1d0 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EJABBERD_VERSION = 23.04
+EJABBERD_VERSION = 24.07
 EJABBERD_SITE = https://static.process-one.net/ejabberd/downloads/$(EJABBERD_VERSION)
 EJABBERD_LICENSE = GPL-2.0+ with OpenSSL exception
 EJABBERD_LICENSE_FILES = COPYING
@@ -36,7 +36,8 @@ EJABBERD_CONF_ENV = \
 
 EJABBERD_CONF_OPTS = \
 	--enable-system-deps \
-	--disable-erlang-version-check
+	--disable-erlang-version-check \
+	--with-rebar="$(HOST_DIR)/bin/rebar"
 
 define EJABBERD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) all install -C $(@D)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
