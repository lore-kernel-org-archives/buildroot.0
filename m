Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20DBC433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 16:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FC944048E;
	Tue, 30 Nov 2021 16:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kswEnq5V_nh6; Tue, 30 Nov 2021 16:13:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 903DF4047B;
	Tue, 30 Nov 2021 16:13:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A5BD1BF2F0
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2072161BB3
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dcL66Qlox-4H for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E90861BBA
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D46ED920D9; Tue, 30 Nov 2021 16:07:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 17:09:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f95d322591cfbeea7ac0a95292c4b5170747585
X-Git-Newrev: 7e47d01c995b6a8329a4dafd4d5b2645b73cc9f2
X-Patchwork-Hint: ignore
Message-Id: <20211130160702.D46ED920D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ghostscript: drop spurious space
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e47d01c995b6a8329a4dafd4d5b2645b73cc9f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious space added by commit
f9e359d7653f4af32a491e2baf4b6e524554174b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ghostscript/ghostscript.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index ca24c61678..d502d19206 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -71,7 +71,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
 GHOSTSCRIPT_DEPENDENCIES += cups
-GHOSTSCRIPT_CONF_OPTS  += \
+GHOSTSCRIPT_CONF_OPTS += \
 	CUPSCONFIG=$(STAGING_DIR)/usr/bin/cups-config \
 	--enable-cups
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
