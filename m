Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83FCC2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BEE46072D;
	Sun,  4 Jan 2026 10:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ODoYAJEXbfYS; Sun,  4 Jan 2026 10:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0F04606F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767523515;
	bh=2CuArIhBABy2qE8Y6K9sSKPoiDInE4dctVEgT2NWWz8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kuHZFzK6smzmKYpe/D+K+iCXxDu53nQbA2Cvt7niYpArEH6B/Y4Fg1Fbv7nWifTKB
	 tl7o0jkHXRas4bCmZ6/qRO8X5YdK9bJdvrv+bxjzvb7D1+22AsAgjqpabkrfaKd6Jm
	 +i1mKEJ4tFaa20AjOjj5kFyFQU04epBSyo55QsgWDF5tLfIzsNBV3UWp4DTlUX4JiY
	 S95MxOUtRFAmqb1LAvfqDOFb+Y8z0TLDuho5gP91FVgEzCScbiCLsgzjD9h5U3xqCY
	 murUCkmy907+q+eTcJEWTx2uhD/H/Nq0OsiiHCJmUca00tgoYizvs9c1+6peA+UEvx
	 +5WeVVPGZcGrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0F04606F0;
	Sun,  4 Jan 2026 10:45:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D531249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 443FF40522
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57w3ijuFkUhQ for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60FD94051C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60FD94051C
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:45:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5972C88162; Sun,  4 Jan 2026 10:45:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 11:44:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a9e45fd540358d1491ec02ef8e47e91ac5f46aa
X-Git-Newrev: 4fd7a468af91ce873d948aef1a41d870d3ed025d
X-Patchwork-Hint: ignore
Message-Id: <20260104104513.5972C88162@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/babeltrace2: needs C++
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4fd7a468af91ce873d948aef1a41d870d3ed025d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit cea219e5180e7117a6002c4a784995c9dad48176 bumped the
package to version 2.1.2.
Upstream added a mandatory dependency to c++ in version 2.1.0:
https://github.com/efficios/babeltrace/commit/c20049fd0678f462f621c80f9e91c1ba16e6b656

Fixes:
https://autobuild.buildroot.net/results/a18/a18f8a5561536d0ae649d73e5871d9a7f88275db/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/babeltrace2/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/babeltrace2/Config.in b/package/babeltrace2/Config.in
index a020d4a7cd..f8db47b354 100644
--- a/package/babeltrace2/Config.in
+++ b/package/babeltrace2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BABELTRACE2
 	bool "babeltrace2"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
@@ -24,6 +25,7 @@ config BR2_PACKAGE_BABELTRACE2
 
 	  https://babeltrace.org/
 
-comment "babeltrace2 needs a toolchain w/ wchar, threads"
+comment "babeltrace2 needs a toolchain w/ wchar, threads, C++"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
