Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92107C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4237680E63;
	Sun, 18 May 2025 14:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9ZQu8dXO6Yb; Sun, 18 May 2025 14:54:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7810E81180
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7810E81180;
	Sun, 18 May 2025 14:54:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C416DF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D994404F0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANj9ukpLMtCT for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:54:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E487240A93
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E487240A93
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:54:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D39B487027; Sun, 18 May 2025 14:54:11 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 16:43:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0575a3ab10932a030c0726a8d8bedc2d06b6499c
X-Git-Newrev: 7050c68b5f16899fae5708412313a4c35d9864ff
X-Patchwork-Hint: ignore
Message-Id: <20250518145411.D39B487027@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyproj: propagate
 dependencies from proj
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
