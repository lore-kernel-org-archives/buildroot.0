Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA41C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 445E570D4E;
	Mon, 19 May 2025 11:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UODyIMKgoNy; Mon, 19 May 2025 10:59:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C9E470D51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C9E470D51;
	Mon, 19 May 2025 10:59:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63A7DE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C444B41556
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwsUSN4Re5yb for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5373341776
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5373341776
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A13182A2E; Mon, 19 May 2025 10:40:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 11:49:56 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 634b2c525308ce3bcc86a55f286aeb1f07b18b15
X-Git-Newrev: 00b2d74dbb73790578b271cac91cb3bd9082487b
X-Patchwork-Hint: ignore
Message-Id: <20250519104003.4A13182A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kexec: bump to version
 2.0.31
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

commit: https://git.buildroot.net/buildroot/commit/?id=00b2d74dbb73790578b271cac91cb3bd9082487b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release announce, see:
https://lists.infradead.org/pipermail/kexec/2025-April/032608.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kexec/kexec.hash | 2 +-
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index d89a3772d0..45113f2936 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
 # After checking pgp signature with key:
 # B8868C80BA62A1FFFAF5FDA9632D3A06589DA6B1
-sha256  748a5fa7af27a8059d1de907bddfc32ac530c7189b5770c83e6f3d898d82124e  kexec-tools-2.0.30.tar.xz
+sha256  8a8f350ddc66e1c905a3ab525a7e9ba96c81e04e70ef69397b0155b67b922c31  kexec-tools-2.0.31.tar.xz
 # locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 4637a51506..f0c39f4188 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.30
+KEXEC_VERSION = 2.0.31
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
