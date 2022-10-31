Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01F2C38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 09:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EF1A40443;
	Mon, 31 Oct 2022 09:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EF1A40443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l9PwdXtEOwfn; Mon, 31 Oct 2022 09:59:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 679CE4032A;
	Mon, 31 Oct 2022 09:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 679CE4032A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C09F01BF358
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4CBE40351
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4CBE40351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KK_8nHJ4Q-5h for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:57:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 003F940342
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 003F940342
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2DE687847; Mon, 31 Oct 2022 09:57:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 10:50:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27a4b1a967b1efbb8339aa198ac242063fd641e5
X-Git-Newrev: 55ef42e090b39fdf129b7e5e218019e0156fe166
X-Patchwork-Hint: ignore
Message-Id: <20221031095715.E2DE687847@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exim: fix typo in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=55ef42e090b39fdf129b7e5e218019e0156fe166
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/exim/exim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index e0fcd83fb0..9c54eeec44 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -20,7 +20,7 @@ define exim-config-change # variable-name, variable-value
 		$(@D)/Local/Makefile
 endef
 
-# Comment-out a variable. Has no effect if it does not exits.
+# Comment-out a variable. Has no effect if it does not exist.
 define exim-config-unset # variable-name
 	$(SED) 's,^\([[:space:]]*$1[[:space:]]*=.*$$\),# \1,' \
 		$(@D)/Local/Makefile
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
