Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B52606A31B
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 16:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Src2b0Na
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2D5C6060B;
	Mon, 19 Oct 2026 16:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTa4bT_pwZQ7; Mon, 19 Oct 2026 16:59:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B32A36060C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792429152;
	b=UzwyIvC+mnUur1jPrdHGOXVIAFpycG8m89YA8SLXXWEh/C1GCKVrGv/zmaghICZkxuwk
	 jT6Pwh9HyRQXc+YeLM3mmZ5ZO8bWvEPc6yYGFOeD3LvijdeVRpWN2PwjOi5SNMEXJmaDF
	 H4FMQ/+Kzr69UQhMXHAtgkUWkbrpmPGupYDXXkVuJH42VXunGZzNEtpGbOQspc2UwMSHH
	 bkNMngc6nDAYkq+zeIuKKZxtheG4jIpsgWspUcZ/zhnpR6KSgUl5dfwC8e+5uSsyqAgkw
	 /T65jxyN+VWGTEJEeqGwjT+zLXMv8M5DD27bt4tqEf50/drdF3AG2WLpYZDZwap2o2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792429152;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=JECCdfzAsCrempmIJedayABeG0LBEPOcKem3qmz59xI=;
	b=EJHag6kw71rf6C+wvxUOFPMCUFRRV6xsLujRhG1N8MFzY807CyamRW6ZCj3ytuhliJZ6
	 B7iV/v/Wz+FNC9jm3b/d53It+hrn0tUHMmi4Q5socmUfOyqzrrVVdEd++JL7m/0Al5OVg
	 yXMf1InUvCvRxBX73N8dI0B9Jw2wyodnKmmWCuUiFM6e1QsQ4bxFSiTHDL4qpq2EnyqFj
	 lxF7oX55+Vo5JrHMQskN/cspmyOSzl17xgNfHb6sMXP0l9UvGf+iPJsNX+9PUE1qKoX8s
	 UdoKMjAqL/1ZS4dPkrpYZII6aIemybIermeuKG2fMcw6C+NNX8bikWxs5TFa9PCKXuw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792429152;
	bh=JECCdfzAsCrempmIJedayABeG0LBEPOcKem3qmz59xI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Src2b0NauurBkV6iKvkJln8Qv4LtiMgCZ8C2CEMmeXXrCmxrkZSnWypr6gPT7sVWJ
	 UjdlgVSyHIqSc3GARa6pHJhb9Vil4eDCBNbBcFoCCm1feooQ+RaraVUKznN10CQ4wF
	 OWY7iiuEkx06UAyCEfnly2w6I5MCXMByhel2cGhN2zqqIZTXQ8tcU5BOx0xgvWHZgo
	 3GKVdboPPHsFB3Es1XUqpBeo9x4ruBzNIa4cokI7yGnD0GwRy6MvvrIuea5wLGsovu
	 CKg1nIkzn6LFDblGvUFzXHWxrRtLEVtJnwZKcR7Pt77JdwRj+CgyIneGAb1PCdSmbU
	 9pndpUiVzRPMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B32A36060C;
	Mon, 19 Oct 2026 16:59:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3366B23A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 258AB40179
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8f36ALPg8uN for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 16:59:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 448E5400B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792429149;
 b=EU9y/lmrITx+1zUeJ3+tzCgHcdROUxyTizitMZNcOUfSoviKmYaP9M0P2Lrp9/T6MNML
 tinY+3SNuYZofcA05iHNjvZSkSGhGJJlQ/g5iHDSL32d9117ds/FXUomjhN3C+F3vlGaF
 MpUeSNI4pfc30y1UCgGCKUqirXmkVviwPdqPMU/mfCu9gJJQcUvHvhbhVDdZ3Hvk8bwpZ
 pzev7k4DhfkxpNUTwmAE03q6t+PZlSVtdRN3/7NXOSxsChJWGXb62UImocQOakAdiSHtS
 iSJ/uBBwMtKeyaNzHqNlK1PjHbJk8XRZh1au72zM2KQf6plgO2PIqTDegbTHFWsY09g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792429149;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yM5owPUTyAaaxZaLL52gjB4/axtZ/e9OWY1LGQYZMBY=;
 b=U2JgSM0BrJgid8NTC6gEV/zqqg0gno3nH72dfwXBEy8XQAPqiOHiyNAPn83x2LFGzLyr
 UAANcSHCqoHOtexuwUNmrAiTLJ5E9EmmWqpkaaohZoitBclX8BegUNprTkgdRfbAPJxfV
 f6jnW8l2atd6zD5B3nHvT62h1Ks5XczWiEeDTvBvt0ZSBR2hcfOawYuWpInGLtPh9o/j6
 pW86S1f9LsM9DDWOKM/KHV1BtMudc9owUksTyQMGiQi33agusGjsZu1Rp2zESDoBtCJ/h
 Ajlg49H6RBqYB9PxrWU7xEfz7mNR07RaWcAR6G82b60lmXuvrnnaep6fc7ZoNpQscDQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 448E5400B4
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:59:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3C6398759; Mon, 19 Oct 2026 16:57:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 18:58:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89d584b8e2c8cda252c768dafac020f79d739691
X-Git-Newrev: 34dc16e77e362bc8b05a92ea97432ef89ca51ece
X-Patchwork-Hint: ignore
Message-Id: <20261019165746.A3C6398759@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openscap: bump to version 1.4.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9114158046148906632=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============9114158046148906632==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34dc16e77e362bc8b05a92ea97432ef89ca51ece
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog available at
https://github.com/OpenSCAP/openscap/releases/tag/1.4.5

