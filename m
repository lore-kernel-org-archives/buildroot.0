Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5270C7619A
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 20:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 396AE4060F;
	Sun, 26 Mar 2023 20:01:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 396AE4060F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doVJJ5L05NyZ; Sun, 26 Mar 2023 20:01:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B7CF41619;
	Sun, 26 Mar 2023 20:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B7CF41619
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0C7C1BF8A8
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 20:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B16C4052F
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 20:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B16C4052F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ixjUeYW-GJ1f for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 20:01:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC5E7400E2
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 20:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC5E7400E2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C98D082AA7; Sun, 26 Mar 2023 20:01:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Mar 2023 21:59:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b2a679dfba428014900f1adaffee05d515f0e20
X-Git-Newrev: e81ca405164fbef1c43fc01aa2f95f67090d3bde
X-Patchwork-Hint: ignore
Message-Id: <20230326200116.C98D082AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libosmium: fix double space in
 Config.in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=e81ca405164fbef1c43fc01aa2f95f67090d3bde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libosmium/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libosmium/Config.in b/package/libosmium/Config.in
index 3a4c64e9d2..825e2b7e33 100644
--- a/package/libosmium/Config.in
+++ b/package/libosmium/Config.in
@@ -13,6 +13,6 @@ config BR2_PACKAGE_LIBOSMIUM
 
 	  https://osmcode.org/libosmium/
 
-comment "libosmium needs a toolchain w/ C++,  wchar, threads, gcc >= 4.7"
+comment "libosmium needs a toolchain w/ C++, wchar, threads, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
