Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD60C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A319140247;
	Sun,  6 Feb 2022 14:29:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qv7q4m1SiR7u; Sun,  6 Feb 2022 14:29:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB84940224;
	Sun,  6 Feb 2022 14:29:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B48C1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE03640224
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:29:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jlnWhFsrY-Ci for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:29:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E461D40221
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:29:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c19so5703296wrb.10
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 06:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1ow5pg8BJRuA/TnHbais2JyudgqLXvnqUV2mW+qLEtw=;
 b=UkkWV3Fapl7F4v6O/nyOQtEPLYg4VUr9tkqK8ELDmrrJF7dnf9riluxY+yJhGDMJj1
 JatbpKCKCa2KHN+LKvZlyC0lbb/GDv4eDdIhXQ/zCtsTnJTX6V0AQVduc8qRrBNk/E+W
 IM4e87o/hi4Nv3IRGmC+z+AXLKmvk4a6M3gQkdH+Qx/r/6v+DtEpfJeF7k2pn6jrVtXz
 J8cpT3ipUEM8Z4qZxvz1n4emsA9gwyaaDWh15ixUni5osR4sD4Yo9UnkZ2bayOozPo5l
 DhXkDlE1ts8CFBbpa9ZKzO3PzpIM/EMXNBDULRKMRM3h7N1cbZwy9tKDyQ7eLo0YZwNm
 QePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1ow5pg8BJRuA/TnHbais2JyudgqLXvnqUV2mW+qLEtw=;
 b=FR4KeghyujD6t5ZFc2/mo4lv79xYyljgmKhIo4B2yWL8XBcPRw07UVirTINDHAUEVX
 LLPgM0ylZgFqB4xtBJ/bM/JqBJWr9wu11V0SkHuCMf+j0VA52fs266DhUX+fCqbIAtCi
 bu3on1DkYXVvpy1imCBGjIarxsNOgp7Guk9TZjV8S09vag/n/SPdO1k6wPOWYsrGI3Y/
 cBl24Vq29n6e5XvqP0LFPJ1Llpt8FQn9cijAf3k4Q3sMtSnXPvpY1jTU6n0WoLprYC66
 2CiJWWNS7AUZCmU5FfIOvl/QEMCB2rGsksusaa5S2dUGUY1op7WrfMzBkze9tNcCAxY2
 Dn0A==
X-Gm-Message-State: AOAM533b5fFF1qF305udeF8Lvht2csbmncDO98qD6jBLOF58rQEbZ6y3
 NgU+j5ixHZoPBb3OO6040YoRs+95utk=
X-Google-Smtp-Source: ABdhPJzbf/Nh1q+bOszpzjg40OKVKG4YC54bY8bg3Qq/obY2RWe020dvjEkHWLjYOwt7afc+6ncHAQ==
X-Received: by 2002:a5d:5001:: with SMTP id e1mr6721631wrt.415.1644157742922; 
 Sun, 06 Feb 2022 06:29:02 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id t4sm6717347wmj.10.2022.02.06.06.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 06:29:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 15:26:38 +0100
Message-Id: <20220206142638.1751906-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mp4v2: needs gcc >= 5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TechSmith fork of mp4v2 needs gcc >= 5:
https://github.com/TechSmith/mp4v2/issues/47

As a result, the following build failure is raised since bump to version
5.0.1 in commit df22a9d6b77d9e245dceb7c8fd3f9d80c8917ca0:

In file included from ./include/mp4v2/mp4v2.h:58:0,
                 from ./libplatform/platform_posix.h:37,
                 from ./libplatform/platform.h:24,
                 from libplatform/impl.h:6:
./include/mp4v2/file.h:336:5: warning: identifier 'nullptr' is a keyword in C++11 [-Wc++0x-compat]
     ShouldParseAtomCallback cb = nullptr );
     ^

While a it, drop first patch which is not needed now that mp4v2 depends
on gcc >= 5

Fixes:
 - http://autobuild.buildroot.org/results/178f1266396d44c6659a67d8e68cb99e36d544ea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...atic-cast-to-unsigned-int-for-cases.patch} |  0
 ...mp4track.cpp-replace-nullptr-by-NULL.patch | 50 -------------------
 package/mp4v2/Config.in                       |  6 ++-
 3 files changed, 4 insertions(+), 52 deletions(-)
 rename package/mp4v2/{0002-Static-cast-to-unsigned-int-for-cases.patch => 0001-Static-cast-to-unsigned-int-for-cases.patch} (100%)
 delete mode 100644 package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch

diff --git a/package/mp4v2/0002-Static-cast-to-unsigned-int-for-cases.patch b/package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch
similarity index 100%
rename from package/mp4v2/0002-Static-cast-to-unsigned-int-for-cases.patch
rename to package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch
diff --git a/package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch b/package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
deleted file mode 100644
index c279b9c56a..0000000000
--- a/package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 78cf76b5d661e37e958163c37c0ad95940c09591 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 30 May 2020 11:42:19 +0200
-Subject: [PATCH] src/mp4track.cpp: replace nullptr by NULL
-
-Commit 15ec11166ba9ee7b77631d0d9234522f656cfd66 added code that uses
-nullptr. nullptr is C++11, it will break the build with gcc < 5.
-
-Semantically, NULL and nullptr are different, so should not be mixed.
-In this situaiton, m_File.FindAtom() indeed does not return nullptr,
-but NULL (on error, that is).
-
-Switch back to comparing against NULL.
-
-Fixes:
- - http://autobuild.buildroot.org/results/14937c96a82fb3d10e5d83bd7b2905b846fb09f9
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/TechSmith/mp4v2/pull/62]
----
- src/mp4track.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/mp4track.cpp b/src/mp4track.cpp
-index 4b8fc9d..42489eb 100644
---- a/src/mp4track.cpp
-+++ b/src/mp4track.cpp
-@@ -908,16 +908,16 @@ File* MP4Track::GetSampleFile( MP4SampleId sampleId )
-        MP4FtypAtom *pFtypAtom = reinterpret_cast<MP4FtypAtom *>( m_File.FindAtom( "ftyp" ) );
- 
-        // MOV spec does not require "ftyp" atom...
--       if ( pFtypAtom == nullptr )
-+       if ( pFtypAtom == NULL )
-        {
--          return nullptr;
-+          return NULL;
-        }
-        else
-        {
-           // ... but most often it is present with a "qt  " value
-           const char *majorBrand = pFtypAtom->majorBrand.GetValue();
-           if ( ::strcmp( pFtypAtom->majorBrand.GetValue(), "qt  " ) == 0 )
--             return nullptr;
-+             return NULL;
-        }
-        throw new Exception( "invalid stsd entry", __FILE__, __LINE__, __FUNCTION__ );
-     }
--- 
-2.26.2
-
diff --git a/package/mp4v2/Config.in b/package/mp4v2/Config.in
index 172d1baabe..00e80cd358 100644
--- a/package/mp4v2/Config.in
+++ b/package/mp4v2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MP4V2
 	bool "mp4v2"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
 	help
 	  The MP4v2 library provides functions to read, create, and
 	  modify mp4 files.
@@ -18,5 +19,6 @@ config BR2_PACKAGE_MP4V2_UTIL
 
 endif
 
-comment "mp4v2 needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "mp4v2 needs a toolchain w/ C++, gcc >= 5"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
