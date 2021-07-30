Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E1EC4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:09:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B87A860F9B
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B87A860F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93EB683B7B;
	Fri, 30 Jul 2021 14:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UuYIHmuGp7G6; Fri, 30 Jul 2021 14:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDACC83B6A;
	Fri, 30 Jul 2021 14:09:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F24A1C1170
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F3414055A
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cAFFnpBR2WhJ for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 14:09:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 803CB40589
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 14:09:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 29CA7838DF; Fri, 30 Jul 2021 13:34:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 15:23:34 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 040883a65126067251ea3c50069f9c5b81c8d0da
X-Git-Newrev: d9589d2842ee5bff1f1e359b5ff40d1d3999d427
X-Patchwork-Hint: ignore
Message-Id: <20210730133421.29CA7838DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
 package/nginx-modsecurity: drop unneeded select on pcre
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9589d2842ee5bff1f1e359b5ff40d1d3999d427
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Drop unneeded select on pcre which has been added by commit
d35873ab0ce5921974239354f8c6e1b4ccc6e565

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4f2629973aa762614b137aa7a56f2892ffb34871)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx-modsecurity/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
index 470424a530..b1fcbadd7a 100644
--- a/package/nginx-modsecurity/Config.in
+++ b/package/nginx-modsecurity/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 	depends on BR2_PACKAGE_NGINX_HTTP
 	depends on BR2_INSTALL_LIBSTDCPP # libmodsecurity
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libmodsecurity
-	select BR2_PACKAGE_PCRE # libmodsecurity
 	select BR2_PACKAGE_LIBMODSECURITY
 	help
 	  The ModSecurity-nginx connector is the connection
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
