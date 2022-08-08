Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A6DC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 15:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3060F40A6E;
	Mon,  8 Aug 2022 15:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3060F40A6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UeZw_eZ6DT1p; Mon,  8 Aug 2022 15:23:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A11940A5C;
	Mon,  8 Aug 2022 15:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A11940A5C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDC8B1BF2FA
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9B7F40A5C
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9B7F40A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNfhF7_o_32Q for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 15:23:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C5AF40A09
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 15:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C5AF40A09
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4B90A86FE1; Mon,  8 Aug 2022 15:09:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 17:21:59 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7e69d057f7744b75f236a0d518829382ddcd3bea
X-Git-Newrev: 2b506b7d5b0b987f3982f6f6a0b8d4cb7060f08b
X-Patchwork-Hint: ignore
Message-Id: <20220808150900.4B90A86FE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/cwiid: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b506b7d5b0b987f3982f6f6a0b8d4cb7060f08b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
