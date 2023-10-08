Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD464E95A8E
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 21:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 778B5818A2;
	Sun,  8 Oct 2023 21:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 778B5818A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Itw-du-ujAMC; Sun,  8 Oct 2023 21:29:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABD00821DA;
	Sun,  8 Oct 2023 21:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABD00821DA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BA461BF2C8
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 21:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECC0C60FC0
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 21:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECC0C60FC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vog9Gupl84Nx for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 21:27:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FE6260E39
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 21:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FE6260E39
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DEC1843F9; Sun,  8 Oct 2023 21:27:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Oct 2023 23:04:06 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 490d118c3c6cae7d14a35c9731bdbc58f6ca0e4a
X-Git-Newrev: c3b7ce430341e3a2fdf45324acf299a31c5b3173
X-Patchwork-Hint: ignore
Message-Id: <20231008212753.0DEC1843F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/go: adjust
 comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3b7ce430341e3a2fdf45324acf299a31c5b3173
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Adjust comments in the Go package to improve clarity:

Config.in.host:

 - Add comment mentioning list of supported architectures.

go.mk:

 - Reword comment re: copying src/ to host/
   - the previously linked issue is not relevant.
   - instead: mention that src/ is needed for stdlib.
 - Adjust comment re: adjusting file timestamps.
   - mention this is needed to avoid rebuilding stdlib

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 651835dbd7c68f3873a63b4f70c9aca9769c019e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/Config.in.host | 2 ++
 package/go/go.mk          | 7 +++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 90a54f0da6..b87b862cec 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -3,6 +3,8 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+	# See https://go.dev/doc/install/source#environment
+	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
 		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
diff --git a/package/go/go.mk b/package/go/go.mk
index 222d642b7b..fa1f4c4797 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -154,12 +154,11 @@ define HOST_GO_INSTALL_CMDS
 	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
 	cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
 
-	# There is a known issue which requires the go sources to be installed
-	# https://golang.org/issue/2775
+	# The Go sources must be installed to the host/ tree for the Go stdlib.
 	cp -a $(@D)/src $(HOST_GO_ROOT)/
 
-	# Set all file timestamps to prevent the go compiler from rebuilding any
-	# built in packages when programs are built.
+	# Set file timestamps to prevent the Go compiler from rebuilding the stdlib
+	# when compiling other programs.
 	find $(HOST_GO_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
