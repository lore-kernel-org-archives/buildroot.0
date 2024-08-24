Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D53FE6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0A98844C4;
	Fri,  6 Sep 2024 20:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-yVJu4v5i0A; Fri,  6 Sep 2024 20:05:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83F04849B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83F04849B1;
	Fri,  6 Sep 2024 20:05:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66E2B1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B73F06114B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dz159ajiYP9X for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20D1460782
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20D1460782
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DEF4828EF; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 09:22:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ac296da266423d8fde22fb02b5fb8cf041d891a
X-Git-Newrev: 8bd00c16d8af2b4b620a0b2c136e6830b9d6b3a0
X-Patchwork-Hint: ignore
Message-Id: <20240906195857.1DEF4828EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lsuio: change upstream,
 bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bd00c16d8af2b4b620a0b2c136e6830b9d6b3a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new version from peter@digitalbrains.com adds some few new
features (name, offset, etc.) and it includes a few improvements.

The former version was more than 14y old.

There is no tag, neither any archive, so currently we use the latest
git commit.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lsuio/lsuio.hash | 2 +-
 package/lsuio/lsuio.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lsuio/lsuio.hash b/package/lsuio/lsuio.hash
index 2df6d074f4..1c408697b2 100644
--- a/package/lsuio/lsuio.hash
+++ b/package/lsuio/lsuio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c88b3850248b2d3419e025abd7b9b0991c8bd33a2d4983f9608408a29900bfb5  lsuio-0.2.0.tar.gz
+sha256  fe799ea2920f07b3d950ae9b6b3dec8c0838437f4571fc8091b94fd765b3d415  lsuio-ba46808da148552462e50ba66d8d15cc5b9a3a00.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/lsuio/lsuio.mk b/package/lsuio/lsuio.mk
index 193de15aef..46647d17ee 100644
--- a/package/lsuio/lsuio.mk
+++ b/package/lsuio/lsuio.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LSUIO_VERSION = 0.2.0
-LSUIO_SITE = http://www.osadl.org/projects/downloads/UIO/user
+# no tag yet
+LSUIO_VERSION = ba46808da148552462e50ba66d8d15cc5b9a3a00
+LSUIO_SITE = $(call github,DigitalBrains1,lsuio,$(LSUIO_VERSION))
 LSUIO_LICENSE = GPL-2.0
 LSUIO_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
