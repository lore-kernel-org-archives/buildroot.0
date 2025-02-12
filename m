Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820CBC021A8
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 13:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2410C4250B;
	Wed, 12 Feb 2025 13:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWlNCSlJnUPD; Wed, 12 Feb 2025 13:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D667E4252B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D667E4252B;
	Wed, 12 Feb 2025 13:15:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A1D92194
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 13:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1A20405AC
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 13:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0ZCu_jQJtLB for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 13:15:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39E85400C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39E85400C6
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 13:15:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21C9D87581; Wed, 12 Feb 2025 13:15:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Feb 2025 13:46:09 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6330d1e3aea824db945c6c9d821a293efaf9e2aa
X-Git-Newrev: 29a3e446a988729b872c208baecddb0ef768d830
X-Patchwork-Hint: ignore
Message-Id: <20250212131532.21C9D87581@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libopenssl:
 security bump to version 3.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=29a3e446a988729b872c208baecddb0ef768d830
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following security issues:

CVE-2024-13176: Timing side-channel in ECDSA signature computation
https://openssl-library.org/news/vulnerabilities/index.html#CVE-2024-13176

CVE-2024-12797: RFC7250 handshakes with unauthenticated servers don't abort
as expected
https://openssl-library.org/news/vulnerabilities/index.html#CVE-2024-12797

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index e8940781b7..29b6850edf 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.2.3/openssl-3.2.3.tar.gz.sha256
-sha256  52b5f1c6b8022bc5868c308c54fb77705e702d6c6f4594f99a0df216acf46239  openssl-3.2.3.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.2.4/openssl-3.2.4.tar.gz.sha256
+sha256  b23ad7fd9f73e43ad1767e636040e88ba7c9e5775bfa5618436a0dd2c17c3716  openssl-3.2.4.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index c3796e14ba..3e873a2fa1 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.2.3
+LIBOPENSSL_VERSION = 3.2.4
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
