Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C93CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F604841F7;
	Fri, 15 May 2026 13:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zBBHv1FiG1rV; Fri, 15 May 2026 13:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24A9884211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851714;
	bh=esFnU0J1RxaEnBZUme+7qmlKuhtRNw7VpizmXN5RhaY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=liOE95R+12Wsvklnj8HFgL+jZOBGJ93Eu7xfXFIt8RSryzRywkN0Ah162h8stMLWU
	 7quRDRyJkqftpm6Th6JqP/Ok0eTqqrRnYXvO1VNRVdKKF8et/BKCnZS9elFlMZ2RDm
	 1UV8bNrUPboligSAj7AH7mn29dp8ZNqpMhdk7oODdvViGF1Cf+orddDjG3Lhxtr0KC
	 kO91M0rDFoKwOd+rghiObzkScH1T/+JrfrlSRTuMLoMVHxkVTqYUY1l5HqjM4zXJA1
	 iHauKUzU3t5zhwcykEahALfNn3oOzQmV8yBrdGkFZAEtTkLYHAXEbjyc0oP0dRF/RC
	 2hzptOi82qarg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A9884211;
	Fri, 15 May 2026 13:28:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 28D5936F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AAEE61558
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOWGcIY_T_0y for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B6EA61549
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B6EA61549
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C180E8634F; Fri, 15 May 2026 13:28:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:18:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f55a6134b7b7664322a594f89ba380d33499cbc7
X-Git-Newrev: 11f509d1d27b845c3fad1468cd8c80b0972dd9e7
X-Patchwork-Hint: ignore
Message-Id: <20260515132815.C180E8634F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/lcms2: patch
 CVE-2026-41254, CVE-2026-42798
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1391518365487279381=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1391518365487279381==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/11f509d1d27b845c3fad1468cd8c80b0972dd9e7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2026-41254:
    Little CMS (lcms2) through 2.18 has an integer overflow in CubeSize in
    cmslut.c because the overflow check is performed after the
    multiplication.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-41254
 - https://github.com/mm2/Little-CMS/commit/da6110b1d14abc394633a388209abd5ebedd7ab0
 - https://github.com/mm2/Little-CMS/commit/e0641b1828d0a1af5ecb1b11fe22f24fceefd4bc

- CVE-2026-42798:
    Little CMS (lcms2) 2.16 through 2.18 before 2.19 has an integer
    overflow in ParseCube in cmscgats.c.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-42798
 - https://github.com/mm2/Little-CMS/commit/6a686019825a89b715d16671f18d049523354176

