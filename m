Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11959CA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 22:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B8D5841C1;
	Sat, 23 Aug 2025 22:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhtLMWOvEBB6; Sat, 23 Aug 2025 22:11:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4354F841BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4354F841BB;
	Sat, 23 Aug 2025 22:11:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CAA5319C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 22:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B12A5614B9
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 22:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3nN0heHtnxn for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 22:11:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 195876144C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 195876144C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 22:11:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 067148790F; Sat, 23 Aug 2025 22:11:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 00:09:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25918f455c61b487cc29e3cfb8ece0e35db96aa1
X-Git-Newrev: ad75a5d4788cd6018e4f128680ef99b52ba20cd7
X-Patchwork-Hint: ignore
Message-Id: <20250823221146.067148790F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: needs host-cmake >= 3.20
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ad75a5d4788cd6018e4f128680ef99b52ba20cd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit-2882cf4ae649 ("package/wpewebkit: security bump to version
2.48.3") wpewebkit depends on cmake 3.20.
Fixes build on current Debian LTS (bullseye) which has only 3.18.4.

>>> wpewebkit 2.48.3 Configuring
...
CMake Error at CMakeLists.txt:9 (cmake_minimum_required):
  CMake 3.20 or higher is required.  You are running version 3.18.4
-- Configuring incomplete, errors occurred!
make: *** [package/pkg-generic.mk:263: /../buildroot/output/build/wpewebkit-2.48.3/.stamp_configured] Error 1

Fixes: 2882cf4ae649f7d5e9cee72f84e672328f550845
Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
Acked-By: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/wpewebkit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 969590482c..5cbba43792 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -41,6 +41,7 @@ config BR2_PACKAGE_WPEWEBKIT
 	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
 	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
 	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
+	select BR2_HOST_CMAKE_AT_LEAST_3_20
 	select BR2_PACKAGE_CAIRO if BR2_ENDIAN = "BIG"
 	select BR2_PACKAGE_CAIRO_PNG if BR2_ENDIAN = "BIG"
 	select BR2_PACKAGE_HARFBUZZ
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
