Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3640C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E38E60A9A;
	Sat, 13 Jan 2024 20:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E38E60A9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVlpp-W__KdL; Sat, 13 Jan 2024 20:33:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE8FC60AD4;
	Sat, 13 Jan 2024 20:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE8FC60AD4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7EE51BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80E6E40983
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80E6E40983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kbchd_Uxpe9a for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:33:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6FEC4096C
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6FEC4096C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A73058605F; Sat, 13 Jan 2024 20:33:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 21:04:08 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 65483f4905fb4b30edb0c45d71dae5d7786c5879
X-Git-Newrev: f788b19bdc57476e52f498fefb2445c60bb36767
X-Patchwork-Hint: ignore
Message-Id: <20240113203307.A73058605F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/python-brotli:
 drop C++ depends
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

commit: https://git.buildroot.net/buildroot/commit/?id=f788b19bdc57476e52f498fefb2445c60bb36767
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

C++ is no longer required for python-brotli as of version 1.1.0:
https://github.com/google/brotli/commit/c8df4b3049ff1283fc4525defbcd003188f88963

Drop python-brotli C++ depends comment from python-weasyprint
reverse dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a51c664ef5130715220b28bfc71df102fb9c0bfc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-brotli/Config.in     | 4 ----
 package/python-weasyprint/Config.in | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/python-brotli/Config.in b/package/python-brotli/Config.in
index c31315392b..ca493bfeff 100644
--- a/package/python-brotli/Config.in
+++ b/package/python-brotli/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_PYTHON_BROTLI
 	bool "python-brotli"
-	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Python bindings for the Brotli compression library.
 
 	  https://github.com/google/brotli
-
-comment "python-brotli needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-weasyprint/Config.in b/package/python-weasyprint/Config.in
index 18d72d742e..65210fb1eb 100644
--- a/package/python-weasyprint/Config.in
+++ b/package/python-weasyprint/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEASYPRINT
 	bool "python-weasyprint"
-	depends on BR2_INSTALL_LIBSTDCPP # python-brotli, python-zopfli
+	depends on BR2_INSTALL_LIBSTDCPP # python-zopfli
 	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CSSSELECT2 # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
