Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AFBC02198
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 09:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C625060FA8;
	Tue, 18 Feb 2025 09:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjdJiSq5Rmv2; Tue, 18 Feb 2025 09:05:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD59B60FCA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD59B60FCA;
	Tue, 18 Feb 2025 09:05:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 250AD1D76
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 09:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2FCF4070E
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 09:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKAL87pg-SCn for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 09:05:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C65B4408EC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C65B4408EC
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 09:05:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C1197877AF; Tue, 18 Feb 2025 09:05:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 09:20:06 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 5b924c807d514d4088f10145c55e73d058046e79
X-Git-Newrev: f6a04a112a1c1733c1393ca7261fda709276517e
X-Patchwork-Hint: ignore
Message-Id: <20250218090527.C1197877AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/unbound: security
 bump to version 1.21.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6a04a112a1c1733c1393ca7261fda709276517e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Fixes the following security vulnerability:

CVE-2024-8508: A vulnerability has been discovered in Unbound when handling
replies with very large RRsets that Unbound needs to perform name
compression for.

https://nlnetlabs.nl/downloads/unbound/CVE-2024-8508.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: update pgp key id in hash file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3f98b643fb8a24da71585561758a61dcdb4092d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unbound/unbound.hash | 8 ++++----
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index ba876299c2..d9397f698a 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,8 +1,8 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.21.0.tar.gz.sha256
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.21.1.tar.gz.sha256
 # After checking pgp signature from:
-# https://nlnetlabs.nl/downloads/unbound/unbound-1.21.0.tar.gz.asc
-# with key: EDFAA3F2CA4E6EB05681AF8E9F6F1C2D7E045F8D
-sha256  e7dca7d6b0f81bdfa6fa64ebf1053b5a999a5ae9278a87ef182425067ea14521  unbound-1.21.0.tar.gz
+# https://nlnetlabs.nl/downloads/unbound/unbound-1.21.1.tar.gz.asc
+# with key: 948EB42322C5D00B79340F5DCFF3344D9087A490
+sha256  3036d23c23622b36d3c87e943117bdec1ac8f819636eb978d806416b0fa9ea46  unbound-1.21.1.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index c63311139b..03a5e8e150 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.21.0
+UNBOUND_VERSION = 1.21.1
 UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
 UNBOUND_INSTALL_STAGING = YES
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
