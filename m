Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B87CEBF8D
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7FA94125C;
	Mon, 17 Nov 2025 19:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GbQIfwPKYWp; Mon, 17 Nov 2025 19:51:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F6524119E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F6524119E;
	Mon, 17 Nov 2025 19:51:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B7E01BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3428D408CF
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtv5Ii5o7d_o for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DC62408B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DC62408B0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79ACE84905; Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 16:52:14 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 27905d0b972be8e19de9009358689cf6f1457437
X-Git-Newrev: f89b2949906d13a2f11b2ee3f137404ba2ab1715
X-Patchwork-Hint: ignore
Message-Id: <20251117195126.79ACE84905@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bind: security
 bump version to 9.18.41
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

commit: https://git.buildroot.net/buildroot/commit/?id=f89b2949906d13a2f11b2ee3f137404ba2ab1715
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Release notes:
https://ftp.isc.org/isc/bind9/9.18.41/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.41/doc/arm/html/changelog.html

Fixes CVE-2025-8677, CVE-2025-40778 & CVE-2025-40780.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f27a99010f66d1012fbf6f4402113ecc08761436)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 50247bcf37..d601e87b75 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.33/bind-9.18.33.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.41/bind-9.18.41.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  fb373fac5ebbc41c645160afd5a9fb451918f6c0e69ab1d9474154e2b515de40  bind-9.18.33.tar.xz
+sha256  6ddc1d981511c4da0b203b0513af131e5d15e5f1c261145736fe1f35dd1fe79d  bind-9.18.41.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index c4d9047c4e..8b336ab781 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.33
+BIND_VERSION = 9.18.41
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
