Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF697E7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7529D616EB;
	Thu, 12 Dec 2024 21:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeTM31g6FpOE; Thu, 12 Dec 2024 21:32:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BFB661726
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BFB661726;
	Thu, 12 Dec 2024 21:32:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A7C4115A
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00E7D80C3F
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1Lt11-Wywuh for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:32:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C704180C38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C704180C38
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B052886E70; Thu, 12 Dec 2024 21:32:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 20:36:52 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 8f9ce0c913bc00127126456df89379daf9c1e03a
X-Git-Newrev: 15aca7d33d6c5fc042b4b75470ab55dc04e31cb3
X-Patchwork-Hint: ignore
Message-Id: <20241212213224.B052886E70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/go: bump version
 to go1.23.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=15aca7d33d6c5fc042b4b75470ab55dc04e31cb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

go1.23.3 (released 2024-11-06) includes fixes to the linker, the runtime,
and the net/http, os, and syscall packages.

https://go.dev/doc/devel/release#go1.23.minor

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 47881d30dbf4977e8dd1ca54106fbb9aeaef8413)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go-bin/go-bin.hash | 14 +++++++-------
 package/go/go-src/go-src.hash |  2 +-
 package/go/go.mk              |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
index cc87cac3a6..5f008c773e 100644
--- a/package/go/go-bin/go-bin.hash
+++ b/package/go/go-bin/go-bin.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  36930162a93df417d90bd22c6e14daff4705baac2b02418edda671cdfa9cd07f  go1.23.2.src.tar.gz
-sha256  cb1ed4410f68d8be1156cee0a74fcfbdcd9bca377c83db3a9e1b07eebc6d71ef  go1.23.2.linux-386.tar.gz
-sha256  542d3c1705f1c6a1c5a80d5dc62e2e45171af291e755d591c5e6531ef63b454e  go1.23.2.linux-amd64.tar.gz
-sha256  f626cdd92fc21a88b31c1251f419c17782933a42903db87a174ce74eeecc66a9  go1.23.2.linux-arm64.tar.gz
-sha256  e3286bdde186077e65e961cbe18874d42a461e5b9c472c26572b8d4a98d15c40  go1.23.2.linux-armv6l.tar.gz
-sha256  c164ce7d894b10fd861d7d7b96f1dbea3f993663d9f0c30bc4f8ae3915db8b0c  go1.23.2.linux-ppc64le.tar.gz
-sha256  de1f94d7dd3548ba3036de1ea97eb8243881c22a88fcc04cc08c704ded769e02  go1.23.2.linux-s390x.tar.gz
+sha256  8d6a77332487557c6afa2421131b50f83db4ae3c579c3bc72e670ee1f6968599  go1.23.3.src.tar.gz
+sha256  3d7b00191a43c50d28e0903a0c576104bc7e171a8670de419d41111c08dfa299  go1.23.3.linux-386.tar.gz
+sha256  a0afb9744c00648bafb1b90b4aba5bdb86f424f02f9275399ce0c20b93a2c3a8  go1.23.3.linux-amd64.tar.gz
+sha256  1f7cbd7f668ea32a107ecd41b6488aaee1f5d77a66efd885b175494439d4e1ce  go1.23.3.linux-arm64.tar.gz
+sha256  5f0332754beffc65af65a7b2da76e9dd997567d0d81b6f4f71d3588dc7b4cb00  go1.23.3.linux-armv6l.tar.gz
+sha256  e3b926c81e8099d3cee6e6e270b85b39c3bd44263f8d3df29aacb4d7e00507c8  go1.23.3.linux-ppc64le.tar.gz
+sha256  6bd72fcef72b046b6282c2d1f2c38f31600e4fe9361fcd8341500c754fb09c38  go1.23.3.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
index b475ec4a46..1a185d011c 100644
--- a/package/go/go-src/go-src.hash
+++ b/package/go/go-src/go-src.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  36930162a93df417d90bd22c6e14daff4705baac2b02418edda671cdfa9cd07f  go1.23.2.src.tar.gz
+sha256  8d6a77332487557c6afa2421131b50f83db4ae3c579c3bc72e670ee1f6968599  go1.23.3.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 33dc681358..3dd590bf6f 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.2
+GO_VERSION = 1.23.3
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
