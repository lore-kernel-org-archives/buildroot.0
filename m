Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4E2D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2131B83F67;
	Tue, 13 Jan 2026 19:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id arFA1MYfwz2P; Tue, 13 Jan 2026 19:41:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53E8D83F33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333299;
	bh=OV2kwELH3BD8t8N9jffecfwh2qx6k2muueAfNcIbedY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QxI+KtyBA1SpIR/O7Ds9+rJKfGU7OVWQMi3AV5FpAfyAk1JmDo9QStfV6J1jjKhgr
	 /rqGYC6xFOCjgqb5IGzZ1yGISD6BHTQG7LFO3RVZurlhaWyWu/zPZk0eqYKDWsLCmQ
	 EULcTYOlYF+Warj26CAvttKYvLLT5UNCxUryoR5oHGdTeFEawif/Bb8TvvT5SxAqIB
	 jw6ByZdsBhMyaHP0J7hotuFKXeOZpq8EyPHuyKsWYwuvqzxMsKFrpcNQqh5vHiFSA5
	 u3FbW1z+34ZYzqNDIJstb4pgmKYt1mSfMV8d8PbfZM1FIrVnKiwrzNTQ94LlC1nZSv
	 a8KpvXq+gLZ5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53E8D83F33;
	Tue, 13 Jan 2026 19:41:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD753231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5FDC406F4
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsuYYinQgFK8 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AFE0406ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AFE0406ED
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09BDD80840; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:22:33 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: c5ef3667014545f492456d1204c971d2429b3d2b
X-Git-Newrev: b8638757b29fee4a2dbcdb4c0ee5cd27dcf67569
X-Patchwork-Hint: ignore
Message-Id: <20260113194035.09BDD80840@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/opencv4: add
 missing Config.in comments on gcc >= 8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b8638757b29fee4a2dbcdb4c0ee5cd27dcf67569
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Commit
75ab6cf93a3ba505897ae99b5ff4bffda55d3c7b ("package/{python-}protobuf:
bump to version 28.1") added a whole bunch of gcc >= 8 dependencies to
opencv4 options, but forgot to create or update appropriate Config.in
comments for several options:

BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
BR2_PACKAGE_OPENCV4_LIB_STITCHING
BR2_PACKAGE_OPENCV4_WITH_PROTOBUF

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 73e9b996fb22205f966bacee4b556afb8afeeb79)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/opencv4/Config.in | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index a553411e1a..8c12b05a73 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -158,9 +158,10 @@ config BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
 	  Include opencv_objdetect (object detection) module into the
 	  OpenCV build.
 
-comment "objdetect needs a glibc or musl toolchain"
+comment "objdetect needs a glibc or musl toolchain w/ gcc 8"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_LIB_PHOTO
 	bool "photo"
@@ -208,9 +209,10 @@ config BR2_PACKAGE_OPENCV4_LIB_STITCHING
 	  Include opencv_stitching (images stitching) module into the
 	  OpenCV build.
 
-comment "stitching needs a glibc or musl toolchain"
+comment "stitching needs a glibc or musl toolchain w/ gcc >= 8"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_OPENCV4_LIB_SUPERRES
 	bool "superres"
@@ -333,6 +335,10 @@ config BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
 	help
 	  Use shared protobuf from the target system.
 
+comment "protobuf support needs a toolchain w/ gcc >= 8"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 config BR2_PACKAGE_OPENCV4_WITH_TBB
 	bool "tbb support"
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # tbb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
