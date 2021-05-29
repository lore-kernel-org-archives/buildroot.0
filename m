Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A4AC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:51:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CF7F6056B
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5CF7F6056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 307874052A;
	Tue,  3 Aug 2021 22:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vY_j3lcq51CR; Tue,  3 Aug 2021 22:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34A8A40518;
	Tue,  3 Aug 2021 22:51:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 023021BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E737240500
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gvl3kdO4lsFZ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 270F44058C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7CCAB843F5; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 May 2021 22:05:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c3ba90d69a37197b688420bf65a506f16897669a
X-Git-Newrev: fb25c95a0b88c63e2b2376a22ee906ca1f714d04
X-Patchwork-Hint: ignore
Message-Id: <20210803210946.7CCAB843F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/strace: xtensa needs
 headers >= 5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb25c95a0b88c63e2b2376a22ee906ca1f714d04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

xtensa support needs user_pt_regs since version 5.6 and
https://github.com/strace/strace/commit/2429c69961e2598902bded9c02dd601b362b66b4

However user_pt_regs is only available since kernel 5.0 and
https://github.com/torvalds/linux/commit/06fbac8e8971f2fa526e189304dd95ee62f39dbe

Fixes:
 - http://autobuild.buildroot.org/results/c6c4fb3b9098c5fc5dbe4415e2a9757fc775b746

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/strace/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/strace/Config.in b/package/strace/Config.in
index 5b33dad392..c394d4c398 100644
--- a/package/strace/Config.in
+++ b/package/strace/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_STRACE
 	bool "strace"
 	# needs at least kernel headers 4.0 on nios2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0 || !BR2_nios2
+	# needs at least kernel headers 5.0 on xtensa
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_xtensa
 	depends on !BR2_nds32 && !BR2_RISCV_32
 	help
 	  A useful diagnostic, instructional, and debugging tool.
@@ -16,3 +18,7 @@ config BR2_PACKAGE_STRACE
 comment "strace needs a toolchain w/ headers >= 4.0 on nios2"
 	depends on BR2_nios2
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
+
+comment "strace needs a toolchain w/ headers >= 5.0 on xtensa"
+	depends on BR2_xtensa
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
