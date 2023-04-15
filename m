Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FF3C77B71
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 11:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1848741D19;
	Sat, 15 Apr 2023 11:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1848741D19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 39AjPkH55548; Sat, 15 Apr 2023 11:52:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5210640B7F;
	Sat, 15 Apr 2023 11:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5210640B7F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3613C1C4004
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 11:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E02540A2E
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 11:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E02540A2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z6QReqGTYQa2 for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 11:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BABE40592
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 11:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BABE40592
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27E5D8408F; Sat, 15 Apr 2023 11:52:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Apr 2023 13:50:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a94014898909f4538b106d21a5399ef7cc3608eb
X-Git-Newrev: 5b4eaa635f32ae6b2f1e1090372844c8c9001bde
X-Patchwork-Hint: ignore
Message-Id: <20230415115232.27E5D8408F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx: change project and download
 URL to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b4eaa635f32ae6b2f1e1090372844c8c9001bde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nginx/Config.in | 2 +-
 package/nginx/nginx.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 406a1c861a..8e888baa1c 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -6,7 +6,7 @@ menuconfig BR2_PACKAGE_NGINX
 	  nginx is an HTTP and reverse proxy server, as well as a mail
 	  proxy server.
 
-	  http://nginx.org/
+	  https://nginx.org/
 
 if BR2_PACKAGE_NGINX
 
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 10cc95d90e..185bcd576f 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NGINX_VERSION = 1.22.1
-NGINX_SITE = http://nginx.org/download
+NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
 NGINX_CPE_ID_VENDOR = f5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
