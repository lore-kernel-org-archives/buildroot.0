Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3297CC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 16:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC97240350;
	Mon,  7 Mar 2022 16:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bBNHy_tX8R1g; Mon,  7 Mar 2022 16:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02E53402C4;
	Mon,  7 Mar 2022 16:43:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9F181BF36A
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 16:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3F09823AA
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 16:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bERyyTgGdoUZ for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 16:43:17 +0000 (UTC)
X-Greylist: delayed 01:50:00 by SQLgrey-1.8.0
Received: from 14.mo583.mail-out.ovh.net (14.mo583.mail-out.ovh.net
 [188.165.51.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B437D8239A
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 16:43:17 +0000 (UTC)
Received: from player716.ha.ovh.net (unknown [10.108.4.24])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 1E331211DB
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 14:13:32 +0000 (UTC)
Received: from dopsi.ch (unknown [147.87.105.170])
 (Authenticated sender: dopsi@dopsi.ch)
 by player716.ha.ovh.net (Postfix) with ESMTPSA id 21904280FA7E8;
 Mon,  7 Mar 2022 14:13:30 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005573865ea-bca2-415c-8429-c0b146579933,
 8AFCA4340CFC43748FAE0634748708AC83408C53) smtp.auth=dopsi@dopsi.ch
X-OVh-ClientIp: 147.87.105.170
From: Simon Doppler <dopsi@dopsi.ch>
To: buildroot@buildroot.org
Date: Mon,  7 Mar 2022 15:13:21 +0100
Message-Id: <20220307141321.307200-1-dopsi@dopsi.ch>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1372190512895801528
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddugedgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufhimhhonhcuffhophhplhgvrhcuoeguohhpshhiseguohhpshhirdgthheqnecuggftrfgrthhtvghrnhepueetteegveeukefggfegtdelfeegleeghfeufeeukedtkedvfedujedvhfegjeeinecukfhppedtrddtrddtrddtpddugeejrdekjedruddthedrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrjeduiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpeguohhpshhiseguohhpshhirdgthhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
Subject: [Buildroot] [PATCH] docs/manual: Document Kconfig requirements for
 uboot
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
Cc: Simon Doppler <dopsi@dopsi.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When using uboot's legacy build system, the 'make uboot-menuconfig'
and 'make uboot-savedefconfig' targets are not available as they
are created by 'kconfig-package'.

Signed-off-by: Simon Doppler <dopsi@dopsi.ch>
---
 docs/manual/make-tips.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 869b6807dd..df3b888c25 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -35,7 +35,8 @@ some settings in the +.config+ file may hide some targets:
 * +barebox-menuconfig+ and +barebox-savedefconfig+ only work when the
   +barebox+ bootloader is enabled.
 * +uboot-menuconfig+ and +uboot-savedefconfig+ only work when the
-  +U-Boot+ bootloader is enabled.
+  +U-Boot+ bootloader is enabled and the +uboot+ build system is set
+  to +Kconfig+.
 
 .Cleaning:
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
