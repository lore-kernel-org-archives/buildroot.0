Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87A2C47DDF
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 13:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3245B60F5C;
	Fri, 26 Jan 2024 13:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3245B60F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OehdsB1iBjWn; Fri, 26 Jan 2024 13:57:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7775760F4B;
	Fri, 26 Jan 2024 13:57:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7775760F4B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B54321BF59C
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 13:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A5E540150
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 13:57:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A5E540150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tls4XZwfgjjM for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 13:57:52 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E7904014E
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 13:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E7904014E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2612E60003;
 Fri, 26 Jan 2024 13:57:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rTMiK-00A6Jn-1r;
 Fri, 26 Jan 2024 14:57:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 14:57:47 +0100
Message-Id: <20240126135747.2407552-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/darkhttpd: security bump to version 1.15
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

CVE-2024-23770: Local Leak of Authentication Parameter in Process List

CVE-2024-23771: Basic Auth Timing Attack

https://security.opensuse.org/2024/01/22/darkhttpd-basic-auth-issues.html

Notice that CVE-2024-23770 is only documented as a known weakness, not
fixed.

Also change the license logic to use the dedicated COPYING file available
since 1.14:

https://github.com/emikulic/darkhttpd/commit/a8ae2b1de069588cad23d79a5392445ee9590fcd

This license is ISC, not MIT - So adjust DARKHTTPD_LICENSE to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/darkhttpd/darkhttpd.hash | 4 ++--
 package/darkhttpd/darkhttpd.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/darkhttpd/darkhttpd.hash b/package/darkhttpd/darkhttpd.hash
index 188afff767..84a787eeba 100644
--- a/package/darkhttpd/darkhttpd.hash
+++ b/package/darkhttpd/darkhttpd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  e063de9efa5635260c8def00a4d41ec6145226a492d53fa1dac436967670d195  darkhttpd-1.14.tar.gz
-sha256  f002944c9a8516e3346002d39c3e13681306833358c0f3c7781dff1fdb639710  darkhttpd.c
+sha256  ea48cedafbf43186f4a8d1afc99b33b671adee99519658446022e6f63bd9eda9  darkhttpd-1.15.tar.gz
+sha256  1ecf63e8f84fd60ac7215e04195b9a61dcb47176ea65df26547582027f6c1dee  COPYING
diff --git a/package/darkhttpd/darkhttpd.mk b/package/darkhttpd/darkhttpd.mk
index bda08899b8..e13f8f7770 100644
--- a/package/darkhttpd/darkhttpd.mk
+++ b/package/darkhttpd/darkhttpd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-DARKHTTPD_VERSION = 1.14
+DARKHTTPD_VERSION = 1.15
 DARKHTTPD_SITE = $(call github,emikulic,darkhttpd,v$(DARKHTTPD_VERSION))
-DARKHTTPD_LICENSE = MIT
-DARKHTTPD_LICENSE_FILES = darkhttpd.c
+DARKHTTPD_LICENSE = ISC
+DARKHTTPD_LICENSE_FILES = COPYING
 DARKHTTPD_CPE_ID_VENDOR = darkhttpd_project
 
 define DARKHTTPD_BUILD_CMDS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
