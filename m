Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0224FC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 19:58:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A40C960F38
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 19:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A40C960F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B67883B79;
	Wed,  4 Aug 2021 19:58:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id laCu2XUxF-JU; Wed,  4 Aug 2021 19:58:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4F6783B9B;
	Wed,  4 Aug 2021 19:58:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E55F1BF3FB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 19:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DE1B83B9B
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 19:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7oPTVhRuzOX for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 19:58:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D6B683B79
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 19:58:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9B3DB8B6E1; Wed,  4 Aug 2021 19:58:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 21:58:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d56423d3d2308c620e61a952e36999c89e4d682
X-Git-Newrev: f23129ee1e3ceb2cdbe751efed9faedbfae67d56
X-Patchwork-Hint: ignore
Message-Id: <20210804195807.9B3DB8B6E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysdig: fix C++ comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=f23129ee1e3ceb2cdbe751efed9faedbfae67d56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace libjson by jsoncpp for C++ dependency which was wrongly added
by commit 74fc60a267341879ca71f8eaa64a80f5b5aaf78b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sysdig/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 7d3c570392..06d20c7f7b 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SYSDIG
 	bool "sysdig"
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_INSTALL_LIBSTDCPP # libjson
+	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, jq
 	depends on !BR2_STATIC_LIBS # elfutils
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
