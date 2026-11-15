Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFF1606A323
	for <buildroot@archiver.kernel.org>; Sun, 15 Nov 2026 08:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mFeggeai
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82FE480F95;
	Sun, 15 Nov 2026 08:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWoIKJ8bC1n2; Sun, 15 Nov 2026 08:41:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1B96A810AF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794732070;
	b=RbDBUr9ctoGneDggFPc96o4jmwxWnWmkp1HbhpNB4G42C0Qy3zsAJdfq27I0UZiL+sT6
	 3549nslzoEXO+RR2QbBkB/oAE0C+nTyHAnC9vwaoKO7uFd/r17eZHDweU//mXWrAcLyiN
	 lCogD9YekwhPNTe4LebOnAY2t7jSGLTrXyibxX9gNXAIUtlRyUxSKOmmGuOf5Bra12+0z
	 AUJLqpy/SW/jc4KRoqFFnyOKgt7AWRblV5zHlgyqAM3QTaZp83aXdUs9zQplEnyTOYHRv
	 HxACbHjns5VZr3karfC7p3omwJU9pai0UOjx3Rqg/+RRmB34CL8XAMC+J0nWmn7eOzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794732070;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=V97uOJRy4YRsGBq7uf4w0RGpQV83snVKqM8WLaydBkg=;
	b=PmseHGArNZ5KagRVGNkHGhenUEFrohNtwotuVzKfhXvBWu/Bk3w0MnJ8HYw/Objz1S9m
	 aBOydF7hsFWqmqzDTcUMqUNmXPpPfLfapx1CT4rhz5/TEhoOS7/Njv+7jRWnytFzsh+L2
	 gLEL6OiPfECeBxey6g7YZjEKM73BtLW6sFqVPsLqVlncQNJe8+YLFAmTtxVsj9bLXmqLa
	 hzQJWZYS/Q0NKc3KdI0a0i34uqa6DP4Xwj1F2QM2WzPKlfsLUPl5HULv1Ek7FpMZi5YbV
	 Yrhc2QtK7yEhbgEgMUakXCPiDGEch5iEhKm1WFgDAcDWqXXVIjIZeXEPr4hsgCQGZpw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794732070;
	bh=V97uOJRy4YRsGBq7uf4w0RGpQV83snVKqM8WLaydBkg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mFeggeaiDV316F37A0qbjXd2Pis0cVGWdB06vGlc/02zm5YIRKRmSdoBFrwYYT63k
	 9t1BYxnaYwmL1ENUhVEYvNOG7+le8YjZI7SOPuXI8OcY0uoE5YfBK2yhLiyPFunAWk
	 +/Szc2+bwn/cLvHs0GyaSapOBukPMXE1i1er74qrnjG83siKVHOdLRlkv5R7jTqxtk
	 onlJadJYL3tAO9xjIgbXjhDJ3eQkIxq2Q5JU5pWIIxR9NI6fLCNfBt51j6SaUk8sNu
	 XvDF+AUak1/RFiy3fEW6D+hpy9Z2V7O5uZnYMtgehyQ6eFx1n6fUXDJnvTE92eyPrt
	 okdB93gfRStjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B96A810AF;
	Sun, 15 Nov 2026 08:41:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE7F8D7
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 08:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB1A24008C
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 08:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQE-HBkQTCOq for <buildroot@buildroot.org>;
 Sun, 15 Nov 2026 08:41:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0D9CA40079
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D9CA40079
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 08:41:06 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6b577addee9so4077252a12.1
 for <buildroot@buildroot.org>; Sun, 15 Nov 2026 00:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794732065; x=1795336865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pRXf2tiNiFhPM8A6jkG3Awighbx5KQMv1aoJ4UI5Ufw=;
 b=uFhUcV9cLO+8y3wC9Mdk07ruhniItX4bW2KzPURh6g70SF8oargdovkcfqMaOUfG3B
 3/b1JRxsDpieE0CARKQzqicNy1k2y4DvEhJE9EqLfvyWszFKrEcYTfcGSa+RtJ9NHqt0
 2VSOnTtTioi+dvSFuHbRa0ORzPaLD9ZQ1APV/b8koduhuykM+Ii/rus2k7qpcd0YB262
 7O2r0u9wQoyDikxnPhUNXXh6HaNIs6bDJzrfxWAMFB84lYnMQXf5lRFUcfcMlODxIgnx
 9fMoLI3IZbZCXum1XYLyRVAHDzO6aetuFp+QUOIzzcrcDbranwdGTSxm9HA1gQLDpPfs
 VHrw==
