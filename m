Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F3FC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD2774F8D9;
	Fri, 28 Feb 2025 16:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czTeoOyaMyB8; Fri, 28 Feb 2025 16:43:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A7964F9AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A7964F9AB;
	Fri, 28 Feb 2025 16:43:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 047C268
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0FA442522
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtDgT299bntn for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C0D0424A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C0D0424A7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37B958350A; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 26 Dec 2024 23:50:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f17b9dd79a241c75d9e07c0b9bb61dfaf4a007ed
X-Git-Newrev: 83b783c29e4b2eed8ad8e6bd63ceda0571db73cb
X-Patchwork-Hint: ignore
Message-Id: <20250228162946.37B958350A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/flashrom: bump to
 version 1.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=83b783c29e4b2eed8ad8e6bd63ceda0571db73cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changes in 1.5.0 and 1.5.1 are described at:
https://www.flashrom.org/release_notes/v_1_5.html

The option classic_cli_print_wiki has been removed in upstream commit
87134f538dd9b69fa1331514f7b492e92f8bd66d ("tree: Remove
print_wiki.c"). It was used to generate some parts of the Wiki, and
was anyway not used by Buildroot as it was disabled.

The build was tested including with fwupd, which is the one reverse
dependency of flashrom in Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/flashrom/flashrom.hash | 2 +-
 package/flashrom/flashrom.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
index 17ebdee3af..0e1faf34e7 100644
--- a/package/flashrom/flashrom.hash
+++ b/package/flashrom/flashrom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b77ce458b3b874387270a71805e899ac63f057d7553dc320da7e4c58e750577c  flashrom-1.4.0.tar.gz
+sha256  3f4dc7878e962e165b7eba73104d4e61231f9d4e838eb47df6ca3d87060a2aa5  flashrom-1.5.1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 4eede48e03..f253c5f9d8 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-FLASHROM_VERSION = 1.4.0
+FLASHROM_VERSION = 1.5.1
 FLASHROM_SITE = $(call github,flashrom,flashrom,v$(FLASHROM_VERSION))
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
 FLASHROM_INSTALL_STAGING = YES
 FLASHROM_CONF_OPTS = \
 	-Dclassic_cli=enabled \
-	-Dclassic_cli_print_wiki=disabled \
 	-Dich_descriptors_tool=enabled \
 	-Dtests=disabled \
 	-Duse_internal_dmi=true \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
