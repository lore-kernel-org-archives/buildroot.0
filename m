Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4949BC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 10:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABFD240984;
	Tue,  7 Feb 2023 10:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABFD240984
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ewX6IZEUnevc; Tue,  7 Feb 2023 10:20:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9253140913;
	Tue,  7 Feb 2023 10:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9253140913
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C06C11BF95C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99EA360BE3
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 10:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99EA360BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KmPZOUZ7JXxZ for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 10:20:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2DCA60B9A
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 10:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2DCA60B9A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0C0C84000; Tue,  7 Feb 2023 10:20:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 11:06:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ae48b70aedf38bf6e90a7bbea5bf28a7c55bdbb
X-Git-Newrev: d5599cb1b41289adcff86ecf91ee6c069fefa9c1
X-Patchwork-Hint: ignore
Message-Id: <20230207102011.B0C0C84000@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-cli: bump version to v23.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5599cb1b41289adcff86ecf91ee6c069fefa9c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like docker-engine, docker-cli uses a non-standard vendor/ directory
structure, so we use the same fixes as we introduced for docker-engine
(see commit: package/docker-engine: bump version to v23.0.0):

  - remove the problematic vendor/modules.txt
  - create a go.mod

Signed-off-by: Christian Stewart <christian@paral.in>
[yann.morin.1998@free.fr:
  - use post-extract hook
  - simplify commit message to refer to docker-engine
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/docker-cli/docker-cli.hash |  2 +-
 package/docker-cli/docker-cli.mk   | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index c6db95f9b3..ff981be963 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  84d71ac2b508b54e8df9f3ea425aa33e254fd3645fe9bad5619b98eaffb33408  docker-cli-20.10.22.tar.gz
+sha256  3379d06cd6177832b91f4796c680b6bf15c7895773448716b4c3c5253f611d1b  docker-cli-23.0.0.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index cb44c68c1b..d61f47e46e 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 20.10.22
+DOCKER_CLI_VERSION = 23.0.0
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
@@ -29,6 +29,15 @@ DOCKER_CLI_TAGS += osusergo netgo
 DOCKER_CLI_GO_ENV = CGO_ENABLED=no
 endif
 
+# create the go.mod file with language version go1.19
+# remove the conflicting vendor/modules.txt
+# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
+define DOCKER_CLI_FIX_VENDORING
+	printf "module $(DOCKER_CLI_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
+	rm -f $(@D)/vendor/modules.txt
+endef
+DOCKER_CLI_POST_EXTRACT_HOOKS += DOCKER_CLI_FIX_VENDORING
+
 DOCKER_CLI_INSTALL_BINS = $(notdir $(DOCKER_CLI_BUILD_TARGETS))
 
 $(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
