Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43C6CD11BF
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 12:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F73740639;
	Sat, 23 Mar 2024 12:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UriIvrA2S8u; Sat, 23 Mar 2024 12:13:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6434E4065C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6434E4065C;
	Sat, 23 Mar 2024 12:13:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 559B31BF84C
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F6AC40564
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 12:13:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JpvA3S2WH4oq for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 12:13:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5589840183
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5589840183
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 12:13:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C4DA837D0; Sat, 23 Mar 2024 12:13:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 13:12:05 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 95b8e4bdf4d65d29b3ede9960dad8cfa478a0a07
X-Git-Newrev: c9e64ea52b5aa23afb7d3236fb6e3a564d9ed6af
X-Patchwork-Hint: ignore
Message-Id: <20240323121330.3C4DA837D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/osm2pgsql: only
 supports 64 bits
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9e64ea52b5aa23afb7d3236fb6e3a564d9ed6af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit 3d8e92e318c39b9d838ca607a3213c7ed1f69bc0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
