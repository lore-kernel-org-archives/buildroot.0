Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9427C636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B82D813EC;
	Sun, 12 Feb 2023 20:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B82D813EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yt72nT0u7HaK; Sun, 12 Feb 2023 20:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7EC8813C5;
	Sun, 12 Feb 2023 20:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7EC8813C5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9BCA1BF30E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4FF340131
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4FF340131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i3CDz7BjkIjv for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:30:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C97B6400D3
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C97B6400D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B856E857B1; Sun, 12 Feb 2023 20:30:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 21:30:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 631d0289fe880952d9bedf37cc10b043c70c1482
X-Git-Newrev: d40cab45e21cd1c66bfffa911b1310e29c321486
X-Patchwork-Hint: ignore
Message-Id: <20230212203017.B856E857B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv3: bump to version 3.4.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=d40cab45e21cd1c66bfffa911b1310e29c321486
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure with gcc >= 12:

/home/thomas/autobuild/instance-1/output-1/build/opencv3-3.4.17/modules/core/src/persistence_base64.cpp: In function 'bool base64::base64_valid(const uint8_t*, size_t, size_t)':
/home/thomas/autobuild/instance-1/output-1/build/opencv3-3.4.17/modules/core/src/persistence_base64.cpp:167:31: error: comparing the result of pointer addition '(src + ((sizetype)off))' and NULL [-Werror=address]
  167 |     if (src == 0 || src + off == 0)
      |                     ~~~~~~~~~~^~~~
cc1plus: some warnings being treated as errors

Update hash of LICENSE file (update in year:
https://github.com/opencv/opencv/commit/f6fe5c07f61eb0bc934672200b2bfd453f2fc41d)

https://github.com/opencv/opencv/wiki/ChangeLog#version3419

Fixes:
 - http://autobuild.buildroot.org/results/cb9c120c15c8042e6919858d6885c1cc4d996c0c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/opencv3/opencv3.hash | 4 ++--
 package/opencv3/opencv3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
index 30308188aa..3d6fd2ed8a 100644
--- a/package/opencv3/opencv3.hash
+++ b/package/opencv3/opencv3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1353eec67849aadb20df71d8bae18b83708e18fc5da080fe5efeabb1e99b2ee8  opencv3-3.4.17.tar.gz
-sha256  9076d3d934839a2f8e7bfe549abda6faea4751f1edd6e9460ff703559890ad5f  LICENSE
+sha256  9b913e74299ce4416a5c94000da577c592bf670fd53bad16220eb115a0821529  opencv3-3.4.19.tar.gz
+sha256  c1fed9cd2f557ba23a1b37a21e2c90629d1a60bdb61e92d0e79369bb6fca3390  LICENSE
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 8e4c90786e..29fb246e65 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV3_VERSION = 3.4.17
+OPENCV3_VERSION = 3.4.19
 OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