X-Gm-Message-State: APuU4Z94XMRdoxFteNl1UaZEx9bsDU+NixKrLJ4MRuzq6CNZnqNhTQQv
 /ONd12LkO4De50q+Ru/X0wXY1XG64iXI/ifdAn67G9SrW2mVJWOWtViTi7opxA==
X-Gm-Gg: AYBFou1hEYb5gDXAwzJRTEb+jP+PeOninPhesr04vZ2vj/pfrW54Apd3aaHcMWtlvCS
 h6dpdqJH4EuSfdP+pLmH9lQuFSW3V4sHBsu3/qOPWjrHufjPZURBg9HUTxPxZQy+TZqIReUMpeL
 11N2pwuEaMdSRQGt1va8Vf+zw6sgQJALVvlahG1avJPOWlrSJ9aNo0nHzm4g+Q5R8EA2JKdb4iq
 ZhHKiAIhTxA7xFsqT1BHcgu3STg4IaeiSXVm5HlZUSZ672Z1n1529xK4qah2hHveoARzGgusz1b
 xvGer34LC4Alx3mOPkxIw+Vy8Kk/6EhoRwEKGwDNq72MOyqAKmTlKNu+WLoLqwAxKcYauIabn6C
 Mz+BgjQyN6Y4+lnBfmdlCx366iJeExI8RhNy8V+56STwB1H6ZN4sumEnBe9UajPzy+ZMCUWBqLd
 sstUh1+AqFVI30I6WtRsKrsBXpNQsta2JBj4bJgE/O9qjKBNn9qPBWIZoa3vKP+MwHaMo5yiu8g
 BLCig5H6X1JOM+CGgpDGppDuFkfnoDfmetq0Pb8m30PXmrs6mhgj7cbqUsFDCaoxxX9A5zH4ipy
 GXvOZTIksPgZ/PW5iy/hYglwbiYHXgp/o69g7KamAG1lFm3esWzMZ91K1TTDzxy1zN7xmxdVajs
 F2lfQuMBt8A==
X-Received: by 2002:a05:6402:13d6:b0:6b4:9919:b54 with SMTP id
 4fb4d7f45d1cf-6b7c0d21666mr5930484a12.42.1794732064516; 
 Sun, 15 Nov 2026 00:41:04 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b7c2361280sm3193246a12.10.2026.11.15.00.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2026 00:41:03 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 15 Nov 2026 09:41:03 +0100
Message-Id: <20261115084103.1439197-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/prboom: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

prboom is dead upstream: its last release, 2.5.0, dates from November
2008, and it only keeps building in Buildroot thanks to a growing set
of local fixes (libpng, autoconf 2.72, GCC 14/15, C23). Its users have
long moved to maintained forks.

Remove the package and add a legacy option for it.

http://prboom.sourceforge.net/

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .checkpackageignore                           |   2 -
 Config.in.legacy                              |   7 +
 package/Config.in                             |   1 -
 package/prboom/0001-libpng-1.4.patch          |  32 ----
 ...move-predefined-O2-optimization-flag.patch |  21 ---
 ...v-instead-of-const-char-const-myargv.patch | 140 ------------------
 package/prboom/Config.in                      |  12 --
 package/prboom/prboom.hash                    |   3 -
 package/prboom/prboom.mk                      |  61 --------
 9 files changed, 7 insertions(+), 272 deletions(-)
 delete mode 100644 package/prboom/0001-libpng-1.4.patch
 delete mode 100644 package/prboom/0002-configure-remove-predefined-O2-optimization-flag.patch
 delete mode 100644 package/prboom/0003-gcc-warnings-const-myargv-instead-of-const-char-const-myargv.patch
 delete mode 100644 package/prboom/Config.in
 delete mode 100644 package/prboom/prboom.hash
 delete mode 100644 package/prboom/prboom.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 25c668db54..5cd8e20bce 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -717,8 +717,6 @@ package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch lib_patch.Upstream
 package/postgresql/S50postgresql lib_sysv.Variables
 package/pptp-linux/0001-susv3-legacy.patch lib_patch.Upstream
 package/pptp-linux/0002-fix-parallel-build.patch lib_patch.Upstream
-package/prboom/0001-libpng-1.4.patch lib_patch.Upstream
-package/prboom/0002-configure-remove-predefined-O2-optimization-flag.patch lib_patch.Upstream
 package/procps-ng/S02sysctl lib_sysv.Variables
 package/proftpd/S50proftpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/prosody/0001-enable-syslog.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 0ee4d04751..8efc476888 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_PRBOOM
