Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45726C83F12
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 12:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC5DC80C06;
	Thu, 31 Aug 2023 12:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC5DC80C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MiGpjxWRID3S; Thu, 31 Aug 2023 12:24:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 270C08329E;
	Thu, 31 Aug 2023 12:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 270C08329E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 551591BF3D1
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 12:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ED8741E70
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 12:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ED8741E70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcuyai5lytHv for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 12:23:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25EF641E3F
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 12:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25EF641E3F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 134BD86731; Thu, 31 Aug 2023 12:23:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 13:09:24 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 762fe411f20a4901567e967ed8e97c9bf59108cd
X-Git-Newrev: 307abe2029d3681408f2c33a37ef688b139151bf
X-Patchwork-Hint: ignore
Message-Id: <20230831122322.134BD86731@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/systemd: fix
 typos in comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=307abe2029d3681408f2c33a37ef688b139151bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d3e71819f7eaccbd974ff0e4f52ed080f24856b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 63467171ed..7f89c7cd1e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -670,9 +670,9 @@ SYSTEMD_TARGET_FINALIZE_HOOKS += \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK
 
 ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
-# systemd provides multiple units to autospawn getty as neede
+# systemd provides multiple units to autospawn getty as needed
 # * getty@.service to start a getty on normal TTY
-# * sertial-getty@.service to start a getty on serial lines
+# * serial-getty@.service to start a getty on serial lines
 # * console-getty.service for generic /dev/console
 # * container-getty@.service for a getty on /dev/pts/*
 #
@@ -680,7 +680,7 @@ ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # * read the console= kernel command line parameter
 # * enable one of the above units depending on what it finds
 #
-# Systemd defaults to enablinb getty@tty1.service
+# Systemd defaults to enabling getty@tty1.service
 #
 # What we want to do
 # * Enable a getty on $BR2_TARGET_GENERIC_TTY_PATH
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
