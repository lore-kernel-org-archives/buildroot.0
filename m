Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D932D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7926560BBA;
	Sun,  7 Dec 2025 17:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWFGHat07Nls; Sun,  7 Dec 2025 17:13:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5E5260BEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765127624;
	bh=TD0y2pc3p0n+y1IXI2vEpSeTrioCuZzaIkmn1y2A2wQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lOMnb8oE/INzjtPmyXPMDxazNqkMvcTaRV845IjJmSTKpo139vvBmZ96n9VlSDfNI
	 3RC/TG59jR2XY3T2dV2D6bfh/6wCCP6eV90iX/NDxn1fDrPdOtaJIuj9y18+wH37pi
	 jrYkG90snfuJ/+j8Lr3ZhxJN1nhP/6jcNQLqP9RCYhUJYY/RdNgubM4LLoX6UdwOIa
	 xojPPsHpgo6XkzMhJXjgYtubrhSXrD4YBtMwtlRZH5hVSVaaceLIxLbT6cieGeTplb
	 sTd4WkQ+9EC0Dexs6A5HnF4HWW2fgfXZL4BBroaAbpFaE9o/Er3XWN3DaCQo+8K65/
	 94uVx4z0cawDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5E5260BEF;
	Sun,  7 Dec 2025 17:13:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 660452CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6C1640437
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4P0Fckc-UfJz for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC70440525
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC70440525
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9E35867FB; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 18:10:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c12266739c52b0754ad1e185307273faa851b0d
X-Git-Newrev: 80f8be48b65cd445b9a30b69235581fc5f437052
X-Patchwork-Hint: ignore
Message-Id: <20251207171336.D9E35867FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/audit: switch SITE to https
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

commit: https://git.buildroot.net/buildroot/commit/?id=80f8be48b65cd445b9a30b69235581fc5f437052
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The http link is broken:

Connecting to people.redhat.com (people.redhat.com)|209.132.178.26|:80...
 failed: No route to host.

No autobuilder error recorded.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
