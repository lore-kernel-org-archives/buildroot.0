Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9881C83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F159409E1;
	Sat, 26 Aug 2023 18:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F159409E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wxeiAeHhZ81a; Sat, 26 Aug 2023 18:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DF244095D;
	Sat, 26 Aug 2023 18:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DF244095D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 35A7B1BF867
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2518B60BBF
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2518B60BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ptyy7LygYzQy for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:48:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6DB660BAE
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6DB660BAE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7F71863F5; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 19:36:45 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d4c4fa9dfc3dae13d47faaba657544b1763414f7
X-Git-Newrev: 1e87afecbbe05e787be123ed379993e26b827ce7
X-Patchwork-Hint: ignore
Message-Id: <20230826184802.C7F71863F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/samba4: bump
 version to 4.18.2
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
Content-Type: multipart/mixed; boundary="===============0255488681823026384=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0255488681823026384==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1e87afecbbe05e787be123ed379993e26b827ce7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Removed patches which were applied upstream, rebased remaining patches.
Added patch 0004 to avoid dependency to perl package JSON:PP.

This bump depends on bumping heimdal, see previous patch of this series.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998@free.fr:
  - make new patch git-formatted
  - add upstream status to new patch
  - update .checkpackageignore wth removed patches
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 55ceaef8f65eeb0fd9ca7314b03668cf9dd325ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-libreplace-disable-libbsd-support.patch   |  2 +-
 ...pre-built-heimdal-build-tools-in-case-of-.patch | 42 +++++-----------------
 ...indal-Use-perl-module-JSON-part-of-core-i.patch | 41 +++++++++++++++++++++
 .../0004-lib-util-Add-signal.h-include.patch       | 37 -------------------
 ...05-samba-4.16.2-fix-build-without-innetgr.patch | 34 ------------------
 package/samba4/samba4.hash                         |  4 +--
 package/samba4/samba4.mk                           |  4 +--
 7 files changed, 54 insertions(+), 110 deletions(-)

diff --git a/package/samba4/0001-libreplace-disable-libbsd-support.patch b/package/samba4/0001-libreplace-disable-libbsd-support.patch
index 79216860dd..8259e91fc6 100644
--- a/package/samba4/0001-libreplace-disable-libbsd-support.patch
+++ b/package/samba4/0001-libreplace-disable-libbsd-support.patch
@@ -19,7 +19,7 @@ diff --git a/lib/replace/wscript b/lib/replace/wscript
 index 240d730cbee..c6d8df43c74 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -406,21 +406,6 @@ def configure(conf):
+@@ -436,21 +436,6 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
diff --git a/package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch b/package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
index 484e6722ea..1c4de6a02e 100644
--- a/package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
+++ b/package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
@@ -1,4 +1,4 @@
-From e002d2ef2688d5433d2bd03aa4d77a0ec5ac4e63 Mon Sep 17 00:00:00 2001
+From 2e53f331104b29db7caf1641a30d3e9316b57184 Mon Sep 17 00:00:00 2001
 From: Uri Simchoni <uri@samba.org>
 Date: Sun, 20 Oct 2019 00:03:14 +0300
 Subject: [PATCH] build: find pre-built heimdal build tools in case of embedded
@@ -33,18 +33,20 @@ BUG: https://bugzilla.samba.org/show_bug.cgi?id=14164
 
 Signed-off-by: Uri Simchoni <uri@samba.org>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: rebased for version 4.11.13]
+[Bernd: rebased for version 4.11.13 & 4.17.7]
 ---
  wscript_configure_embedded_heimdal | 11 +++++++++++
  wscript_configure_system_heimdal   | 11 -----------
  2 files changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/wscript_configure_embedded_heimdal b/wscript_configure_embedded_heimdal
-index 8c55ae2a938..4fdae8062c5 100644
+index 8c55ae2..4fdae80 100644
 --- a/wscript_configure_embedded_heimdal
 +++ b/wscript_configure_embedded_heimdal
