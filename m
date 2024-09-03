Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39126CD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72B9060889;
	Tue,  3 Sep 2024 19:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gwh8iPZMg4Cs; Tue,  3 Sep 2024 19:34:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9247F6080E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9247F6080E;
	Tue,  3 Sep 2024 19:34:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD5A1BF95C
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CAFF40A21
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHoacK7_YXXj for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:34:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 080E440A02
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 080E440A02
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:34:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0C7686B87; Tue,  3 Sep 2024 19:34:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:07:00 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: ab10088867f87311550b2c4d7e657d5b1276bf2a
X-Git-Newrev: 4d26c6214e4c86e17e64aab8b3326e9aa742b99f
X-Patchwork-Hint: ignore
Message-Id: <20240903193407.F0C7686B87@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/gcc-bare-metal:
 bump to gcc 14.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d26c6214e4c86e17e64aab8b3326e9aa742b99f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

This patch bumps gcc-bare-metal to gcc 14.2.0.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f00b18c48aa7e1fdf68ac49a1d143eb664c05826)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc-bare-metal/14.1.0            | 1 -
 package/gcc-bare-metal/14.2.0            | 1 +
 package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc-bare-metal/14.1.0 b/package/gcc-bare-metal/14.1.0
deleted file mode 120000
index e519bfb6fd..0000000000
--- a/package/gcc-bare-metal/14.1.0
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/14.1.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/14.2.0 b/package/gcc-bare-metal/14.2.0
new file mode 120000
index 0000000000..0737236850
--- /dev/null
+++ b/package/gcc-bare-metal/14.2.0
@@ -0,0 +1 @@
+../gcc/14.2.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 2f36b49125..501f12bc33 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_GCC_BARE_METAL_VERSION = 14.1.0
+HOST_GCC_BARE_METAL_VERSION = 14.2.0
 HOST_GCC_BARE_METAL_SITE = \
 	https://ftp.gnu.org/gnu/gcc/gcc-$(HOST_GCC_BARE_METAL_VERSION)
 HOST_GCC_BARE_METAL_SOURCE = gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
