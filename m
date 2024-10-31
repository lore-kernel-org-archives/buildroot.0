Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD2BD6B6B4
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 12:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2286C60A80;
	Thu, 31 Oct 2024 12:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oexdix2zFS3o; Thu, 31 Oct 2024 12:45:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EF8B60A7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EF8B60A7A;
	Thu, 31 Oct 2024 12:45:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95506494E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 845638148F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qwh4ohRdUWQt for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 12:45:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF78A81494
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF78A81494
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:45:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A068684E85; Thu, 31 Oct 2024 12:45:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 13:45:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc9c4e05761fa850403c8c2c21e1bfbe719aecc2
X-Git-Newrev: 55b333029efa8b405a5687a47632617306eddedc
X-Patchwork-Hint: ignore
Message-Id: <20241031124526.A068684E85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: bump to version 22.11.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=55b333029efa8b405a5687a47632617306eddedc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This marks the transitioning of the 22.x releases
of nodejs into LTS. [1]

LICENSE hash changed due to
* various new bundled components[2,3,4]
* removed bundled components [5,6]

All new components fall under MIT or Apache license which are already
mentioned in the license field.

All node package tests have been run sucessfully after the update.

[1] https://nodejs.org/en/blog/release/v22.11.0
[2] https://github.com/nodejs/node/commit/77936c3d2482ded2cb868f20f177433081b6dca8
[3] https://github.com/nodejs/node/commit/92439fc160c19281faacfdf084ba718b79dd537f
[4] https://github.com/nodejs/node/commit/da6c61def82190fd07cbdd9bb946644273eddf96
[5] https://github.com/nodejs/node/commit/8e4fd2842bd6d2640dd0477323fe911c991265d7
[6] https://github.com/nodejs/node/commit/20a8c96c412bb2c2dd74a5739cfb61919f1ec787

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/nodejs.hash | 12 ++++++------
 package/nodejs/nodejs.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index 61bda55098..aaa9e4619a 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,8 +1,8 @@
 # From https://nodejs.org/dist/v20.15.1/SHASUMS256.txt.asc
-sha256  10d47a46ef208b3e4b226e4d595a82659123b22397ed77b7975d989114ec317e  node-v20.15.1-linux-arm64.tar.xz
-sha256  7bc120efdd8018f6915471b963d9b80adf4ed406d6dc9edb4ae944b85f505c4c  node-v20.15.1-linux-armv7l.tar.xz
-sha256  b33e684802251397ad62ad3f8a1836267ee8b7723f87f669470018ad0035287b  node-v20.15.1-linux-ppc64le.tar.xz
-sha256  26700f8d3e78112ad4a2618a9c8e2816e38a49ecf0213ece80e54c38cb02563f  node-v20.15.1-linux-x64.tar.xz
-sha256  fdd53a5729d936691a2a1151046fb4897721cb8b0fca2af957823a9b40fe0c34  node-v20.15.1.tar.xz
+sha256  6031d04b98f59ff0f7cb98566f65b115ecd893d3b7870821171708cdbaf7ae6e  node-v22.11.0-linux-arm64.tar.xz
+sha256  9de0fdcfb1cccbe03f72f939e4e6f03867aef3da8223f90606cd93757704dae0  node-v22.11.0-linux-armv7l.tar.xz
+sha256  d1d49d7d611b104b6d616e18ac439479d8296aa20e3741432de0e85f4735a81e  node-v22.11.0-linux-ppc64le.tar.xz
+sha256  83bf07dd343002a26211cf1fcd46a9d9534219aad42ee02847816940bf610a72  node-v22.11.0-linux-x64.tar.xz
+sha256  bbf0297761d53aefda9d7855c57c7d2c272b83a7b5bad4fea9cb29006d8e1d35  node-v22.11.0.tar.xz
 # Locally calculated
-sha256  49cd410e0fe6a8879a40d0764092d1e6114cc85fe41d4efed990d028eec25582  LICENSE
+sha256  f0cb1ad806ba5d681f378a8cc2e539fe4b54839290eda3c814ec8994af2b8422  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 104d2cf258..bf0764136e 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 20.15.1
+NODEJS_COMMON_VERSION = 22.11.0
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = http://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
