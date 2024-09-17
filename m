Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DBDCAC5A3
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8142E61512;
	Tue, 17 Sep 2024 21:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUL_XSerpM_x; Tue, 17 Sep 2024 21:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CDF761516
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CDF761516;
	Tue, 17 Sep 2024 21:09:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 744751BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80EF860782
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvKxYne9mpnK for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81B266113B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81B266113B
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F60083A68; Tue, 17 Sep 2024 21:09:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 16:55:28 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 72ef77c83664f74ee748631076f34d9746e5e4e2
X-Git-Newrev: c68ffcb55e8ff219bead37b21e81cd35cd87da58
X-Patchwork-Hint: ignore
Message-Id: <20240917210908.6F60083A68@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/botan: needs
 thread support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c68ffcb55e8ff219bead37b21e81cd35cd87da58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Botan commit 313e439c786d68bcf374b2cb0edfe3ffd891db94 added a
dependency to pthread.h. Add a dependency to thread support.

Fixes:
 - http://autobuild.buildroot.org/results/205/205d7505803990508bbd545393902789063ababd

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ad6e6f5d598a9311fc9141e4b9b08820562d1792)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/botan/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index c74128bb9d..c61b368801 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_BOTAN
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	help
@@ -23,7 +24,8 @@ config BR2_PACKAGE_BOTAN
 
 	  http://botan.randombit.net
 
-comment "botan needs a toolchain w/ C++, gcc >= 10"
+comment "botan needs a toolchain w/ threads, C++, gcc >= 10"
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
