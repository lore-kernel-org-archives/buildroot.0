Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1305C4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:03:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DE7260FC0
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DE7260FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D76F5400E6;
	Fri, 13 Aug 2021 13:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1v_87wfX3gv0; Fri, 13 Aug 2021 13:03:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C26B40150;
	Fri, 13 Aug 2021 13:03:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 524371BF288
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EBC1600D1
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sdZDWWWnDoDj for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 13:03:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D91DD60640
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 13:03:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6B98787B61; Fri, 13 Aug 2021 13:03:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:03:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d811549b755ac5079dfb1cb06d7d325aeaf462f2
X-Git-Newrev: 4f857798a6f77df260a70343fe23e83a2083e569
X-Patchwork-Hint: ignore
Message-Id: <20210813130302.6B98787B61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymupdf: depend on python3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=4f857798a6f77df260a70343fe23e83a2083e569
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the package documentation, python 3.6 or newer
is needed.

Fixes:
 - http://autobuild.buildroot.net/results/f857986b8c9b6d4a843f3694cae8527760540ed0/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pymupdf/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-pymupdf/Config.in b/package/python-pymupdf/Config.in
index 54714eb3bf..65221d3e51 100644
--- a/package/python-pymupdf/Config.in
+++ b/package/python-pymupdf/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_PYMUPDF
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mupdf -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # mupdf -> harfbuzz
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_MUPDF
 	select BR2_PACKAGE_ZLIB
@@ -13,10 +14,12 @@ config BR2_PACKAGE_PYTHON_PYMUPDF
 	  https://github.com/pymupdf/PyMuPDF
 
 comment "python-pymupdf needs Xorg"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_XORG7
 
 comment "python-pymupdf needs a toolchain w/ C++, gcc >= 4.8"
+	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
