Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6148C77B7C
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82B0141EFA;
	Wed, 25 Jun 2025 17:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWGfM3QQVqAF; Wed, 25 Jun 2025 17:12:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76DD141F12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76DD141F12;
	Wed, 25 Jun 2025 17:12:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 06465154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECE2040111
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHtiAPiVrOqo for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:12:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA27440401
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA27440401
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:12:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AA88843B4; Wed, 25 Jun 2025 17:12:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Jun 2025 19:11:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1ea9a64e68960be7737e641c98c6990a06e72c0
X-Git-Newrev: 5d9551d303c953aa34bad4ae6bc47e56f830dfe0
X-Patchwork-Hint: ignore
Message-Id: <20250625171254.9AA88843B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx-modsecurity: update upstream
 URLs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1131311620016180763=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1131311620016180763==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5d9551d303c953aa34bad4ae6bc47e56f830dfe0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'https://github.com/SpiderLabs/ModSecurity-nginx' now redirects to
'https://github.com/owasp-modsecurity/ModSecurity-nginx', so update our
URLs accordingly.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nginx-modsecurity/Config.in              | 2 +-
 package/nginx-modsecurity/nginx-modsecurity.hash | 2 +-
 package/nginx-modsecurity/nginx-modsecurity.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
index 0bbf05fad9..94f0ff0a45 100644
--- a/package/nginx-modsecurity/Config.in
+++ b/package/nginx-modsecurity/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 	  point between nginx and libmodsecurity
 	  (ModSecurity v3).
 
-	  https://github.com/SpiderLabs/ModSecurity-nginx
+	  https://github.com/owasp-modsecurity/ModSecurity-nginx
 
 comment "nginx-modsecurity needs a toolchain w/ C++, threads, dynamic library"
 	depends on BR2_PACKAGE_NGINX_HTTP
diff --git a/package/nginx-modsecurity/nginx-modsecurity.hash b/package/nginx-modsecurity/nginx-modsecurity.hash
index 698dbc7da6..34e7b87f41 100644
--- a/package/nginx-modsecurity/nginx-modsecurity.hash
+++ b/package/nginx-modsecurity/nginx-modsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v1.0.3/modsecurity-nginx-v1.0.3.tar.gz.sha256
+# From https://github.com/owasp-modsecurity/ModSecurity-nginx/releases/download/v1.0.3/modsecurity-nginx-v1.0.3.tar.gz.sha256
 sha256  ae811c7208ac029cb7a99d6f63e03d3971797607517187f47620df39c1f78add  modsecurity-nginx-v1.0.3.tar.gz
 # Locally calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/nginx-modsecurity/nginx-modsecurity.mk b/package/nginx-modsecurity/nginx-modsecurity.mk
index a00c200469..42a50ca39f 100644
--- a/package/nginx-modsecurity/nginx-modsecurity.mk
+++ b/package/nginx-modsecurity/nginx-modsecurity.mk
@@ -6,7 +6,7 @@
 
 NGINX_MODSECURITY_VERSION = 1.0.3
 NGINX_MODSECURITY_SOURCE = modsecurity-nginx-v$(NGINX_MODSECURITY_VERSION).tar.gz
-NGINX_MODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v$(NGINX_MODSECURITY_VERSION)
+NGINX_MODSECURITY_SITE = https://github.com/owasp-modsecurity/ModSecurity-nginx/releases/download/v$(NGINX_MODSECURITY_VERSION)
 NGINX_MODSECURITY_LICENSE = Apache-2.0
 NGINX_MODSECURITY_LICENSE_FILES = LICENSE
 NGINX_MODSECURITY_DEPENDENCIES = libmodsecurity

--===============1131311620016180763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1131311620016180763==--
