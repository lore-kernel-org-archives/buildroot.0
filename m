Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F77C4167B
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 08:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C410A42170;
	Tue, 31 Oct 2023 08:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C410A42170
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4OVAUMfzcW79; Tue, 31 Oct 2023 08:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CC5E42159;
	Tue, 31 Oct 2023 08:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CC5E42159
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 345711BF329
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 08:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D8EF42159
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 08:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D8EF42159
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ke7DyVyC0jDx for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 08:44:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16B2242155
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 08:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16B2242155
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 046B78625B; Tue, 31 Oct 2023 08:44:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 31 Oct 2023 09:43:18 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: d329d67020d101e2d05a011d07f5d3163c450241
X-Git-Newrev: c4f67bf98102e2ad1a338be22231605d97669daf
X-Patchwork-Hint: ignore
Message-Id: <20231031084413.046B78625B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libopenssl:
 security bump to version 3.0.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4f67bf98102e2ad1a338be22231605d97669daf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fixes CVE-2023-5363:
https://www.openssl.org/news/secadv/20231024.txt
https://www.openssl.org/news/vulnerabilities.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 27e2c73d1d..532d8f9aa6 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-3.0.11.tar.gz.sha256
-sha256  b3425d3bb4a2218d0697eb41f7fc0cdede016ed19ca49d168b78e8d947887f55  openssl-3.0.11.tar.gz
+# From https://www.openssl.org/source/openssl-3.0.12.tar.gz.sha256
+sha256  f93c9e8edde5e9166119de31755fc87b4aa34863662f67ddfcba14d0b6b69b61  openssl-3.0.12.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 5ff878dded..7da1c9699a 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.0.11
+LIBOPENSSL_VERSION = 3.0.12
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
