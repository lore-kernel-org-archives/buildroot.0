Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16707C4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 14:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B388581335;
	Sun, 18 Dec 2022 14:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B388581335
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9Z6Z6tASQYS; Sun, 18 Dec 2022 14:37:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEC83813D1;
	Sun, 18 Dec 2022 14:37:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEC83813D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AB781BF853
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 14:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5330140169
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 14:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5330140169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8bsoicBXHxcp for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 14:36:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 518C5400D3
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 14:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 518C5400D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DAEB86904; Sun, 18 Dec 2022 14:36:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 15:34:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9612601b037e6deb79af300e64e0557dda1be5c
X-Git-Newrev: 8ef654997caba04dffecdc4105b214abf7d02ae5
X-Patchwork-Hint: ignore
Message-Id: <20221218143632.3DAEB86904@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: bump to version 2022.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ef654997caba04dffecdc4105b214abf7d02ae5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Update service files based on latest versions in:
https://github.com/sbabic/meta-swupdate/tree/master/recipes-support/swupdate/swupdate

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...otloader.c-fix-build-without-reallocarray.patch | 35 ----------------------
 package/swupdate/swupdate-usb@.service             |  1 +
 package/swupdate/swupdate.hash                     |  2 +-
 package/swupdate/swupdate.mk                       |  2 +-
 package/swupdate/swupdate.service                  |  1 +
 5 files changed, 4 insertions(+), 37 deletions(-)

diff --git a/package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch b/package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch
deleted file mode 100644
index d90ae7906e..0000000000
--- a/package/swupdate/0001-swupdate-core-bootloader.c-fix-build-without-reallocarray.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f30c4771e93cad7e77d7f2add94327865d226553 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 15 May 2022 14:53:35 +0200
-Subject: [PATCH] core/bootloader.c: fix build without reallocarray
-
-Use realloc instead of reallocarray to avoid the following build failure
-with uclibc raised since version 2022.05 and
-https://github.com/sbabic/swupdate/commit/b8897ed695e1cd954859142b14ec8546d2e7994a:
-
-microblaze-buildroot-linux-uclibc/bin/ld: core/built-in.o: in function `register_bootloader':
-(.text.register_bootloader+0x30): undefined reference to `reallocarray'
-
-Fixes:
- - http://autobuild.buildroot.org/results/7208e8189b4a6f35aaa4ed7777ecdd37421a7c7f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Backported from: f30c4771e93cad7e77d7f2add94327865d226553
-Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
----
- core/bootloader.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/core/bootloader.c b/core/bootloader.c
-index f34cb414..5694d43d 100644
---- a/core/bootloader.c
-+++ b/core/bootloader.c
-@@ -25,7 +25,7 @@ static unsigned int num_available = 0;
- 
- int register_bootloader(const char *name, bootloader *bl)
- {
--	entry *tmp = reallocarray(available, num_available + 1, sizeof(entry));
-+	entry *tmp = realloc(available, (num_available + 1) * sizeof(entry));
- 	if (!tmp) {
- 		return -ENOMEM;
- 	}
diff --git a/package/swupdate/swupdate-usb@.service b/package/swupdate/swupdate-usb@.service
index eda9d1539c..df1a408421 100644
--- a/package/swupdate/swupdate-usb@.service
+++ b/package/swupdate/swupdate-usb@.service
@@ -1,5 +1,6 @@
 [Unit]
 Description=usb media swupdate service
+Requires=swupdate.service
 Requires=swupdate-progress.service
 
 [Service]
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 638b586e8a..1b26f9e5e2 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1e819f71b19626bde1a4906ced39d3406ca240b458d3c4a998bd9c7333eba260  swupdate-2022.05.tar.gz
+sha256  e6335e87812a98a87f1c55df03c9f4e4ef042789570002c5db120b09f64b0d86  swupdate-2022.12.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 1cd60d1b8f..8f05b83922 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2022.05
+SWUPDATE_VERSION = 2022.12
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
diff --git a/package/swupdate/swupdate.service b/package/swupdate/swupdate.service
index a3d8d1939e..94d4526acf 100644
--- a/package/swupdate/swupdate.service
+++ b/package/swupdate/swupdate.service
@@ -4,6 +4,7 @@ Documentation=https://github.com/sbabic/swupdate
 Documentation=https://sbabic.github.io/swupdate
 
 [Service]
+Type=notify
 ExecStart=/usr/lib/swupdate/swupdate.sh
 KillMode=mixed
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
