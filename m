Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41A8606A33E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 17:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=I8PBvz1P
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE3508146E;
	Fri, 23 Oct 2026 17:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xtKBRK6Jwi0; Fri, 23 Oct 2026 17:44:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E66E781164
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792777481;
	b=nzFm9md1lySq7BkaMLzQINDLf0gro13h118DTlXrzAwXbpuXHi41whLw8oIpE6iGBUW7
	 4A9lb0q05KYsKzQaPSsW7pcftttK17uK5NrbH4kRdYtUiQtUSTyZMjJ7g68XwBE4V4Ky+
	 Fz2fs65lZNrY4Xxd0Aice4hsKK+SfCaTdS6zGNMz5hXGrn1g4BOyLGiTuRihCTO+ix/wM
	 7Svuno/kwrBFynepToQrPrC6HMLJHHNy6yvLq6/iPu2q74/eP5DQpDR2lVhm9qXCtpX98
	 LgL1u2DDvOUrVXn44gXoAntwBHPI1VWzfHqCu3vyxJAeUd+TFvpapV/20qe9b5ezaIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792777481;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LZqqrES5qVd5SJWh2wPowBAm2gSn1xaWkq61AWtjXtY=;
	b=jfI7LzLLJT5GddNM1HLa+0maiW8vP3Juxv+eG4AmmX1iFwgWhVByImheqxTqPAm6O+t7
	 ecrDpZ0Sj8DFvxljSCSqmcic8NCRVBf6MDCy4Md3Hv2uah37ZqjyucuZcppMhlEgG9ya1
	 E9ODmO4/0VVibZQz4Mcsubnybn9T2euhRx+uAWCNg1SO1nDGKIQLvt3yzhUqxUeLE+ayH
	 YOd6Jw+gDeIMPUSd2ES38dkSqkcXErlhyDCW2gigiWhqhHHBdjGG8qpFeQEvEW6ZH5IUj
	 uu4IiAnYAXnYk0V+wyvrTpxNOCve3VsS/0mtIS3dnP6O6lC+kHcNSADeR75fnyp+m1Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792777481;
	bh=LZqqrES5qVd5SJWh2wPowBAm2gSn1xaWkq61AWtjXtY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I8PBvz1PzA3H6/K1R2Qff3fzON26XIhpBr5X/SHBaDNzkroYscGTYK5dV3AsJEjbS
	 pQDuOUds+A/yrsf/3N8X7lIhBS/q+xzteJ9xBNYCOq7qdAE6Gn8dA0af+Fo64Zhaaa
	 W4/U4V0JOqnBL/xSWHFs4e1kPAHD1Xp1EFwEeSq1m2gUPl9EyVjLMluCcrNzOfPPt/
	 XYMcmKSKyCMt1tFdk9IPER2b2ecdma1Kml/5W2d1f1SI31DzQoTueYwa6+q8GSOD1K
	 Whh5LBzV24TlX9C1ZxX68amQWpJtjBC/FYJxo+MOV+GwLuKFwzcDRhxP7zVRt3WhYz
	 hurqYxGj+hEcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E66E781164;
	Fri, 23 Oct 2026 17:44:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B6637235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 17:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A847540059
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 17:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwceKnB7xzlY for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 17:44:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8FA74401DF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792777477;
 b=Swfm+0CrLVnjzxzCIto1AkgzLAfqkAWtxZ11WS99NqXXCxTG3D5IYf5UI8ym8Mnf2nGF
 4SJPBA6p6ALCEvrr+Sd0IEqmopNro2int1Yn+w7u95UndAPMLUBoL3tqq2wlH4SEfC1a3
 zZzwI9gaQXTGCsTv+lX+c3vtMRs1eRgRc/wCuP19zD48RKigOLoZi/IbTF7hdJsNvB9be
 cXQsGZAFgOEn9As0Dye6pLPL1HZDPxXGJyIs+YFKNFWrny/lULDf0brMD4USwQZO/x9Qi
 P4FaYyjO57KSI+YYVZFdenfvGX0W1/qs1oiJJQwXbl1N3U8c4cLwbjtF5oBA5t9UWOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792777477;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=f5ok2CMxyoHO/jETAYQe//t1IC/VlHMtdQZan3R+UBk=;
 b=RHYomkLc+GMpU8jSO/CLpeeBBvjeH6n04ggJxZD3jp/2IDpwaOXFVC6BtoK+2ge9rE3a
 I1mtjKEIkk/yVFpTgkmPraItB4iww4vZHzwaXrkbxkgyrpY891R4qyzmjL6pMJGe5jsg9
 mwoEaPOX3LEKm8AroZEt9yNQ3ApnEypYb6FemI1AU4q+KkDgl8LtqztHLagRG4rJxzh4v
 oAPZUXsEDVpYRMzDRqX1R6zm1xKElzo8Jd88kgS1XNTNLwvUOdx7YuNjOVCLctENWkD3h
 SDbPcdGESB8SsT677u7bB1BEto72TTx6OZtOxZmn0a+ZuAaIfNtuOl8ZUjyhoWJrmUg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FA74401DF
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 17:44:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 058359C686; Fri, 23 Oct 2026 17:43:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 19:43:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd9c348c227e9560a45caaeaa2cb026a8cf8043d
X-Git-Newrev: c4f9adc6e661d73123e929595deaf0f3c8bb496b
X-Patchwork-Hint: ignore
Message-Id: <20261023174313.058359C686@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/avrdude: bump to version 8.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4f9adc6e661d73123e929595deaf0f3c8bb496b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/avrdudes/avrdude/releases/tag/v8.2
https://github.com/avrdudes/avrdude/releases/tag/v8.3

