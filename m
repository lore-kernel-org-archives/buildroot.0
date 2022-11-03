Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC96DC47089
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9526340522;
	Mon,  5 Dec 2022 11:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9526340522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YjVBKv9Bwllr; Mon,  5 Dec 2022 11:44:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 572334052B;
	Mon,  5 Dec 2022 11:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 572334052B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3095E1BF8C7
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA33E4161F
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA33E4161F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5XhmkHDkSDzh for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DC6541621
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DC6541621
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A9C785BA2; Mon,  5 Dec 2022 11:26:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:19:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aef5c2d3b6bf9aabe543495a9ad33de7ddf58812
X-Git-Newrev: 1fb64680bffbda1e5fb952150652f73205322707
X-Patchwork-Hint: ignore
Message-Id: <20221205112604.8A9C785BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mupdf: bump to version 1.20.3
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
Content-Type: multipart/mixed; boundary="===============1846007815415620524=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1846007815415620524==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1fb64680bffbda1e5fb952150652f73205322707
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop all patches which are now upstream/no longer needed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Makefile-add-an-install_libs-target.patch |  41 -------
 ...ouble-free-of-object-during-linearization.patch |  52 ---------
 ...le-max-key-size-in-cached-color-converter.patch | 119 ---------------------
 ...-Makefile-compile-hexdump.exe-with-HOSTCC.patch |  40 -------
 package/mupdf/mupdf.hash                           |   4 +-
 package/mupdf/mupdf.mk                             |   6 +-
 6 files changed, 5 insertions(+), 257 deletions(-)

