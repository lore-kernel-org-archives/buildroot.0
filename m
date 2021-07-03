Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2555AC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:03:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8C3961050
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8C3961050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF0CD42398;
	Wed,  4 Aug 2021 00:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kA3LUWaDk7D2; Wed,  4 Aug 2021 00:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1745423BD;
	Wed,  4 Aug 2021 00:03:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CD491BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0252D40E50
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fotdPKEtAmxL for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BCB94046D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 843298827E; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 21:56:53 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 23f8a58e9a8974be095b8cbca4cb685228e1ac26
X-Git-Newrev: f08975d1e48c697fe334414ca3d3488c79fc6dd5
X-Patchwork-Hint: ignore
Message-Id: <20210803210958.843298827E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/php-geoip: add php8
 build support
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

commit: https://git.buildroot.net/buildroot/commit/?id=f08975d1e48c697fe334414ca3d3488c79fc6dd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a patch that allows php-geoip to compile against php8.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-add-build-support-for-php8.patch          | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/php-geoip/0001-add-build-support-for-php8.patch b/package/php-geoip/0001-add-build-support-for-php8.patch
new file mode 100644
index 0000000000..5672b00ce8
--- /dev/null
+++ b/package/php-geoip/0001-add-build-support-for-php8.patch
@@ -0,0 +1,35 @@
+From 9500f9964a1ef03890376c61f1b17db88753c8e2 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Mon, 28 Jun 2021 12:24:59 -0700
+Subject: [PATCH] add build support for php8
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ php_geoip.h | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/php_geoip.h b/php_geoip.h
+index 2f67cb6..d19d612 100644
+--- a/php_geoip.h
++++ b/php_geoip.h
+@@ -30,6 +30,17 @@ extern zend_module_entry geoip_module_entry;
+ typedef long zend_long;
+ #endif
+ 
++/* Small change to let it build after a major internal change for php8.0
++ * More info:
++ * https://github.com/php/php-src/blob/php-8.0.0/UPGRADING.INTERNALS#L47
++ */
++#if PHP_MAJOR_VERSION >= 8
++# define TSRMLS_DC
++# define TSRMLS_D
++# define TSRMLS_CC
++# define TSRMLS_C
++# endif
++
+ #ifdef PHP_WIN32
+ #define PHP_GEOIP_API __declspec(dllexport)
+ #else
+-- 
+2.31.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
