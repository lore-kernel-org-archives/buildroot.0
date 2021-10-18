Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984C7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:21:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E4286103D
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E4286103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1682460817;
	Mon, 18 Oct 2021 19:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9QbhRAqwdsk2; Mon, 18 Oct 2021 19:21:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 657DA608E9;
	Mon, 18 Oct 2021 19:21:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6CB61BF319
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E392140227
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-fOVfQ5WsH0 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:19:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DE9B40185
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:18:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0C0CB874CA; Mon, 18 Oct 2021 19:15:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:16:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 513508de0b15853cb484c16412ffac9926c4cc8c
X-Git-Newrev: 6d7a36e08c0983e92b9e7ba42f49bf8dc945c16a
X-Patchwork-Hint: ignore
Message-Id: <20211018191554.0C0CB874CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv4: bump to version 4.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d7a36e08c0983e92b9e7ba42f49bf8dc945c16a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/opencv/opencv/wiki/ChangeLog#version454

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ne-argument-version-of-SetTotalBytesLimit.patch | 39 ----------------------
 package/opencv4/opencv4.hash                       |  2 +-
 package/opencv4/opencv4.mk                         |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/opencv4/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch b/package/opencv4/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
deleted file mode 100644
index d169e04ef2..0000000000
--- a/package/opencv4/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
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
diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
index b8e38d333a..791ebe3d35 100644
--- a/package/opencv4/opencv4.hash
+++ b/package/opencv4/opencv4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  77f616ae4bea416674d8c373984b20c8bd55e7db887fd38c6df73463a0647bab  opencv4-4.5.3.tar.gz
+sha256  c20bb83dd790fc69df9f105477e24267706715a9d3c705ca1e7f613c7b3bad3d  opencv4-4.5.4.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 040fc63e4e..1859b866dd 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV4_VERSION = 4.5.3
+OPENCV4_VERSION = 4.5.4
 OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
 OPENCV4_INSTALL_STAGING = YES
 OPENCV4_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
