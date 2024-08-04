Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A558C3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 20:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A1D0600CB;
	Sun,  4 Aug 2024 20:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WV0neYyCD_HK; Sun,  4 Aug 2024 20:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12C5860607
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12C5860607;
	Sun,  4 Aug 2024 20:37:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 058511BF4DD
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E516C40390
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iU2YgSM8uf2r for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 20:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F046400E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F046400E5
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 20:37:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 842A983E70; Sun,  4 Aug 2024 20:37:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Aug 2024 22:23:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6395fc6e6575d487c4a4404516cc3cb440271e95
X-Git-Newrev: 4398dd7e847d89ec3cff3446643eb0816279a51d
X-Patchwork-Hint: ignore
Message-Id: <20240804203731.842A983E70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpqxx: bump to version 7.9.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4398dd7e847d89ec3cff3446643eb0816279a51d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Requires GCC 8.3 due to the introduction of the charconv header.
However, as there is no BR2_TOOLCHAIN_GCC_AT_LEAST_8_3, we round up to
BR2_TOOLCHAIN_GCC_AT_LEAST_9.

Note the `COPYING` file has changed due to copyright year bumps.

See also: https://github.com/jtv/libpqxx/blob/master/NEWS

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpqxx/Config.in    | 6 +++---
 package/libpqxx/libpqxx.hash | 4 ++--
 package/libpqxx/libpqxx.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libpqxx/Config.in b/package/libpqxx/Config.in
index f5fe2b3807..845692eae6 100644
--- a/package/libpqxx/Config.in
+++ b/package/libpqxx/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBPQXX
 	bool "libpqxx"
 	depends on BR2_PACKAGE_POSTGRESQL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # C++17/charconv
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  libpqxx is the official C++ client API for PostgreSQL, the
@@ -10,8 +10,8 @@ config BR2_PACKAGE_LIBPQXX
 
 	  http://pqxx.org/development/libpqxx/
 
-comment "libpqxx needs toolchain w/ C++, gcc >= 7, threads"
+comment "libpqxx needs toolchain w/ C++, gcc >= 9, threads"
 	depends on BR2_PACKAGE_POSTGRESQL
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 1c0e4c185d..7e13e7415b 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c7dc3e8fa2eee656f2b6a8179d72f15db10e97a80dc4f173f806e615ea990973  libpqxx-7.7.5.tar.gz
-sha256  91718581edafc9f722915133d75f74c82d7c2e41a1831c1e042206423e5a63b0  COPYING
+sha256  e37d5774c39f6c802e32d7f418e88b8e530404fb54758516e884fc0ebdee6da4  libpqxx-7.9.2.tar.gz
+sha256  3dd057a614dd24688aafc38d4c41111140e17147cfd94f314a80af30879641b2  COPYING
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index 434cefd069..c69b77260d 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPQXX_VERSION = 7.7.5
+LIBPQXX_VERSION = 7.9.2
 LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
