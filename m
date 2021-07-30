Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4296C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:09:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9151460F36
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9151460F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F643834F7;
	Fri, 30 Jul 2021 14:09:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l7dyBdbesx7o; Fri, 30 Jul 2021 14:09:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A3C183487;
	Fri, 30 Jul 2021 14:09:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F169D1BF377
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E08E44058C
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r79-OyylE1tG for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 14:09:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 518564055A
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 14:09:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E38F58A29B; Fri, 30 Jul 2021 13:34:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 15:21:09 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 3906569e17e7bf1fdc1d439a78178567d302cdf9
X-Git-Newrev: aa6a494f2d41a2c9d188ece34dd8a53ed76fe7fa
X-Patchwork-Hint: ignore
Message-Id: <20210730133420.E38F58A29B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libmodsecurity:
 drop AC_CHECK_FILE workaround
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa6a494f2d41a2c9d188ece34dd8a53ed76fe7fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Drop AC_CHECK_FILE workaround as it is not needed since version 3.0.4:
https://github.com/SpiderLabs/ModSecurity/commit/8af8cad90779a64af87d29b3a44f3ea2e0a270c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 82f5293d735c19c3cd33dcfdca87ab3be857353b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodsecurity/libmodsecurity.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index a84cd27b34..605f7eb03e 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -14,9 +14,6 @@ LIBMODSECURITY_CPE_ID_VENDOR = trustwave
 LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
 # 0002-test-for-uClinux-in-configure-script.patch
 LIBMODSECURITY_AUTORECONF = YES
-# libinjection uses AC_CHECK_FILE, not available in cross-compile
-LIBMODSECURITY_CONF_ENV = \
-	ac_cv_file_others_libinjection_src_libinjection_html5_c=yes
 
 LIBMODSECURITY_DEPENDENCIES = pcre
 LIBMODSECURITY_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
