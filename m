Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBACC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F116840183;
	Mon, 22 Jul 2024 16:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ga9yviMezG-L; Mon, 22 Jul 2024 16:10:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9BBB401A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9BBB401A0;
	Mon, 22 Jul 2024 16:10:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 426C71BF284
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B29A8059D
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBA54g5Ckwr9 for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A44B808A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A44B808A9
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:10:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B43487060; Mon, 22 Jul 2024 16:10:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 18:01:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e4554eeb76e8b516c6cbcd66f15868492aac594
X-Git-Newrev: 209103c756b4b5fd3637f290face7122b2fbd1e7
X-Patchwork-Hint: ignore
Message-Id: <20240722161029.0B43487060@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-cli-buildx: bump version to
 v0.16.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=209103c756b4b5fd3637f290face7122b2fbd1e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the vendor/ workaround as it is no longer necessary.

https://github.com/docker/buildx/releases/tag/v0.16.1

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-cli-buildx/docker-cli-buildx.hash |  2 +-
 package/docker-cli-buildx/docker-cli-buildx.mk   | 11 +----------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/docker-cli-buildx/docker-cli-buildx.hash b/package/docker-cli-buildx/docker-cli-buildx.hash
index a6e0b0deab..26b187d12a 100644
--- a/package/docker-cli-buildx/docker-cli-buildx.hash
+++ b/package/docker-cli-buildx/docker-cli-buildx.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  371eb742213ed580179fc4fdfd9a197f0e3115e91979b7907828427d578d49e5  docker-cli-buildx-0.11.2-go2.tar.gz
+sha256  8c9dd3fb18ccba399223ba0f623c9fe09fa38fb2a05283131be8e4e139b2d8fa  docker-cli-buildx-0.16.1-go2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/docker-cli-buildx/docker-cli-buildx.mk b/package/docker-cli-buildx/docker-cli-buildx.mk
index b62d09fbcc..ea77a86077 100644
--- a/package/docker-cli-buildx/docker-cli-buildx.mk
+++ b/package/docker-cli-buildx/docker-cli-buildx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_BUILDX_VERSION = 0.11.2
+DOCKER_CLI_BUILDX_VERSION = 0.16.1
 DOCKER_CLI_BUILDX_SITE = $(call github,docker,buildx,v$(DOCKER_CLI_BUILDX_VERSION))
 
 DOCKER_CLI_BUILDX_LICENSE = Apache-2.0
@@ -19,15 +19,6 @@ DOCKER_CLI_BUILDX_LDFLAGS = \
 	-X $(DOCKER_CLI_BUILDX_GOMOD)/version.Revision=$(DOCKER_CLI_BUILDX_VERSION) \
 	-X $(DOCKER_CLI_BUILDX_GOMOD)/version.Version=$(DOCKER_CLI_BUILDX_VERSION)
 
-# create the go.mod file with required language version go1.20
-# remove the conflicting vendor/modules.txt
-# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
-define DOCKER_CLI_BUILDX_FIX_VENDORING
-	printf "module $(DOCKER_CLI_BUILDX_GOMOD)\n\ngo 1.20\n" > $(@D)/go.mod
-	rm -f $(@D)/vendor/modules.txt
-endef
-DOCKER_CLI_BUILDX_POST_EXTRACT_HOOKS += DOCKER_CLI_BUILDX_FIX_VENDORING
-
 define DOCKER_CLI_BUILDX_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/bin/buildx \
 		$(TARGET_DIR)/usr/lib/docker/cli-plugins/docker-buildx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