-@@ -1 +1,12 @@
- conf.RECURSE('source4/heimdal_build')
+@@ -6,3 +6,14 @@
+ 
+ conf.define('USING_EMBEDDED_HEIMDAL', 1)
+ conf.RECURSE('third_party/heimdal_build')
 +
 +def check_system_heimdal_binary(name):
 +    if conf.LIB_MAY_BE_BUNDLED(name):
@@ -56,34 +58,6 @@ index 8c55ae2a938..4fdae8062c5 100644
 +
 +check_system_heimdal_binary("compile_et")
 +check_system_heimdal_binary("asn1_compile")
-diff --git a/wscript_configure_system_heimdal b/wscript_configure_system_heimdal
-index 0ff6dad2f55..f77c177442f 100644
---- a/wscript_configure_system_heimdal
-+++ b/wscript_configure_system_heimdal
-@@ -37,14 +37,6 @@ def check_system_heimdal_lib(name, functions='', headers='', onlyif=None):
-     conf.define('USING_SYSTEM_%s' % name.upper(), 1)
-     return True
- 
--def check_system_heimdal_binary(name):
--    if conf.LIB_MAY_BE_BUNDLED(name):
--        return False
--    if not conf.find_program(name, var=name.upper()):
--        return False
--    conf.define('USING_SYSTEM_%s' % name.upper(), 1)
--    return True
--
- check_system_heimdal_lib("com_err", "com_right_r com_err", "com_err.h")
- 
- if check_system_heimdal_lib("roken", "rk_socket_set_reuseaddr", "roken.h"):
-@@ -96,9 +88,6 @@
- #if conf.CHECK_BUNDLED_SYSTEM('tommath', checkfunctions='mp_init', headers='tommath.h'):
- #    conf.define('USING_SYSTEM_TOMMATH', 1)
- 
--check_system_heimdal_binary("compile_et")
--check_system_heimdal_binary("asn1_compile")
--
- conf.env.KRB5_VENDOR = 'heimdal'
- conf.define('USING_SYSTEM_KRB5', 1)
- conf.define('USING_SYSTEM_HEIMDAL', 1)
 -- 
 2.20.1
