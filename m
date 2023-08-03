Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C532C001DB
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 19:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D69F83F73;
	Thu,  3 Aug 2023 19:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D69F83F73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VoSZILBxytqa; Thu,  3 Aug 2023 19:11:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4205E83F17;
	Thu,  3 Aug 2023 19:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4205E83F17
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E0C91BF2BD
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 19:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA62640897
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 19:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA62640897
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66Vq9rEMnezL for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 19:11:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C85AC41D9D
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 19:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C85AC41D9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFE24841B3; Thu,  3 Aug 2023 19:11:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 3 Aug 2023 21:09:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea1816008818acc7a339cf1b009b9453bc59e95a
X-Git-Newrev: d3e71819f7eaccbd974ff0e4f52ed080f24856b0
X-Patchwork-Hint: ignore
Message-Id: <20230803191106.AFE24841B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: fix typos in comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3e71819f7eaccbd974ff0e4f52ed080f24856b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 3ce0634594..f330b9d2b2 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -663,9 +663,9 @@ SYSTEMD_TARGET_FINALIZE_HOOKS += \
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
@@ -673,7 +673,7 @@ ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
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
