Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D85C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 21:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 895F54093B;
	Fri, 12 Jul 2024 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAO3NBEnwOO0; Fri, 12 Jul 2024 21:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FE614097F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FE614097F;
	Fri, 12 Jul 2024 21:10:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 759A11BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6340660662
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGXbnmEnlUQs for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 21:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DD7060647
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DD7060647
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 21:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E87F84580; Fri, 12 Jul 2024 21:09:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 23:08:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: afbe0fe8f5907f8d5eb4fde428af54721313a4cd
X-Git-Newrev: 5d02277884e406625c0142e7c3e68dfe30bdf6c4
X-Patchwork-Hint: ignore
Message-Id: <20240712210957.8E87F84580@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: security bump version to
 go1.22.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d02277884e406625c0142e7c3e68dfe30bdf6c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE:

CVE-2024-24791: net/http: denial of service due to improper 100-continue handling

https://go.dev/doc/devel/release#go1.22.5

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go-src/go-src.hash | 2 +-
 package/go/go.mk              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
index 7952461f2d..d300f6e2c9 100644
--- a/package/go/go-src/go-src.hash
+++ b/package/go/go-src/go-src.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  fed720678e728a7ca30ba8d1ded1caafe27d16028fab0232b8ba8e22008fb784  go1.22.4.src.tar.gz
+sha256  ac9c723f224969aee624bc34fd34c9e13f2a212d75c71c807de644bb46e112f6  go1.22.5.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 91a8fb828f..bfbe997911 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.22.4
+GO_VERSION = 1.22.5
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
