Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991CDC28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 14:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E2B24099A;
	Wed, 26 Jan 2022 14:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DfyXrX1k1WaQ; Wed, 26 Jan 2022 14:41:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3005240949;
	Wed, 26 Jan 2022 14:41:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E20721BF577
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 14:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0A4C409EF
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 14:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hStI8CSIDbJV for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 14:40:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E987409B2
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 14:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 50ED1825F5; Wed, 26 Jan 2022 14:33:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 15:39:09 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 98524b449615350a860ccf0b63a106d7742477d7
X-Git-Newrev: ed95b7bbc2b110e19dd97b6a03613b9a51d37288
X-Patchwork-Hint: ignore
Message-Id: <20220126143337.50ED1825F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/nodejs: bump to
 version 14.18.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed95b7bbc2b110e19dd97b6a03613b9a51d37288
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

This bump will fix the following build failure raised since bump of
python3 to version 3.10.1 in commit
25b1fc2898d68ddf2674b14c738045875fc5a2dc:

Please use python3.9 or python3.8 or python3.7 or python3.6 or python3.5 or python2.7.
	/usr/bin/python3.7 ./configure
	/usr/bin/python3.5 ./configure
	/home/peko/autobuild/instance-1/output-1/host/bin/python2.7 ./configure
Node.js configure: Found Python 3.10.1...

https://github.com/nodejs/node/releases/tag/v14.18.2

Fixes:
 - http://autobuild.buildroot.org/results/9e2ebb9c3681ec0485eaa042fa838c8ee62f649b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 06735b085fd595ffc233e48cc5a57f4fa555b02c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 3a4571e8e5..f330757341 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v14.17.6/SHASUMS256.txt
-sha256  3fa1d71adddfab2f5e3e41874b4eddbdf92b65cade4a43922fb1e437afcf89ed  node-v14.18.1.tar.xz
+# From https://nodejs.org/dist/v14.18.2/SHASUMS256.txt
+sha256  3e8a9ce10f8bcd3628eb6dd049f7f03c84ba9219be6f9743e2221154b9cc680b  node-v14.18.2.tar.xz
 
 # Hash for license file
 sha256  b3a67885b5a6ac35e8bbe8190509e41b79b0d9a2e3fbd47186f2ac4727f63be5  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 42ef1baa64..44bf786dfd 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 14.18.1
+NODEJS_VERSION = 14.18.2
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-qemu host-python3 host-nodejs c-ares \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
