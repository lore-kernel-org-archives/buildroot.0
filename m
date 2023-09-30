Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764F7E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 09:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2971F8236F;
	Sat, 30 Sep 2023 09:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2971F8236F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FPqPxuizPy-3; Sat, 30 Sep 2023 09:25:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39E4B8235C;
	Sat, 30 Sep 2023 09:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39E4B8235C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27DBA1BF2F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEAFF60BB2
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEAFF60BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WBwlhD2E0WN9 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 09:25:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B253F60AE2
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B253F60AE2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C352838BB; Sat, 30 Sep 2023 09:25:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 11:22:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e655158627fba890c5a42074c722521ac48ef5d
X-Git-Newrev: 01ec4a39f5ceb83c62b0040067ba53197a0a6843
X-Patchwork-Hint: ignore
Message-Id: <20230930092529.9C352838BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/batman-adv: update to 2023.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=01ec4a39f5ceb83c62b0040067ba53197a0a6843
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Older Batman-adv versions fail to build with kernel 6.4.x
with following error message:
bat_iv_ogm.c:283:18: error: implicit declaration of function 'prandom_u32_max'; did you mean 'prandom_u32_state'? [-Werror=implicit-function-declaration]

prandom_u32_max got removed in commit 3c202d14a9d73fb63c3dccb18feac5618c21e1c4
from the Linux kernel.

Fixes:
 - http://autobuild.buildroot.net/results/205/2055ac3805d1941c148f1681a224570055dd83cd

For other changes in this release, see:
https://www.open-mesh.org/news/112

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/batman-adv/batman-adv.hash | 7 ++++---
 package/batman-adv/batman-adv.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
index 14a92c231a..b95dfa34dd 100644
--- a/package/batman-adv/batman-adv.hash
+++ b/package/batman-adv/batman-adv.hash
@@ -1,7 +1,8 @@
-# From https://downloads.open-mesh.org/batman/releases/batman-adv-2022.2/batman-adv-2022.2.tar.gz.sha1
-sha1  e1829e10fc37ea674a20cb9ba1d6c1483042fbfa  batman-adv-2022.2.tar.gz
+# From https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2023.1.tar.gz.sha1
+sha1  e3d6e8d4db772156d7ad021b9a166832633a2ea5  batman-adv-2023.1.tar.gz
+# locally computed
+sha256  f46a7286660a5ec3506a1be7ef60b471c51ac70550597d598040479ab7b936b8  batman-adv-2022.3.tar.gz
 
 # Hash for license files
-sha256  218ffb534fead1c9b5b0d90ec1b2fba688209cdf00e861bece1cbf469fe69953  batman-adv-2022.3.tar.gz
 sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
index 75b8292ee1..5b50572d11 100644
--- a/package/batman-adv/batman-adv.mk
+++ b/package/batman-adv/batman-adv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATMAN_ADV_VERSION = 2022.3
+BATMAN_ADV_VERSION = 2023.1
 BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
 BATMAN_ADV_LICENSE = GPL-2.0, MIT (batman_adv.h)
 BATMAN_ADV_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
