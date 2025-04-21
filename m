Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA13AC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B19DE60B3B;
	Mon, 21 Apr 2025 21:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g385PjC7y2zD; Mon, 21 Apr 2025 21:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3E3760813
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3E3760813;
	Mon, 21 Apr 2025 21:29:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCE0E1BC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE891813EA
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9J-An-JhAJB5 for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF9BC813F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF9BC813F9
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:29:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7F2F86002; Mon, 21 Apr 2025 21:29:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 23:27:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1956e4e43459dfa0bfe936a6bfb74f5530abf5bf
X-Git-Newrev: dd9c6907c79bf180a9e0ce8674ffa2e48c1d4439
X-Patchwork-Hint: ignore
Message-Id: <20250421212932.D7F2F86002@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mmc-utils: bump to 2aef4cd9a84d
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7818080445853992601=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7818080445853992601==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dd9c6907c79bf180a9e0ce8674ffa2e48c1d4439
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Among the various changes, it's worth noting the extension of the
register read functionality, allowing also to get its value as an
argument [1].
Moreover, commit [2] fixes the conditional invocation of sparse
properly handling the corresponding 'C' option. Hence, the related
change in the Buildroot compilation command (i.e. C=0).

[1] https://web.git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/commit/?id=21e0fa6420736830a90e13b4a807ec3475df5e65
[2] https://web.git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/commit/?id=a89cba2a0f8c6a19aa6b804877241170f5b6bdd2
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mmc-utils/mmc-utils.hash | 2 +-
 package/mmc-utils/mmc-utils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 3da95d8070..17dedad2b7 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1ae5706ce56bfedda94a01e87c5151ac750fb849987aeb74ff89d70f43556131  mmc-utils-523d8f3cfb219d800f45860892e742e3a355f1bb-git4.tar.gz
+sha256  e9630d911bcf59e235a349d862700fa7ccea7545eb314da48431dcb4da125023  mmc-utils-2aef4cd9a84ddc76349fc0d7e10d675e7fa596fa-git4.tar.gz
 sha256  49cd65f67b516078ff7e0dbe639972dad21ed3858246e3969fc8a8fc2a4dca66  README
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 28ac62678b..0036a775ee 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = 523d8f3cfb219d800f45860892e742e3a355f1bb
+MMC_UTILS_VERSION = 2aef4cd9a84ddc76349fc0d7e10d675e7fa596fa
 MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
@@ -25,7 +25,7 @@ endif
 # let's do this here otherwise it won't be automatically set and build
 # will fail
 define MMC_UTILS_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) C= \
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) C=0 \
 		CFLAGS="$(MMC_UTILS_CFLAGS)" \
 		AM_CFLAGS='-DVERSION=\"$(shell echo $(MMC_UTILS_VERSION) | head -c 6)\"'
 endef

--===============7818080445853992601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7818080445853992601==--
