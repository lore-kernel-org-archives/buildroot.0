Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE21C25B74
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E0CA606C4;
	Mon, 13 May 2024 19:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXAC5tNbLm95; Mon, 13 May 2024 19:57:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A964060817
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A964060817;
	Mon, 13 May 2024 19:57:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B32D41BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ADB5D4018D
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oq8qMnmrJ_ZG for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00C31400B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00C31400B8
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:57:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E184187132; Mon, 13 May 2024 19:57:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 21:50:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b55d22f822d179ba25b630b50e98e6eeaffbdcfe
X-Git-Newrev: 67855e77c18949727e740571550a22495c1e8675
X-Patchwork-Hint: ignore
Message-Id: <20240513195730.E184187132@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc-bare-metal: bump to gcc 14.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=67855e77c18949727e740571550a22495c1e8675
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See here for changes:
https://gcc.gnu.org/gcc-14/changes.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc-bare-metal/13.2.0            | 1 -
 package/gcc-bare-metal/14.1.0            | 1 +
 package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc-bare-metal/13.2.0 b/package/gcc-bare-metal/13.2.0
deleted file mode 120000
index b7a75dc7dd..0000000000
--- a/package/gcc-bare-metal/13.2.0
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/13.2.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/14.1.0 b/package/gcc-bare-metal/14.1.0
new file mode 120000
index 0000000000..e519bfb6fd
--- /dev/null
+++ b/package/gcc-bare-metal/14.1.0
@@ -0,0 +1 @@
+../gcc/14.1.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 0dfc8d7a5c..2f36b49125 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_GCC_BARE_METAL_VERSION = 13.2.0
+HOST_GCC_BARE_METAL_VERSION = 14.1.0
 HOST_GCC_BARE_METAL_SITE = \
 	https://ftp.gnu.org/gnu/gcc/gcc-$(HOST_GCC_BARE_METAL_VERSION)
 HOST_GCC_BARE_METAL_SOURCE = gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
