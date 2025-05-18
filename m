Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDB0C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5064760F5E;
	Mon, 19 May 2025 11:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBkgWgsQTBPU; Mon, 19 May 2025 11:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68FD271235
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68FD271235;
	Mon, 19 May 2025 11:05:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 806EED4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C6F44117F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4ms8z-8QaSa for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F1F8423D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F1F8423D7
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89F0E82A2E; Mon, 19 May 2025 10:40:10 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 16:43:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0575a3ab10932a030c0726a8d8bedc2d06b6499c
X-Git-Newrev: 7050c68b5f16899fae5708412313a4c35d9864ff
X-Patchwork-Hint: ignore
Message-Id: <20250519104010.89F0E82A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pyproj:
 propagate dependencies from proj
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7050c68b5f16899fae5708412313a4c35d9864ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The python-pyproj package was introduced in
7c65b4484e1ed414496488cf8eb4fe967b10c087, and it selects
BR2_PACKAGE_PROJ, but forgot to propagate its dependencies, so let's
do that.

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PROJ
  Depends on [n]: BR2_INSTALL_LIBSTDCPP [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && BR2_USE_WCHAR [=y]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_PYPROJ [=y] && BR2_PACKAGE_PYTHON3 [=y]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pyproj/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/python-pyproj/Config.in b/package/python-pyproj/Config.in
index ee829d71c5..19bdd82d43 100644
--- a/package/python-pyproj/Config.in
+++ b/package/python-pyproj/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_PYTHON_PYPROJ
 	bool "python-pyproj"
+	depends on BR2_INSTALL_LIBSTDCPP # proj
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # proj
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # proj
+	depends on BR2_USE_WCHAR # proj
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
 	select BR2_PACKAGE_PROJ # runtime
 	help
@@ -7,3 +11,8 @@ config BR2_PACKAGE_PYTHON_PYPROJ
 	  coordinate transformations library).
 
 	  https://github.com/pyproj4/pyproj
+
+comment "python-pyproj needs a toolchain w/ C++, gcc >= 4.7, NPTL, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
