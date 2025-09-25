Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90346CAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BDCF61528;
	Thu, 25 Sep 2025 20:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOFaYe-3RT7Q; Thu, 25 Sep 2025 20:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 874EC6152F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 874EC6152F;
	Thu, 25 Sep 2025 20:45:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 82EE0199
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69BEE83BD0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khFT5MWZiAZW for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADC1F83BA0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADC1F83BA0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A98D986464; Thu, 25 Sep 2025 20:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:37:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ecf12c186f1e62751980eb4c7345decd65305680
X-Git-Newrev: 981efdb8ca9033656e272e1de447c5e2359f7bc0
X-Patchwork-Hint: ignore
Message-Id: <20250925204458.A98D986464@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cloudflared: bump to version
 2025.8.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=981efdb8ca9033656e272e1de447c5e2359f7bc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also set BuiltForPackageManager=buildroot so that cloudflared's update
command informs the user to update cloudflared via buildroot.

Without BuiltForPackageManager set:
cloudflared update
INF cloudflared is up to date version=

With BuiltForPackageManager set:
cloudflared update
ERR cloudflared was installed by buildroot. Please update using the same method.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cloudflared/cloudflared.hash | 2 +-
 package/cloudflared/cloudflared.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/cloudflared/cloudflared.hash b/package/cloudflared/cloudflared.hash
index f199160a94..407d24ccdb 100644
--- a/package/cloudflared/cloudflared.hash
+++ b/package/cloudflared/cloudflared.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f9223cdefaa4b75aa1c49638936af9d5007b6c7bd943ab70203bb75bf32467da  cloudflared-2025.1.0-go2.tar.gz
+sha256  803d3e162dc91da6b3b4f7961f57c113fa818d45517758511f72d254d68a46ba  cloudflared-2025.8.1-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index bf341b6b62..03b6a8fae6 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-CLOUDFLARED_VERSION = 2025.1.0
+CLOUDFLARED_VERSION = 2025.8.1
 CLOUDFLARED_SITE = $(call github,cloudflare,cloudflared,$(CLOUDFLARED_VERSION))
 CLOUDFLARED_LICENSE = Apache-2.0
 CLOUDFLARED_LICENSE_FILES = LICENSE
 CLOUDFLARED_CPE_ID_VENDOR = cloudflare
 CLOUDFLARED_BUILD_TARGETS = cmd/cloudflared
-CLOUDFLARED_LDFLAGS = -X main.Version=$(CLOUDFLARED_VERSION)
+CLOUDFLARED_LDFLAGS = \
+	-X main.Version=$(CLOUDFLARED_VERSION) \
+	-X github.com/cloudflare/cloudflared/cmd/cloudflared/updater.BuiltForPackageManager=buildroot
 
 $(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