diff --git a/package/mupdf/0001-Makefile-add-an-install_libs-target.patch b/package/mupdf/0001-Makefile-add-an-install_libs-target.patch
deleted file mode 100644
index 9cb5a2fec9..0000000000
--- a/package/mupdf/0001-Makefile-add-an-install_libs-target.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 0989f13ecbc2155b05da0cb091801d32d750d2d4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?=
- <raphael.melotte@essensium.com>
-Date: Thu, 29 Aug 2019 09:51:02 +0200
-Subject: [PATCH] Makefile: add an install_libs target.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This allows to install only the library files (if you need pymupdf but
-not mupdf binaries for example).
-
-Signed-off-by: Raphaël Mélotte <raphael.melotte@essensium.com>
----
- Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index c5bc541ac..e14f88526 100644
---- a/Makefile
-+++ b/Makefile
-@@ -322,7 +322,7 @@ libs: $(INSTALL_LIBS)
- tools: $(TOOL_APPS)
- apps: $(TOOL_APPS) $(VIEW_APPS)
- 
--install: libs apps
-+install_libs:
- 	install -d $(DESTDIR)$(incdir)/mupdf
- 	install -d $(DESTDIR)$(incdir)/mupdf/fitz
- 	install -d $(DESTDIR)$(incdir)/mupdf/pdf
-@@ -333,6 +333,7 @@ install: libs apps
- 	install -d $(DESTDIR)$(libdir)
- 	install -m 644 $(INSTALL_LIBS) $(DESTDIR)$(libdir)
- 
-+install: libs apps install_libs
- 	install -d $(DESTDIR)$(bindir)
- 	install -m 755 $(TOOL_APPS) $(VIEW_APPS) $(DESTDIR)$(bindir)
- 
--- 
-2.21.0
-
diff --git a/package/mupdf/0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch b/package/mupdf/0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch
deleted file mode 100644
index a4746961a6..0000000000
--- a/package/mupdf/0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From cee7cefc610d42fd383b3c80c12cbc675443176a Mon Sep 17 00:00:00 2001
-From: Robin Watts <Robin.Watts@artifex.com>
-Date: Fri, 22 Jan 2021 17:05:15 +0000
-Subject: [PATCH] Bug 703366: Fix double free of object during linearization.
-
-This appears to happen because we parse an illegal object from
-a broken file and assign it to object 0, which is defined to
-be free.
-
-Here, we fix the parsing code so this can't happen.
-
-[Retrieved from:
-http://git.ghostscript.com/?p=mupdf.git;h=cee7cefc610d42fd383b3c80c12cbc675443176a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- source/pdf/pdf-parse.c | 6 ++++++
- source/pdf/pdf-xref.c  | 2 ++
- 2 files changed, 8 insertions(+)
-
-diff --git a/source/pdf/pdf-parse.c b/source/pdf/pdf-parse.c
-index 7abc8c3d4..5761c3351 100644
---- a/source/pdf/pdf-parse.c
-+++ b/source/pdf/pdf-parse.c
-@@ -749,6 +749,12 @@ pdf_parse_ind_obj(fz_context *ctx, pdf_document *doc,
- 		fz_throw(ctx, FZ_ERROR_SYNTAX, "expected generation number (%d ? obj)", num);
- 	}
- 	gen = buf->i;
-+	if (gen < 0 || gen >= 65536)
-+	{
-+		if (try_repair)
-+			*try_repair = 1;
-+		fz_throw(ctx, FZ_ERROR_SYNTAX, "invalid generation number (%d)", gen);
-+	}
- 
- 	tok = pdf_lex(ctx, file, buf);
- 	if (tok != PDF_TOK_OBJ)
-diff --git a/source/pdf/pdf-xref.c b/source/pdf/pdf-xref.c
-index 1b2bdcd59..30197b4b8 100644
---- a/source/pdf/pdf-xref.c
-+++ b/source/pdf/pdf-xref.c
-@@ -1190,6 +1190,8 @@ pdf_read_new_xref(fz_context *ctx, pdf_document *doc, pdf_lexbuf *buf)
- 	{
- 		ofs = fz_tell(ctx, doc->file);
- 		trailer = pdf_parse_ind_obj(ctx, doc, doc->file, buf, &num, &gen, &stm_ofs, NULL);
-+		if (num == 0)
-+			fz_throw(ctx, FZ_ERROR_GENERIC, "Trailer object number cannot be 0\n");
- 	}
- 	fz_catch(ctx)
- 	{
--- 
-2.17.1
-
diff --git a/package/mupdf/0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch b/package/mupdf/0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch
deleted file mode 100644
index 5335f140d6..0000000000
--- a/package/mupdf/0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From f5712c9949d026e4b891b25837edd2edc166151f Mon Sep 17 00:00:00 2001
-From: Tor Andersson <tor.andersson@artifex.com>
-Date: Tue, 20 Apr 2021 14:46:48 +0200
-Subject: [PATCH] Bug 703791: Stay within hash table max key size in cached
- color converter.
-
-[Retrieved from:
-http://git.ghostscript.com/?p=mupdf.git;h=f5712c9949d026e4b891b25837edd2edc166151f]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/mupdf/fitz/hash.h |  2 ++
- source/fitz/colorspace.c  | 40 ++++++++++++++++++++++++---------------
- source/fitz/hash.c        |  7 +++----
- 3 files changed, 30 insertions(+), 19 deletions(-)
-
-diff --git a/include/mupdf/fitz/hash.h b/include/mupdf/fitz/hash.h
-index e92eb0458..feb37a5e4 100644
---- a/include/mupdf/fitz/hash.h
-+++ b/include/mupdf/fitz/hash.h
-@@ -5,6 +5,8 @@
- #include "mupdf/fitz/context.h"
- #include "mupdf/fitz/output.h"
- 
-+#define FZ_HASH_TABLE_KEY_LENGTH 48
-+
- /**
- 	Generic hash-table with fixed-length keys.
- 
-diff --git a/source/fitz/colorspace.c b/source/fitz/colorspace.c
-index af454caf1..f4db9d3d2 100644
---- a/source/fitz/colorspace.c
-+++ b/source/fitz/colorspace.c
-@@ -1025,23 +1025,30 @@ typedef struct fz_cached_color_converter
- static void fz_cached_color_convert(fz_context *ctx, fz_color_converter *cc_, const float *ss, float *ds)
- {
- 	fz_cached_color_converter *cc = cc_->opaque;
--	float *val = fz_hash_find(ctx, cc->hash, ss);
--	int n = cc->base.ds->n * sizeof(float);
--
--	if (val)
-+	if (cc->hash)
- 	{
--		memcpy(ds, val, n);
--		return;
--	}
-+		float *val = fz_hash_find(ctx, cc->hash, ss);
-+		int n = cc->base.ds->n * sizeof(float);
- 
--	cc->base.convert(ctx, &cc->base, ss, ds);
-+		if (val)
-+		{
-+			memcpy(ds, val, n);
-+			return;
-+		}
- 
--	val = Memento_label(fz_malloc_array(ctx, cc->base.ds->n, float), "cached_color_convert");
--	memcpy(val, ds, n);
--	fz_try(ctx)
--		fz_hash_insert(ctx, cc->hash, ss, val);
--	fz_catch(ctx)
--		fz_free(ctx, val);
-+		cc->base.convert(ctx, &cc->base, ss, ds);
-+
-+		val = Memento_label(fz_malloc_array(ctx, cc->base.ds->n, float), "cached_color_convert");
-+		memcpy(val, ds, n);
-+		fz_try(ctx)
-+			fz_hash_insert(ctx, cc->hash, ss, val);
-+		fz_catch(ctx)
-+			fz_free(ctx, val);
-+	}
-+	else
-+	{
-+		cc->base.convert(ctx, &cc->base, ss, ds);
-+	}
- }
- 
- void fz_init_cached_color_converter(fz_context *ctx, fz_color_converter *cc, fz_colorspace *ss, fz_colorspace *ds, fz_colorspace *is, fz_color_params params)
-@@ -1060,7 +1067,10 @@ void fz_init_cached_color_converter(fz_context *ctx, fz_color_converter *cc, fz_
- 	fz_try(ctx)
- 	{
- 		fz_find_color_converter(ctx, &cached->base, ss, ds, is, params);
--		cached->hash = fz_new_hash_table(ctx, 256, n * sizeof(float), -1, fz_free);
-+		if (n * sizeof(float) <= FZ_HASH_TABLE_KEY_LENGTH)
-+			cached->hash = fz_new_hash_table(ctx, 256, n * sizeof(float), -1, fz_free);
-+		else
-+			fz_warn(ctx, "colorspace has too many components to be cached");
- 	}
- 	fz_catch(ctx)
- 	{
-diff --git a/source/fitz/hash.c b/source/fitz/hash.c
-index 882b886c9..287d43f03 100644
---- a/source/fitz/hash.c
-+++ b/source/fitz/hash.c
-@@ -11,11 +11,9 @@
- 	and removed frequently.
- */
- 
--enum { MAX_KEY_LEN = 48 };
--
- typedef struct
- {
--	unsigned char key[MAX_KEY_LEN];
-+	unsigned char key[FZ_HASH_TABLE_KEY_LENGTH];
- 	void *val;
- } fz_hash_entry;
- 
-@@ -50,7 +48,8 @@ fz_new_hash_table(fz_context *ctx, int initialsize, int keylen, int lock, fz_has
- {
- 	fz_hash_table *table;
- 
--	assert(keylen <= MAX_KEY_LEN);
-+	if (keylen > FZ_HASH_TABLE_KEY_LENGTH)
-+		fz_throw(ctx, FZ_ERROR_GENERIC, "hash table key length too large");
- 
- 	table = fz_malloc_struct(ctx, fz_hash_table);
- 	table->keylen = keylen;
--- 
-2.17.1
-
diff --git a/package/mupdf/0004-Makefile-compile-hexdump.exe-with-HOSTCC.patch b/package/mupdf/0004-Makefile-compile-hexdump.exe-with-HOSTCC.patch
deleted file mode 100644
index bc9debd332..0000000000
--- a/package/mupdf/0004-Makefile-compile-hexdump.exe-with-HOSTCC.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From c0036573a995dc78d3cf60a30ff0af2b47f3680a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 14 Nov 2021 23:24:27 +0100
-Subject: [PATCH] Makefile: compile hexdump.exe with HOSTCC
-
-hexdump.exe must be compiled for the host or the build will fail when
-cross-compiling with HAVE_OBJCOPY=no
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://bugs.ghostscript.com/show_bug.cgi?id=704442]
----
- Makefile | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 6492b1ca3..0732b358f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -60,6 +60,8 @@ AR_CMD = $(QUIET_AR) $(MKTGTDIR) ; $(AR) cr $@ $^
- ifdef RANLIB
-   RANLIB_CMD = $(QUIET_RANLIB) $(RANLIB) $@
- endif
-+HOSTCC ?= $(CC)
-+HOST_LINK_CMD = $(QUIET_LINK) $(MKTGTDIR) ; $(HOSTCC) -o $@ $^
- LINK_CMD = $(QUIET_LINK) $(MKTGTDIR) ; $(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
- TAGS_CMD = $(QUIET_TAGS) ctags -R --c-kinds=+p --exclude=platform/python --exclude=platform/c++
- WINDRES_CMD = $(QUIET_WINDRES) $(MKTGTDIR) ; $(WINDRES) $< $@
-@@ -81,6 +83,9 @@ $(OUT)/%.a :
- 	$(AR_CMD)
- 	$(RANLIB_CMD)
- 
-+$(OUT)/scripts/hexdump.exe: scripts/hexdump.c
-+	$(HOST_LINK_CMD)
-+
- $(OUT)/%.exe: %.c
- 	$(LINK_CMD)
- 
--- 
-2.33.0
-
diff --git a/package/mupdf/mupdf.hash b/package/mupdf/mupdf.hash
index 67093cbc9f..fa24e741c7 100644
--- a/package/mupdf/mupdf.hash
+++ b/package/mupdf/mupdf.hash
@@ -1,8 +1,8 @@
 # From https://mupdf.com/downloads/index.html:
-sha1  fc17bd01d5860e49b009f28a5ddb629e94af4510  mupdf-1.18.0-source.tar.xz
+sha1  f27108668e876b47d7438e2a8b2295654e66f42d  mupdf-1.20.3-source.tar.lz
 
 # Locally computed:
-sha256  592d4f6c0fba41bb954eb1a41616661b62b134d5b383e33bd45a081af5d4a59a  mupdf-1.18.0-source.tar.xz
+sha256  6f73f63ef8aa81991dfd023d4426a548827d1d74e0bfcf2a013acad63b651868  mupdf-1.20.3-source.tar.lz
 
 # Hash for license files:
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 56ea7cc507..1fc54b2d35 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # python-pymupdf's version must match mupdf's version
-MUPDF_VERSION = 1.18.0
-MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.xz
+MUPDF_VERSION = 1.20.3
+MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.lz
 MUPDF_SITE = https://mupdf.com/downloads/archive
 MUPDF_LICENSE = AGPL-3.0+
 MUPDF_LICENSE_FILES = COPYING
@@ -68,7 +68,7 @@ endef
 
 define MUPDF_INSTALL_STAGING_CMDS
 	$(MUPDF_MAKE_ENV) $(MAKE) -C $(@D) $(MUPDF_MAKE_OPTS) \
-		DESTDIR="$(STAGING_DIR)" install_libs
+		DESTDIR="$(STAGING_DIR)" install-libs
 endef
 
 define MUPDF_INSTALL_TARGET_CMDS

--===============1846007815415620524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1846007815415620524==--
