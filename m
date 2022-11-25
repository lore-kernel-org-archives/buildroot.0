Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5ABC4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 20:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4774641DF5;
	Fri, 25 Nov 2022 20:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4774641DF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fFzJ_nM6EfRL; Fri, 25 Nov 2022 20:32:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6671741DF3;
	Fri, 25 Nov 2022 20:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6671741DF3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB041BF271
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 20:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 030DB40C86
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 20:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 030DB40C86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M3OtRVnyC_Vf for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 20:32:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2147240640
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 20:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2147240640
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 097E784689; Fri, 25 Nov 2022 20:32:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 21:31:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ade5915c1d65b7653125d1cf6952efdd6113806
X-Git-Newrev: 3d5d447c5d531479ea5fa60ca3231ec91bde5354
X-Patchwork-Hint: ignore
Message-Id: <20221125203244.097E784689@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: fix check-package
 warning
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d5d447c5d531479ea5fa60ca3231ec91bde5354
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

toolchain/Config.in:236: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3381962216

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index e7329c1a1c..4947ab3aae 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -231,13 +231,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_104028
 # https://sourceware.org/bugzilla/show_bug.cgi?id=29621
 config BR2_TOOLCHAIN_HAS_GCC_BUG_107728
 	bool
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_OPTIMIZE_0
 	default y if BR2_microblazebe || BR2_microblazeel \
 		|| BR2_mips || BR2_mipsel \
 		|| BR2_nios2 \
 		|| BR2_or1k \
 		|| BR2_sh
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_OPTIMIZE_0
 
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
