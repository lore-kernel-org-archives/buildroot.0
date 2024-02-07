Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73D0C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE1B040028;
	Wed,  7 Feb 2024 11:58:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vghCZzsAH_5i; Wed,  7 Feb 2024 11:58:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B251E40931
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B251E40931;
	Wed,  7 Feb 2024 11:58:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6859C1BF2C4
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53B3C40194
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OFy3qSoQJKhP for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:58:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2479B40025
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2479B40025
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:58:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 087798757A; Wed,  7 Feb 2024 11:58:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 12:58:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06dcbdf8ad3d55b92df4bc3ded82c08e21cbb60e
X-Git-Newrev: 650c2b83b515bf6941189b837d87819a901ec901
X-Patchwork-Hint: ignore
Message-Id: <20240207115839.087798757A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ml-dtypes: needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=650c2b83b515bf6941189b837d87819a901ec901
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ebe47e7605c6cde295e209d80690508cfd11ba61 forgot to add C++
dependency resulting in the following build failure:

../output-1/build/python-numpy-1.25.0/meson.build:1:0: ERROR: Unable to detect GNU compiler type:

Fixes:
 - http://autobuild.buildroot.org/results/6f3532598355732b289730fc751e9aebdab4b0e4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ml-dtypes/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-ml-dtypes/Config.in b/package/python-ml-dtypes/Config.in
index 8791564b19..58c218b214 100644
--- a/package/python-ml-dtypes/Config.in
+++ b/package/python-ml-dtypes/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_ML_DTYPES
 	bool "python-ml-dtypes"
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # python-pybind, python-numpy
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # python-numpy
 	depends on BR2_HOST_GCC_AT_LEAST_9 # host-python-numpy
@@ -10,3 +11,9 @@ config BR2_PACKAGE_PYTHON_ML_DTYPES
 	  dtype extensions used in machine learning libraries.
 
 	  https://github.com/jax-ml/ml_dtypes
+
+comment "python-ml-dtypes needs a glibc or musl toolchain w/ C++, gcc >= 9"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
+		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
