Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0648CA1013
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75E3C61C33;
	Mon,  8 Sep 2025 10:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMIraMDT6kWl; Mon,  8 Sep 2025 10:39:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AF1561587
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AF1561587;
	Mon,  8 Sep 2025 10:39:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22EE9186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 974EB42B94
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89LWEo43kw75 for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AA9842B74
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AA9842B74
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4895983A90; Mon,  8 Sep 2025 10:39:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Sep 2025 17:19:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7e83660caecf3f95e6b311669b59a5391ce198a5
X-Git-Newrev: 39615bc2727fa3fa706baed2a96a12de8b8228e1
X-Patchwork-Hint: ignore
Message-Id: <20250908103908.4895983A90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/weston: do not
 select JPEG, no longer needed
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=39615bc2727fa3fa706baed2a96a12de8b8228e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since upstream commit 66e1614122c22d455cc3a28db08b3afac2b7be29, which
first appeared in version 1.11.0, back in 2016, jpeg is no longer a
mandatory dependency. And in fact, Buildroot no longer has it
unconditionally in WESTON_DEPENDENCIES since commit
f67a6e9b7a7be9adbc405b3126000056120a01af, but BR2_PACKAGE_WESTON is
still selecting in.

A build without libjpeg works just fine, so let's drop this select.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c8edd532c2ad7309efc36f9851127c9a55124411)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
