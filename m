Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471D7E77173
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 21:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4B1E40620;
	Thu,  5 Dec 2024 21:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7ifNORVoqtL; Thu,  5 Dec 2024 21:38:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8418C4061C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8418C4061C;
	Thu,  5 Dec 2024 21:38:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EC031FDB
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 21:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19EF1811E7
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 21:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGcu3zEyBIG8 for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 21:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BDA9811DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BDA9811DB
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 21:38:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC8F586977; Thu,  5 Dec 2024 21:38:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Dec 2024 22:31:07 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 58e5e26cf526d11886c3714a3231f77e27d389b9
X-Git-Newrev: ba8f13e5d7caaa17d473b3532b3819826df6dfe6
X-Patchwork-Hint: ignore
Message-Id: <20241205213812.EC8F586977@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/php: security
 bump to version 8.2.26
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba8f13e5d7caaa17d473b3532b3819826df6dfe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following security issues:

- Heap-Use-After-Free in sapi_read_post_data Processing in CLI SAPI
  Interface
  https://github.com/php/php-src/security/advisories/GHSA-4w77-75f9-2c8w

- CVE-2024-8932: OOB access in ldap_escape
  https://github.com/php/php-src/security/advisories/GHSA-g665-fm4p-vhff

- CVE-2024-8929: [Mysqlnd] Leak partial content of the heap through heap
  buffer over-read
  https://github.com/php/php-src/security/advisories/GHSA-h35g-vwh6-m678

- CVE-2024-11233: Single byte overread with convert.quoted-printable-decode
  filter
  https://github.com/php/php-src/security/advisories/GHSA-r977-prxv-hc43

- CVE-2024-11234: Configuring a proxy in a stream context might allow for
  CRLF injection in URIs
  https://github.com/php/php-src/security/advisories/GHSA-c5f2-jwm7-mmq2

- CVE-2024-11236: Integer overflow in the firebird and dblib quoters causing
  OOB writes
  https://github.com/php/php-src/security/advisories/GHSA-5hqh-c84r-qjcv

Changelog: https://www.php.net/ChangeLog-8.php#8.2.26

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 6615e159b6..788efe39b6 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  330b54876ea1d05ade12ee9726167332058bccd58dffa1d4e12117f6b4f616b9  php-8.2.25.tar.xz
+sha256  54747400cb4874288ad41a785e6147e2ff546cceeeb55c23c00c771ac125c6ef  php-8.2.26.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 372aad916f..be53e13908 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.25
+PHP_VERSION = 8.2.26
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
