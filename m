Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712B4C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:55:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F99660F35
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F99660F35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC0824025C;
	Sun,  8 Aug 2021 09:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSJzTgFgSvLY; Sun,  8 Aug 2021 09:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 433014024B;
	Sun,  8 Aug 2021 09:55:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2B21BF408
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96E7382CA5
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kSJTjVZysZ50 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:55:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2B4982C2E
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:55:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9F7688B8F6; Sun,  8 Aug 2021 09:54:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 11:33:43 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 9f4a31eda47d6feaea1048d6cd80b17003612aef
X-Git-Newrev: fc39b42252c89bffcf2feced8060273e93485eea
X-Patchwork-Hint: ignore
Message-Id: <20210808095442.9F7688B8F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/sysdig: fix C++
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc39b42252c89bffcf2feced8060273e93485eea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Replace libjson by jsoncpp for C++ dependency which was wrongly added
by commit 74fc60a267341879ca71f8eaa64a80f5b5aaf78b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f23129ee1e3ceb2cdbe751efed9faedbfae67d56)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
