Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A63CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 15:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4C7B60BAE;
	Fri, 13 Oct 2023 15:06:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4C7B60BAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4vUWhLUPmV3w; Fri, 13 Oct 2023 15:06:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CADCA6F5CB;
	Fri, 13 Oct 2023 15:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CADCA6F5CB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C7A41BF2C1
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B0D260BEE
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 15:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B0D260BEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Rk16z7RKbZk for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 15:05:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32DEA60BC7
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 15:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32DEA60BC7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22EAA847F3; Fri, 13 Oct 2023 15:05:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 17:03:47 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 6ebe613d115e816136e8eef893d97f8ea4c4994c
X-Git-Newrev: 6f71f481f79825713bf3f794f2117dfb9e8a44f0
X-Patchwork-Hint: ignore
Message-Id: <20231013150556.22EAA847F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libmodplug: use a
 full-length hash as version
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f71f481f79825713bf3f794f2117dfb9e8a44f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Commit 369ff9a88ff8 (package/libmodplug: update to git version)
improperly used a short hash as version, so switch to the full-length
hash.

Github use the full-length hash when it creates the top-level directory
of the generated archive, so the hash of the archive does not in fact
change, only its filename. This is perfectly fine fine our handling of
s.b.o.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 80e94c76169fd15d2433b18a9e54d6a4f3c4ff18)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodplug/libmodplug.hash | 2 +-
 package/libmodplug/libmodplug.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmodplug/libmodplug.hash b/package/libmodplug/libmodplug.hash
index 01ff71014c..8aaf500a3a 100644
--- a/package/libmodplug/libmodplug.hash
+++ b/package/libmodplug/libmodplug.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d145910ca10c3ecab0019d45be7e31ea6be1d1ee951ef0e1f747c9752d20f043  libmodplug-d1b97ed.tar.gz
+sha256  d145910ca10c3ecab0019d45be7e31ea6be1d1ee951ef0e1f747c9752d20f043  libmodplug-d1b97ed0020bc620a059d3675d1854b40bd2608d.tar.gz
 sha256  49942e7b3b175f549e751feb08b5270ca6f6c5fb7a1be9f9517db275ec32c92e  COPYING
diff --git a/package/libmodplug/libmodplug.mk b/package/libmodplug/libmodplug.mk
index 735d0e704d..c5d2463fdb 100644
--- a/package/libmodplug/libmodplug.mk
+++ b/package/libmodplug/libmodplug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODPLUG_VERSION = d1b97ed
+LIBMODPLUG_VERSION = d1b97ed0020bc620a059d3675d1854b40bd2608d
 LIBMODPLUG_SITE = $(call github,Konstanty,libmodplug,$(LIBMODPLUG_VERSION))
 LIBMODPLUG_INSTALL_STAGING = YES
 LIBMODPLUG_LICENSE = Public Domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
