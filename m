Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687B2C47258
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12C45437A1;
	Wed, 10 Jan 2024 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12C45437A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1PKVT7y-5zpp; Wed, 10 Jan 2024 20:52:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB1C1437B0;
	Wed, 10 Jan 2024 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB1C1437B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E262B1BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C656343727
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C656343727
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EpS0u1gjoJJt for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:52:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBDDE436EF
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBDDE436EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF74885DB3; Wed, 10 Jan 2024 20:52:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:21:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fe4e29b5ea2c129c123df2d847fc8e04f06e93e
X-Git-Newrev: a51c664ef5130715220b28bfc71df102fb9c0bfc
X-Patchwork-Hint: ignore
Message-Id: <20240110205222.AF74885DB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-brotli: drop C++ depends
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a51c664ef5130715220b28bfc71df102fb9c0bfc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

C++ is no longer required for python-brotli as of version 1.1.0:
https://github.com/google/brotli/commit/c8df4b3049ff1283fc4525defbcd003188f88963

Drop python-brotli C++ depends comment from python-weasyprint
reverse dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
