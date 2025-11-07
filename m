Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E078CCF9F8
	for <buildroot@archiver.kernel.org>; Fri,  7 Nov 2025 20:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6780405ED;
	Fri,  7 Nov 2025 20:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qyF52AtYRuM; Fri,  7 Nov 2025 20:53:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19AC2405E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19AC2405E4;
	Fri,  7 Nov 2025 20:53:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0261A1BC
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 20:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F30D860625
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 20:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhAQ5RIcXY4x for <buildroot@buildroot.org>;
 Fri,  7 Nov 2025 20:53:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F016A6061E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F016A6061E
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 20:53:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA3CB80301; Fri,  7 Nov 2025 20:53:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Nov 2025 21:41:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 788b7d695856640684f4ed018d30a7e359e6a984
X-Git-Newrev: 872f694a955b3fb6e775678183a73299e02d7419
X-Patchwork-Hint: ignore
Message-Id: <20251107205316.DA3CB80301@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udisks: bump to version 2.11.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=872f694a955b3fb6e775678183a73299e02d7419
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/storaged-project/udisks/releases/tag/udisks-2.11.0

Let's also add support for ATA SMART according to libblockdev package.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: remove "security" from commit log title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/udisks/udisks.hash | 2 +-
 package/udisks/udisks.mk   | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/udisks/udisks.hash b/package/udisks/udisks.hash
index 8803bedb21..a62e6b5ed6 100644
--- a/package/udisks/udisks.hash
+++ b/package/udisks/udisks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6401c715d287ec84fe605e0cb90579e8da6c395bce5f42e419f205dd297e261f  udisks-2.10.2.tar.bz2
+sha256  0bf30151fe8d9d2fb59b57f6630739dfbbd16417dee69ec57d43b37335bd649a  udisks-2.11.0.tar.bz2
 sha256  98046e932dc6c739001e79d7079a3bd958fc55475dcd917d27f884c0c93525cc  COPYING
diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 515797f39a..c9b66872e9 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDISKS_VERSION = 2.10.2
+UDISKS_VERSION = 2.11.0
 UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.bz2
 UDISKS_SITE = https://github.com/storaged-project/udisks/releases/download/udisks-$(UDISKS_VERSION)
 UDISKS_LICENSE = GPL-2.0+
@@ -45,4 +45,10 @@ else
 UDISKS_CONF_OPTS += --disable-fhs-media
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_SMART),y)
+UDISKS_CONF_OPTS += --enable-smart
+else
+UDISKS_CONF_OPTS += --disable-smart
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
