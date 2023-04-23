Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5C5C77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 09:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34DF741828;
	Sun, 23 Apr 2023 09:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34DF741828
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LAs-kx7iVMOF; Sun, 23 Apr 2023 09:52:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E0BA4181F;
	Sun, 23 Apr 2023 09:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E0BA4181F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DD051BF369
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2568960BA6
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2568960BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2XFWs1BfhROr for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 09:50:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6E3860AD0
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 09:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6E3860AD0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3662843A5; Sun, 23 Apr 2023 09:50:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 11:08:57 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f29a5497f52eaa01d84d59951b0d70f90f0a272c
X-Git-Newrev: 02b2c66ffcd48efa87c0503449d3ed18e32f3860
X-Patchwork-Hint: ignore
Message-Id: <20230423095040.D3662843A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/nginx: change
 project and download URL to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=02b2c66ffcd48efa87c0503449d3ed18e32f3860
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5b4eaa635f32ae6b2f1e1090372844c8c9001bde)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
