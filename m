Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AF7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 11:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39FE64174F;
	Sun, 17 Jul 2022 11:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39FE64174F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 86iODxF7fF0X; Sun, 17 Jul 2022 11:31:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F29264173B;
	Sun, 17 Jul 2022 11:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F29264173B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 454F01BF325
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 11:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E88083E49
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 11:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E88083E49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q0aszFx9M0vq for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 11:31:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 509A683E47
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 11:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 509A683E47
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 436968399D; Sun, 17 Jul 2022 11:17:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 13:30:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86deafe8635738c3f9efcbda5b22883504d59129
X-Git-Newrev: 4f25bbb7a758d4deee8216e25485ad113bae0f2c
X-Patchwork-Hint: ignore
Message-Id: <20220717111751.436968399D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cwiid: fix comment dependency for
 MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f25bbb7a758d4deee8216e25485ad113bae0f2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixed broken logic added with ceedd670d8ac54321c3c8b5b882346a035073e67
back in 2015.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