+	bool "prboom has been removed"
+	select BR2_LEGACY
+	help
+	  prboom is no longer maintained upstream (last release in
+	  2008) and has been removed.
+
 config BR2_KERNEL_HEADERS_7_2
 	bool "kernel headers version 7.2.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index a24c73c2ca..49659b007e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -294,7 +294,6 @@ menu "Games"
 	source "package/minetest-game/Config.in"
 	source "package/opentyrian/Config.in"
 	source "package/opentyrian-data/Config.in"
-	source "package/prboom/Config.in"
 	source "package/sl/Config.in"
 	source "package/solarus/Config.in"
 	source "package/stella/Config.in"
diff --git a/package/prboom/0001-libpng-1.4.patch b/package/prboom/0001-libpng-1.4.patch
deleted file mode 100644
index 0d2a3a5ba8..0000000000
--- a/package/prboom/0001-libpng-1.4.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-[PATCH] fix build with libpng 1.4.x
-
-In 1.4.x the png_*_NULL defines are gone. Replace them with a normal
-NULL instead.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/SDL/i_sshot.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: prboom-2.5.0/src/SDL/i_sshot.c
-===================================================================
---- prboom-2.5.0.orig/src/SDL/i_sshot.c
-+++ prboom-2.5.0/src/SDL/i_sshot.c
-@@ -231,7 +231,7 @@ int I_ScreenShot (const char *fname)
-   if (fp)
-   {
-     png_struct *png_ptr = png_create_write_struct(
--        PNG_LIBPNG_VER_STRING, png_error_ptr_NULL, error_fn, warning_fn);
-+        PNG_LIBPNG_VER_STRING, NULL, error_fn, warning_fn);
- 
-     if (png_ptr)
-     {
-@@ -279,7 +279,7 @@ int I_ScreenShot (const char *fname)
-             break;
-         }
-       }
--      png_destroy_write_struct(&png_ptr,  png_infopp_NULL);
-+      png_destroy_write_struct(&png_ptr, NULL);
-     }
-     fclose(fp);
-   }
diff --git a/package/prboom/0002-configure-remove-predefined-O2-optimization-flag.patch b/package/prboom/0002-configure-remove-predefined-O2-optimization-flag.patch
deleted file mode 100644
index 9260cb6314..0000000000
--- a/package/prboom/0002-configure-remove-predefined-O2-optimization-flag.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-configure: remove predefined -O2 optimization flag
-
-CFLAGS_OPT variable forces to use -O2 optimization flag denying the
-possibility to use different optimization flag values.
-
-Remove -O2 flag from CFLAGS_OPT.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
-diff -urpN prboom-2.5.0.orig/configure.ac prboom-2.5.0/configure.ac
---- prboom-2.5.0.orig/configure.ac	2019-06-20 14:07:45.058481879 +0200
-+++ prboom-2.5.0/configure.ac	2019-06-20 14:09:05.066238825 +0200
-@@ -48,7 +48,7 @@ else
- fi
- 
- dnl --- cph: work out flags to pass to compiler
--CFLAGS_OPT="-O2 -fomit-frame-pointer"
-+CFLAGS_OPT="-fomit-frame-pointer"
- AC_C_COMPILE_FLAGS(-Wall)
- dnl --- Option to enable debugging
- AC_ARG_ENABLE(debug,AC_HELP_STRING([--enable-debug],[turns on various debugging features, like range checking and internal heap diagnostics]),,enable_debug="no")
diff --git a/package/prboom/0003-gcc-warnings-const-myargv-instead-of-const-char-const-myargv.patch b/package/prboom/0003-gcc-warnings-const-myargv-instead-of-const-char-const-myargv.patch
deleted file mode 100644
index b102175d59..0000000000
--- a/package/prboom/0003-gcc-warnings-const-myargv-instead-of-const-char-const-myargv.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From 92d44b6383a3e053feac2c820b8114873fcd798e Mon Sep 17 00:00:00 2001
-From: entryway <entryway@localhost>
-Date: Fri, 10 Jun 2011 19:59:18 +0000
-Subject: [PATCH] gcc warnings: 'const **myargv' instead of 'const char * const
- * myargv'
-
-Upstream: https://github.com/coelckers/prboom-plus/commit/92d44b6383a3e053feac2c820b8114873fcd798e
-[thomas: backport to 2.5.0]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/SDL/i_main.c |  3 ++-
- src/d_main.c     | 20 ++++++++++++--------
- src/m_argv.c     |  3 +--
- src/m_argv.h     |  2 +-
- 4 files changed, 16 insertions(+), 12 deletions(-)
-
-diff --git a/src/SDL/i_main.c b/src/SDL/i_main.c
-index 05cd655..1c19ef0 100644
---- a/src/SDL/i_main.c
-+++ b/src/SDL/i_main.c
-@@ -356,7 +356,8 @@ int main(int argc, char **argv)
- #endif
- 
-   myargc = argc;
--  myargv = argv;
-+  myargv = malloc(sizeof(myargv[0]) * myargc);
-+  memcpy(myargv, argv, sizeof(myargv[0]) * myargc);
- 
- #ifdef _WIN32
-   if (!M_CheckParm("-nodraw")) {
-diff --git a/src/d_main.c b/src/d_main.c
-index 6d8493e..320e07a 100644
---- a/src/d_main.c
-+++ b/src/d_main.c
-@@ -870,7 +870,7 @@ static void FindResponseFile (void)
- 	int indexinfile;
-         byte *file = NULL;
-         const char **moreargs = malloc(myargc * sizeof(const char*));
--        const char **newargv;
-+        char **newargv;
-         // proff 04/05/2000: Added for searching responsefile
-         char fname[PATH_MAX+1];
- 
-@@ -904,14 +904,15 @@ static void FindResponseFile (void)
- 	  int k;
-           lprintf(LO_ERROR,"\nResponse file empty!\n");
- 
--	  newargv = calloc(sizeof(char *),MAXARGVS);
-+	  newargv = calloc(sizeof(newargv[0]),myargc);
- 	  newargv[0] = myargv[0];
-           for (k = 1,index = 1;k < myargc;k++)
-           {
-             if (i!=k)
-               newargv[index++] = myargv[k];
-           }
--          myargc = index; myargv = newargv;
-+          myargc = index;
-+          myargv = newargv;
-           return;
-         }
- 
-@@ -919,8 +920,8 @@ static void FindResponseFile (void)
- 	memcpy((void *)moreargs,&myargv[i+1],(index = myargc - i - 1) * sizeof(myargv[0]));
- 
- 	{
--	  const char *firstargv = myargv[0];
--	  newargv = calloc(sizeof(char *),MAXARGVS);
-+	  char *firstargv = myargv[0];
-+	  newargv = calloc(sizeof(newargv[0]), 1);
- 	  newargv[0] = firstargv;
- 	}
- 
-@@ -949,16 +950,19 @@ static void FindResponseFile (void)
- 
- 	      // Terminate string, realloc and add to argv
- 	      *p = 0;
-+	      newargv = realloc(newargv, sizeof(newargv[0]) * (indexinfile + 1));
- 	      newargv[indexinfile++] = realloc(s,strlen(s)+1);
- 	    }
- 	  } while(size > 0);
- 	}
- 	free(file);
- 
-+	newargv = realloc(newargv, sizeof(newargv[0]) * (indexinfile + index));
- 	memcpy((void *)&newargv[indexinfile],moreargs,index*sizeof(moreargs[0]));
- 	free((void *)moreargs);
- 
--        myargc = indexinfile+index; myargv = newargv;
-+        myargc = indexinfile+index;
-+        myargv = newargv;
- 
-         // DISPLAY ARGS
-         //jff 9/3/98 use logical output routine
-@@ -999,7 +1003,7 @@ static void DoLooseFiles(void)
-   int lmpcount = 0;
-   int dehcount = 0;
-   int i,j,p;
--  const char **tmyargv;  // use these to recreate the argv array
-+  char **tmyargv;  // use these to recreate the argv array
-   int tmyargc;
-   boolean skip[MAXARGVS]; // CPhipps - should these be skipped at the end
- 
-@@ -1060,7 +1064,7 @@ static void DoLooseFiles(void)
- 
-   // Now go back and redo the whole myargv array with our stuff in it.
-   // First, create a new myargv array to copy into
--  tmyargv = calloc(sizeof(char *),MAXARGVS);
-+  tmyargv = calloc(sizeof(tmyargv[0]),MAXARGVS);
-   tmyargv[0] = myargv[0]; // invocation
-   tmyargc = 1;
- 
-diff --git a/src/m_argv.c b/src/m_argv.c
-index 9392840..4fa1ed8 100644
---- a/src/m_argv.c
-+++ b/src/m_argv.c
-@@ -37,8 +37,7 @@
- #include "m_argv.h"
- 
- int    myargc;
--const char * const * myargv; // CPhipps - not sure if ANSI C allows you to
--// modify contents of argv, but I can't imagine it does.
-+char **myargv;
- 
- //
- // M_CheckParm
-diff --git a/src/m_argv.h b/src/m_argv.h
-index 5340c15..b1d5907 100644
---- a/src/m_argv.h
-+++ b/src/m_argv.h
-@@ -39,7 +39,7 @@
-  * MISC
-  */
- extern int  myargc;
--extern const char * const * myargv; /* CPhipps - const * const * */
-+extern char **myargv;
- 
- /* Returns the position of the given parameter in the arg list (0 if not found). */
- int M_CheckParm(const char *check);
--- 
-2.50.1
diff --git a/package/prboom/Config.in b/package/prboom/Config.in
deleted file mode 100644
index 7dc635d75c..0000000000
--- a/package/prboom/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_PRBOOM
-	bool "prboom"
-	select BR2_PACKAGE_SDL
-	select BR2_PACKAGE_SDL_MIXER
-	select BR2_PACKAGE_SDL_NET
-	help
-	  PrBoom is a Doom client which allows you to play the good
-	  old game on newer hardware. It even supports higher
-	  resolution and better rendering, while still keeping the old
-	  style alive.
-
-	  http://prboom.sourceforge.net/
diff --git a/package/prboom/prboom.hash b/package/prboom/prboom.hash
deleted file mode 100644
index 2cc0f5136f..0000000000
--- a/package/prboom/prboom.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  226c1c470f8cc983327536404f405a1d026cf0a5188c694a1243cc8630014bae  prboom-2.5.0.tar.gz
-sha256  1cba07ce0f6d1366d84b7cc62b76966ba79075e5f379c1e230c3ff0635fa789f  COPYING
diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
deleted file mode 100644
index 28a55badf6..0000000000
--- a/package/prboom/prboom.mk
+++ /dev/null
@@ -1,61 +0,0 @@
-################################################################################
-#
-# prboom
-#
-################################################################################
-
-PRBOOM_VERSION = 2.5.0
-PRBOOM_SITE = http://downloads.sourceforge.net/project/prboom/prboom%20stable/$(PRBOOM_VERSION)
-PRBOOM_CONF_ENV = ac_cv_type_gid_t=yes ac_cv_type_uid_t=yes
-PRBOOM_DEPENDENCIES = sdl sdl_net sdl_mixer
-PRBOOM_LICENSE = GPL-2.0+
-PRBOOM_LICENSE_FILES = COPYING
-PRBOOM_AUTORECONF = YES
-
-PRBOOM_CFLAGS = $(TARGET_CFLAGS)
-
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-PRBOOM_CFLAGS += -O0
-endif
-
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_14),y)
-PRBOOM_CFLAGS += -std=gnu18
-endif
-
-PRBOOM_CONF_ENV += CFLAGS="$(PRBOOM_CFLAGS)"
-
-ifeq ($(BR2_PACKAGE_LIBPNG),y)
-PRBOOM_DEPENDENCIES += libpng
-endif
-
-ifeq ($(BR2_STATIC_LIBS),y)
-# SDL_mixer uses symbols from SDL, but ends up after it on the link
-# cmdline. Fix it by forcing the SDL libs at the very end
-PRBOOM_CONF_ENV += LIBS="`$(STAGING_DIR)/usr/bin/sdl-config --static-libs`"
-endif
-
-PRBOOM_CONF_OPTS = \
-	--oldincludedir=$(STAGING_DIR)/usr/include \
-	--with-sdl-prefix=$(STAGING_DIR)/usr \
-	--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
-	--disable-cpu-opt \
-	--disable-sdltest \
-	--disable-gl
-
-# endianness detection isn't used when cross compiling
-define PRBOOM_BIG_ENDIAN_FIXUP
-	$(SED) 's,.*#.*undef WORDS_BIGENDIAN.*,#define WORDS_BIGENDIAN 1,g' \
-		$(PRBOOM_DIR)/config.h
-endef
-
-ifeq ($(BR2_ENDIAN),"BIG")
-PRBOOM_POST_CONFIGURE_HOOKS += PRBOOM_BIG_ENDIAN_FIXUP
-endif
-
-define PRBOOM_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/src/prboom $(TARGET_DIR)/usr/games/prboom
-	$(INSTALL) -D $(@D)/src/prboom-game-server $(TARGET_DIR)/usr/games/prboom-game-server
-	$(INSTALL) -D $(@D)/data/prboom.wad $(TARGET_DIR)/usr/share/games/doom/prboom.wad
-endef
-
-$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
