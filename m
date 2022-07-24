Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8ADC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88C7440AD8;
	Sun, 24 Jul 2022 12:38:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88C7440AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5BoCGW6sGCFD; Sun, 24 Jul 2022 12:38:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3747940186;
	Sun, 24 Jul 2022 12:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3747940186
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 675421BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40ADA402D2
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40ADA402D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sRSkCn0utlfC for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:38:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E688C40278
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E688C40278
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C0A3685C5A; Sun, 24 Jul 2022 12:24:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 14:37:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2511d88e83acae4144be89ce5e258b724067bd5
X-Git-Newrev: 8aaa7ecbce1d10cbcd880c3da5e429988f96176a
X-Patchwork-Hint: ignore
Message-Id: <20220724122437.C0A3685C5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opensc: new package
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
Content-Type: multipart/mixed; boundary="===============9196105942253607836=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9196105942253607836==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8aaa7ecbce1d10cbcd880c3da5e429988f96176a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Fix-maybe-uninitialized-errors.patch      | 82 ++++++++++++++++++++++
 package/opensc/Config.in                           | 16 +++++
 package/opensc/opensc.hash                         |  5 ++
 package/opensc/opensc.mk                           | 15 ++++
 6 files changed, 120 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6f529d0c46..628b5cf456 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1558,6 +1558,7 @@ F:	support/testing/tests/package/test_zfs.py
 N:	José Pekkarinen <jose.pekkarinen@unikie.com>
 F:	package/alfred/
 F:	package/bmx7/
+F:	package/opensc/
 F:	package/python-aexpect/
 F:	package/python-alembic/
 F:	package/python-lark/
diff --git a/package/Config.in b/package/Config.in
index 5e7499c396..3a70fe3f9f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1644,6 +1644,7 @@ menu "Hardware handling"
 	source "package/mtdev/Config.in"
 	source "package/ne10/Config.in"
 	source "package/neardal/Config.in"
+	source "package/opensc/Config.in"
 	source "package/owfs/Config.in"
 	source "package/pcsc-lite/Config.in"
 	source "package/rpi-rgb-led-matrix/Config.in"