(cherry picked from commit c409050184c743ebcf65640cc8eb5c56cc9f570e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-Fix-integer-overflow-in-CubeSize.patch    | 28 ++++++++++++++++
 package/lcms2/0002-check-overflow.patch            | 34 +++++++++++++++++++
 ...seCube-integer-overflow-in-LUT-allocation.patch | 38 ++++++++++++++++++++++
 package/lcms2/lcms2.mk                             |  7 ++++
 4 files changed, 107 insertions(+)

diff --git a/package/lcms2/0001-Fix-integer-overflow-in-CubeSize.patch b/package/lcms2/0001-Fix-integer-overflow-in-CubeSize.patch
new file mode 100644
index 0000000000..84ccf4142b
--- /dev/null
+++ b/package/lcms2/0001-Fix-integer-overflow-in-CubeSize.patch
@@ -0,0 +1,28 @@
+From da6110b1d14abc394633a388209abd5ebedd7ab0 Mon Sep 17 00:00:00 2001
+From: Marti Maria <marti.maria@littlecms.com>
+Date: Thu, 19 Feb 2026 09:07:20 +0100
+Subject: [PATCH] Fix integer overflow in CubeSize()
+
+Thanks to @zerojackyi for reporting
+
+CVE: CVE-2026-41254
+Upstream: https://github.com/mm2/Little-CMS/commit/da6110b1d14abc394633a388209abd5ebedd7ab0
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/cmslut.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmslut.c b/src/cmslut.c
+index 10891486..b2452090 100644
+--- a/src/cmslut.c
++++ b/src/cmslut.c
+@@ -460,7 +460,8 @@ void EvaluateCLUTfloatIn16(const cmsFloat32Number In[], cmsFloat32Number Out[],
+ static
+ cmsUInt32Number CubeSize(const cmsUInt32Number Dims[], cmsUInt32Number b)
+ {
+-    cmsUInt32Number rv, dim;
++    cmsUInt32Number dim;
++    cmsUInt64Number rv;
+ 
+     _cmsAssert(Dims != NULL);
+ 
diff --git a/package/lcms2/0002-check-overflow.patch b/package/lcms2/0002-check-overflow.patch
new file mode 100644
index 0000000000..4524db88fc
--- /dev/null
+++ b/package/lcms2/0002-check-overflow.patch
@@ -0,0 +1,34 @@
+From e0641b1828d0a1af5ecb1b11fe22f24fceefd4bc Mon Sep 17 00:00:00 2001
+From: Marti Maria <marti.maria@littlecms.com>
+Date: Thu, 12 Mar 2026 22:57:35 +0100
+Subject: [PATCH] check for overflow
+
+Thanks to Guanni Qu for detecting & reporting the issue
+
+CVE: CVE-2026-41254
+Upstream: https://github.com/mm2/Little-CMS/commit/e0641b1828d0a1af5ecb1b11fe22f24fceefd4bc
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/cmslut.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/cmslut.c b/src/cmslut.c
+index a60baf98..65c935fc 100644
+--- a/src/cmslut.c
++++ b/src/cmslut.c
+@@ -468,12 +468,12 @@ cmsUInt32Number CubeSize(const cmsUInt32Number Dims[], cmsUInt32Number b)
+     for (rv = 1; b > 0; b--) {
+ 
+         dim = Dims[b-1];
+-        if (dim <= 1) return 0;  // Error
+-
+-        rv *= dim;
++        if (dim <= 1) return 0;  
+ 
+         // Check for overflow
+         if (rv > UINT_MAX / dim) return 0;
++
++        rv *= dim;
+     }
+ 
+     // Again, prevent overflow
diff --git a/package/lcms2/0003-Fix-for-ParseCube-integer-overflow-in-LUT-allocation.patch b/package/lcms2/0003-Fix-for-ParseCube-integer-overflow-in-LUT-allocation.patch
new file mode 100644
index 0000000000..d53c3ad7f2
--- /dev/null
+++ b/package/lcms2/0003-Fix-for-ParseCube-integer-overflow-in-LUT-allocation.patch
@@ -0,0 +1,38 @@
+From 6a686019825a89b715d16671f18d049523354176 Mon Sep 17 00:00:00 2001
+From: Marti Maria <marti.maria@littlecms.com>
+Date: Thu, 19 Feb 2026 08:48:50 +0100
+Subject: [PATCH] Fix for ParseCube integer overflow in LUT allocation
+
+thanks to @zerojackyi for reporting
+
+
+CVE: CVE-2026-42798
+Upstream: https://github.com/mm2/Little-CMS/commit/6a686019825a89b715d16671f18d049523354176
+[thomas: backport  to 2.16]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/cmscgats.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmscgats.c b/src/cmscgats.c
+index 252db22d..3d819fad 100644
+--- a/src/cmscgats.c
++++ b/src/cmscgats.c
+@@ -3128,7 +3128,16 @@ cmsBool ParseCube(cmsIT8* cube, cmsStage** Shaper, cmsStage** CLUT, char title[]
+ 
+             if (lut_size > 0) {
+ 
+-                int nodes = lut_size * lut_size * lut_size;
++                int nodes;
++                
++                /**
++                * Professional LUT‑generation tools (e.g., Nobe LutBake) list 65×65×65 as their highest supported size.                
++                */
++                if (lut_size > 65)
++                    return SynError(cube, "LUT size '%d' is over maximum of 65", lut_size);
++
++                nodes = lut_size * lut_size * lut_size;
++
+ 
+                 cmsFloat32Number* lut_table = _cmsMalloc(cube->ContextID, nodes * 3 * sizeof(cmsFloat32Number));
+                 if (lut_table == NULL) return FALSE;
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 92aeff8890..474e1a9de3 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -14,6 +14,13 @@ LCMS2_INSTALL_STAGING = YES
 # tiff is only used by tificc sample
 LCMS2_CONF_OPTS = --without-tiff
 
+# 0001-Fix-integer-overflow-in-CubeSize.patch
+# 0002-check-overflow.patch
+LCMS2_IGNORE_CVES += CVE-2026-41254
+
+# 0003-Fix-for-ParseCube-integer-overflow-in-LUT-allocation.patch
+LCMS2_IGNORE_CVES += CVE-2026-42798
+
 ifeq ($(BR2_PACKAGE_JPEG),y)
 LCMS2_CONF_OPTS += --with-jpeg
 LCMS2_DEPENDENCIES += jpeg

--===============1391518365487279381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1391518365487279381==--
