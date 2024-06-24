Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052E9C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B782460B19;
	Mon, 24 Jun 2024 20:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAxhhg6elLRC; Mon, 24 Jun 2024 20:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32B0760B29
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32B0760B29;
	Mon, 24 Jun 2024 20:02:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CAF01BF95F
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19BD581F1F
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8c-klYxMQ6we for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4950A81D72
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4950A81D72
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4664182B63; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:33:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edb5589aebbd63999d0c2595dc31bf18db52fe9a
X-Git-Newrev: 8a90c1b7e268d1a8b22ab4043c3f4e6c788aca0c
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.4664182B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libabseil-cpp: update the patch to
 be applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8a90c1b7e268d1a8b22ab4043c3f4e6c788aca0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the package patch to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-force-position-independent-code.patch             | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/libabseil-cpp/0001-force-position-independent-code.patch b/package/libabseil-cpp/0001-force-position-independent-code.patch
index 6bf46bf0cb..a6ca9c0f0e 100644
--- a/package/libabseil-cpp/0001-force-position-independent-code.patch
+++ b/package/libabseil-cpp/0001-force-position-independent-code.patch
@@ -1,4 +1,4 @@
-From d170b19e500d85381369e379771be8d7816bcc92 Mon Sep 17 00:00:00 2001
+From 832765d12879fabf799dd80af6e8fee9cd298934 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <Aduskett@gmail.com>
 Date: Tue, 21 Jul 2020 13:08:50 -0700
 Subject: [PATCH] force position independent code
@@ -16,17 +16,19 @@ cause relocation errors when shared libraries link against the built static
 libraries.
 
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  CMake/AbseilHelpers.cmake | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/CMake/AbseilHelpers.cmake b/CMake/AbseilHelpers.cmake
-index 86ff9eb..bdb7a89 100644
+index 3bd33ce8718d..7f269bd20c21 100644
 --- a/CMake/AbseilHelpers.cmake
 +++ b/CMake/AbseilHelpers.cmake
-@@ -209,6 +209,8 @@ function(absl_cc_library)
-     set_property(TARGET ${_NAME} PROPERTY CXX_STANDARD ${ABSL_CXX_STANDARD})
-     set_property(TARGET ${_NAME} PROPERTY CXX_STANDARD_REQUIRED ON)
+@@ -292,6 +292,8 @@ Cflags: -I\${includedir}${PC_CFLAGS}\n")
+       target_compile_features(${_NAME} PUBLIC ${ABSL_INTERNAL_CXX_STD_FEATURE})
+     endif()
  
 +    # Without this setting, other programs such as GRPC will fail when linking.
 +    set_property(TARGET ${_NAME} PROPERTY POSITION_INDEPENDENT_CODE ON)
@@ -34,5 +36,5 @@ index 86ff9eb..bdb7a89 100644
      # to have properly named lib files.  This is a no-op when we are not being
      # installed.
 -- 
-2.26.2
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
