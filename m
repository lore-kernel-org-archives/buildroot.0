Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18844606A31D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 19:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eKpsIPoa
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A052607BB;
	Wed, 28 Oct 2026 19:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sv3qblOhwDhV; Wed, 28 Oct 2026 19:42:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3997F6073C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793216545;
	b=CP8XtYTXw6dLzGWozJZ2EnVpQ1Vk+0mRN4WpwKnY/HECXdaqYY1uFexcldftA/sXgSZ6
	 9jMGa4prGdJggVk3bPOLG5Y54rjNgAsUBLjqqa3vCEcY5DuuzoOd6hkYB6Sy3MEjNW2jt
	 nTuRL5cX+waOHIoZGeMvNeWq69PjtTFQH+VdJ0zzyzjL6N84w9YiFPHmVwkvhrFszWD05
	 nVJihHN+vwByKBWk134kOtL45j1Cqs0t+69FrefIrbZ5zy8F2TvllzxZ3zxSEgr5Z8iFx
	 fGWcosb+Lr5GOeFJJjtnGZ2CZGIG2gWw4yCdBvxw29fJuXfO3kTfRSBsQbsoxXMGu6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793216545;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uGg2Wn71RTvszZTtnNFIgfSzSZwsY3LtF2JlLY/j18A=;
	b=NWWr28YbkIGzMHCJPJWmFhlbDmu6N90YcmkIqqazBDeU4st0ROotfjH476gWVUYe9w10
	 2X8f1zJxW3Vu0iMZYZomJ+2/OesDywsHqHh6fu5aHtqfaFzIgg22EHI41U9R8xxXsgYBj
	 odO79gmjYpI44xj1EfDAnz/2T197TQCH4kVAQySvLxXYCVY/G02urLVaXlGMGOeltBbYB
	 YsXpMGe7vLvoYmmWri5h5kGhHjDbg/iEaSHKfgKg3AZZ9xFaOojwBdughaKNsJ7NP6TK+
	 kiHhW1lcPA1UEbNoTq5GIfrbrumKfOeKeI6ouGH9lv8SUcIzMYXPr+DBgEY3HfE2wJA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793216545;
	bh=uGg2Wn71RTvszZTtnNFIgfSzSZwsY3LtF2JlLY/j18A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eKpsIPoakhKYL4i9c8hKnLiy9ellEIRqt55LmV7RKHruwMnZOJXRoUDn44of1KG7R
	 g/bhFZ3T24zjoKfvdmJ7VwXwgFGBl769hGsab4aLekcYuL+4Q1sW3rNAw71DIBtCW4
	 qPElxNAnxXgvvOfYS0sY/4ZZm94dmLRruSixtpVhB7+cjmGUEUEu4dG+fT6XATFluZ
	 YTwugVeFevi2+Ou+qhJLPXWM/lty8a2V0EpV9tn7q+i+A2PzdpUGQM7JphEWhxOPbz
	 3h2FluGEUjFGJOEQHK6mpGDTVmNlFEnK5383l0UQRZed/c9CFOPYGNNCwMCrrUsCqH
	 zxUV+9ZsAnfYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3997F6073C;
	Wed, 28 Oct 2026 19:42:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B6ADF3AF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99442401DF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUodhi8nsWDE for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 19:42:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4F51540059
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793216542;
 b=l7IRhODrcH6iN+27B3O1hS95exO7gZxnBStlM5gsvnq4e/xu8Z0qnfsqX9w8KyTBigBu
 U+Jd+VYuERw5p6r4xOIeeSpqAs3zkGBuaA8s9FRsJg3wPkBnmcXX3i2ZVgHPkWVseFkP9
 WwaN5KByvF5ZM4K7p/NErCusmacI5v2OBmgHqE22DCcFlxP8BR28feK7fLIe62gs7z/Md
 mDTHtfnx9CGDYt9LjR5KJMoRtZIm68/YetUqyss/GFamB6t29CQwe31O3L6r5BS6gJwJ5
 0nPoR+M3mcrn/7aCQ9WUVqj+g7v/2WKB00jPUPqi1Rn6aQPc6aqhZJn4+iOMa7uq7Ng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793216542;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=q4f3czQJVk6r8GPC0D2xwTzW09OJKCMCz9P6TKYKnxQ=;
 b=mhvAAjin54MQWvhxBO5BP78vh8zi0OLQMzT704mdsu3jje/CFopK8StWM97W2s0x3sov
 7EEKsk4HoQwU9NA39wfR0vCa8jPvQRZTHkNWPRQkfLfc+dAXz1T1B1jjJZh+FSRj5ZUmM
 ddU6aj2UM4Ll7oGzvOPW7szOVnsRsYVwUDRIQ2U2p9l3pYId8+dAuxL+22J84RTLfEBv4
 RL0QBNcHB39tvyMoJzVdZ2xXM9VhmbRmxbAQzfHL9gBtEh6CQfRHzvPxAPxQMhPQUf6e3
 KBlxaaoK4ULRdJp4EKup9IdrpR17E+/4TyYMOJoKe0K/ZuP3CWW524jfskXHi+RTTtA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F51540059
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 19:42:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BFB09D23B; Wed, 28 Oct 2026 19:40:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 20:27:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7af7e73ca4b485ba77105d745feaae4fe93cb45d
X-Git-Newrev: 727b904c13bbc2a9a7a530b1f8e47d7d180c2768
X-Patchwork-Hint: ignore
Message-Id: <20261028194055.2BFB09D23B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grpc: security bump version to
 1.84.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/727b904c13bbc2a9a7a530b1f8e47d7d180c2768
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- bump version to 1.84.1 (for details see [1], [2])
- add patch 0004-CMakeLists.txt-fix-grpc-compile-without-third_party-.patch
  to fix compile without extra/third_party downloads

