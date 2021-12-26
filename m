Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F479C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 10:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBCEC40966;
	Sun, 26 Dec 2021 10:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_R05xx4ZEEs; Sun, 26 Dec 2021 10:46:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D261441573;
	Sun, 26 Dec 2021 10:46:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 93E2E1BF476
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82AC660D70
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MAJhX6WXZT2C for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 10:46:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABA3360D6C
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:46:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0EF9682A91; Sun, 26 Dec 2021 10:40:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 11:46:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e4c2d6213a09e9a0c598f800510acd6687ffcda
X-Git-Newrev: 790abe41827d6ca705fa3c39101728e5d98f57d4
X-Patchwork-Hint: ignore
Message-Id: <20211226104044.0EF9682A91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-libust: fix legal-info
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

commit: https://git.buildroot.net/buildroot/commit/?id=790abe41827d6ca705fa3c39101728e5d98f57d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

COPYING has been removed since version 2.13.0 and
https://github.com/lttng/lttng-ust/commit/c0c0989ab70574e09b2f7e8b48c2da6af664a849
resulting in the following build failure since bump to version 2.13.1 in
commit 733bf73e3ff86dd80e68e22c0ccc2f43e4a3d475:

ERROR: COPYING has wrong sha256 hash:
ERROR: expected: 74125a84c2166300776980166e29de40d5f98d1a75e487f0bbc0c03b4cd2342e
ERROR: got     :

So use the new license files, add BSD-3-Clause (which was added in
version 2.13.0 and
https://github.com/lttng/lttng-ust/commit/d8621b3ea82b7fc1937b0eefb2b1316b2ce361a5)
and don't add BSD-2-Clause and GPL-3.0+ as tests are disabled

Fixes:
 - http://autobuild.buildroot.org/results/470d6401f2a97f4ac91b2d8cfb1af90b638320a9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-libust/lttng-libust.hash | 8 ++++++--
 package/lttng-libust/lttng-libust.mk   | 4 ++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 23839e42cc..42f2b372dc 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,5 +1,9 @@
 # From https://lttng.org/files/lttng-ust/lttng-ust-2.13.2.tar.bz2.sha256
 sha256  5667bf0269e1e62e2d9cb974c456ff86e0401bd7aa3bfc8d5fdb97233249eddc  lttng-ust-2.13.1.tar.bz2
 
-# Hash for license file
-sha256  74125a84c2166300776980166e29de40d5f98d1a75e487f0bbc0c03b4cd2342e  COPYING
+# Hash for license files
+sha256  5b52242fd2045d62dd664c8358137b46c1e08efdba674c91cbfc06585efe1ce7  LICENSE
+sha256  f206ce02ddf94d03120b58381064702729a0e6cbb03cafc84dc0e434ce5689fa  LICENSES/BSD-3-Clause
+sha256  6841c85b94f9dab319356e3aaf9e969fcedad51d3aaadf665bf86f34f4186b62  LICENSES/GPL-2.0
+sha256  d72921266bc8452a8789f8a04a82755373990d00b7e0b0f1a8edb8f854e94d1c  LICENSES/LGPL-2.1
+sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/MIT
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index e3e1cdebf2..690d18fe3d 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -7,8 +7,8 @@
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
 LTTNG_LIBUST_VERSION = 2.13.1
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
-LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
-LTTNG_LIBUST_LICENSE_FILES = COPYING
+LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond), BSD-3-Clause (snprintf)
+LTTNG_LIBUST_LICENSE_FILES = LICENSE LICENSES/BSD-3-Clause LICENSES/GPL-2.0 LICENSES/LGPL-2.1 LICENSES/MIT
 LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
 LTTNG_LIBUST_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
