Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E06BC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 15:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0BB260BF8;
	Mon,  8 Aug 2022 15:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0BB260BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B4Wa_5qUUx3P; Mon,  8 Aug 2022 15:23:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02AF360671;
	Mon,  8 Aug 2022 15:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02AF360671
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B8761BF2FA
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22CA160671
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22CA160671
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FtUmjk2nSX5R for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 15:23:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EC0F605D8
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 15:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EC0F605D8
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B0ED686FE4; Mon,  8 Aug 2022 15:09:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 17:21:46 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 3fa36af681385c6db347dd946ca55c6d64914a37
X-Git-Newrev: fd0238db2a40422ec9c4a4d58c6429f155ef0281
X-Patchwork-Hint: ignore
Message-Id: <20220808150931.B0ED686FE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/cwiid: fix
 comment dependency for MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd0238db2a40422ec9c4a4d58c6429f155ef0281
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fixed broken logic added with ceedd670d8ac54321c3c8b5b882346a035073e67
back in 2015.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4f25bbb7a758d4deee8216e25485ad113bae0f2c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cwiid/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 7e8cdc3086..44148eb188 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -33,4 +33,4 @@ comment "cwiid needs a toolchain w/ dynamic lib, threads, wchar, headers >= 3.18
 	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
-	depends on !BR2_USE_MMU
+	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
