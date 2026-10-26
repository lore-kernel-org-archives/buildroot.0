Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAB8606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YEXYir4a
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6535605FA;
	Mon, 26 Oct 2026 08:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Xdruzd0eWFl; Mon, 26 Oct 2026 08:10:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A22EC60604
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793002209;
	b=jCdEBH9qw/qmUpz/+QhcIxIDmYcdjM1U7Po+25+Z04EeeudDJy1inImMwu71/A17cq8R
	 FBVU0eFV5C5eBSpdNixIJUPSfQcwciAXcY3ZWU+4QG7g50SJR69Dk6Ah/vwpCj/1Mg4cH
	 1pggtBrTndJ//bSM0dLUsb72XJUFyjI+I2oV9SYrgGSy9STKyPTSOPUEahkFZ24+mmFct
	 2U9zAt9lG24JHnb0qKb2ppIUKCeIUY+KbmLYAZjwJKEx/kUk5yBReS/X4kD74GyrwOo/M
	 AKwhy0TqkUh/256ifLe8tbBg9NdNGBX0UoSPKccPql6PDwuUCNNOQH2prCycMXMV5FA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793002209;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AySGYA1Pl26DIxeT7cvXEIkllGQFM3dsSPUgKblOia8=;
	b=NU2Ys40n6IKQ62r8Kc3dC23NO64a5ZWREz2A72O3yfoGEtQHCZBDwJVF+IvppgeXe/Tp
	 RwlchXdoarFV45TFo6EPBFRN4k5ok64l76Jmq9jX2cZB2p6rcDd1jbo8UiUeV6ThkDwTt
	 +66L3h2pzd0qrTv849mkwbyTB5dOnczmrItl22qmaMlqRI7lg09m9UJZXt57rI3vsn+sv
	 w8PQc4AnwK/Iz2ZoDWEuTK21DACSzSl/GhbG58d8ygivTUQBp6AKzQjUbvFOUCG6L3QIC
	 cyT2cWnPVL7fckuqL89wMYorNABIGoev6w9B04RoO7tUV/m85iouMwf+Lsl3I8nyDKw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793002209;
	bh=AySGYA1Pl26DIxeT7cvXEIkllGQFM3dsSPUgKblOia8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YEXYir4a8WGLgP5y0VfPeXw4+jpL5QboaSkX8E6JRaPCqZTLKOxC7417ZR1MrGydu
	 XGkNnJoTiKdFHpw42JLqHTp7APcAMBKeoVoqAU0QdM2H6EbREMAsAXX7tVtSDByc+n
	 N0uL3nX30ChJYXaQEYf7BE8ZMGzRozrl6XqwwDindxdiZlsbPq1UOMWiF769hJBdNI
	 v0kokd8KJZrpyQTr+z3pZ+EJwCDbQVIqBBNnwmQRK6ZMqTEj7AFFfqUobw+fYkXHrT
	 1OvN5hVn/SK9ZgdEc1W1jBuXRyh73+P4umV2olS6+9NmyG/99IhVsSjBHetOnJWDb0
	 XLt36DfqfSrzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A22EC60604;
	Mon, 26 Oct 2026 08:10:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EDE9CB91
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFE4080D82
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unmQ41bb0PHq for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 08:10:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1051680CCC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793002206;
 b=iOI1GM0Lrd1OtToViEP22agncgu/8QkUwNU6i4tmPrazTAygtUGg7mn7tPY8Iiz/Ig/j
 xI5IgQT+Q4Vq8H5AaHvHen/srlp1ejyQoqQJ4bWmDc06nuZTGEdwCsHtyb83jhORQfscQ
 ex+KVndCTso+gwa3a7tFY2V1Iz7HMLKeEcbvHixHPcX0DakHfFqHLFoASCmsZ3K0DjQbs
 zz1vn7ELUNh88ZAvcvR3ee7kmGDxdJ6dYzuSMNKY2/FwUy8sPXbB056Uwd6fPUsoSoP4G
 VVef9/zq3TNkOib+bzhugJoLD56pmRJ3V9tAWdAWqQDnTg4gpFzh/uG/1GUL5d2RFxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793002206;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=J88ceC1GxgKAm7mQaWrl4QBkj7kOUjmkUewmFzW69V8=;
 b=KlAvEx9A8Y4n+EZ7Efarefo1jESmQpPdSC23rvhKQLhSJdr9nkDD651HoIU3tOx8V6xp
 bZpDMlk3QxeNRn/sfh87C7n0nJWGNiTXeDTb91QPjP4Y2m+p+47CFuvppAVhtW8X5jRGk
 5wY9IBDJ4o+ZkD6ww3KRDuWq0tm5HAPxIWE5P8/WcD44yR1w625bz9rLvv3x3N1vj9/w9
 2zhP5822eDW7nzI16XVsvjtreNNaS9U87dNPvzoeCMMEsKNBpZ+Fj3wfHRFldnHuL1NaY
 ffO3yjFRHqAw2ZaXAxcynI9i0S8tzld5fayxdvIY3eVdCoQGcfpRgJLDUIFx9vidbCA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1051680CCC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 08:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30E0A9CF44; Mon, 26 Oct 2026 08:08:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 09:09:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2cf3210eeda7f8f17b6d36904f6ba77db7890be2
