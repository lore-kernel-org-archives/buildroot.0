Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C36EB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACC11612C4;
	Thu, 20 Jul 2023 21:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACC11612C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YHsRMOlm0aPc; Thu, 20 Jul 2023 21:20:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F39F161289;
	Thu, 20 Jul 2023 21:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F39F161289
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5FF71BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ED7141E25
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ED7141E25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eLSgTCzwGjFj for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:20:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9968141E13
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9968141E13
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88D54874C7; Thu, 20 Jul 2023 21:20:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 23:19:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 687f41227a08c54f49cd13896028761363645b1a
X-Git-Newrev: fbec4980061421c301d511ceeb57163079f07632
X-Patchwork-Hint: ignore
Message-Id: <20230720212023.88D54874C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuhttpd: fix comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbec4980061421c301d511ceeb57163079f07632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuhttpd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
index a552a88f0c..d89f4541b6 100644
--- a/package/libuhttpd/Config.in
+++ b/package/libuhttpd/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_LIBUHTTPD
 
 comment "libuhttpd needs a toolchain w/ gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
