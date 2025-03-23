Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02530C28B30
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 06:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B03C860A7E;
	Sun, 23 Mar 2025 06:47:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRF9Q-3-6__c; Sun, 23 Mar 2025 06:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6A9560A6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6A9560A6E;
	Sun, 23 Mar 2025 06:47:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B0351C9
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 06:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8089C82047
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 06:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wbonv9TJLhWb for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 06:47:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41E8182045
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41E8182045
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 06:47:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C4D588251; Sun, 23 Mar 2025 06:47:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Mar 2025 07:40:40 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a8f8e3e6580e8cd600cd5b49824ce75879d872c0
X-Git-Newrev: 2b39d1f89ced517c41c23aabee95f5cc2e9d3855
X-Patchwork-Hint: ignore
Message-Id: <20250323064730.2C4D588251@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/php: security
 bump version to 8.2.28
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b39d1f89ced517c41c23aabee95f5cc2e9d3855
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following vulnerabilities:

- CVE-2025-1217: Header parser of `http` stream wrapper does not handle
  folded headers
  https://github.com/php/php-src/security/advisories/GHSA-v8xr-gpvj-cx9g

- CVE-2025-1219: Libxml streams use wrong `content-type` header when
  requesting a redirected resource
  https://github.com/php/php-src/security/advisories/GHSA-p3x9-6h7p-cgfc

- CVE-2025-1734: Streams HTTP wrapper does not fail for headers with invalid
  name and no colon
  https://github.com/php/php-src/security/advisories/GHSA-pcmh-g36c-qc44

- CVE-2025-1736: Stream HTTP wrapper header check might omit basic auth
  header
  https://github.com/php/php-src/security/advisories/GHSA-hgf5-96fm-v528

- CVE-2025-1861: Stream HTTP wrapper truncate redirect location to 1024
  bytes
  https://github.com/php/php-src/security/advisories/GHSA-52jp-hrpf-2jff

Changelog: https://www.php.net/ChangeLog-8.php#8.2.28

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 788efe39b6..7954de6f5e 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  54747400cb4874288ad41a785e6147e2ff546cceeeb55c23c00c771ac125c6ef  php-8.2.26.tar.xz
+sha256  af8c9153153a7f489153b7a74f2f29a5ee36f5cb2c6c6929c98411a577e89c91  php-8.2.28.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index abbe9a799e..fca8d49a81 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.26
+PHP_VERSION = 8.2.28
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
