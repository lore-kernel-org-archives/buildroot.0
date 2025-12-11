Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BA9D43345
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A923F80F5F;
	Thu, 11 Dec 2025 19:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mc6DTrVq6_a3; Thu, 11 Dec 2025 19:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C589981097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481405;
	bh=EgUuWi6VE3nirgHgJtruw1TSCegM2+PARNrd9n4MV5A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QY+GS4WUPtAmjVGWZFZs2nQIV37UvoVlOLpmV7fJ+0twblcSDIPyI4KzCEP7kmBhO
	 71m1vcaDwxQYzbDYwT8GWQ1b9T7HkgKfnqoRGid9iMIagTC4SXBnKYg2+jedb641Ln
	 xr3p33U67XTGW7VkpCQ+1xy9bJZktQx12VFDODAgpgmtpdQGJVjAWuFEve5NOFkx20
	 pC8jJqy4G5H1zwoz9H9zdScymauP+G1+jnM1ciE8OsMrzomGwUkVprUqgykhMpdz3J
	 RIPpCC5+JCZ6ys2XGCeZd8+mPSAauDVPprSj+flOadJHJEMjNVbeIchA8gxFBxzn7h
	 OE/Ro0uu6bXLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C589981097;
	Thu, 11 Dec 2025 19:30:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B1772E9
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B9D760592
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JgSTtrkGN_sM for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B63860679
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B63860679
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7ACE786BE8; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:49 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: e63a7375a544273e74d22acbf7a9a8d0e60522b5
X-Git-Newrev: 263adc0ac713a91dd6288a73ea855edf7b5581fc
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.7ACE786BE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/audit: switch
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

commit: https://git.buildroot.net/buildroot/commit/?id=263adc0ac713a91dd6288a73ea855edf7b5581fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

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
