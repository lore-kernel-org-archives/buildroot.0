Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533D4C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:17:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10A7D60F8F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10A7D60F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D736B4059E;
	Wed,  4 Aug 2021 00:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BqRGpgADHfCK; Wed,  4 Aug 2021 00:17:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E879340328;
	Wed,  4 Aug 2021 00:17:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E5AB1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB66140E9A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hwrGp1dIFboM for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B87A640EA0
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0E91581469; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:51:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 05610e04b3087a024c7ac67132f3eb0940d62268
X-Git-Newrev: ec2e4722be8cbf2f18964070f1d34baa0362485b
X-Patchwork-Hint: ignore
Message-Id: <20210803211013.0E91581469@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nginx: add
 stream_set_module support
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec2e4722be8cbf2f18964070f1d34baa0362485b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is a new module in 1.20

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx/Config.in | 6 ++++++
 package/nginx/nginx.mk  | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 6ae790a949..1200b2bf4c 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -339,6 +339,12 @@ config BR2_PACKAGE_NGINX_STREAM_REALIP_MODULE
 	help
 	  Enable ngx_stream_realip_module
 
+config BR2_PACKAGE_NGINX_STREAM_SET_MODULE
+	bool "ngx_stream_set_module"
+	default y
+	help
+	  Enable ngx_stream_set_module
+
 config BR2_PACKAGE_NGINX_STREAM_SSL_MODULE
 	bool "ngx_stream_ssl_module"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 36515e67cc..1f996cc613 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -232,6 +232,10 @@ ifeq ($(BR2_PACKAGE_NGINX_STREAM_REALIP_MODULE),y)
 NGINX_CONF_OPTS += --with-stream_realip_module
 endif
 
+ifeq ($(BR2_PACKAGE_NGINX_STREAM_SET_MODULE),)
+NGINX_CONF_OPTS += --without-stream_set_module
+endif
+
 ifeq ($(BR2_PACKAGE_NGINX_STREAM_SSL_MODULE),y)
 NGINX_DEPENDENCIES += openssl
 NGINX_CONF_OPTS += --with-stream_ssl_module
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