This version contains a fix [3] for the eMudhra intermediate CAs [4].

[1] https://github.com/grpc/grpc/releases/tag/v1.84.0
[2] https://github.com/grpc/grpc/releases/tag/v1.84.1
[3] https://github.com/grpc/grpc/commit/405e6a1c30024ffd688c38f784c34f57e36c4304
[4] https://emudhra.we-have-a-problem.com/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Julien: mark commit as "security" and add links to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...txt-fix-grpc-compile-without-third_party-.patch | 71 ++++++++++++++++++++++
 package/grpc/grpc.hash                             |  2 +-
 package/grpc/grpc.mk                               |  2 +-
 3 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/package/grpc/0004-CMakeLists.txt-fix-grpc-compile-without-third_party-.patch b/package/grpc/0004-CMakeLists.txt-fix-grpc-compile-without-third_party-.patch
new file mode 100644
index 0000000000..8811271511
--- /dev/null
+++ b/package/grpc/0004-CMakeLists.txt-fix-grpc-compile-without-third_party-.patch
@@ -0,0 +1,71 @@
+From de97b2d195bf7b29db119313f4dcdd90b499eecf Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 27 Oct 2026 17:53:21 +0100
+Subject: [PATCH] CMakeLists.txt: fix grpc compile without third_party
+ downloads
+
+- comment out  protobuf_generate_grpc_cpp_with_import_path_correction lines
+  with external dependencies (to fix compile failure because of missing
+  files)
+
+Fixes:
+
+  CMake Error at CMakeLists.txt:601 (file):
+    file COPY cannot find
+    ".../build/host-grpc-1.84.1/third_party/grpc-proto/grpc/channelz/v1/channelz.proto":
+    No such file or directory.
+  Call Stack (most recent call first):
+    CMakeLists.txt:710 (protobuf_generate_grpc_cpp_with_import_path_correction)
+
+  CMake Error at CMakeLists.txt:601 (file):
+    file COPY cannot find
+    ".../build/host-grpc-1.84.1/third_party/grpc-proto/grpc/reflection/v1/reflection.proto":
+    No such file or directory.
+  Call Stack (most recent call first):
+    CMakeLists.txt:713 (protobuf_generate_grpc_cpp_with_import_path_correction)
+
+  CMake Error at CMakeLists.txt:601 (file):
+    file COPY cannot find
+    ".../build/host-grpc-1.84.1/third_party/grpc-proto/grpc/reflection/v1alpha/reflection.proto":
+    No such file or directory.
+  Call Stack (most recent call first):
+    CMakeLists.txt:716 (protobuf_generate_grpc_cpp_with_import_path_correction)
+
+Upstream: N/A Buildroot specific.
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ CMakeLists.txt | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 44bf4d2972..36c37b8cb4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -707,15 +707,15 @@ protobuf_generate_grpc_cpp_with_import_path_correction(
+ protobuf_generate_grpc_cpp_with_import_path_correction(
+   src/proto/grpc/lookup/v1/rls_config.proto src/proto/grpc/lookup/v1/rls_config.proto
+ )
+-protobuf_generate_grpc_cpp_with_import_path_correction(
+-  third_party/grpc-proto/grpc/channelz/v1/channelz.proto grpc/channelz/v1/channelz.proto
+-)
+-protobuf_generate_grpc_cpp_with_import_path_correction(
+-  third_party/grpc-proto/grpc/reflection/v1/reflection.proto grpc/reflection/v1/reflection.proto
+-)
+-protobuf_generate_grpc_cpp_with_import_path_correction(
+-  third_party/grpc-proto/grpc/reflection/v1alpha/reflection.proto grpc/reflection/v1alpha/reflection.proto
+-)
++#protobuf_generate_grpc_cpp_with_import_path_correction(
++#  third_party/grpc-proto/grpc/channelz/v1/channelz.proto grpc/channelz/v1/channelz.proto
++#)
++#protobuf_generate_grpc_cpp_with_import_path_correction(
++#  third_party/grpc-proto/grpc/reflection/v1/reflection.proto grpc/reflection/v1/reflection.proto
++#)
++#protobuf_generate_grpc_cpp_with_import_path_correction(
++#  third_party/grpc-proto/grpc/reflection/v1alpha/reflection.proto grpc/reflection/v1alpha/reflection.proto
++#)
+ 
+ # This enables CMake to build the project without requiring submodules
+ # in the third_party directory as long as test builds are disabled.
+-- 
+2.56.0
+
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 42b1120c8a..5adc16927e 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  60caa8397426d8a500e3e57ab6a49d1cb5aa62a36f2591eb9da3d77fa38ad8c9  grpc-1.83.1.tar.gz
+sha256  e3cd1dbeedc989a6bf863bc1f0762a7cd1feff5cfae7d520481a541ad23ca85e  grpc-1.84.1.tar.gz
 sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index d504eeb992..c6057674a6 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.83.1
+GRPC_VERSION = 1.84.1
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
