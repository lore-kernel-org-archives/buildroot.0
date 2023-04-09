Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD72BC77B6E
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 20:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 714FA60FDD;
	Sun,  9 Apr 2023 20:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 714FA60FDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhHLTPQCuoPx; Sun,  9 Apr 2023 20:59:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FF9260FAA;
	Sun,  9 Apr 2023 20:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FF9260FAA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 997131C3AF4
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 20:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72353410C8
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 20:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72353410C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cQ3Z8iHL220s for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 20:59:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E768410C4
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 20:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E768410C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B16183C0B; Sun,  9 Apr 2023 20:59:19 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Apr 2023 22:56:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9df6503ed047acb37dae66fab2a1208f2b5ecb5e
X-Git-Newrev: 47910ccc361934ab4b3fbcfe05530f38de07844f
X-Patchwork-Hint: ignore
Message-Id: <20230409205919.1B16183C0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/efivar: don't install in
 $(HOST_DIR)/usr
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

commit: https://git.buildroot.net/buildroot/commit/?id=47910ccc361934ab4b3fbcfe05530f38de07844f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For years already, $(HOST_DIR)/usr is deprecated. Install directly in
$(HOST_DIR). This will trigger a check-package error in the following
commit.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/efivar/efivar.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efivar/efivar.mk b/package/efivar/efivar.mk
index 8b1d338bec..ee6d7302df 100644
--- a/package/efivar/efivar.mk
+++ b/package/efivar/efivar.mk
@@ -39,7 +39,7 @@ define EFIVAR_BUILD_CMDS
 endef
 
 define HOST_EFIVAR_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/src/makeguids $(HOST_DIR)/usr/bin/makeguids
+	$(INSTALL) -D -m 0755 $(@D)/src/makeguids $(HOST_DIR)/bin/makeguids
 endef
 
 define EFIVAR_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
