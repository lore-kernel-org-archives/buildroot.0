Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E507BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 22:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BE0082EF1;
	Wed,  5 Jan 2022 22:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GMMorhl09guV; Wed,  5 Jan 2022 22:45:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E039082D75;
	Wed,  5 Jan 2022 22:45:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F97B1BF267
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 22:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AC3C60D89
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 22:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qj3xaEJhCxw2 for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 22:45:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D010760D72
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 22:45:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7B7C5832C5; Wed,  5 Jan 2022 22:39:33 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 5 Jan 2022 23:44:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b61366f3cc52ea54f9b5719d25ab09e595f53173
X-Git-Newrev: 5b4e139770b03a50dd93202bff50d2acda113346
X-Patchwork-Hint: ignore
Message-Id: <20220105223933.7B7C5832C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bmx7: drop useless $(d)
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b4e139770b03a50dd93202bff50d2acda113346
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was overlooked in commit
8e065065777e2955f385ae51b14c9f284b83e477 ("package/bmx7: new package")

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bmx7/bmx7.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bmx7/bmx7.mk b/package/bmx7/bmx7.mk
index 54a9cc8eb5..7eb8a3d6ca 100644
--- a/package/bmx7/bmx7.mk
+++ b/package/bmx7/bmx7.mk
@@ -11,7 +11,7 @@ BMX7_LICENSE_FILES = LICENSE
 BMX7_DEPENDENCIES = zlib mbedtls wireless_tools
 
 define BMX7_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(d)/src
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/src
 endef
 
 define BMX7_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
