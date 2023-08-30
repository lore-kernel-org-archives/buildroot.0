Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA73C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 21:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 774CB40296;
	Wed, 30 Aug 2023 21:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 774CB40296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K3sTdw3UYnij; Wed, 30 Aug 2023 21:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A346D4181F;
	Wed, 30 Aug 2023 21:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A346D4181F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B09D1BF405
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8979441C14
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8979441C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLPXx_FH0sYK for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 21:54:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B34741C1F
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 21:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B34741C1F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 473478669B; Wed, 30 Aug 2023 21:54:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 23:48:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 93556f95a3a8ce402eb29e8f5c73f0c02a708f54
X-Git-Newrev: 06b2e496a0c47b1fef55b0daccac1e62b41d7aac
X-Patchwork-Hint: ignore
Message-Id: <20230830215441.473478669B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/go: bump to version
 1.21.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=06b2e496a0c47b1fef55b0daccac1e62b41d7aac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Go 1.21.0 is a major release of Go.

https://go.dev/doc/devel/release#go1.21.0

Set GOTOOLCHAIN=local to disable the new toolchain download feature. This
feature, introduced in Go 1.21.x, will automatically download pre-built compiler
binaries from Google for the toolchain version specified in go.mod. We do not
want this in Buildroot as we build from source instead: set GOTOOLCHAIN=local to
disable the feature and use the locally built toolchain.

https://go.dev/doc/toolchain

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 2298534d91..2289442a72 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  2c5ee9c9ec1e733b0dbbc2bdfed3f62306e51d8172bf38f4f4e542b27520f597  go1.20.7.src.tar.gz
+sha256  818d46ede85682dd551ad378ef37a4d247006f12ec59b5b755601d2ce114369a  go1.21.0.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index fc1d9ed681..04aa612256 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.20.7
+GO_VERSION = 1.21.0
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
@@ -28,6 +28,7 @@ HOST_GO_COMMON_ENV = \
 	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
 	GOMODCACHE="$(HOST_GO_GOPATH)/pkg/mod" \
 	GOPROXY=off \
+	GOTOOLCHAIN=local \
 	PATH=$(BR_PATH) \
 	GOBIN= \
 	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
