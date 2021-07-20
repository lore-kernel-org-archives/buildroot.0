Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC413C636C8
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:56:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56285610F7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56285610F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D1CC40282;
	Tue, 20 Jul 2021 21:56:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ndvFdvIA32rU; Tue, 20 Jul 2021 21:56:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 333F140276;
	Tue, 20 Jul 2021 21:56:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5F341BF9B2
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C58EC6062E
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hNH1llV_TFKB for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:56:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13E906058D
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:56:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 971B1886E5; Tue, 20 Jul 2021 21:22:30 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:51:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05610e04b3087a024c7ac67132f3eb0940d62268
X-Git-Newrev: ec2e4722be8cbf2f18964070f1d34baa0362485b
X-Patchwork-Hint: ignore
Message-ID: <20210720212230.971B1886E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx: add stream_set_module
 support
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
Message-ID: <20210720215113.lnMjyanpSmKyaWW8ULgDfXaFWg2l-Zq66JOtJn9Pq-M@z>

commit: https://git.buildroot.net/buildroot/commit/?id=ec2e4722be8cbf2f18964070f1d34baa0362485b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
