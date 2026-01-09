Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42074D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFECC83BF3;
	Tue, 13 Jan 2026 19:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRgg1zZpJ-wN; Tue, 13 Jan 2026 19:37:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E65983BF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333033;
	bh=LFs5X0DvdmtbriFySI8W7goj+Mww0qVikwXG5qR7rzc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VoeGBP2C4bwD5JX+nmGw/mDzohl8Tve9ce9JQihh2RfbTa7zzsj0QDS689//wHh89
	 tRGegqOjDeCT3nSsy1qK7maOqTeSicPdZirRKiNzPxopi6aay4LgT85aOVzCk3we/o
	 zAhGoHkFn0dMmu9tOYgdr44PBOCVghavCHme7Veg0lyQf1q2ms7ZZzfHZjWDWpcQgE
	 TvCK6hAn1u/LVg9cvMsfEGklICxLAxg84hVceCPprlF1JoAcjkeYJ3jSclHVrRCv/p
	 GbZUc9HZrK/MR3OpcC3FnUUV8dO9qckiSaKLNMB1EhHnYLcfRSlIWO3cVTD/PzH+eP
	 Z8DblucSIXaJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E65983BF9;
	Tue, 13 Jan 2026 19:37:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FA761C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F21D882E14
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqUM183BViAC for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1EFF82D04
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1EFF82D04
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0ED886E71; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 18:23:16 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b262d3f0582e8437b2ed254ca0f8254b60fd9d1c
X-Git-Newrev: 3edb679ccd2caded8173aa02aeede00a1282b0f7
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.D0ED886E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/opencv4: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=3edb679ccd2caded8173aa02aeede00a1282b0f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
index f71ceba2c5..d9c924a0e8 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -167,9 +167,10 @@ config BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
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
@@ -217,9 +218,10 @@ config BR2_PACKAGE_OPENCV4_LIB_STITCHING
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
@@ -342,6 +344,10 @@ config BR2_PACKAGE_OPENCV4_WITH_PROTOBUF
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
