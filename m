Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D42C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33B0A4166B;
	Sat, 23 Jul 2022 15:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33B0A4166B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZlWvPI_naw9b; Sat, 23 Jul 2022 15:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41E3541665;
	Sat, 23 Jul 2022 15:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41E3541665
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C5AA1BF46A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 541C541669
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 541C541669
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LbHrOK9kh8Nc for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:31:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DC3841665
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DC3841665
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 30DB0846A2; Sat, 23 Jul 2022 15:18:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 17:31:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f1ad4fc93286adaba852c99d6e1c2565b5c4258
X-Git-Newrev: f9536761668f377a02d810a4a2029a692de58cb6
X-Patchwork-Hint: ignore
Message-Id: <20220723151806.30DB0846A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch: add BR2_ARCH_NEEDS_GCC_AT_LEAST_12
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9536761668f377a02d810a4a2029a692de58cb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new symbol will be used by architectures introduced with gcc 12.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in             | 4 ++++
 package/gcc/Config.in.host | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index 26293d4986..442d6b0075 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -313,6 +313,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_10
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_12
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2d9eaef102..4e906acc5b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -51,6 +51,7 @@ config BR2_GCC_VERSION_10_X
 
 config BR2_GCC_VERSION_11_X
 	bool "gcc 11.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 	# powerpc spe support has been deprecated since gcc 8.x.
 	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 	depends on !BR2_powerpc_SPE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
