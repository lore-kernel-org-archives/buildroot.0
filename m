Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AF9C4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 22:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92B8140A47;
	Sun,  3 Dec 2023 22:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92B8140A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RyFVe96_CtlZ; Sun,  3 Dec 2023 22:26:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E47E40A08;
	Sun,  3 Dec 2023 22:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E47E40A08
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13ED31BF3DA
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70C72409E1
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 22:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70C72409E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mgaJwh9FPx8K for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 22:24:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E8CB40A1E
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 22:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E8CB40A1E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DD4B87936; Sun,  3 Dec 2023 22:24:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 3 Dec 2023 22:35:54 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 50abc2e77a249402bdbeef55ed7e64dd3a8641f1
X-Git-Newrev: 37dfdda3211e3fdf35aa6b996604e32755f32d6d
X-Patchwork-Hint: ignore
Message-Id: <20231203222432.1DD4B87936@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libmemcached: fix
 build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=37dfdda3211e3fdf35aa6b996604e32755f32d6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fix the following build failure with gcc 4.8 raised since bump to
version 1.1.4 in commit 7205df8a4f3c729b11a5f0c34885e6cf592f24b9:

/home/buildroot/autobuild/run/instance-0/output-1/build/libmemcached-1.1.4/src/libmemcachedprotocol/ascii_handler.c: In function 'ascii_get_response_handler':
/home/buildroot/autobuild/run/instance-0/output-1/build/libmemcached-1.1.4/src/libmemcachedprotocol/ascii_handler.c:249:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (int x = 0; x < keylen; ++x) {
   ^

Fixes:
 - http://autobuild.buildroot.org/results/202aeec4dda822ac341d8882f84f968a303697c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5eb79ff3b951fb756e17d8a06b5608b179ddbd60)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmemcached/libmemcached.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index f86cdd3bbf..63df8f5c20 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -16,7 +16,9 @@ LIBMEMCACHED_CPE_ID_VENDOR = awesome
 
 # Force Release otherwise libraries will be suffixed by -dbg which will raise
 # unexpected build failures with packages that use libmemcached (e.g. c-icap)
-LIBMEMCACHED_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+LIBMEMCACHED_CONF_OPTS += \
+	-DCMAKE_BUILD_TYPE=Release \
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99"
 
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LIBMEMCACHED_DEPENDENCIES += libevent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
