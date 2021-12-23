Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E25C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 17:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3281A40AC6;
	Thu, 23 Dec 2021 17:38:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RH-J-NpTbz6A; Thu, 23 Dec 2021 17:38:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4137340AD5;
	Thu, 23 Dec 2021 17:38:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 091701BF2E5
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 17:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7EDD400D8
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 17:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nTLgMrL9MH0l for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 17:38:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF80640386
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 17:38:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7318982A89; Thu, 23 Dec 2021 17:32:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 23 Dec 2021 18:38:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06a372a9ce214cee41db38e8b4ba3ba1e5995f1f
X-Git-Newrev: d7056bc60fa9c2e03c40e044f98c31828ae9ae62
X-Patchwork-Hint: ignore
Message-Id: <20211223173238.7318982A89@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 21.4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7056bc60fa9c2e03c40e044f98c31828ae9ae62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumping intel-gmmlib to 22.0.0 with commit befdaea1df introduced changes
which cause build errors on older versions of mediadriver:
https://github.com/intel/gmmlib/issues/93

Bump this package to fix the build errors.

Fixes:
http://autobuild.buildroot.net/results/814334887b0dda5bf052f7b99672c6abbc7cbbb7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 1678ea5254..c2a8e2a240 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d62cc04254f57c62149cd8bc135e3562b8dc05c0815362b9a83adf200522e777  intel-media-21.4.2.tar.gz
+sha256  9b5ef7716c5d8199229512020c18dce5cabee25fbf3f1912179502bedb655919  intel-media-21.4.3.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 4625831b4e..7e949b5e7a 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 21.4.2
+INTEL_MEDIADRIVER_VERSION = 21.4.3
 INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
