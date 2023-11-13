Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B72C4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 18:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFD4A40133;
	Mon, 13 Nov 2023 18:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFD4A40133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lhWJ0rPOVZo0; Mon, 13 Nov 2023 18:55:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD2F940106;
	Mon, 13 Nov 2023 18:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD2F940106
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 169B11BF228
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 18:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E34AE60D70
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 18:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E34AE60D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4aAo9Sljj-wh for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 18:55:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F47360A9C
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 18:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F47360A9C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DDA6870D1; Mon, 13 Nov 2023 18:55:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Nov 2023 19:53:39 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 83b09400dd2d8c60be7ebab9416d13d8dc1ef57f
X-Git-Newrev: aaee2d9943fa2dcde59d1932a544fc8011952d86
X-Patchwork-Hint: ignore
Message-Id: <20231113185520.0DDA6870D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libmemcached:
 force CMAKE_BUILD_TYPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=aaee2d9943fa2dcde59d1932a544fc8011952d86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Force CMAKE_BUILD_TYPE to Release to avoid the following build failure
with c-icap or php-memcached raised since bump to version 1.1.4 and
switch to cmake-package in commit
7205df8a4f3c729b11a5f0c34885e6cf592f24b9:

Fixes:
 - http://autobuild.buildroot.org/results/bca84915550a72f1dc89c8661cba2545d6bc96ef
 - http://autobuild.buildroot.org/results/b140d225208e7fa44b935a119e74347caf710e55

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: use +=]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d23bcbd2bb76fb157624d18e88ce33fd9a964fbe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmemcached/libmemcached.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libmemcached/libmemcached.mk b/package/libmemcached/libmemcached.mk
index bd63d78c97..f64ab5ec48 100644
--- a/package/libmemcached/libmemcached.mk
+++ b/package/libmemcached/libmemcached.mk
@@ -14,6 +14,10 @@ LIBMEMCACHED_LICENSE = BSD-3-Clause
 LIBMEMCACHED_LICENSE_FILES = LICENSE
 LIBMEMCACHED_CPE_ID_VENDOR = awesome
 
+# Force Release otherwise libraries will be suffixed by -dbg which will raise
+# unexpected build failures with packages that use libmemcached (e.g. c-icap)
+LIBMEMCACHED_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+
 ifeq ($(BR2_PACKAGE_LIBEVENT),y)
 LIBMEMCACHED_DEPENDENCIES += libevent
 LIBMEMCACHED_CONF_OPTS += -DENABLE_MEMASLAP=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
