Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE173C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63A5D403C8;
	Fri, 22 Jul 2022 07:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63A5D403C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ieU8fyBb43B; Fri, 22 Jul 2022 07:11:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75CE340A09;
	Fri, 22 Jul 2022 07:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75CE340A09
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF8851BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B40A160A7B
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B40A160A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DgauYyU9pCuh for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:09:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F401960AE0
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F401960AE0
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E83B483E37; Fri, 22 Jul 2022 06:55:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 09:08:41 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ec2a21e297a0cab1cc1bb5c2e16476bbab56cd30
X-Git-Newrev: 7a58fd8ffa8bae18efc5004bb3d08d542a221590
X-Patchwork-Hint: ignore
Message-Id: <20220722065547.E83B483E37@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/nginx: replace
 NGINX_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a58fd8ffa8bae18efc5004bb3d08d542a221590
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

nginx has been replaced by f5 since February 2022:

<cpe-item name="cpe:/a:nginx:nginx:1.18.0" deprecated="true" deprecation_date="2022-02-22T19:26:32.967Z">
      <reference href="https://nginx.org/en/CHANGES-1.18">Change Log</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:nginx:nginx:1.18.0:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:f5:nginx:1.18.0:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Af5%3Anginx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3bd30f4a131d368ba3e3e158ae3aec768fe80d68)
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
