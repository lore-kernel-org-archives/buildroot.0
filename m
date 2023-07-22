Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AD1C001DC
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 783EB60EE8;
	Sat, 22 Jul 2023 21:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 783EB60EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybOlpjRdg6gg; Sat, 22 Jul 2023 21:07:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F03E160F0C;
	Sat, 22 Jul 2023 21:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F03E160F0C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26DA11BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA3F9410C1
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA3F9410C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GLe_SJLaYY77 for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:06:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE29E4109F
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE29E4109F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C32BD81F7D; Sat, 22 Jul 2023 21:06:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 23:00:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bedfdf6917ab7e4fb6d692f2e17eaff09b136a8
X-Git-Newrev: 651835dbd7c68f3873a63b4f70c9aca9769c019e
X-Patchwork-Hint: ignore
Message-Id: <20230722210646.C32BD81F7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: adjust comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=651835dbd7c68f3873a63b4f70c9aca9769c019e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
index 94c90877d1..2a3b7825b7 100644
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
