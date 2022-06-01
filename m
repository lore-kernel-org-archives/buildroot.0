Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CCFC433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4148083300;
	Wed,  1 Jun 2022 21:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ki6a67eFD5QZ; Wed,  1 Jun 2022 21:43:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 291FD832C9;
	Wed,  1 Jun 2022 21:43:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD3031BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCFC4832C9
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ci3eVx9Tr9QY for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:43:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1ED3A832BF
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:43:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 87B8686951; Wed,  1 Jun 2022 21:31:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 23:43:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0295e9602f22dd11e0e484bf10950354d1febe3b
X-Git-Newrev: 85af9a673d1e467271da4f4a377e8d425145b61d
X-Patchwork-Hint: ignore
Message-Id: <20220601213154.87B8686951@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8812au-aircrack-ng: bump to
 version 37e27f9165300c89607144b646545fac576ec510
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9017209690864395911=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9017209690864395911==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=85af9a673d1e467271da4f4a377e8d425145b61d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with kernel >= 5.17 thanks to
https://github.com/aircrack-ng/rtl8812au/commit/7e61ad89ccae51a80706f765e1d5f2e82a1662c7:

/home/autobuild/autobuild/instance-14/output-1/build/rtl8812au-aircrack-ng-3a6402e9e79802891f1531b435be54f4d8b71f0b/./os_dep/osdep_service.c: In function ‘thread_exit’:
/home/autobuild/autobuild/instance-14/output-1/build/rtl8812au-aircrack-ng-3a6402e9e79802891f1531b435be54f4d8b71f0b/./os_dep/osdep_service.c:1295:2: error: implicit declaration of function ‘complete_and_exit’ [-Werror=implicit-function-declaration]
 1295 |  complete_and_exit(comp, 0);
      |  ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1fff5023b5b79a7d81fd4cba6dea8dcb3f428340

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index ed1921d1c2..667cf34efc 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  acae758c3834196c71f4ee58f53a3c1b29ffd984f63ff2f40f2b080c8785c49f  rtl8812au-aircrack-ng-3a6402e9e79802891f1531b435be54f4d8b71f0b.tar.gz
+sha256  749ba2e77d0364381445e40f7f0b7041d861cf9a356dbe53085e3abaef888c1d  rtl8812au-aircrack-ng-37e27f9165300c89607144b646545fac576ec510.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 2bbca88cfb..55c118a825 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = 3a6402e9e79802891f1531b435be54f4d8b71f0b
+RTL8812AU_AIRCRACK_NG_VERSION = 37e27f9165300c89607144b646545fac576ec510
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE

--===============9017209690864395911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9017209690864395911==--
