Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E7DCA1013
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05292840B0;
	Mon,  8 Sep 2025 10:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93h7_TZ3P8KU; Mon,  8 Sep 2025 10:39:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 269CA842B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 269CA842B8;
	Mon,  8 Sep 2025 10:39:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DFBA1D9
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF79F42B74
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TdI0bY3wFzXA for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D08D42B43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D08D42B43
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B5F483A93; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Sep 2025 17:17:16 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5d35b11416e68df70192f2277659f707f9bb0d10
X-Git-Newrev: 7e83660caecf3f95e6b311669b59a5391ce198a5
X-Patchwork-Hint: ignore
Message-Id: <20250908103908.3B5F483A93@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/wpewebkit: needs
 host-cmake >= 3.20
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7e83660caecf3f95e6b311669b59a5391ce198a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit ad75a5d4788cd6018e4f128680ef99b52ba20cd7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
