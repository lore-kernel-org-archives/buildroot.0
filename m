Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABBECA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 13:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA5AA8422C;
	Fri, 29 Aug 2025 13:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id biNJee1CbYtJ; Fri, 29 Aug 2025 13:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEE7D84211
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEE7D84211;
	Fri, 29 Aug 2025 13:12:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA6EDD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0C8861228
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MtmE98VqdUQG for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 13:12:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A4DA60899
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A4DA60899
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:12:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19AC687D68; Fri, 29 Aug 2025 13:12:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 15:11:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f80622f1cc33dc9f845d0fe1272a38788a789e9
X-Git-Newrev: 8964f0652c3dbd3fefa89b23f257404df1b75dc1
X-Patchwork-Hint: ignore
Message-Id: <20250829131220.19AC687D68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: fix sub-option indentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=8964f0652c3dbd3fefa89b23f257404df1b75dc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Config.in comment is between the main BR2_PACKAGE_MARIADB option
and its sub-options, causing the sub-options to not appear as nicely
indented in menuconfig.

Before:

[ ] mariadb
[ ] mariadb server
  [ ] mariadb embedded server

After:

[ ] mariadb
  [ ] mariadb server
    [ ] mariadb embedded server

which is what we want.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mariadb/Config.in b/package/mariadb/Config.in
index acedd1da9d..693b7ce925 100644
--- a/package/mariadb/Config.in
+++ b/package/mariadb/Config.in
@@ -20,11 +20,6 @@ config BR2_PACKAGE_MARIADB
 
 	  http://www.mariadb.org/
 
-comment "mariadb needs a toolchain w/ dynamic library, C++, threads, wchar"
-	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
-
 if BR2_PACKAGE_MARIADB
 
 config BR2_PACKAGE_MARIADB_SERVER
@@ -39,3 +34,8 @@ config BR2_PACKAGE_MARIADB_SERVER_EMBEDDED
 	  Install the mariadb embedded server on the target.
 
 endif
+
+comment "mariadb needs a toolchain w/ dynamic library, C++, threads, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
