Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FB6C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:10:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE1EF60720
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE1EF60720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B428C606F5;
	Fri, 30 Jul 2021 14:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_PRlSjw0X7o; Fri, 30 Jul 2021 14:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED0E6606C0;
	Fri, 30 Jul 2021 14:10:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E0C41BF377
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B2224058C
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2BRA9jBvvfEl for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 14:09:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9220E4055A
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 14:09:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3BF66844CB; Fri, 30 Jul 2021 13:34:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 15:20:21 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 5fb92d0d49cb6ccc7b78b7964b53ad8a317cf89a
X-Git-Newrev: 23da5f059435452c444e04956a2ba414bf490a06
X-Patchwork-Hint: ignore
Message-Id: <20210730133428.3BF66844CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libmodsecurity:
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

commit: https://git.buildroot.net/buildroot/commit/?id=23da5f059435452c444e04956a2ba414bf490a06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
