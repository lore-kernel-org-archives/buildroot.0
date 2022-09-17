Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19360ECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBB47843DB;
	Sat, 17 Sep 2022 15:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBB47843DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3cDCJxS9K2Mw; Sat, 17 Sep 2022 15:40:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA3CE8439A;
	Sat, 17 Sep 2022 15:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA3CE8439A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE4531BF968
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8E4B40919
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8E4B40919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zgk-L3irSSeR for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:40:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F19AD40153
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F19AD40153
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E1901844E9; Sat, 17 Sep 2022 15:40:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:33:13 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 138ebee299f7742ae0e71c35b535e70d27d4950c
X-Git-Newrev: 1a24f9e7335cad70e72ab1d2b5efa1590616ca2d
X-Patchwork-Hint: ignore
Message-Id: <20220917154022.E1901844E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/edk2-platforms:
 fix legal-info
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a24f9e7335cad70e72ab1d2b5efa1590616ca2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix typo: EDK2_PLATFORMS_LICENSE_FILE -> EDK2_PLATFORMS_LICENSE_FILES
added by commit 33aa59e7b500e60f2d736a17183c7d49b7baf5bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6cd25766163c35b74ba27f08b552bbb92d6bb406)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/edk2-platforms/edk2-platforms.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 430791ae3e..7de59c1afc 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -8,7 +8,7 @@
 EDK2_PLATFORMS_VERSION = db922e1253cb6f1fc456805bc42fb7d401eed5c2
 EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
 EDK2_PLATFORMS_LICENSE = BSD-2-Clause
-EDK2_PLATFORMS_LICENSE_FILE = License.txt
+EDK2_PLATFORMS_LICENSE_FILES = License.txt
 EDK2_PLATFORMS_INSTALL_TARGET = NO
 EDK2_PLATFORMS_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
