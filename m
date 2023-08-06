Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA16FC001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 10:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7742040591;
	Sun,  6 Aug 2023 10:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7742040591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AtXj9I9NuvE0; Sun,  6 Aug 2023 10:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FB9840339;
	Sun,  6 Aug 2023 10:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FB9840339
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 564651BF44A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 10:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64C0760773
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 10:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64C0760773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7QNj6Ah3Q-Im for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 10:28:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A82D060BD3
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 10:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A82D060BD3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9114984297; Sun,  6 Aug 2023 10:28:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 12:28:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2a44207ea0eeaf2346cb6fe572a96770b74d9dc9
X-Git-Newrev: 7aea64c843590fb8dc3640d4ccc6851b114cdd30
X-Patchwork-Hint: ignore
Message-Id: <20230806102847.9114984297@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/acpica: remove
 HARDWARE_NAME make variable override
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

commit: https://git.buildroot.net/buildroot/commit/?id=7aea64c843590fb8dc3640d4ccc6851b114cdd30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The HARDWARE_NAME Makefile variable was removed few years ago in
upstream (by Thomas). See [1].

This commit was first included in tag R01_19_17 (version 20170119).
See the change log [2].

This patch removes occurences of this HARDWARE_NAME, since it's now
unneeded. There is no change in the behavior of this build recipe.

[1] https://github.com/acpica/acpica/commit/0ba20f5f86d41bbe442eaeb426d13d25181fa512
[2] https://github.com/acpica/acpica/blob/R01_19_17/documents/changes.txt#L26

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acpica/acpica.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index 81f7d8e103..b932941369 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -14,7 +14,7 @@ HOST_ACPICA_DEPENDENCIES = host-bison host-flex
 
 define ACPICA_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		HARDWARE_NAME=$(BR2_ARCH) HOST=_LINUX CC="$(TARGET_CC)" \
+		HOST=_LINUX CC="$(TARGET_CC)" \
 		NOWERROR=TRUE \
 		all
 endef
@@ -27,7 +27,7 @@ endef
 
 define ACPICA_INSTALL_TARGET_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		HARDWARE_NAME=$(BR2_ARCH) DESTDIR="$(TARGET_DIR)" \
+		DESTDIR="$(TARGET_DIR)" \
 		INSTALLFLAGS=-m755 install
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
