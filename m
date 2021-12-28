Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4C2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 163338134B;
	Tue, 28 Dec 2021 21:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hsTPlGerykbs; Tue, 28 Dec 2021 21:02:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6006681328;
	Tue, 28 Dec 2021 21:02:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E255A1BF344
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE63C40586
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fbl4xg5t2Aa0 for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:02:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D18CA400BA
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:02:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B62F482977; Tue, 28 Dec 2021 20:56:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 21:47:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81662cf228290f4abd72243730156baabb8b91c9
X-Git-Newrev: 33de45c0672d44ae544cfb5f56dc60ec809322d3
X-Patchwork-Hint: ignore
Message-Id: <20211228205626.B62F482977@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv3: bump to version 3.4.17
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=33de45c0672d44ae544cfb5f56dc60ec809322d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/opencv/opencv/wiki/ChangeLog#version3417

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ne-argument-version-of-SetTotalBytesLimit.patch | 39 ----------------------
 package/opencv3/opencv3.hash                       |  2 +-
 package/opencv3/opencv3.mk                         |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/opencv3/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch b/package/opencv3/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
deleted file mode 100644
index d169e04ef2..0000000000
--- a/package/opencv3/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 9cfa84313c5833d7295fcf57be93d5d2aaadfd88 Mon Sep 17 00:00:00 2001
-From: Vincent Rabaud <vrabaud@google.com>
-Date: Sat, 10 Jul 2021 00:21:52 +0200
-Subject: [PATCH] Use the one argument version of SetTotalBytesLimit.
-
-The two argument versions has been deprecated, cf
-https://developers.google.com/protocol-buffers/docs/reference/cpp/google.protobuf.io.coded_stream
-
-[Retrieved from:
-https://github.com/opencv/opencv/commit/9cfa84313c5833d7295fcf57be93d5d2aaadfd88]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- modules/dnn/src/caffe/caffe_io.cpp | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/modules/dnn/src/caffe/caffe_io.cpp b/modules/dnn/src/caffe/caffe_io.cpp
-index 2fc4d84f4604..ebecf95eea3a 100644
---- a/modules/dnn/src/caffe/caffe_io.cpp
-+++ b/modules/dnn/src/caffe/caffe_io.cpp
-@@ -92,6 +92,7 @@
- #ifdef HAVE_PROTOBUF
- #include <google/protobuf/io/coded_stream.h>
- #include <google/protobuf/io/zero_copy_stream_impl.h>
-+#include <google/protobuf/stubs/common.h>
- #include <google/protobuf/text_format.h>
- 
- #include <opencv2/core.hpp>
-@@ -1111,7 +1112,11 @@ static const int kProtoReadBytesLimit = INT_MAX;  // Max size of 2 GB minus 1 by
- 
- bool ReadProtoFromBinary(ZeroCopyInputStream* input, Message *proto) {
-     CodedInputStream coded_input(input);
-+#if GOOGLE_PROTOBUF_VERSION >= 3006000
-+    coded_input.SetTotalBytesLimit(kProtoReadBytesLimit);
-+#else
-     coded_input.SetTotalBytesLimit(kProtoReadBytesLimit, 536870912);
-+#endif
- 
-     return proto->ParseFromCodedStream(&coded_input);
- }
diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
index 59af557198..30308188aa 100644
--- a/package/opencv3/opencv3.hash
+++ b/package/opencv3/opencv3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b1e8470b18e9e793bf70b4ae051bbc9bf81fa45f8cbfee1e6c88858c90be8ff7  opencv3-3.4.15.tar.gz
+sha256  1353eec67849aadb20df71d8bae18b83708e18fc5da080fe5efeabb1e99b2ee8  opencv3-3.4.17.tar.gz
 sha256  9076d3d934839a2f8e7bfe549abda6faea4751f1edd6e9460ff703559890ad5f  LICENSE
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index f3511bbcb9..8e4c90786e 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV3_VERSION = 3.4.15
+OPENCV3_VERSION = 3.4.17
 OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
