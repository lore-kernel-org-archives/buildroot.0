Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35881E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 13:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE0628487A;
	Sat, 14 Dec 2024 13:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RaenTMIyeQhC; Sat, 14 Dec 2024 13:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05FCF84879
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05FCF84879;
	Sat, 14 Dec 2024 13:40:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E063FCE
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 13:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD59D4194D
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 13:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dZa3y7WAEs7 for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 13:40:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0EA624177F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EA624177F
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EA624177F
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 13:40:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A84F1C0004;
 Sat, 14 Dec 2024 13:40:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tMSNG-00DWrV-2M;
 Sat, 14 Dec 2024 14:40:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 14:39:59 +0100
Message-Id: <20241214134000.3224571-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/subversion: security bump to version
 1.14.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security vulnerabilities:

CVE-2024-46901: mod_dav_svn denial-of-service via control characters in
paths

It has been discovered that the patch for CVE-2013-1968 was incomplete
and unintentionally left mod_dav_svn vulnerable to control characters
in filenames.

https://subversion.apache.org/security/CVE-2024-46901-advisory.txt

Subversion 1.14.4 also fixed a Windows-only vulnerability:
https://subversion.apache.org/security/CVE-2024-45720-advisory.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/subversion/subversion.hash | 4 ++--
 package/subversion/subversion.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index 2710e9e3f3..5950e9dccf 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,5 +1,5 @@
-# From https://www.apache.org/dist/subversion/subversion-1.14.3.tar.bz2.sha512
-sha512  40b172492005fd3b0cd9e457b4444af8ea5d8ff8fc161a9a0c6dc3a7314c6ad4ff75a4676f68a1919ae6273ae03e34d04eba8c1c37b8c0b4ec70d6731b527b41  subversion-1.14.3.tar.bz2
+# From https://www.apache.org/dist/subversion/subversion-1.14.5.tar.bz2.sha512
+sha512  e4800564d0cc68be98f19aa58d89181de83f237f0ccff10824d9237f8c65eb0071f7176ac54e9e8f8ecbf685849bd3e94be48f678f4c23ed6a5fd7fb6edd0321  subversion-1.14.5.tar.bz2
 
 # Locally calculated
 sha256  484aff0cfbb81155a10f903ed756e27e9fc65578c245a295bae295c4bb51eaad  LICENSE
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index bc0b9b45ab..b3daf013f0 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.14.3
+SUBVERSION_VERSION = 1.14.5
 SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = https://downloads.apache.org/subversion
 SUBVERSION_LICENSE = Apache-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
