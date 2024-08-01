Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7254AC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE14A8206C;
	Thu,  1 Aug 2024 21:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QG-VU8vVZVsk; Thu,  1 Aug 2024 21:48:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D1B184522
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D1B184522;
	Thu,  1 Aug 2024 21:48:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9C211BF990
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B74AB40CC3
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:48:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NcfVB_LX5Bw for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:48:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4649403DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4649403DD
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:48:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E3D183A55; Thu,  1 Aug 2024 21:48:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Aug 2024 23:47:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a23518b9d74a8bd66e19b8ffa7175b81dc7dd207
X-Git-Newrev: e6e9deabe3dc7ea74a8c90f4673f84653a0ff69d
X-Patchwork-Hint: ignore
Message-Id: <20240801214839.9E3D183A55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netcalc: bump to v2.1.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6e9deabe3dc7ea74a8c90f4673f84653a0ff69d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream now provides sha256sum for tarball.  License hash updated
because of copyright year and maintainer surname changes.

Changes from https://github.com/troglobit/netcalc/releases/tag/v2.1.7:

 - Allow colorized output over pipes, use -n to disable.
   This reverts the auto-disable in pipes, introduced in v2.1
 - Misc. build issues on macOS and *BSD
 - Various minor GCC 13 and Clang 18 warnings

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netcalc/netcalc.hash | 10 +++++-----
 package/netcalc/netcalc.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/netcalc/netcalc.hash b/package/netcalc/netcalc.hash
index ba503b6457..7a9f2000e0 100644
--- a/package/netcalc/netcalc.hash
+++ b/package/netcalc/netcalc.hash
@@ -1,5 +1,5 @@
-# From https://github.com/troglobit/netcalc/releases/tag/v2.1.6
-md5  c8660b61370c76d866247fe65966a35b  netcalc-2.1.6.tar.gz
-# Locally computed:
-sha256  cff41782fcf63d7d4ce6d35f95ed302127f6ddf6fc0ca03a8188af95a7c3243b  netcalc-2.1.6.tar.gz
-sha256  745538f8d515d37af6f03442df982a8b211b129e8dc10d0195e33c4b42f8fe5f  LICENSE
+# From https://github.com/troglobit/netcalc/releases/tag/v2.1.7
+sha256  7300ceac519dd14a8431d27339359f064eb5d80bdd7307ecb1b1cb1b0ab42969  netcalc-2.1.7.tar.gz
+
+# Locally computed
+sha256  c9462bef0a7f70323f782e10def048ea0bb281d35e93dd0de896ea9805856015  LICENSE
diff --git a/package/netcalc/netcalc.mk b/package/netcalc/netcalc.mk
index 7d96fc53cf..4d69deee61 100644
--- a/package/netcalc/netcalc.mk
+++ b/package/netcalc/netcalc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETCALC_VERSION = 2.1.6
+NETCALC_VERSION = 2.1.7
 NETCALC_SITE = https://github.com/troglobit/netcalc/releases/download/v$(NETCALC_VERSION)
 NETCALC_LICENSE = BSD-3-Clause
 NETCALC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
