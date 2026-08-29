Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1C7C61DD6
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E503980DF9;
	Sat, 29 Aug 2026 21:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zpl9uj-Sdqa; Sat, 29 Aug 2026 21:11:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788037880;
	bh=iBFahPJwcE0cc2Med18W4Cr9wlSdbRdX6Dv+IcIrY0s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=skcaHYUtGwWpDzwMQATH5geyKUPdOvMx7AAifZFo+/dWUJH0kt3NrI1pBpR+yLvX4
	 gAscOyzV1yRmA7XUWKKv/rdeJqFQmU8hnHy4JyHRnythcwxEkTIxRpnBLYUCg2qkmr
	 ICYkXvWUFjJ1jsbMfgU1k91rm0hywS4uz0QNvoCcNQlkO8kYWtjGNMz2w3YerpRuJ7
	 pD4pmAFHtoBvsx9EmvHMnY9vWA2xYidyXryLGzr/7rYfy7uZ0/Q1YHazKebFc2FOqQ
	 63Jj33S5HQEHZKmpRO5t4ulskFdFQHVVAKs3AIFOAztXn5U6x0MtWDCw5zXfcEy2QV
	 xFjCxSd/wrELA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0743880E07;
	Sat, 29 Aug 2026 21:11:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E2C79D4
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FE3240059
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1MBqntrwKMe for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7304F40057
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:11:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A69BF8E474; Sat, 29 Aug 2026 21:10:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 23:09:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6b06b8d9cb899a226eba62f6ec902115efbf27a
X-Git-Newrev: 5ea2135a56d6038329ede3f744fbe5a363bc3557
X-Patchwork-Hint: ignore
Message-Id: <20260829211019.A69BF8E474@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang: fix link failure on
 odbcserver
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============6550625233438177437=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6550625233438177437==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ea2135a56d6038329ede3f744fbe5a363bc3557
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

host-erlang build can fail with the following error:

  make[5]: Nothing to be done for 'opt'.
   MAKE	opt
   CC	../priv/bin/x86_64-pc-linux-gnu/odbcserver
  /usr/bin/ld: ../priv/obj/x86_64-pc-linux-gnu/odbcserver.o: in function `encode_column_dyn':
  odbcserver.c:(.text+0x6b4): undefined reference to `ei_x_encode_tuple_header'
  /usr/bin/ld: odbcserver.c:(.text+0x6c2): undefined reference to `ei_x_encode_tuple_header'
  /usr/bin/ld: odbcserver.c:(.text+0x6d4): undefined reference to `ei_x_encode_ulong'
  /usr/bin/ld: odbcserver.c:(.text+0x6e7): undefined reference to `ei_x_encode_ulong'
  /usr/bin/ld: odbcserver.c:(.text+0x6fa): undefined reference to `ei_x_encode_ulong'
  /usr/bin/ld: odbcserver.c:(.text+0x708): undefined reference to `ei_x_encode_tuple_header'
  /usr/bin/ld: odbcserver.c:(.text+0x71b): undefined reference to `ei_x_encode_ulong'
  /usr/bin/ld: odbcserver.c:(.text+0x72e): undefined reference to `ei_x_encode_ulong'
  [...]

This can be reproduced with the following minimal defconfig (and
libei.so present on host, see details below):

  BR2_x86_64=y
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_PACKAGE_ERLANG=y

Those missing symbols are part of the erl_interface, exposed by libei.a.
host-erlang builds correctly libei.a _before_ odbcserver.c (it can be
found in lib/erl_interface/obj/x86_64-pc-linux-gnu/libei.a), but the
failure is actually due to the build command generated and used for
odbcserver.c, especially the link arguments:

  /usr/bin/gcc \
  [...]
  -o ../priv/bin/x86_64-pc-linux-gnu/odbcserver \
  ../priv/obj/x86_64-pc-linux-gnu/odbcserver.o \
  -L/usr/lib64 \
  -lodbc \
  -L/home/alexis/src/buildroot/erlang-master/build/host-erlang-custom/lib/erl_interface/obj/x86_64-pc-linux-gnu \
  -lpthread -lei

/usr/lib64 is searched before the path where libei.a has been built, so
if whether a valid libei.a or libei.so is found there, it shadows the
expected libei.a. In the build from which the logs above come, the
notable point is that the host system indeed have a valid libei.so, but
is completely unrelated to erl_interface; it rather exposes the Emulated
Input protocol aimed at Wayland stack; and so it obviously contains none
of the expected ei_* symbols.

Upstream has already identified and fixed the issue, the fix is already
released in versions >= 27.x.y. Erlang 26 (the version currently
packaged in buildroot), isn't supported anymore (only the three latest
releases are supported, see
https://github.com/erlang/otp/blob/master/SECURITY.md), so there won't
be any new minor update that will release this fix.

Pick and backport the fixing patch so that the current version packaged
in buildroot can still build.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...bs-order-to-avoid-picking-up-system-libei.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/erlang/0001-Change-libs-order-to-avoid-picking-up-system-libei.patch b/package/erlang/0001-Change-libs-order-to-avoid-picking-up-system-libei.patch
new file mode 100644
index 0000000000..c21311cbb3
--- /dev/null
+++ b/package/erlang/0001-Change-libs-order-to-avoid-picking-up-system-libei.patch
@@ -0,0 +1,32 @@
+From de58cbe979942308eb8823a526cd68b06d5dc662 Mon Sep 17 00:00:00 2001
+From: Sacha <sachahony@gmail.com>
+Date: Wed, 13 Mar 2024 13:28:41 +0100
+Subject: [PATCH] Change libs order to avoid picking up system libei
+
+Upstream: https://github.com/erlang/otp/commit/de58cbe
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+---
+ lib/odbc/c_src/Makefile.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/odbc/c_src/Makefile.in b/lib/odbc/c_src/Makefile.in
+index d1b26743a6a4..03ed314f6a26 100644
+--- a/lib/odbc/c_src/Makefile.in
++++ b/lib/odbc/c_src/Makefile.in
+@@ -80,10 +80,10 @@ ODBC_INCLUDE = @ODBC_INCLUDE@
+ # ----------------------------------------------------
+ CC =  @CC@
+ CFLAGS = $(TYPEFLAGS) @CFLAGS@ @THR_DEFS@ @DEFS@
+-EI_LDFLAGS = -L$(EI_ROOT)/obj$(TYPEMARKER)/$(TARGET)
++EI_LDFLAGS = -L$(EI_ROOT)/obj$(TYPEMARKER)/$(TARGET) $(EI_LIB)
+ LD = @LD@
+-LDFLAGS =  $(ODBC_LIB) $(EI_LDFLAGS)
+-LIBS = @LIBS@ @THR_LIBS@ $(EI_LIB)
++LDFLAGS =  $(EI_LDFLAGS) $(ODBC_LIB)
++LIBS = @LIBS@ @THR_LIBS@
+ INCLUDES = -I. $(ODBC_INCLUDE) $(EI_INCLUDE)
+ TARGET_FLAGS =  @TARGET_FLAGS@
+ 
+-- 
+2.55.0
+

--===============6550625233438177437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6550625233438177437==--
