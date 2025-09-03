Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F54CA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 17:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3E884216B;
	Wed,  3 Sep 2025 17:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELL0WqBS0FWZ; Wed,  3 Sep 2025 17:24:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E59EE418B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E59EE418B3;
	Wed,  3 Sep 2025 17:24:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C31A92BAA
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 17:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3EA041559
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 17:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEJYfvTUBKiZ for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 17:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECC184062F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECC184062F
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 17:24:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D610F80DF3; Wed,  3 Sep 2025 17:24:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Sep 2025 19:10:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 98399d11ff6afe053a052f867bb0610eaacd52a0
X-Git-Newrev: 5c618d65ff749832801f9c5f5114c9b944d408d2
X-Patchwork-Hint: ignore
Message-Id: <20250903172440.D610F80DF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/re2: bump to version
 2025-08-12
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5c618d65ff749832801f9c5f5114c9b944d408d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- re2 now needs C++17

changelog: https://github.com/google/re2/compare/2024-07-02...2025-08-12

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/re2/Config.in | 2 +-
 package/re2/re2.hash  | 2 +-
 package/re2/re2.mk    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/re2/Config.in b/package/re2/Config.in
index b79e711ad3..acc4bdbe46 100644
--- a/package/re2/Config.in
+++ b/package/re2/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_RE2
 	bool "re2"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # libabseil-cpp
 	select BR2_PACKAGE_LIBABSEIL_CPP
diff --git a/package/re2/re2.hash b/package/re2/re2.hash
index baa3a927c5..25ca9b4896 100644
--- a/package/re2/re2.hash
+++ b/package/re2/re2.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  eb2df807c781601c14a260a507a5bb4509be1ee626024cb45acbd57cb9d4032b  re2-2024-07-02.tar.gz
+sha256  2f3bec634c3e51ea1faf0d441e0a8718b73ef758d7020175ed7e352df3f6ae12  re2-2025-08-12.tar.gz
 sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index 80db4db650..1068e7cc54 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RE2_VERSION = 2024-07-02
+RE2_VERSION = 2025-08-12
 RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
 RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
