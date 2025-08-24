Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F79CA0EFF
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 14:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB6B7616E6;
	Sun, 24 Aug 2025 14:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bN1BpWz3R28y; Sun, 24 Aug 2025 14:09:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAEB360BD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAEB360BD7;
	Sun, 24 Aug 2025 14:09:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 390F11D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 800A941BF7
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsAwSTh4Qy65 for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 14:09:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6D6C41B86
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6D6C41B86
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:09:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B077B87A2E; Sun, 24 Aug 2025 14:09:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 16:08:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddbad663e005cc19020b074fd9adc2859304afdf
X-Git-Newrev: c8edd532c2ad7309efc36f9851127c9a55124411
X-Patchwork-Hint: ignore
Message-Id: <20250824140932.B077B87A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: do not select JPEG,
 no longer needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8edd532c2ad7309efc36f9851127c9a55124411
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream commit 66e1614122c22d455cc3a28db08b3afac2b7be29, which
first appeared in version 1.11.0, back in 2016, jpeg is no longer a
mandatory dependency. And in fact, Buildroot no longer has it
unconditionally in WESTON_DEPENDENCIES since commit
f67a6e9b7a7be9adbc405b3126000056120a01af, but BR2_PACKAGE_WESTON is
still selecting in.

A build without libjpeg works just fine, so let's drop this select.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/weston/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 89bcaa4aa0..614fef6bcc 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -15,7 +15,6 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBDISPLAY_INFO
 	select BR2_PACKAGE_LIBDRM
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
