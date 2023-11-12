Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8785DC4167B
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 13:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5A7740568;
	Sun, 12 Nov 2023 13:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5A7740568
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AIJ-eHN-WSgd; Sun, 12 Nov 2023 13:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5FC9414FA;
	Sun, 12 Nov 2023 13:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5FC9414FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D38711BF377
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 13:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B95E382096
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 13:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B95E382096
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nxa04LDR4PC8 for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 13:08:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B465882036
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 13:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B465882036
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FDCE87060; Sun, 12 Nov 2023 13:08:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Nov 2023 14:07:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82510279b05aebcb2368142fe36e70086cc25a3d
X-Git-Newrev: d23bcbd2bb76fb157624d18e88ce33fd9a964fbe
X-Patchwork-Hint: ignore
Message-Id: <20231112130818.9FDCE87060@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmemcached: force
 CMAKE_BUILD_TYPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=d23bcbd2bb76fb157624d18e88ce33fd9a964fbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
