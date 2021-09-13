Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF655C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 18:06:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E35B60ED7
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 18:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E35B60ED7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68B2680F20;
	Mon, 13 Sep 2021 18:06:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Li6v50uK8xO; Mon, 13 Sep 2021 18:06:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B57EC80ED7;
	Mon, 13 Sep 2021 18:06:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F29D01BF2B9
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 18:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFD7880EB4
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 18:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dvnGOf_1iwxV for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 18:06:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A28380EB2
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 18:06:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0EC0F8A5F2; Mon, 13 Sep 2021 18:04:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 20:06:10 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 963af0c56ec4cd23276933b63711d0c4e517a517
X-Git-Newrev: 84b4f533ce03187ade81f77857d0e5016a4c4af3
X-Patchwork-Hint: ignore
Message-Id: <20210913180449.0EC0F8A5F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/openjdk: needs
 host gcc >= 4.9
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=84b4f533ce03187ade81f77857d0e5016a4c4af3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

openjdk needs host gcc >= 4.9 since bump to version 16.0.1+9 in commit
057e27029c9811ba8cc4922e30cc3878bed98807 and
https://github.com/openjdk/jdk/commit/2a8f92e7e71f7c1ed4010fa31f4b413758c8752a:

configure: Using gcc BuildC compiler version 4.8.5 [cc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-44)]
configure: Using gcc BuildC++ compiler version 4.8.5 [g++ (GCC) 4.8.5 20150623 (Red Hat 4.8.5-44)]
configure: Using gcc build linker version 2.27 [GNU ld version 2.27-44.base.el7]

[...]

g++: error: unrecognized command line option '-std=c++14'

Add a dependency on host gcc >= 4.9 for the OpenJDK 16 version only, so
that users can still use OpenJDK 11 on older distributions.

Fixes:
 - http://autobuild.buildroot.org/results/7072308d148ccb8237180729551df65c87a76f11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: limit the dependency to OpenJDK 16]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0e5a1f7757cbdc0c513e64e0652d7a132a01f092)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index f2b7f5ffd7..a0d04e5725 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_OPENJDK
 	depends on !BR2_STATIC_LIBS # glibc
 	depends on BR2_INSTALL_LIBSTDCPP # cups
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, cups, libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb, C++14 for OpenJDK16
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_USE_MMU # cups
 	depends on BR2_PACKAGE_XORG7
@@ -60,6 +60,10 @@ config BR2_OPENJDK_VERSION_LTS
 
 config BR2_OPENJDK_VERSION_LATEST
 	bool "latest (OpenJDK 16)"
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++14
+
+comment "OpenJDK 16 needs a host gcc >= 4.9"
+	depends on !BR2_HOST_GCC_AT_LEAST_4_9 # C++14
 
 endchoice
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
