Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20B0C54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 09:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACE17607A3;
	Sun,  1 Sep 2024 09:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jFV0cN_Te1ST; Sun,  1 Sep 2024 09:06:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E1D96079D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E1D96079D;
	Sun,  1 Sep 2024 09:06:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1428B1BF86B
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C42D409FE
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GoNCyoh0e3a for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 09:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11785409E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11785409E8
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 09:06:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2F47868D3; Sun,  1 Sep 2024 09:05:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Sep 2024 10:46:06 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 51fa453efd639a3500f105f821482bf541d22f76
X-Git-Newrev: e9450112209e7df0599b0919bddd340ad7746cac
X-Patchwork-Hint: ignore
Message-Id: <20240901090559.F2F47868D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/elfutils: fix
 build on microblaze
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9450112209e7df0599b0919bddd340ad7746cac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix the following build failure on microblaze:

dwelf_elf_begin.c:62:1: error: symver is only supported on ELF platforms
   62 | OLD_VERSION (dwelf_elf_begin, ELFUTILS_0.175)
      | ^~~~~~~~~~~
dwelf_elf_begin.c:62:1: error: symver is only supported on ELF platforms

Fixes:
 - http://autobuild.buildroot.org/results/5ca2aa5c76415690ad4a85837ba47e7bcfbdbcbc

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8ef2bb44379e4763682199ad2ecfd23d51cbacc0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elfutils/elfutils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 4d8cc43342..8738af7751 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -45,6 +45,10 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 ELFUTILS_CONF_OPTS += --disable-symbol-versioning
 endif
 
+ifeq ($(BR2_microblaze),y)
+ELFUTILS_CONF_OPTS += --disable-symbol-versioning
+endif
+
 # disable for now, needs "distro" support
 ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
 HOST_ELFUTILS_CONF_OPTS += --disable-libdebuginfod --disable-debuginfod
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
