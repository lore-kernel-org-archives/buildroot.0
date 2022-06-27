Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDD7C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDC9282BF5;
	Mon, 27 Jun 2022 22:42:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDC9282BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m00u03EVjq8S; Mon, 27 Jun 2022 22:42:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E300482BE5;
	Mon, 27 Jun 2022 22:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E300482BE5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC2021BF9B5
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A195B82BEB
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A195B82BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BjnKU9CReQuM for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:40:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED23982BED
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED23982BED
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 81F02876FE; Mon, 27 Jun 2022 22:28:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 00:35:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a143c012ef1fb21fb1d2761e9cd172285f1b5131
X-Git-Newrev: 3bd30f4a131d368ba3e3e158ae3aec768fe80d68
X-Patchwork-Hint: ignore
Message-Id: <20220627222807.81F02876FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx: replace NGINX_CPE_ID_VENDOR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3bd30f4a131d368ba3e3e158ae3aec768fe80d68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nginx has been replaced by f5 since February 2022:

<cpe-item name="cpe:/a:nginx:nginx:1.18.0" deprecated="true" deprecation_date="2022-02-22T19:26:32.967Z">
      <reference href="https://nginx.org/en/CHANGES-1.18">Change Log</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:nginx:nginx:1.18.0:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:f5:nginx:1.18.0:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Af5%3Anginx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx/nginx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index cff741ee35..ba01c7e016 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -8,7 +8,7 @@ NGINX_VERSION = 1.20.1
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-NGINX_CPE_ID_VENDOR = nginx
+NGINX_CPE_ID_VENDOR = f5
 NGINX_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