Drop 0001-CMakeLists.txt-allow-disabling-Python-support.patch: the
upstream pull request [1] was merged, but the option was renamed to
FORCE_DISABLE_PYTHON_SUPPORT, so use that instead of
ENABLE_PYTHON_SUPPORT.

[1] https://github.com/avrdudes/avrdude/pull/2051

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...eLists.txt-allow-disabling-Python-support.patch | 59 ----------------------
 package/avrdude/avrdude.hash                       |  2 +-
 package/avrdude/avrdude.mk                         |  4 +-
 3 files changed, 3 insertions(+), 62 deletions(-)

diff --git a/package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch b/package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch
deleted file mode 100644
index fc6210c099..0000000000
--- a/package/avrdude/0001-CMakeLists.txt-allow-disabling-Python-support.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 41ee27cf1d31bbc62425aab286b7e524acc64bff Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Fri, 29 Aug 2025 22:21:50 +0200
-Subject: [PATCH] CMakeLists.txt: allow disabling Python support
-
-In some cases, even if Swig is found and Python3 is found, it may not
-be desirable to build Python support in avrdude, so this commit adds
-an ENABLE_PYTHON_SUPPORT option to be able to explicitly disable using
-Python support (unfortunately CMake doesn't allow passing arguments
-that would prevent it from finding Swig/Python 3 if available).
-
-To preserve existing behavior, this option defaults to enabled (ON).
-
-Upstream: https://github.com/avrdudes/avrdude/pull/2051
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- CMakeLists.txt | 19 +++++++++++--------
- 1 file changed, 11 insertions(+), 8 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7f3fce92..94263bab 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -34,6 +34,7 @@ option(USE_EXTERNAL_LIBS "Use external libraries from AVRDUDE GitHub repositorie
- option(USE_LIBUSBWIN32 "Prefer libusb-win32 over libusb" OFF)
- option(DEBUG_CMAKE "Enable debugging output for this CMake project" OFF)
- option(BUILD_SHARED_LIBS "Build shared libraries" OFF)
-+option(ENABLE_PYTHON_SUPPORT "Enable Python support" ON)
- 
- if(WIN32)
-     # Prefer static libraries over DLLs on Windows
-@@ -281,14 +282,16 @@ if(HAVE_LINUXGPIO)
- endif()
- 
- # -------------------------------------
--# Find SWIG
--find_package(SWIG 4.0 COMPONENTS python)
--if(SWIG_FOUND)
--  find_package(Python3 COMPONENTS Interpreter Development)
--  if(PYTHON3_FOUND)
--    set(HAVE_SWIG 1)
--  else()
--    message(STATUS "Found SWIG but no Python3 header/library; cannot use SWIG")
-+# Find SWIG/Python3 if needed
-+if(ENABLE_PYTHON_SUPPORT)
-+  find_package(SWIG 4.0 COMPONENTS python)
-+  if(SWIG_FOUND)
-+    find_package(Python3 COMPONENTS Interpreter Development)
-+    if(PYTHON3_FOUND)
-+      set(HAVE_SWIG 1)
-+    else()
-+      message(STATUS "Found SWIG but no Python3 header/library; cannot use SWIG")
-+    endif()
-   endif()
- endif()
- 
--- 
-2.50.1
-
diff --git a/package/avrdude/avrdude.hash b/package/avrdude/avrdude.hash
index 995dad3782..d7ab47d895 100644
--- a/package/avrdude/avrdude.hash
+++ b/package/avrdude/avrdude.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2d3016edd5281ea09627c20b865e605d4f5354fe98f269ce20522a5b910ab399  avrdude-8.1.tar.gz
+sha256  6c6fe3606f2ef331e502fb9c1d418ba09eb9705e811efbe18259025a9787ee3d  avrdude-8.3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 8f451a7fdb..5708fe2017 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-AVRDUDE_VERSION = 8.1
+AVRDUDE_VERSION = 8.3
 AVRDUDE_SITE = $(call github,avrdudes,avrdude,v$(AVRDUDE_VERSION))
 AVRDUDE_LICENSE = GPL-2.0+
 AVRDUDE_LICENSE_FILES = COPYING
 
-AVRDUDE_CONF_OPTS = -DHAVE_LINUXGPIO=ON -DENABLE_PYTHON_SUPPORT=NO
+AVRDUDE_CONF_OPTS = -DHAVE_LINUXGPIO=ON -DFORCE_DISABLE_PYTHON_SUPPORT=ON
 AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 	host-flex host-bison
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
