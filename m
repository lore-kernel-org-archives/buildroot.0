Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D3DC46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 22:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DE4B83DD5;
	Tue, 30 Jan 2024 22:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DE4B83DD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SQXzYsAhLc3z; Tue, 30 Jan 2024 22:08:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D044B835BA;
	Tue, 30 Jan 2024 22:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D044B835BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C19A11BF95D
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C9FE41B23
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 22:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C9FE41B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_tLhdQul61l for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 22:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92EFC41B26
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 22:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92EFC41B26
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E91986737; Tue, 30 Jan 2024 22:07:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 23:04:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2953cd264489229adaef5f0a1f307900dcc3e425
X-Git-Newrev: b0fabbd2aabd827a1989c5dd97089a0cfb9e04c6
X-Patchwork-Hint: ignore
Message-Id: <20240130220739.7E91986737@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdio-tools: bump version to 1.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0fabbd2aabd827a1989c5dd97089a0cfb9e04c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[v1.3.1] - 2023-12-02
---------------------

Fixes mvls to work with kernels 6.2 and onwards.

- mdio: Multiple registers can now be dumped at once, via the generic
  dump operation.

- mvls: Relax the driver matching to accept the strings used in
  kernels 6.2 and newer.

Signed-off-by: Robert Marko <robimarko@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mdio-tools/mdio-tools.hash | 2 +-
 package/mdio-tools/mdio-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mdio-tools/mdio-tools.hash b/package/mdio-tools/mdio-tools.hash
index 1a9d598923..19172e2cd6 100644
--- a/package/mdio-tools/mdio-tools.hash
+++ b/package/mdio-tools/mdio-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d2ab71d92173053af41d754e9c229e1ead768b9f8b7f4947b3b87b84c4c5e360  mdio-tools-1.3.0.tar.gz
+sha256  652353ba153fdd8b1d58ded4b90d0639536d705aa5923018e27ea0b78aa8e4fb  mdio-tools-1.3.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
index fb8ec39f35..16eba74734 100644
--- a/package/mdio-tools/mdio-tools.mk
+++ b/package/mdio-tools/mdio-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDIO_TOOLS_VERSION = 1.3.0
+MDIO_TOOLS_VERSION = 1.3.1
 MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
 MDIO_TOOLS_LICENSE = GPL-2.0
 MDIO_TOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
