Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B24C2BD05
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 09:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CFD581B35;
	Mon, 24 Jun 2024 09:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQ8ttAc0kD3W; Mon, 24 Jun 2024 09:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 914E781B36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 914E781B36;
	Mon, 24 Jun 2024 09:18:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 994111BF48B
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 09:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85B8240494
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 09:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOmznImZLvkg for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 09:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8520440407
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8520440407
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 09:18:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7040B82A9F; Mon, 24 Jun 2024 09:18:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 11:15:28 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 9edaaea06f76f49156a296124450a9c393eebc47
X-Git-Newrev: 583ecdb8b433190e82ea4497b6b75a3f74b8b173
X-Patchwork-Hint: ignore
Message-Id: <20240624091817.7040B82A9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/nut: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=583ecdb8b433190e82ea4497b6b75a3f74b8b173
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

threads are mandantory since bump to version 2.8.2 in commit
4edd837ac0193db83202030ee2997ac811e6bc45 and
https://github.com/networkupstools/nut/commit/ff401e538bcbead62a3532887135518ef9e779df:

In file included from nutipc.cpp:38:
../include/nutipc.hpp:455:3: error: 'pthread_t' does not name a type
  455 |   pthread_t m_impl;
      |   ^~~~~~~~~

Fixes: 4edd837ac0193db83202030ee2997ac811e6bc45
 - http://autobuild.buildroot.org/results/d16a24d60b298d7616a516ec0c6c30696ed93a58

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ddc46ee1a2024ec9eb38718e34ab9aca38a7302b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in | 5 +++--
 package/nut/Config.in      | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index e6d549f81f..5f39507cff 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -430,13 +430,14 @@ config BR2_PACKAGE_COLLECTD_NTPD
 config BR2_PACKAGE_COLLECTD_NUT
 	bool "nut"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_NUT
 	help
 	  The NUT plugin collects uninterruptible power supply (UPS)
 	  statistics using the Network UPS Tools (NUT).
 
-comment "nut needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "nut needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_COLLECTD_OLSRD
 	bool "olsrd"
diff --git a/package/nut/Config.in b/package/nut/Config.in
index df647b9b48..0ecd33d583 100644
--- a/package/nut/Config.in
+++ b/package/nut/Config.in
@@ -1,11 +1,12 @@
-comment "nut needs a toolchain w/ C++"
+comment "nut needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_NUT
 	bool "nut"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Network UPS tools
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