X-Git-Newrev: 7c1c82a04545eb880d03f7e2badc3feef451f06c
X-Patchwork-Hint: ignore
Message-Id: <20261026080840.30E0A9CF44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl_433: bump version to 25.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7c1c82a04545eb880d03f7e2badc3feef451f06c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

And drop now upstreamed patches.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-build-Update-for-compat-with-newer-CMake.patch | 25 -----------------
 ...2-Fix-overflow-in-rfraw-test-data-parsing.patch | 31 ----------------------
 package/rtl_433/rtl_433.hash                       |  2 +-
 package/rtl_433/rtl_433.mk                         |  5 +---
 4 files changed, 2 insertions(+), 61 deletions(-)

diff --git a/package/rtl_433/0001-build-Update-for-compat-with-newer-CMake.patch b/package/rtl_433/0001-build-Update-for-compat-with-newer-CMake.patch
deleted file mode 100644
index 81cb5cd094..0000000000
--- a/package/rtl_433/0001-build-Update-for-compat-with-newer-CMake.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 42ac641452aa56afa04f7bad5a55f790ee639852 Mon Sep 17 00:00:00 2001
-From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
-Date: Sun, 30 Mar 2025 12:05:53 +0200
-Subject: [PATCH] build: Update for compat with newer CMake (closes #3245)
-
-Upstream: https://github.com/merbanan/rtl_433/commit/42ac641452aa56afa04f7bad5a55f790ee639852
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 08f63eea7..6dc1f7910 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,7 +1,7 @@
- ########################################################################
- # Project setup
- ########################################################################
--cmake_minimum_required(VERSION 2.6)
-+cmake_minimum_required(VERSION 2.6...3.10)
- # Fix behavior of CMAKE_C_STANDARD when targeting macOS.
- if(POLICY CMP0025)
-     cmake_policy(SET CMP0025 NEW)
diff --git a/package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch b/package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch
deleted file mode 100644
index 6446fea0ab..0000000000
--- a/package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 25e47f8932f0401392ef1d3c8cc9ed5595bc894a Mon Sep 17 00:00:00 2001
-From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
-Date: Wed, 8 Oct 2025 10:11:15 +0200
-Subject: [PATCH] Fix overflow in rfraw test data parsing (closes #3375)
-
-CVE: CVE-2025-34450
-Upstream: https://github.com/merbanan/rtl_433/commit/25e47f8932f0401392ef1d3c8cc9ed5595bc894a
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/rfraw.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/rfraw.c b/src/rfraw.c
-index 9f4c9780c..71a1c365d 100644
---- a/src/rfraw.c
-+++ b/src/rfraw.c
-@@ -159,9 +159,14 @@ static bool parse_rfraw(pulse_data_t *data, char const **p)
-             data->num_pulses++;
-             pulse_needed = true;
-         }
-+        // abort reading if the pulse data array is full
-+        if (data->num_pulses >= PD_MAX_PULSES) {
-+            break;
-+        }
-     }
-     //data->gap[data->num_pulses - 1] = 3000; // TODO: extend last gap?
- 
-+    // expand reapeats as long as the pulse data array has enough space
-     unsigned pkt_pulses = data->num_pulses - prev_pulses;
-     for (int i = 1; i < repeats && data->num_pulses + pkt_pulses <= PD_MAX_PULSES; ++i) {
-         memcpy(&data->pulse[data->num_pulses], &data->pulse[prev_pulses], pkt_pulses * sizeof (*data->pulse));
diff --git a/package/rtl_433/rtl_433.hash b/package/rtl_433/rtl_433.hash
index 30f60a82f7..f3b68f6d82 100644
--- a/package/rtl_433/rtl_433.hash
+++ b/package/rtl_433/rtl_433.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  5a409ea10e6d3d7d4aa5ea91d2d6cc92ebb2d730eb229c7b37ade65458223432  rtl_433-25.02.tar.gz
+sha256  d283ec7a41a02d398e8918b20b65df3bf684cf4478371830662004005dadcdd2  rtl_433-25.12.tar.gz
 # License file, locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index fc6c2bece2..bc5e47dec1 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-RTL_433_VERSION = 25.02
+RTL_433_VERSION = 25.12
 RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
 RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
 RTL_433_CPE_ID_VALID = YES
 
-# 0002-Fix-overflow-in-rfraw-test-data-parsing.patch
-RTL_433_IGNORE_CVES += CVE-2025-34450
-
 # Force Release build to remove ASAN.
 RTL_433_CONF_OPTS = \
 	-DCMAKE_BUILD_TYPE=Release \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
