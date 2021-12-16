Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DEAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 22:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F94983FA8;
	Thu, 16 Dec 2021 22:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jUmKYxsrRrAP; Thu, 16 Dec 2021 22:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A45C883F6D;
	Thu, 16 Dec 2021 22:54:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 312111BF29D
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 22:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DDDA83F6D
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 22:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qpn7e5H3K2U5 for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 22:54:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47C1D83F67
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 22:54:15 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so2798340wmj.5
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 14:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTUP5FjQE2SR4Z1vdMZYkYTBTbjlLvuYUW7ZToNFXMo=;
 b=jfs/piRjYOWMoF2y8jXSQkrd7XWz06EG3XQ4A0q/p89JLjnwGWv4QXXVPxrtugk/F+
 lzic8jEODMNACjkxBdhZI/IwDGPy11fQKTfyP/17K7yYCUacYCY5OsiiCEGVN9WNEvDL
 LjVNFDHSVaXSdW3ou+gAqpdQTMfCTbufAATMTDrKXhbE1TVP39pi1IR73W01aUvsB0Nu
 7Q9O1fYAL57t0pzj4VbDE8f0hhcmxy8PaP4ivwJCgNK2Lxf63KjasBpsFEQwKxIq+FpY
 Rf0ySadCQBeQEG0wibeSZujLuCj/yZGkpUtIfNwfPp3L80J5XQKfM4zC9cSEBW42AbiH
 h7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lTUP5FjQE2SR4Z1vdMZYkYTBTbjlLvuYUW7ZToNFXMo=;
 b=5aqFZykDeW6NT60+vIEmyOJZJDaUKImFrq3ki551l1pmF7syX+nrBP9o+mBuB2Jeow
 CjpFtpHZQzwybh/eb86zHD5t/27femZgAlBeV2jV/YkzupbkO6VciFqL7sxP1jvSA3Qk
 14m4x6PJCgN0OzXoeb/Or8dm0sJClxSV23g8n70UT66Y2PUvqWrAltm4DoTeIJ4iybiC
 3GlPq35RLmLh74mwtq/rOtpGjdxsMuOe1usvPRoUdH1e/vROgX90Ykgv5l7iH5kCzXoR
 JQlhmHXAf1wFp/1IguE0H6ftbMMM/efCI6rJSH60DmvVl3pTF7wegYfi7fzezO2NGyHo
 xOKw==
X-Gm-Message-State: AOAM531hoL7E49E/U+7S9UZAHYUr5EJAqXNKQit2ndwQYLVRUfuIr8pE
 nTGWCherpfdgMt1A+u4DXqMWB4ImoZi8mQ==
X-Google-Smtp-Source: ABdhPJyTrusZ8yG+OqfTWk2vJjxWgOBnpuOJ/diXhuz0hb61Eh2tvvgxrD+DeeRWsJVebhCVYVme5g==
X-Received: by 2002:a1c:4b0e:: with SMTP id y14mr6818421wma.170.1639695253111; 
 Thu, 16 Dec 2021 14:54:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id u10sm8044309wrs.99.2021.12.16.14.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:54:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 23:53:38 +0100
Message-Id: <20211216225339.1067213-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/tcl: bump to version 8.6.12
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
Cc: Davide Viti <zinosat@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Refresh patch
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tcl/0001-dont-build-compat.patch | 14 +++++++-------
 package/tcl/tcl.hash                     |  4 ++--
 package/tcl/tcl.mk                       |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/tcl/0001-dont-build-compat.patch b/package/tcl/0001-dont-build-compat.patch
index c0d5d85da7..7a7d959cd2 100644
--- a/package/tcl/0001-dont-build-compat.patch
+++ b/package/tcl/0001-dont-build-compat.patch
@@ -7,7 +7,7 @@ anything buildroot is using as a standard C library will be good enough
 to not have broken behavior.
 
 Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
-[Fabrice: Update for 8.6.9]
+[Fabrice: Update for 8.6.12]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
 
@@ -15,11 +15,11 @@ diff --git a/unix/tcl.m4 b/unix/tcl.m4
 --- a/unix/tcl.m4
 +++ b/unix/tcl.m4
 @@ -2725,7 +2725,7 @@ AC_DEFUN([SC_TCL_CHECK_BROKEN_FUNC],[
-     if test ["$tcl_ok"] = 1; then
- 	AC_CACHE_CHECK([proper ]$1[ implementation], [tcl_cv_]$1[_unbroken],
- 	    AC_TRY_RUN([[int main() {]$2[}]],[tcl_cv_]$1[_unbroken]=ok,
--		[tcl_cv_]$1[_unbroken]=broken,[tcl_cv_]$1[_unbroken]=unknown))
-+		[tcl_cv_]$1[_unbroken]=broken,[tcl_cv_]$1[_unbroken]=ok))
- 	if test ["$tcl_cv_]$1[_unbroken"] = "ok"; then
+ #include <stdlib.h>
+ #include <string.h>
+ int main() {]$2[}]]])],[tcl_cv_$1_unbroken=ok],
+-		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=unknown]))
++		[tcl_cv_$1_unbroken=broken],[tcl_cv_$1_unbroken=unknown]))
+	if test ["$tcl_cv_]$1[_unbroken"] = "ok"; then
  	    tcl_ok=1
  	else
diff --git a/package/tcl/tcl.hash b/package/tcl/tcl.hash
index 913190b95c..2b82a1938b 100644
--- a/package/tcl/tcl.hash
+++ b/package/tcl/tcl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 ad0cd2de2c87b9ba8086b43957a0de3eb2eb565c7159d5f53ccbba3feb915f4e  tcl8.6.9-src.tar.gz
-sha256 c0a69a2bfd757361ec7e6143973b103c90409316b49e9c88db26ad6388e79f16  license.terms
+sha256  26c995dd0f167e48b11961d891ee555f680c175f7173ff8cb829f4ebcde4c1a6  tcl8.6.12-src.tar.gz
+sha256  c0a69a2bfd757361ec7e6143973b103c90409316b49e9c88db26ad6388e79f16  license.terms
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 7c456e89b3..97754b63d0 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TCL_VERSION_MAJOR = 8.6
-TCL_VERSION = $(TCL_VERSION_MAJOR).9
+TCL_VERSION = $(TCL_VERSION_MAJOR).12
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = TCL
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
