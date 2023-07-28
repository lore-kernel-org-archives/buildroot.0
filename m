Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E589EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FBF24192F;
	Fri, 28 Jul 2023 20:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FBF24192F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yJupRsPCMCHo; Fri, 28 Jul 2023 20:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8198941FBA;
	Fri, 28 Jul 2023 20:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8198941FBA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E2A4D1BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CB23413A3
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CB23413A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66-_HlpUeKYG for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52265416DE
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52265416DE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CF4D83947; Fri, 28 Jul 2023 20:08:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 22:04:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3009095ba8a87a22f55f6b89e42f667487563b94
X-Git-Newrev: 4bb8558d7c004ea4fe183598a7aae15e6bca1b43
X-Patchwork-Hint: ignore
Message-Id: <20230728200820.3CF4D83947@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in: add
 BR2_ARCH_NEEDS_GCC_AT_LEAST_13
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

commit: https://git.buildroot.net/buildroot/commit/?id=4bb8558d7c004ea4fe183598a7aae15e6bca1b43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new symbol will be used by architectures introduced with gcc 13.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in             | 4 ++++
 package/gcc/Config.in.host | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 1c0c400a98..db0d839c79 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -304,6 +304,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 73ecc14398..5c356e7cbd 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -48,6 +48,7 @@ config BR2_GCC_VERSION_11_X
 
 config BR2_GCC_VERSION_12_X
 	bool "gcc 12.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
