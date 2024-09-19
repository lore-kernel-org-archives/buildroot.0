Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7B9CF3963
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 20:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E22F41841;
	Thu, 19 Sep 2024 20:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TN4qsxCU-6Co; Thu, 19 Sep 2024 20:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CC7A41740
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CC7A41740;
	Thu, 19 Sep 2024 20:00:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE6091BF292
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A931184BF9
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEh08AwyCxnb for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 19:58:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78C3F84C06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78C3F84C06
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 19:58:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7566483CEE; Thu, 19 Sep 2024 19:58:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 14:03:52 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5ef38affb9d53a374f4e27eab6ef7709d6f15bb0
X-Git-Newrev: 6fef00bf43e22855aad2b7ee5afdb2337236bae5
X-Patchwork-Hint: ignore
Message-Id: <20240919195838.7566483CEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/go: bump to
 version go1.22.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6fef00bf43e22855aad2b7ee5afdb2337236bae5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Upgrade Go to the latest v1.22.x point release, go1.22.1.

This requires go-bootstrap-stage3 at version go1.21.8:

See: https://go.dev/doc/go1.22#bootstrap

https://go.dev/doc/devel/release#go1.22.1

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 84caea5d58b979490260e733841f2dde591b75cc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/Config.in.host | 4 ++--
 package/go/go.hash        | 2 +-
 package/go/go.mk          | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index b87b862cec..0d89e875ad 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,7 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
 	# See https://go.dev/doc/install/source#environment
 	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
@@ -30,4 +30,4 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
diff --git a/package/go/go.hash b/package/go/go.hash
index e6a71e5753..06d8776db2 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  71fb31606a1de48d129d591e8717a63e0c5565ffba09a24ea9f899a13214c34d  go1.21.13.src.tar.gz
+sha256  79c9b91d7f109515a25fc3ecdaad125d67e6bdb54f6d4d98580f46799caea321  go1.22.1.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 05238567a8..b5f3fc502d 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.21.13
+GO_VERSION = 1.22.1
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
@@ -12,7 +12,7 @@ GO_LICENSE = BSD-3-Clause
 GO_LICENSE_FILES = LICENSE
 GO_CPE_ID_VENDOR = golang
 
-HOST_GO_DEPENDENCIES = host-go-bootstrap-stage2
+HOST_GO_DEPENDENCIES = host-go-bootstrap-stage3
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
@@ -128,7 +128,7 @@ HOST_GO_HOST_ENV = \
 HOST_GO_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
-	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
 	GOROOT="$(@D)" \
 	GOBIN="$(@D)/bin" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