diff --git a/package/opensc/0001-Fix-maybe-uninitialized-errors.patch b/package/opensc/0001-Fix-maybe-uninitialized-errors.patch
new file mode 100644
index 0000000000..671d92c150
--- /dev/null
+++ b/package/opensc/0001-Fix-maybe-uninitialized-errors.patch
@@ -0,0 +1,82 @@
+From bcb39d6f4d2dee6beb035cb2f3618174ec1cb2b0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
+Date: Fri, 10 Dec 2021 13:54:26 +0200
+Subject: [PATCH] Fix maybe uninitialized errors
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
+Upstream: https://github.com/OpenSC/OpenSC/commit/05ec8c7fe785a2b9aeaac1164adb349df42b7f80
+---
+ src/libopensc/pkcs15-coolkey.c  | 12 ++++++------
+ src/pkcs15init/pkcs15-asepcos.c |  2 +-
+ src/tools/opensc-explorer.c     |  2 +-
+ 3 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/libopensc/pkcs15-coolkey.c b/src/libopensc/pkcs15-coolkey.c
+index 586475dd..15684cef 100644
+--- a/src/libopensc/pkcs15-coolkey.c
++++ b/src/libopensc/pkcs15-coolkey.c
+@@ -147,9 +147,9 @@ coolkey_find_matching_cert(sc_card_t *card, sc_cardctl_coolkey_object_t *in_obj,
+ static int
+ coolkey_get_attribute_ulong(sc_card_t *card, sc_cardctl_coolkey_object_t *obj, CK_ATTRIBUTE_TYPE type, CK_ULONG *value)
+ {
+-	const u8 *val;
+-	size_t val_len;
+-	u8 data_type;
++	const u8 *val = NULL;
++	size_t val_len = 0;
++	u8 data_type = 0;
+ 	int r;
+ 
+ 	r  = coolkey_get_attribute(card, obj, type, &val, &val_len, &data_type);
+@@ -168,8 +168,8 @@ static int
+ coolkey_get_attribute_boolean(sc_card_t *card, sc_cardctl_coolkey_object_t *obj, CK_ATTRIBUTE_TYPE attr_type)
+ {
+ 	int r;
+-	const u8 *val;
+-	size_t val_len;
++	const u8 *val = NULL;
++	size_t val_len = 0;
+ 
+ 	r = coolkey_get_attribute(card, obj, attr_type, &val, &val_len, NULL);
+ 	if (r < 0) {
+@@ -186,7 +186,7 @@ static int
+ coolkey_get_attribute_bytes(sc_card_t *card, sc_cardctl_coolkey_object_t *obj, CK_ATTRIBUTE_TYPE type, u8 *data, size_t *data_len, size_t max_data_len)
+ {
+ 	const u8 *val;
+-	size_t val_len;
++	size_t val_len = 0;
+ 	int r;
+ 
+ 	r = coolkey_get_attribute(card, obj, type, &val, &val_len, NULL);
+diff --git a/src/pkcs15init/pkcs15-asepcos.c b/src/pkcs15init/pkcs15-asepcos.c
+index d7122012..bc0efb5c 100644
+--- a/src/pkcs15init/pkcs15-asepcos.c
++++ b/src/pkcs15init/pkcs15-asepcos.c
+@@ -221,7 +221,7 @@ static int asepcos_do_store_pin(sc_profile_t *profile, sc_card_t *card,
+ {
+ 	sc_file_t *nfile = NULL;
+ 	u8  buf[64], sbuf[64], *p = buf, *q = sbuf;
+-	int r, akn;
++	int r, akn = 0;
+ 
+ 	if (auth_info->auth_type != SC_PKCS15_PIN_AUTH_TYPE_PIN)
+ 		return SC_ERROR_OBJECT_NOT_VALID;
+diff --git a/src/tools/opensc-explorer.c b/src/tools/opensc-explorer.c
+index 9ec4daa1..04efdf8f 100644
+--- a/src/tools/opensc-explorer.c
++++ b/src/tools/opensc-explorer.c
+@@ -2472,7 +2472,7 @@ int main(int argc, char *argv[])
+ 		char *line;
+ 		int cargc;
+ 		char *cargv[260];
+-		int multiple;
++		int multiple = 0;
+ 		struct command *cmd;
+ 		char prompt[3*SC_MAX_PATH_STRING_SIZE];
+ 
+-- 
+2.25.1
+
diff --git a/package/opensc/Config.in b/package/opensc/Config.in
new file mode 100644
index 0000000000..fe3dd0836e
--- /dev/null
+++ b/package/opensc/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_OPENSC
+	bool "opensc"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_PCSC_LITE
+	select BR2_PACKAGE_OPENSSL
+	help
+	  OpenSC provides a set of libraries and utilities to work
+	  with smart cards.
+
+	  https://github.com/OpenSC/OpenSC/wiki
+
+comment "opensc needs a toolchain with dynamic library, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/opensc/opensc.hash b/package/opensc/opensc.hash
new file mode 100644
index 0000000000..517cfe503a
--- /dev/null
+++ b/package/opensc/opensc.hash
@@ -0,0 +1,5 @@
+# Computed locally from https://https://github.com/OpenSC/OpenSC/releases/
+sha256  8d4e5347195ebea332be585df61dcc470331c26969e4b0447c851fb0844c7186  opensc-0.22.0.tar.gz
+
+# Computed locally
+sha256  376b54d4c5f4aa99421823fa4da93e3ab73096fce2400e89858632aa7da24a14  COPYING
diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
new file mode 100644
index 0000000000..538151c12a
--- /dev/null
+++ b/package/opensc/opensc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# opensc
+#
+################################################################################
+
+OPENSC_VERSION = 0.22.0
+OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSION)
+OPENSC_LICENSE = LGPL-2.1+
+OPENSC_LICENSE_FILES = COPYING
+OPENSC_DEPENDENCIES = openssl pcsc-lite
+OPENSC_INSTALL_STAGING = YES
+OPENSC_CONF_OPTS = --disable-strict
+
+$(eval $(autotools-package))

--===============9196105942253607836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9196105942253607836==--
