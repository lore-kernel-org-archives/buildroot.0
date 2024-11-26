Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF12D65552
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 20:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BD5B483DF;
	Tue, 26 Nov 2024 20:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKD331kvqni2; Tue, 26 Nov 2024 20:46:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3E3C40E4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3E3C40E4E;
	Tue, 26 Nov 2024 20:46:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BFF471DA8
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 20:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B85A76FA78
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 20:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dNB9apwuPEl for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 20:46:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFD8A6FA06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFD8A6FA06
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 20:46:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4307866E4; Tue, 26 Nov 2024 20:46:55 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Nov 2024 21:29:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 283d30e89f4ef6c088cd5f547e5d31c08e9847b3
X-Git-Newrev: b03dc5b615b217ea3246caa5f94de5e62ec17a8a
X-Patchwork-Hint: ignore
Message-Id: <20241126204655.C4307866E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mmc-utils: bump to
 523d8f3cfb21
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

commit: https://git.buildroot.net/buildroot/commit/?id=b03dc5b615b217ea3246caa5f94de5e62ec17a8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Upstream commit f884bfe684f2c31e1f5b7c9247b364178fa20ea3 changed the
default build behavior to run `sparse` which is problematic if the tool
is not available on the host during builds.

Update the build command to not define `C` so `sparse` is skipped.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mmc-utils/mmc-utils.hash | 2 +-
 package/mmc-utils/mmc-utils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index fec7533d16..48bfd7bc04 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4547b5f0f8a43857dcfb516b8b9c987d07febfecbe3d27987f43064db46ca8f9  mmc-utils-e1281d4de9166b7254ba30bb58f9191fc2c9e7fb-git4.tar.gz
+sha256  1ae5706ce56bfedda94a01e87c5151ac750fb849987aeb74ff89d70f43556131  mmc-utils-523d8f3cfb219d800f45860892e742e3a355f1bb-git4.tar.gz
 sha256  4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  README
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 48c347d846..28ac62678b 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = e1281d4de9166b7254ba30bb58f9191fc2c9e7fb
+MMC_UTILS_VERSION = 523d8f3cfb219d800f45860892e742e3a355f1bb
 MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
@@ -25,7 +25,7 @@ endif
 # let's do this here otherwise it won't be automatically set and build
 # will fail
 define MMC_UTILS_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) C= \
 		CFLAGS="$(MMC_UTILS_CFLAGS)" \
 		AM_CFLAGS='-DVERSION=\"$(shell echo $(MMC_UTILS_VERSION) | head -c 6)\"'
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
