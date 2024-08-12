Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5F4C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 09:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACEDD40203;
	Mon, 12 Aug 2024 09:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id an9P-Ynku0e6; Mon, 12 Aug 2024 09:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9167040210
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9167040210;
	Mon, 12 Aug 2024 09:52:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02EAD1BF27C
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2027606A9
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 09:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_ztAHf1-6x4 for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 09:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20A0F60616
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20A0F60616
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 09:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19A3184710; Mon, 12 Aug 2024 09:52:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 11:19:47 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: dc20060f40bd198419d2910ce32668251f50922d
X-Git-Newrev: e81d5d016f263b53440af3266afb1d29e83abfc5
X-Patchwork-Hint: ignore
Message-Id: <20240812095251.19A3184710@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/python-pymupdf:
 drop dependency on X.org
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

commit: https://git.buildroot.net/buildroot/commit/?id=e81d5d016f263b53440af3266afb1d29e83abfc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Now that the mandatory dependency of MuPDF on X.org, we can also drop
this dependency from python-pymupdf.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit edfa6f29785e618b75739b702fc863ee2410908d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pymupdf/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/python-pymupdf/Config.in b/package/python-pymupdf/Config.in
index 3831a25451..7e961689b6 100644
--- a/package/python-pymupdf/Config.in
+++ b/package/python-pymupdf/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_PYTHON_PYMUPDF
 	depends on BR2_INSTALL_LIBSTDCPP # mupdf -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mupdf -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # mupdf -> harfbuzz
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_HOST_SWIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_MUPDF
@@ -13,10 +12,6 @@ config BR2_PACKAGE_PYTHON_PYMUPDF
 
 	  https://github.com/pymupdf/PyMuPDF
 
-comment "python-pymupdf needs Xorg"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_PACKAGE_XORG7
-
 comment "python-pymupdf needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
