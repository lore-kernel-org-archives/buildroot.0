Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82F1C28B30
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 06:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BA6860A6E;
	Sun, 23 Mar 2025 06:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1SkyMp3sFZsy; Sun, 23 Mar 2025 06:49:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F28760A64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F28760A64;
	Sun, 23 Mar 2025 06:49:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A27A1C9
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 06:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BDFF400FF
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 06:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dxc_9KJbRzUJ for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 06:49:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D3FC40018
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D3FC40018
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 06:49:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79D1188285; Sun, 23 Mar 2025 06:49:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 22 Mar 2025 14:00:31 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 48505536f6c5440334a855dce98e49ab6026f224
X-Git-Newrev: 7379a1e4513d779f59430692ea1fe3d71b628516
X-Patchwork-Hint: ignore
Message-Id: <20250323064939.79D1188285@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/php: security
 bump version to 8.3.19
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7379a1e4513d779f59430692ea1fe3d71b628516
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_3

Release notes: https://news-web.php.net/php.announce/455
"(The 8.3.18 release was skipped due to the erroneous omission of a
non-security related patch.)"

Fixes CVE-2024-11235, CVE-2025-1219, CVE-2025-1736, CVE-2025-1861,
CVE-2025-1734, and CVE-2025-1217.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit befd90b7655804aa30eae494fae6640ff178217c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 8696b234c7..ba9c5bb468 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  6158ee678e698395da13d72c7679a406d2b7554323432f14d37b60ed87d8ccfb  php-8.3.17.tar.xz
+sha256  976e4077dd25bec96b5dfe8938052d243bbd838f95368a204896eff12756545f  php-8.3.19.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index d127154815..374fdb2c69 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.17
+PHP_VERSION = 8.3.19
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
