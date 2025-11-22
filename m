Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D37CFC51F
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 16:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53F8281422;
	Sat, 22 Nov 2025 16:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TcoTOGE9MQCx; Sat, 22 Nov 2025 16:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BA598142B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BA598142B;
	Sat, 22 Nov 2025 16:09:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 171B2158
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14DF2606AA
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oan7oxp4X5sD for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 16:09:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24B48606A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24B48606A7
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 16:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15C2985DF1; Sat, 22 Nov 2025 16:09:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 17:00:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfa0e6e7f79799c4349e641360aadec76ed38818
X-Git-Newrev: 3e51fca55f74cd6ec6cd01ff42219ba91e504804
X-Patchwork-Hint: ignore
Message-Id: <20251122160952.15C2985DF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-yaml: bump version to 2.3.0
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
Content-Type: multipart/mixed; boundary="===============4365449378788266040=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4365449378788266040==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3e51fca55f74cd6ec6cd01ff42219ba91e504804
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://pecl.php.net/package-changelog.php?package=yaml

Since Buildroot commit [1] (package/php: bump version to 8.4.13)
php-yaml is failing to build with errors such as:

    /buildroot/output/build/php-yaml-2.2.3/parse.c: In function ‘handle_sequence’:
    /buildroot/output/build/php-yaml-2.2.3/parse.c:534:39: error: passing argument 1 of ‘zval_ptr_dtor’ from incompatible pointer type [-Wincompatible-pointer-types]

This commits fixes the issue.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a9e5cf6ac2cb7ba62d23c842899b3f7816eca14c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add commit log info about build failure]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php-yaml/php-yaml.hash | 2 +-
 package/php-yaml/php-yaml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-yaml/php-yaml.hash b/package/php-yaml/php-yaml.hash
index 4fa5dfbc16..796e654659 100644
--- a/package/php-yaml/php-yaml.hash
+++ b/package/php-yaml/php-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5937eb9722ddf6d64626799cfa024598ff2452ea157992e4e67331a253f90236  yaml-2.2.3.tgz
+sha256  bc8404807a3a4dc896b310af21a7f8063aa238424ff77f27eb6ffa88b5874b8a  yaml-2.3.0.tgz
 sha256  68d9700294396c72089bfc7bf38a5b3654a53ae415f3bd37768848c14e86f338  LICENSE
diff --git a/package/php-yaml/php-yaml.mk b/package/php-yaml/php-yaml.mk
index e825e3146f..440b07afe4 100644
--- a/package/php-yaml/php-yaml.mk
+++ b/package/php-yaml/php-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_YAML_VERSION = 2.2.3
+PHP_YAML_VERSION = 2.3.0
 PHP_YAML_SOURCE = yaml-$(PHP_YAML_VERSION).tgz
 PHP_YAML_SITE = https://pecl.php.net/get
 PHP_YAML_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \

--===============4365449378788266040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4365449378788266040==--
