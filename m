Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DFBC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:59:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE43B610A0
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE43B610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8975D613D6;
	Thu, 19 Aug 2021 20:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f5876vXYFtOJ; Thu, 19 Aug 2021 20:59:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08DFC6063C;
	Thu, 19 Aug 2021 20:59:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2BB91BF215
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA87B4011D
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HeOH5QVFgOLh for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:59:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D554404D8
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 20:59:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D8F968D5FC; Thu, 19 Aug 2021 20:58:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 22:58:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63943ecf455fabba2b91f5c2a901f220d3975cb4
X-Git-Newrev: 25c092b15b2002400b7175fd4997038ac5c86e9f
X-Patchwork-Hint: ignore
Message-Id: <20210819205817.D8F968D5FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_101916
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=25c092b15b2002400b7175fd4997038ac5c86e9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

heirloom-mailx package fails to build for the SH4 architecture with
optimization enabled with gcc = 11.1.0:
http://autobuild.buildroot.net/results/911/911f5c024834741754102ff1bbb05c4a64c54a0b/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101916

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index fba1589e38..1d0469a13e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -197,6 +197,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101915
 	bool
 	default y if BR2_microblaze
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101916
+# ICE: on SH4: Segmentation fault signal terminated program cc1.
+# This bug still exists in gcc = 11.1.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_101916
+	bool
+	default y if BR2_sh4
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
