Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00365D43345
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDC43410B7;
	Thu, 11 Dec 2025 19:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bRFBgWJVD_O; Thu, 11 Dec 2025 19:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E29514107A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481284;
	bh=lNoS4ksGfZgoIxOV2hNF1paQugaMJUMtuA4M1DPS6mw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IeD+3WtMzOTET3ia36pIYgSjyg7AbuOmcA5gQ4IhKn82Jd0UZZZN8fWGYg0bRgjLU
	 Iy7NuHB/O55JxM56uOqxSjKPwhDpjWQ/07nnVK1UonqAUJjKsOF5gernuXKo0kQT1V
	 PwQOxqFunYdtdS7t0eDDuKTs3GcE4dPXOAd6xv05jIxspJUsQU09pOg0BNsukjzQb5
	 yM9CwZDMHY/s82g/2+C/tTCmCOVDukJPrutseGrAzYmKOKaezum4jAVKZjU2CdqnHG
	 A4Jxa1D2Q3vn4MYBUtoYl4HWC967QVrjT9HYeticvJgAh97PQjngPIrgeUQyExVomb
	 CS3KZytlOnJlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E29514107A;
	Thu, 11 Dec 2025 19:28:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E7A5E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4691D40027
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqTFw8wJK855 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08D854008E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08D854008E
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0874086B47; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:22:06 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 081203958b871a677572a6e92fb8f2ab3ee2c6ae
X-Git-Newrev: 8aa28cd0e83effd129c8777b324eef8645207b8c
X-Patchwork-Hint: ignore
Message-Id: <20251211192747.0874086B47@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/audit: switch
 SITE to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=8aa28cd0e83effd129c8777b324eef8645207b8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The http link is broken:

Connecting to people.redhat.com (people.redhat.com)|209.132.178.26|:80...
 failed: No route to host.

No autobuilder error recorded.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 80f8be48b65cd445b9a30b69235581fc5f437052)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/audit/Config.in | 2 +-
 package/audit/audit.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/Config.in b/package/audit/Config.in
index 6e5761533f..e9bdf346da 100644
--- a/package/audit/Config.in
+++ b/package/audit/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_AUDIT
 
 	  Note: The z/OS remote plugin is disabled in this package
 
-	  http://people.redhat.com/sgrubb/audit/
+	  https://people.redhat.com/sgrubb/audit/
 
 comment "audit needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index eb0b74b098..499cf1cee9 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AUDIT_VERSION = 3.1.5
-AUDIT_SITE = http://people.redhat.com/sgrubb/audit
+AUDIT_SITE = https://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
 AUDIT_CPE_ID_VENDOR = linux_audit_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