The two patches present in the package directory are now integrated in
the new version, so drop them.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-build-without-crypto-support.patch    | 57 ----------------------
 ...gcrypt-cmake-variables-if-gcrypt-is-not-f.patch | 50 -------------------
 package/openscap/openscap.hash                     |  8 +--
 package/openscap/openscap.mk                       |  2 +-
 4 files changed, 5 insertions(+), 112 deletions(-)

diff --git a/package/openscap/0001-Fix-build-without-crypto-support.patch b/package/openscap/0001-Fix-build-without-crypto-support.patch
deleted file mode 100644
index 97da60f032..0000000000
--- a/package/openscap/0001-Fix-build-without-crypto-support.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From d12d820a9493b0a0ee1ad4b0aeaa87da28aa0080 Mon Sep 17 00:00:00 2001
-From: Eljees <yurytumanov.r@yandex.ru>
-Date: Mon, 27 Jul 2026 06:57:38 +0300
-Subject: [PATCH] Fix build without crypto support
-
-Upstream: https://github.com/OpenSCAP/openscap/commit/d12d820a9493b0a0ee1ad4b0aeaa87da28aa0080
-Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
----
- src/CMakeLists.txt                   | 2 +-
- src/OVAL/probes/CMakeLists.txt       | 2 +-
- src/OVAL/probes/crapi/CMakeLists.txt | 7 ++++++-
- 3 files changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 5d59bf3f036f..f31ce8040e0a 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -59,7 +59,7 @@ if (ENABLE_PROBES)
- 		)
- 	endif()
- endif()
--if (HAVE_MMAN_H AND (GCRYPT_FOUND OR NSS_FOUND))
-+if (HAVE_MMAN_H)
- 	list(APPEND OBJECTS_TO_LINK_AGAINST
- 		$<TARGET_OBJECTS:crapi_object>
- 	)
-diff --git a/src/OVAL/probes/CMakeLists.txt b/src/OVAL/probes/CMakeLists.txt
-index e505908f5842..25e3ca56a0c3 100644
---- a/src/OVAL/probes/CMakeLists.txt
-+++ b/src/OVAL/probes/CMakeLists.txt
-@@ -1,7 +1,7 @@
- add_subdirectory("SEAP")
- add_subdirectory("probe")
- 
--if (HAVE_MMAN_H AND CRYPTO_FOUND)
-+if (HAVE_MMAN_H)
- 	add_subdirectory("crapi")
- endif()
- 
-diff --git a/src/OVAL/probes/crapi/CMakeLists.txt b/src/OVAL/probes/crapi/CMakeLists.txt
-index 1f3e5a963bbf..3fb6f123c8d6 100644
---- a/src/OVAL/probes/crapi/CMakeLists.txt
-+++ b/src/OVAL/probes/crapi/CMakeLists.txt
-@@ -1,4 +1,9 @@
--file(GLOB_RECURSE CRAPI_SOURCES "*.c")
-+if (CRYPTO_FOUND)
-+	file(GLOB_RECURSE CRAPI_SOURCES "*.c")
-+else()
-+	# crapi_init has a no-op implementation for builds without a digest backend.
-+	set(CRAPI_SOURCES "crapi.c")
-+endif()
- file(GLOB_RECURSE CRAPI_HEADERS "*.h")
- 
- add_library(crapi_object OBJECT ${CRAPI_SOURCES} ${CRAPI_HEADERS})
--- 
-2.55.0
-
diff --git a/package/openscap/0002-Do-not-use-gcrypt-cmake-variables-if-gcrypt-is-not-f.patch b/package/openscap/0002-Do-not-use-gcrypt-cmake-variables-if-gcrypt-is-not-f.patch
deleted file mode 100644
index d4d3bd2d16..0000000000
--- a/package/openscap/0002-Do-not-use-gcrypt-cmake-variables-if-gcrypt-is-not-f.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 5b858d1786c025cbd50dfc284b252c3ee6dd99dc Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
-Date: Tue, 18 Aug 2026 09:38:05 +0200
-Subject: [PATCH] Do not use gcrypt cmake variables if gcrypt is not found
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Commit d12d820a9493 ("Fix build without crypto support") enabled
-building the crapi library without a crypto backend, but left the
-target_include_directories and target_compile_definitions calls
-unguarded. When no crypto library is available, the GCrypt find module
-leaves GCRYPT_INCLUDE_DIRS unset, so CMake fails at the generate step
-with:
-
-  CMake Error: The following variables are used in this project, but
-  they are set to NOTFOUND: GCRYPT_INCLUDE_DIR
-
-The test command provided at this time made the build successful because
-it provided -DCMAKE_DISABLE_FIND_PACKAGE_GCrypt=TRUE, but if no crypto
-backend is provided, it does not make sense to provide those cmake
-configuration options preventing dependency search manually.
-
-Guard both calls with a CRYPTO_FOUND check so they are only applied when
-an actual digest backend is present, even without providing
--DCMAKE_DISABLE_FIND_PACKAGE_foo
-
-Upstream: https://github.com/OpenSCAP/openscap/commit/5b858d1786c025cbd50dfc284b252c3ee6dd99dc
-Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
----
- src/OVAL/probes/crapi/CMakeLists.txt | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/OVAL/probes/crapi/CMakeLists.txt b/src/OVAL/probes/crapi/CMakeLists.txt
-index 3fb6f123c8d6..88cb916b6d96 100644
---- a/src/OVAL/probes/crapi/CMakeLists.txt
-+++ b/src/OVAL/probes/crapi/CMakeLists.txt
-@@ -8,5 +8,7 @@ file(GLOB_RECURSE CRAPI_HEADERS "*.h")
- 
- add_library(crapi_object OBJECT ${CRAPI_SOURCES} ${CRAPI_HEADERS})
- set_oscap_generic_properties(crapi_object)
--target_include_directories(crapi_object PUBLIC ${NSS_INCLUDE_DIRS} ${GCRYPT_INCLUDE_DIRS})
--target_compile_definitions(crapi_object PUBLIC ${GCRYPT_DEFINITIONS})
-+if (CRYPTO_FOUND)
-+	target_include_directories(crapi_object PUBLIC ${NSS_INCLUDE_DIRS} ${GCRYPT_INCLUDE_DIRS})
-+	target_compile_definitions(crapi_object PUBLIC ${GCRYPT_DEFINITIONS})
-+endif()
--- 
-2.55.0
-
diff --git a/package/openscap/openscap.hash b/package/openscap/openscap.hash
index 16cebc54c9..60b34287f3 100644
--- a/package/openscap/openscap.hash
+++ b/package/openscap/openscap.hash
@@ -1,6 +1,6 @@
-# From https://github.com/OpenSCAP/openscap/releases/tag/1.4.4
-sha256  25b1b046822121204e6d53d877a532c88bf7fde14b94c9c72297cd5709b03478  openscap-1.4.4.tar.gz
-# From https://github.com/OpenSCAP/openscap/releases/download/1.4.4/openscap-1.4.4.tar.gz.sha512
-sha512  c69736bee997e50a04aff8e4f22da880f342190e1289c5df0fb73b7af34833d3bd9f4e5055b227a18d571167671f821701a09f8c9a3e4568c7da68cc4be51133  openscap-1.4.4.tar.gz
+# From https://github.com/OpenSCAP/openscap/releases/tag/1.4.5
+sha256  f4fc0a54b50441b3c6bb3527c292345cdb3bea16a9d23435292beb508eb96e47  openscap-1.4.5.tar.gz
+# From https://github.com/OpenSCAP/openscap/releases/download/1.4.5/openscap-1.4.5.tar.gz.sha512
+sha512  cb39e53a5cfe8e0bf69418f04ff2175e2579656620d59ae84bab4de482bcb35a58580d598f86dfdfc7613bb7c1c37dd99aa9c9bbb8ff015f4772ad62fecd6267  openscap-1.4.5.tar.gz
 # Locally computed
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/openscap/openscap.mk b/package/openscap/openscap.mk
index 6fbe097718..feb70048ed 100644
--- a/package/openscap/openscap.mk
+++ b/package/openscap/openscap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSCAP_VERSION = 1.4.4
+OPENSCAP_VERSION = 1.4.5
 OPENSCAP_SITE = https://github.com/OpenSCAP/openscap/releases/download/$(OPENSCAP_VERSION)
 OPENSCAP_LICENSE = LGPL-2.1+
 OPENSCAP_LICENSE_FILES = COPYING

--===============9114158046148906632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9114158046148906632==--
