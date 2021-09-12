Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FE2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:39:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 916FC610A6
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 07:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 916FC610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6114F40578;
	Sun, 12 Sep 2021 07:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFza9VqHCPki; Sun, 12 Sep 2021 07:39:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7E8840568;
	Sun, 12 Sep 2021 07:39:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 326C31BF584
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22F1C826B0
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 07:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CIHsyXKauoNI for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 07:39:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69143826AA
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 07:39:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 975F88A3A5; Sun, 12 Sep 2021 07:37:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 09:37:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 287a359090d71298d49a0aceca6e81b3fe068cad
X-Git-Newrev: 0e5a1f7757cbdc0c513e64e0652d7a132a01f092
X-Patchwork-Hint: ignore
Message-Id: <20210912073758.975F88A3A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openjdk: needs host gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e5a1f7757cbdc0c513e64e0652d7a132a01f092
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
