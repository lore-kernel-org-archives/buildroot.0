Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABC7C636CC
	for <buildroot@archiver.kernel.org>; Fri,  3 Feb 2023 07:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA1B0429B6;
	Fri,  3 Feb 2023 07:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA1B0429B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nwVkjGx8tb78; Fri,  3 Feb 2023 07:41:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA05C41731;
	Fri,  3 Feb 2023 07:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA05C41731
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0E5A1BF3A8
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 07:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9F6340362
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 07:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9F6340362
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDYh0r3ffyy6 for <buildroot@lists.busybox.net>;
 Fri,  3 Feb 2023 07:40:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9415E402A8
 for <buildroot@buildroot.org>; Fri,  3 Feb 2023 07:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9415E402A8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D0E683611; Fri,  3 Feb 2023 07:40:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 3 Feb 2023 08:32:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: def789059af78cd65294cafa4288cb41691e86c7
X-Git-Newrev: c7ea83dd2df315ba4f492a9ef6b24152ba4cc4f3
X-Patchwork-Hint: ignore
Message-Id: <20230203074021.7D0E683611@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/containerd: bump to version 1.6.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7ea83dd2df315ba4f492a9ef6b24152ba4cc4f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfixes and improvements.

We now install the containerd.service systemd unit.

https://github.com/containerd/containerd/releases/tag/v1.6.16

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 04a29949d7..16474089d1 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  b86e5c42f58b8348422c972513ff49783c0d505ed84e498d0d0245c5992e4320  containerd-1.6.12.tar.gz
+sha256  e0a893cf67df9dfaecbcde2ba4e896efb3a86ffe48dcfe0d2b26f7cf19b5af3a  containerd-1.6.16.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 192175800c..4a0d6ec38b 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.12
+CONTAINERD_VERSION = 1.6.16
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
@@ -41,4 +41,10 @@ else
 CONTAINERD_TAGS += no_btrfs
 endif
 
+define CONTAINERD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/containerd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/containerd.service
+	$(SED) 's,/usr/local/bin,/usr/bin,g' $(TARGET_DIR)/usr/lib/systemd/system/containerd.service
+endef
+
 $(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
