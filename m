Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD34D0D150
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A090080CB1;
	Wed,  7 Jan 2026 17:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ueCxVDkyBeWo; Wed,  7 Jan 2026 17:46:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC20980CD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808010;
	bh=UJpNcKrnwPm510nJsEyLYGHWotNi+zNff/u7ZbwWrYQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A4dQZ42FiuXs6OsggCCU4jq9hrswsGpHmunngt9gEhQ6mlvbf+LYTfPjVriu+8/Cy
	 kx+uDSZahtQ8uqGMvP9qT42kKjTN9cbHFHN5e/tD+z1f+sQIYD/q9E7RYSqv3wxtj5
	 o2OnmgL8DjwuiiJCK4EsJYIEsPS+f4t9TPufzhH9wy33rXvbVrOhiUxdIV3VZOriY9
	 EXhtwek6VA7KIRV9HhZ3FCvhjWe5NGgEQlHL44CrTUOf8PdIMB6vZsvRT3JKlZ1rt9
	 MCSfI2tulmBpA41Mku3SYkxinNbN+fFhmbEQmiXpALV0EeUBKvUlrbnZBQWXfeSbJ8
	 tz9hTcEO1YV+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC20980CD5;
	Wed,  7 Jan 2026 17:46:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2196625B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55CEB4085E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFgw-nSk5rHY for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 925AC4085F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 925AC4085F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9162888367; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:16:38 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2d40b04b7c799d50d50098a2506d798bef0f36a2
X-Git-Newrev: ddf4033924cd923afc89230d21d19eca55652e5b
X-Patchwork-Hint: ignore
Message-Id: <20260107174640.9162888367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/php: security
 bump to v8.3.29
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ddf4033924cd923afc89230d21d19eca55652e5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

For more information on the release, see:

- https://www.php.net/ChangeLog-8.php#8.3.29
- https://www.php.net/ChangeLog-8.php#8.3.28
- https://www.php.net/ChangeLog-8.php#8.3.27
- https://www.php.net/ChangeLog-8.php#8.3.26
- https://www.php.net/ChangeLog-8.php#8.3.25

Fixes the following security issues:

- CVE-2025-14180

For more information, see:
  - https://github.com/php/php-src/security/advisories/GHSA-8xr5-qppj-gvwj

- CVE-2025-14178

For more information, see:
  - https://github.com/php/php-src/security/advisories/GHSA-h96m-rvf9-jgm2

- CVE-2025-14177

For more information, see:
  - https://github.com/php/php-src/security/advisories/GHSA-3237-qqm7-mfv7

(cherry picked from 15258031791d34692d0784545fae7b0456064d22)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/0006-Sync-headers-installation.patch | 21 +++++----------------
 package/php/php.hash                             |  2 +-
 package/php/php.mk                               |  2 +-
 3 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/package/php/0006-Sync-headers-installation.patch b/package/php/0006-Sync-headers-installation.patch
index da1c6a6e4c..3c4e6b1779 100644
--- a/package/php/0006-Sync-headers-installation.patch
+++ b/package/php/0006-Sync-headers-installation.patch
@@ -22,9 +22,11 @@ systems by installing only what is intended outside of php-src.
 Closes GH-13210
 Closes GH-13213
 
+Upstream: https://github.com/php/php-src/commit/52dba99d47563f38d8ed5f84690a3cb2c1785475
 [Thomas: minor backporting tweaks]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://github.com/php/php-src/commit/52dba99d47563f38d8ed5f84690a3cb2c1785475
+[tperale: xxhash include fixed in https://github.com/php/php-src/commit/be8819259417d63b389eb9ea6c00abd6aeb8e1c6]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 ---
  ext/date/config.w32        |  2 +-
  ext/dom/config.m4          |  2 +-
@@ -190,26 +192,13 @@ index d38b032efd3..bafbd0b9f8d 100644
 -									'php_hash_murmur.h php_hash_xxhash.h');
 +									'php_hash_murmur.h php_hash_xxhash.h php_hash_fnv.h ' +
 +									'php_hash_joaat.h xxhash/xxhash.h');
-diff --git a/ext/hash/php_hash_xxhash.h b/ext/hash/php_hash_xxhash.h
-index a1e8840ce27..ace70deedb0 100644
---- a/ext/hash/php_hash_xxhash.h
-+++ b/ext/hash/php_hash_xxhash.h
-@@ -18,7 +18,7 @@
- #define PHP_HASH_XXHASH_H
- 
- #define XXH_INLINE_ALL 1
--#include "xxhash.h"
-+#include "xxhash/xxhash.h"
- 
- typedef struct {
- 	XXH32_state_t s;
 diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
 index 3cf400fe962..63221eddb0b 100644
 --- a/ext/iconv/config.m4
 +++ b/ext/iconv/config.m4
-@@ -149,7 +149,7 @@ int main(void) {
+@@ -163,7 +163,7 @@ int main(void) {
  
-     PHP_NEW_EXTENSION(iconv, iconv.c, $ext_shared,, [-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1])
+     PHP_NEW_EXTENSION(iconv, iconv.c, $ext_shared,, [-DZEND_ENABLE_STATIC_TSRMLS_CACHE=1 -DICONV_CONST=$php_cv_iconv_const])
      PHP_SUBST(ICONV_SHARED_LIBADD)
 -    PHP_INSTALL_HEADERS([ext/iconv/])
 +    PHP_INSTALL_HEADERS([ext/iconv], [php_iconv.h])
diff --git a/package/php/php.hash b/package/php/php.hash
index dbb130f30b..02ebf1b0f6 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  388ee5fd111097e97bae439bff46aec4ea27f816d3f0c2cb5490a41410d44251  php-8.3.24.tar.xz
+sha256  f7950ca034b15a78f5de9f1b22f4d9bad1dd497114d175cb1672a4ca78077af5  php-8.3.29.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 5460f440cb..37dabdcd1a 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.24
+PHP_VERSION = 8.3.29
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
