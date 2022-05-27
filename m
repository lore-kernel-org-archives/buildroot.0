Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E3BC433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 08:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D849B61614;
	Fri, 27 May 2022 08:13:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2n-4NM2nj0cD; Fri, 27 May 2022 08:13:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEB3261610;
	Fri, 27 May 2022 08:13:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66F511BF9D1
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27B86412F0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BS2IX-pBId31 for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 08:11:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74F7E412F3
 for <buildroot@buildroot.org>; Fri, 27 May 2022 08:11:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A78C3865C5; Fri, 27 May 2022 08:00:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 10:09:33 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d9ccb9a1d1d41eff92050ffa31d54b97e3892bd9
X-Git-Newrev: af5875c6aa73bbe7fd9b3d7a22da23462ea2cf3f
X-Patchwork-Hint: ignore
Message-Id: <20220527080001.A78C3865C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python-zopfli:
 needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=af5875c6aa73bbe7fd9b3d7a22da23462ea2cf3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

python-zopfli needs C++ since its addition in commit
53972c82964dd1337dff4ccbcdd484d243aef0ba:

nios2-buildroot-linux-gnu-gcc.br_real: error: zopfli/src/zopflipng/lodepng/lodepng.cpp: C++ compiler not installed on this system

Fixes:
 - http://autobuild.buildroot.org/results/442ae4a02e691b4039d1694620f6284906cdc97f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b8152158f8381a7d59c6d33851df9997a3cc0101)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-weasyprint/Config.in | 2 +-
 package/python-zopfli/Config.in     | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/python-weasyprint/Config.in b/package/python-weasyprint/Config.in
index 7fe99c3951..18d72d742e 100644
--- a/package/python-weasyprint/Config.in
+++ b/package/python-weasyprint/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEASYPRINT
 	bool "python-weasyprint"
-	depends on BR2_INSTALL_LIBSTDCPP # python-brotli
+	depends on BR2_INSTALL_LIBSTDCPP # python-brotli, python-zopfli
 	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CSSSELECT2 # runtime
diff --git a/package/python-zopfli/Config.in b/package/python-zopfli/Config.in
index 0b1ebca85c..dc68a2fef0 100644
--- a/package/python-zopfli/Config.in
+++ b/package/python-zopfli/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_PYTHON_ZOPFLI
 	bool "python-zopfli"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Zopfli module for python.
 
 	  https://github.com/fonttools/py-zopfli
+
+comment "python-zopfli needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