+
diff --git a/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch b/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
new file mode 100644
index 0000000000..7eb31e5d07
--- /dev/null
+++ b/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
@@ -0,0 +1,41 @@
+From bd8fc19c8383914b518a9d56f4c08fba3baeb967 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 7 May 2023 11:02:26 +0200
+Subject: [PATCH] 3rdparty/heindal: Use perl module JSON, part of core, instead
+ of JSON:PP package
+
+Downloaded from
+https://github.com/openwrt/packages/blob/master/net/samba4/patches/105-perl-json-pp.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+Upstream: unknown
+---
+ third_party/heimdal/cf/make-proto.pl | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/third_party/heimdal/cf/make-proto.pl b/third_party/heimdal/cf/make-proto.pl
+index 36a040ce6c0..ad21dbad9e1 100644
+--- a/third_party/heimdal/cf/make-proto.pl
++++ b/third_party/heimdal/cf/make-proto.pl
+@@ -4,7 +4,7 @@
+ use Getopt::Std;
+ use File::Compare;
+ 
+-use JSON;
++use JSON::PP;
+ 
+ my $comment = 0;
+ my $doxygen = 0;
+@@ -70,7 +70,7 @@ if($opt_x) {
+     my $EXP;
+     local $/;
+     open(EXP, '<', $opt_x) || die "open ${opt_x}";
+-    my $obj = JSON->new->utf8->decode(<EXP>);
++    my $obj = JSON::PP->new->utf8->decode(<EXP>);
+     close $EXP;
+ 
+     foreach my $x (keys %$obj) {
+-- 
+2.25.1
+
diff --git a/package/samba4/0004-lib-util-Add-signal.h-include.patch b/package/samba4/0004-lib-util-Add-signal.h-include.patch
deleted file mode 100644
index 838a8fa6d7..0000000000
--- a/package/samba4/0004-lib-util-Add-signal.h-include.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From d1732a79dbf30c41802245909d0250ebe2b9d92e Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 12 Dec 2021 10:27:42 +0100
-Subject: [PATCH] lib/util: Add signal.h include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes build error with samba-4.15.3 and uClibc:
-
-../../source3/printing/samba-bgqd.c: In function ‘main’:
-../../source3/printing/samba-bgqd.c:340:21: error: ‘SIGPIPE’ undeclared (first use in this function); did you mean ‘EPIPE’?
-../../source3/printing/samba-bgqd.c:384:14: error: ‘SIGTERM’ undeclared (first use in this function)
-
-Patch sent upstream:
-https://gitlab.com/samba-team/samba/-/merge_requests/2296
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- lib/util/signal.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/util/signal.h b/lib/util/signal.h
-index 0663af6ab94..f662ee110d6 100644
---- a/lib/util/signal.h
-+++ b/lib/util/signal.h
-@@ -21,6 +21,7 @@
- #ifndef _SAMBA_UTIL_SIGNAL_H_
- #define _SAMBA_UTIL_SIGNAL_H_
- 
-+#include <signal.h>
- #include <stdbool.h>
- 
- /**
--- 
-2.30.2
-
diff --git a/package/samba4/0005-samba-4.16.2-fix-build-without-innetgr.patch b/package/samba4/0005-samba-4.16.2-fix-build-without-innetgr.patch
deleted file mode 100644
index b338596d7a..0000000000
--- a/package/samba4/0005-samba-4.16.2-fix-build-without-innetgr.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-# Gentoo bug 855047
-
-Fixes uClibc build when uClibc was build without netgroup support.
-Upstream enables netgroup support based on getdomainname() being
-present:
-https://github.com/samba-team/samba/commit/f179184a2be2ddd38f463fcc12252f8d24e529f8#diff-b8d1bc25b89846e70ecb61cb296a8f5c50c9a0a1b62e46790fae81aa9d5bfaaeR632
-
-Downloaded from
-https://gitweb.gentoo.org/repo/gentoo.git/tree/net-fs/samba/files/samba-4.16.2-fix-musl-without-innetgr.patch
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- a/lib/util/access.c
-+++ b/lib/util/access.c
-@@ -115,7 +115,7 @@ static bool string_match(const char *tok,const char *s)
- 			return true;
- 		}
- 	} else if (tok[0] == '@') { /* netgroup: look it up */
--#ifdef HAVE_NETGROUP
-+#if defined(HAVE_NETGROUP) && defined(HAVE_INNETGR)
- 		DATA_BLOB tmp;
- 		char *mydomain = NULL;
- 		char *hostname = NULL;
---- a/source3/auth/user_util.c
-+++ b/source3/auth/user_util.c
-@@ -135,7 +135,7 @@ static void store_map_in_gencache(TALLOC_CTX *ctx, const char *from, const char
-
- bool user_in_netgroup(TALLOC_CTX *ctx, const char *user, const char *ngname)
- {
--#ifdef HAVE_NETGROUP
-+#if defined(HAVE_NETGROUP) && defined(HAVE_INNETGR)
- 	char nis_domain_buf[256];
- 	const char *nis_domain = NULL;
- 	char *lowercase_user = NULL;
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 18ec63e07a..20390fb6b4 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.15.13.tar.asc
-sha256  c412e3536a5265d04e52983e643bae9e047bcc3eac08683a945b1057ecdf4968  samba-4.15.13.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.18.2.tar.asc
+sha256  5bf87e179616cd12a52d85fb8b26eec709f13709a2b67fe42b1fb0213f7e8106  samba-4.18.2.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index b979aaf09f..2799dbe2f7 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.15.13
+SAMBA4_VERSION = 4.18.2
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
@@ -120,7 +120,7 @@ define SAMBA4_CONFIGURE_CMDS
 		PERL="$(HOST_DIR)/bin/perl" \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(SAMBA4_CONF_ENV) \
-		./buildtools/bin/waf configure \
+		./configure \
 			--prefix=/usr \
 			--sysconfdir=/etc \
 			--localstatedir=/var \

--===============0255488681823026384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0255488681823026384==--
