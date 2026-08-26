Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F206C61DC4
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 21:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB0E48097B;
	Wed, 26 Aug 2026 21:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEGrungXSKg8; Wed, 26 Aug 2026 21:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787780920;
	bh=NWmlFqYvsEaxNoOe8rcfGPAVC3qIhvDUpZsrNXWQYmg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PGTmdyx5MZprdU1g7yryXjyv9/SFZOscNJDQwywutMxP/t8OpNHGEPhYCMjFrjg25
	 XUhHkKbDLEqyFN9YpWgV2L9UJIYnuW2u4w/xdeQNtAtHqp8yhagWGu7+PY0+yz+LiB
	 EP4qgtkaKoQiyAy2pA0PdO0puSD/zdWwmU8vw9sNlYJujU5dP9R9M0OhxT7+mJ7rI0
	 v+3OIiX035JeVVZNBVny5Ss4eiUuxPtzIBJ8qCR7oJLSBoEfVcj0dOg8YZLzfAf6it
	 oLMyam+TCcnuhcHUEbCfWA5OSx9Fv56hP5V/IMr4tV9qjmtwL+08tHyVMLKMlMLI1O
	 yisd7xrcpZjug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4AC0809BB;
	Wed, 26 Aug 2026 21:48:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF325230
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B58074073D
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6uSGw2OUpa96 for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 21:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FCA7406F3
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:48:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD28C92103; Wed, 26 Aug 2026 21:47:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Aug 2026 23:47:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d21a1ac8868fa6360a123684e21d5cfc772477ae
X-Git-Newrev: 23fd881bdbe9849dc95d3e8e3517b50085309029
X-Patchwork-Hint: ignore
Message-Id: <20260826214742.CD28C92103@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: php: fix test by
 switching to "Debian" filesystem layout
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/23fd881bdbe9849dc95d3e8e3517b50085309029
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit [1] (package/apache: use "Debian" filesystem
layout to fix read-only rootfs) changed the filesystem layout.
This had the effect of installing files to different locations
and breaking the test_php runtime test.

This commit fixes the issue by updating the file paths to their
right locations. The "httpd.conf" was updated by following the
same recipe described in the comment (starting from a config
file as installed by the apache Buildroot package).

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16060152979

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/1006666f67ba2837ba4cf1014186f3b1cc8f3415

Signed-off-by: Julien Olivain <ju.o@free.fr>
Tested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../test_php/rootfs-overlay/etc/apache2/httpd.conf | 22 +++++++++++-----------
 .../apache2/default-site}/htdocs/script.php        |  0
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf b/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf
index 109247514b..75bad163db 100644
--- a/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf
+++ b/support/testing/tests/package/test_php/rootfs-overlay/etc/apache2/httpd.conf
@@ -5,14 +5,14 @@
 # - "ServerName localhost:80" added to remove startup warning,
 # - "AddType application/x-httpd-php .php" added to enable php.
 
-ServerRoot "/usr"
+ServerRoot "/"
 Listen 80
 
-LoadModule authz_core_module modules/mod_authz_core.so
-LoadModule mime_module modules/mod_mime.so
-LoadModule log_config_module modules/mod_log_config.so
-LoadModule unixd_module modules/mod_unixd.so
-LoadModule php_module modules/libphp.so
+LoadModule authz_core_module usr/lib/apache2/modules/mod_authz_core.so
+LoadModule mime_module usr/lib/apache2/modules/mod_mime.so
+LoadModule log_config_module usr/lib/apache2/modules/mod_log_config.so
+LoadModule unixd_module usr/lib/apache2/modules/mod_unixd.so
+LoadModule php_module usr/lib/apache2/modules/libphp.so
 
 <IfModule unixd_module>
 User daemon
@@ -27,8 +27,8 @@ ServerName localhost:80
     Require all denied
 </Directory>
 
-DocumentRoot "/usr/htdocs"
-<Directory "/usr/htdocs">
+DocumentRoot "/usr/share/apache2/default-site/htdocs"
+<Directory "/usr/share/apache2/default-site/htdocs">
     Options Indexes FollowSymLinks
     AllowOverride None
     Require all granted
@@ -38,7 +38,7 @@ DocumentRoot "/usr/htdocs"
     Require all denied
 </Files>
 
-ErrorLog "/var/logs/error_log"
+ErrorLog "var/log/apache2/error_log"
 LogLevel warn
 
 <IfModule log_config_module>
@@ -49,10 +49,10 @@ LogLevel warn
       LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio
     </IfModule>
 
-    CustomLog "/var/logs/access_log" common
+    CustomLog "var/log/apache2/access_log" common
 </IfModule>
 
 <IfModule mime_module>
-    TypesConfig /etc/apache2/mime.types
+    TypesConfig etc/apache2/mime.types
     AddType application/x-httpd-php .php
 </IfModule>
diff --git a/support/testing/tests/package/test_php/rootfs-overlay/usr/htdocs/script.php b/support/testing/tests/package/test_php/rootfs-overlay/usr/share/apache2/default-site/htdocs/script.php
similarity index 100%
rename from support/testing/tests/package/test_php/rootfs-overlay/usr/htdocs/script.php
rename to support/testing/tests/package/test_php/rootfs-overlay/usr/share/apache2/default-site/htdocs/script.php
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
