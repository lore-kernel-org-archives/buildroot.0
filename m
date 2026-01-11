Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5410BD2502F
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 13:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FCDF80758;
	Sun, 11 Jan 2026 13:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXLumRqeN-hG; Sun, 11 Jan 2026 13:25:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25EA68071B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768137957;
	bh=mMj3xMnqrjSFPyBoH5Zv+jvw7AOik+BSNnMulOPAUkE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=QN5y8BxCxneAapofMDRE7ESHL/i9zUKi8wfvtk4lXN+yFidsyUuf15WSrqIKFwkol
	 wOetb/XrmfNwvdMkMBe9n4Cs1PZP4l/fsl8sfFHVGNqk6ERcHxycYM0btRld2wUTsp
	 sFb+5c+hilzh8exhsd/woOZUjaIGDOj0VcCOCVA/RK/8U5jmnJvFxPTnYg2OqG+aiO
	 1AqUD2+2Pqm3PEU77V1xOgzKNZKwsmzoahaNi37RxXNYziwCPJQCNLgx2JHKxls8Tt
	 31IJfH9wYq2wh0ebBTtcuR/DT2sd7/Ux9J0hDA72cRWZOHqh8tLSQBznowvALIX4Dd
	 BEP2coW0z+RPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25EA68071B;
	Sun, 11 Jan 2026 13:25:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED8BD18D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 13:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0D5D40462
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 13:25:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDHq36A-lsb8 for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 13:25:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=95.163.59.36;
 helo=send197.i.mail.ru; envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 28405401FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28405401FC
