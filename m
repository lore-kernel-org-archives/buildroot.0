Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5CCC5472C
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 20:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 487B04030C;
	Mon, 26 Aug 2024 20:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68sI0H7esR-u; Mon, 26 Aug 2024 20:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2C7040329
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2C7040329;
	Mon, 26 Aug 2024 20:44:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D69851BF29D
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 20:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3D1A60746
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 20:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0z7F5MW_fud for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 20:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E84706069D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E84706069D
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 20:44:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D1D87864CB; Mon, 26 Aug 2024 20:44:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 22:41:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42d95c00a9257b1bcd0d559fa5e8e5b35abde08e
X-Git-Newrev: f14e03ba21491407d2aaa47e782cc0e924ab6164
X-Patchwork-Hint: ignore
Message-Id: <20240826204413.D1D87864CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuecc: switch to a functional
 Github repo
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

commit: https://git.buildroot.net/buildroot/commit/?id=f14e03ba21491407d2aaa47e782cc0e924ab6164
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The https://projects.universe-factory.net/attachments/download/85 URL
no longer works, so let's switch to what appears to be the official
Github repo:

  https://github.com/neocturne/libuecc

The v7 in this Github is 100% identical to the v7 that was available
from https://projects.universe-factory.net/attachments/download/85.

Also at
https://metadata.ftp-master.debian.org/changelogs//main/libu/libuecc/libuecc_7-5_copyright
Debian lists https://github.com/NeoRaider/libuecc as the source, and
this URL redirects to https://github.com/neocturne/libuecc.

Thanks to the original tarball being a .tar.xz, and our Github macro
generating a .tar.gz, the filename is different, and therefore the
different hash will not be an issue.

Fixes:

  http://autobuild.buildroot.org/results/c4c24bd06bc7889c46d78e14d5bef528340d4463/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuecc/libuecc.hash | 4 +---
 package/libuecc/libuecc.mk   | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/libuecc/libuecc.hash b/package/libuecc/libuecc.hash
index b72519f167..7ac5860cd1 100644
--- a/package/libuecc/libuecc.hash
+++ b/package/libuecc/libuecc.hash
@@ -1,5 +1,3 @@
-# from https://projects.universe-factory.net/projects/fastd/files
-md5  5cd543cb8e7bce83a22c07a0579c95a1  libuecc-7.tar.xz
 # computed locally
-sha256  b94aef08eab5359d0facaa7ead2ce81b193eef0c61379d9835213ebc0a46257a  libuecc-7.tar.xz
+sha256  465a6584c991c13fddf36700328c44fee9a3baff9025fb5f232b34d003d715e0  libuecc-7.tar.gz
 sha256  ec4d9fcc3a37a7998a9ea4decf38f4c0c91a44fd05bb17638c52fe16f2b12e23  COPYRIGHT
diff --git a/package/libuecc/libuecc.mk b/package/libuecc/libuecc.mk
index aad26e5aff..6251edb636 100644
--- a/package/libuecc/libuecc.mk
+++ b/package/libuecc/libuecc.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBUECC_VERSION = 7
-LIBUECC_SITE = https://projects.universe-factory.net/attachments/download/85
-LIBUECC_SOURCE = libuecc-$(LIBUECC_VERSION).tar.xz
+LIBUECC_SITE = $(call github,neocturne,libuecc,v$(LIBUECC_VERSION))
 LIBUECC_LICENSE = BSD-2-Clause
 LIBUECC_LICENSE_FILES = COPYRIGHT
 LIBUECC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
