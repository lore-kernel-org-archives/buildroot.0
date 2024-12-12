Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EB8E77180
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BDA260671;
	Thu, 12 Dec 2024 21:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56lPivvBsR1d; Thu, 12 Dec 2024 21:32:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 421956179C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 421956179C;
	Thu, 12 Dec 2024 21:32:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33CA2115C
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 166A1615E7
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phxzHiHvggQb for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:32:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C42236144F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C42236144F
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD2FC86E71; Thu, 12 Dec 2024 21:32:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 20:37:04 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 15aca7d33d6c5fc042b4b75470ab55dc04e31cb3
X-Git-Newrev: fbdd2acaec3303abad661583b511210d540cab7e
X-Patchwork-Hint: ignore
Message-Id: <20241212213224.BD2FC86E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/go: bump to
 version 1.23.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fbdd2acaec3303abad661583b511210d540cab7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

go1.23.4 (released 2024-12-03) includes fixes to the compiler, the runtime, the trace command, and the syscall package.

https://go.dev/doc/devel/release#go1.23.4
https://github.com/golang/go/issues?q=milestone%3AGo1.23.4+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ef273589633170018abe2bb20de75e11443b36a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go-bin/go-bin.hash | 14 +++++++-------
 package/go/go-src/go-src.hash |  2 +-
 package/go/go.mk              |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
index 5f008c773e..37e1db20a9 100644
--- a/package/go/go-bin/go-bin.hash
+++ b/package/go/go-bin/go-bin.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  8d6a77332487557c6afa2421131b50f83db4ae3c579c3bc72e670ee1f6968599  go1.23.3.src.tar.gz
-sha256  3d7b00191a43c50d28e0903a0c576104bc7e171a8670de419d41111c08dfa299  go1.23.3.linux-386.tar.gz
-sha256  a0afb9744c00648bafb1b90b4aba5bdb86f424f02f9275399ce0c20b93a2c3a8  go1.23.3.linux-amd64.tar.gz
-sha256  1f7cbd7f668ea32a107ecd41b6488aaee1f5d77a66efd885b175494439d4e1ce  go1.23.3.linux-arm64.tar.gz
-sha256  5f0332754beffc65af65a7b2da76e9dd997567d0d81b6f4f71d3588dc7b4cb00  go1.23.3.linux-armv6l.tar.gz
-sha256  e3b926c81e8099d3cee6e6e270b85b39c3bd44263f8d3df29aacb4d7e00507c8  go1.23.3.linux-ppc64le.tar.gz
-sha256  6bd72fcef72b046b6282c2d1f2c38f31600e4fe9361fcd8341500c754fb09c38  go1.23.3.linux-s390x.tar.gz
+sha256  ad345ac421e90814293a9699cca19dd5238251c3f687980bbcae28495b263531  go1.23.4.src.tar.gz
+sha256  4a4a0e7587ef8c8a326439b957027f2791795e2d29d4ae3885b4091a48f843bc  go1.23.4.linux-386.tar.gz
+sha256  6924efde5de86fe277676e929dc9917d466efa02fb934197bc2eba35d5680971  go1.23.4.linux-amd64.tar.gz
+sha256  16e5017863a7f6071363782b1b8042eb12c6ca4f4cd71528b2123f0a1275b13e  go1.23.4.linux-arm64.tar.gz
+sha256  1f1dda0dc7ce0b2295f57258ec5ef0803fd31b9ed0aa20e2e9222334e5755de1  go1.23.4.linux-armv6l.tar.gz
+sha256  65a303ef51e48ff77e004a6a5b4db6ce59495cd59c6af51b54bf4f786c01a1b9  go1.23.4.linux-ppc64le.tar.gz
+sha256  74aab82bf4eca7c26c830a5b0e2a31d193a4d5ba47045526b92473cc7188d7d7  go1.23.4.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
index 1a185d011c..0b11d8d392 100644
--- a/package/go/go-src/go-src.hash
+++ b/package/go/go-src/go-src.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  8d6a77332487557c6afa2421131b50f83db4ae3c579c3bc72e670ee1f6968599  go1.23.3.src.tar.gz
+sha256  ad345ac421e90814293a9699cca19dd5238251c3f687980bbcae28495b263531  go1.23.4.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 3dd590bf6f..91d9f8d1c1 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.3
+GO_VERSION = 1.23.4
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
