Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A26C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AC50409FF;
	Mon, 27 Jun 2022 22:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AC50409FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7IDqJh6dO141; Mon, 27 Jun 2022 22:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 163E940574;
	Mon, 27 Jun 2022 22:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 163E940574
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CCB41BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 477F14050C
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 477F14050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nP1RgXSnDBsx for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:21:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BDB7400D7
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BDB7400D7
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 31A2987693; Mon, 27 Jun 2022 22:08:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 00:21:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4246d5055946b4e4c503fe69b5eab95fc6069b56
X-Git-Newrev: 8bb0753345aa4d1b550230c25a28c527f51ac110
X-Patchwork-Hint: ignore
Message-Id: <20220627220845.31A2987693@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cereal: bump to version 1.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bb0753345aa4d1b550230c25a28c527f51ac110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

doc and examples can be disabled since
https://github.com/USCiLab/cereal/commit/6e1c66a94cfb2dd7d726afbe270681b7b19763cd
so set BUILD_SANDBOX=OFF as BUILD_DOC=OFF is already passed by
cmake-infrastructure

https://github.com/USCiLab/cereal/releases/tag/v1.3.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cereal/cereal.hash | 2 +-
 package/cereal/cereal.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cereal/cereal.hash b/package/cereal/cereal.hash
index 18889b4d42..1ddb504a72 100644
--- a/package/cereal/cereal.hash
+++ b/package/cereal/cereal.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  65ea6ddda98f4274f5c10fb3e07b2269ccdd1e5cbb227be6a2fd78b8f382c976  cereal-1.3.1.tar.gz
+sha256  16a7ad9b31ba5880dac55d62b5d6f243c3ebc8d46a3514149e56b5e7ea81f85f  cereal-1.3.2.tar.gz
 sha256  58604a126af6a671ea390ee3d5b3e42228aa59b2858fb7af1d5b20b31739ccbb  LICENSE
 sha256  d9e523e8736ac0c68064c7ad312a222f285e82bf6c96a1b1c2cadaffff9fc64f  include/cereal/external/base64.hpp
 sha256  7fb69c707f0ed3a8b59b8f949f0928a9cc06d67bc15d599094693703ff70ea26  include/cereal/external/rapidjson/rapidjson.h
diff --git a/package/cereal/cereal.mk b/package/cereal/cereal.mk
index a44f09c743..6da7df9360 100644
--- a/package/cereal/cereal.mk
+++ b/package/cereal/cereal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CEREAL_VERSION = 1.3.1
+CEREAL_VERSION = 1.3.2
 CEREAL_SITE = $(call github,USCiLab,cereal,v$(CEREAL_VERSION))
 # For licensing, see also: https://github.com/USCiLab/cereal/issues/609
 CEREAL_LICENSE = BSD-3-Clause (cereal), Zlib (base64.hpp), MIT (rapidjson), BSL-1.0 or MIT (rapidxml)
@@ -13,6 +13,7 @@ CEREAL_CPE_ID_VENDOR = usc
 CEREAL_INSTALL_STAGING = YES
 CEREAL_INSTALL_TARGET = NO
 CEREAL_CONF_OPTS = \
+	-DBUILD_SANDBOX=OFF \
 	-DTHREAD_SAFE=ON \
 	-DJUST_INSTALL_CEREAL=ON
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
