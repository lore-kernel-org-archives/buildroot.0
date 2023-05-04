Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7522C77B78
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 20:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FC4342739;
	Thu,  4 May 2023 20:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FC4342739
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TzOI0i5Vu5yF; Thu,  4 May 2023 20:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D3C04273A;
	Thu,  4 May 2023 20:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D3C04273A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 725631BF3B8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4572584197
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4572584197
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hMrL4NWoHCNt for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 20:41:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FD4E84196
 for <buildroot@buildroot.org>; Thu,  4 May 2023 20:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FD4E84196
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07AFF85DAB; Thu,  4 May 2023 20:41:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 4 May 2023 22:30:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd57580729e4d5ac1fe1ed67fdfb7723a9fddece
X-Git-Newrev: 0ee49d6272b7046c0d961da0b3950e0f78b89a0b
X-Patchwork-Hint: ignore
Message-Id: <20230504204108.07AFF85DAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/edid-decode: fix typo in Config.in
 for comment selection
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ee49d6272b7046c0d961da0b3950e0f78b89a0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo ('!!' vs. '!') Config.in for dependencies comment selection
(introduced by commit 'package/edid-decode: bump version to 1889504',
see [1]).

[1] https://git.buildroot.net/buildroot/commit/?id=d498088fe7e1e664d4ee8d9bc54262d40227d6e5

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/edid-decode/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/edid-decode/Config.in b/package/edid-decode/Config.in
index ddf1942c68..5ebecd7330 100644
--- a/package/edid-decode/Config.in
+++ b/package/edid-decode/Config.in
@@ -8,5 +8,5 @@ config BR2_PACKAGE_EDID_DECODE
 	  https://git.linuxtv.org/edid-decode.git/
 
 comment "edid-decode needs a toolchain w/ C++, gcc >= 4.7"
-	depends on !!BR2_INSTALL_LIBSTDCPP || \
+	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
