Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2C8C54E58
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 20:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68CC981F04;
	Wed, 20 Mar 2024 20:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMmGFZhcw8mF; Wed, 20 Mar 2024 20:32:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7445081F29
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7445081F29;
	Wed, 20 Mar 2024 20:32:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 668181BF5AE
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52EE1406D1
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 20:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fe4evbHFZij0 for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 20:32:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47051406CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47051406CA
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 20:32:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A51B836DF; Wed, 20 Mar 2024 20:32:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Mar 2024 21:30:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9ef4ed8657cf58d743ada711071303d6f3d800a
X-Git-Newrev: 3d8e92e318c39b9d838ca607a3213c7ed1f69bc0
X-Patchwork-Hint: ignore
Message-Id: <20240320203213.0A51B836DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/osm2pgsql: only supports 64 bits
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3d8e92e318c39b9d838ca607a3213c7ed1f69bc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

osm2pgsql only supports 64 bits architectures since bump to version
1.10.0 in commit e056aeeca9cf8c00c6da62c39979ce6c55c92791 and
https://github.com/osm2pgsql-dev/osm2pgsql/commit/389904269a1b1f246641d203abadfcd5cebb97cc
resulting in the following build failure with arm:

CMake Error at CMakeLists.txt:20 (message):
  osm2pgsql needs a 64 bit architecture

Fixes: e056aeeca9cf8c00c6da62c39979ce6c55c92791
 - http://autobuild.buildroot.org/results/30c2675a732fd810c68dffbb6483f9cf8e4fcbf3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/osm2pgsql/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index c6a38f3180..439309df95 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OSM2PGSQL
 	bool "osm2pgsql"
+	depends on BR2_ARCH_IS_64
 	depends on BR2_INSTALL_LIBSTDCPP # boost, libosmium, protozero
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
@@ -24,9 +25,11 @@ config BR2_PACKAGE_OSM2PGSQL
 	  https://osm2pgsql.org
 
 comment "osm2pgsql needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on BR2_ARCH_IS_64
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "osm2pgsql needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_ARCH_IS_64
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