Received: from send197.i.mail.ru (send197.i.mail.ru [95.163.59.36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28405401FC
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 13:25:53 +0000 (UTC)
Received: by exim-smtp-7b4fb89df9-5xc4b with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1vevRL-000000002yT-0gDO; Sun, 11 Jan 2026 16:25:07 +0300
To: buildroot@buildroot.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Date: Sun, 11 Jan 2026 16:25:05 +0300
Message-ID: <20260111132505.135161-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD979975AF0D777FEBD705C26DA7DFA1BE5FABF32B159CC9D93182A05F53808504074A834FCD354C6F93DE06ABAFEAF670558C4DC7A9D5E31A80E69DFBCC8459429D4BD60608253162F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76C42F509AB58C142EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB55337566E85E34C3A1969254C3DA658411CF769CFB71049D930E8E4965188631ED2E5FE98EEF46B7454FC60B9742502CCDD46D0DEDCF5861DED71B2F389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C03F781F11CD20E21D8941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B63033054805BDE987CC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB86D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE75A9E79F66F1C28F3731C566533BA786AA5CC5B56E945C8DA
X-87b9d050: 1
X-C1DE0DAB: 0D63561A33F958A5175AFDFB942D400A5002B1117B3ED6966F16F680B1FD029BE20DC3F561CE4150823CB91A9FED034534781492E4B8EEAD9F68E8F4EDE74A9DC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D659262165E85FF4C9B25149798909F54D18C340A8BD7BFC43FAF8AD0261303F4BAB63D7538FBA6B313CB8341EE9D5BE9A0AD8D9CB6526109749F610CC95B175B0A410939066EC910AFE8CD93680B12512CF4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVYrk7BQKFwEtihwQHaVGDuhz6GHd+hUVVQ==
X-Mailru-Sender: 689FA8AB762F7393DDD5FD59B456EAD22F4E7CA9AF9A032F9ACC188ADDDEF20716A5A791493F30EF90DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; 
 s=mail4; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:
 To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=LqGZ7QwoXp1MIiXkEMabcUxQexrw5ps6g2Yqbo64rHo=; t=1768137954; x=1768227954; 
 b=iFYbaFAbUJNqiENZvyU4YGipphNpuIGTNWrB5dAbgzQk4vqxAwD7L6MfHnyUgsg01HXqyvg7ooU
 XVpm4hS0yJKlRQq8zaxINyzLKiMHnt/kxDbsB2kQ/ySdVIA7miskWF7cOT4zkyV/8PIO+UtJFZeDo
 kSRjG6Aem16gV0PVuGAx/PPe1BYBQ3nyDsJR0WjaZQ/d6OqmK8sxEgFNEmyAlpZQ8Kus/ApzBi3t9
 q01I3tpolB9vrhHk1oeClUNSY7s1I3+cPpuuq028ofd/R0Lr0PT6SvWhQGtr8JQZV4WPsRArWtfZ2
 UjGWZW2g/9zILeMQDc52N+EUsqOOfnwYePOg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=inbox.ru
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=iFYbaFAb
X-Mailman-Original-Authentication-Results: exim-smtp-7b4fb89df9-5xc4b;
 auth=pass
 smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
Subject: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.14.1
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/libgeos/geos/releases/tag/3.14.1

Drop merged upstream patch.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 ...e-floating-point-exceptions-optional.patch | 71 -------------------
 package/libgeos/libgeos.hash                  |  2 +-
 package/libgeos/libgeos.mk                    |  2 +-
 3 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch

diff --git a/package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch b/package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch
deleted file mode 100644
index 6adcd39861..0000000000
--- a/package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From a6bac7bd506988085fa692ff2e12727ae0e9db84 Mon Sep 17 00:00:00 2001
-From: Maxim Kochetkov <fido_max@inbox.ru>
-Date: Mon, 15 Sep 2025 17:16:08 +0300
-Subject: [PATCH] geosop: make floating-point exceptions optional
-
-commit 26292ce ("geosop: show most floating-point exceptions in verbose mode")
-add fenv.h dependency. Some libc implementations (uclibc-ng )may have no fenv
-support. So make floating-point exceptions optional and detetct fenv.h at
-configure stage.
-
-Upstream: https://github.com/libgeos/geos/pull/1305
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
----
- CMakeLists.txt         | 7 +++++++
- util/geosop/GeosOp.cpp | 6 ++++++
- 2 files changed, 13 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 12411e586..a1e2f0c6e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -558,3 +558,10 @@ if(PROJECT_IS_TOP_LEVEL)
- 
-   unset(_is_multi_config_generator)
- endif()  # PROJECT_IS_TOP_LEVEL
-+
-+include(CheckIncludeFile)
-+check_include_file(fenv.h HAVE_FENV_H)
-+
-+if(HAVE_FENV_H)
-+    target_compile_definitions(geos_cxx_flags INTERFACE HAVE_FENV)
-+endif()
-diff --git a/util/geosop/GeosOp.cpp b/util/geosop/GeosOp.cpp
-index 2cb17f000..05307cf30 100644
---- a/util/geosop/GeosOp.cpp
-+++ b/util/geosop/GeosOp.cpp
-@@ -26,7 +26,9 @@
- #include <geos/io/WKBStreamReader.h>
- #include <geos/io/WKBWriter.h>
- 
-+#if defined(HAVE_FENV)
- #include <cfenv>
-+#endif
- #include <fstream>
- #include <iostream>
- #include <sstream>
-@@ -394,10 +396,13 @@ void GeosOp::run(OpArguments& opArgs) {
-     //------------------------
- 
-     try {
-+#if defined(HAVE_FENV)
-         std::feclearexcept(FE_ALL_EXCEPT); // clear floating-point status flags
-+#endif
- 
-         execute(op, opArgs);
- 
-+#if defined(HAVE_FENV)
-         // Catch everything except for FE_INEXACT, which is usually harmless
-         const int fpexp = std::fetestexcept(FE_ALL_EXCEPT ^ FE_INEXACT);
-         if (args.isVerbose && (fpexp != 0)) {
-@@ -414,6 +419,7 @@ void GeosOp::run(OpArguments& opArgs) {
-                 std::cerr << " FE_UNDERFLOW";
-             std::cerr << std::endl;
-         }
-+#endif
-     }
-     catch (std::exception &e) {
-         std::cerr << "Run-time exception: " << e.what() << std::endl;
--- 
-2.51.0
-
diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index 538933873b..0441b89426 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fe85286b1977121894794b36a7464d05049361bedabf972e70d8f9bf1e3ce928  geos-3.14.0.tar.bz2
+sha256  3c20919cda9a505db07b5216baa980bacdaa0702da715b43f176fb07eff7e716  geos-3.14.1.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 0de73e2688..cc34ba2aca 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.14.0
+LIBGEOS_VERSION = 3.14.1
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
