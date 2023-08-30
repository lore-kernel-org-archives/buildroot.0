Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FD3C83F14
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 22:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5E89612D7;
	Wed, 30 Aug 2023 22:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5E89612D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bRt4XHBkkd_e; Wed, 30 Aug 2023 22:34:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33C54612CD;
	Wed, 30 Aug 2023 22:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33C54612CD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 796681BF424
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEF2741917
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEF2741917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIkvcYLsox-i for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 22:32:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA31241E1F
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA31241E1F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 990C7866DF; Wed, 30 Aug 2023 22:32:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 00:23:50 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 99c68c06b8a4067c65a8d72a6a11929dabbdcad7
X-Git-Newrev: 4d292bc080f42c0b74cb4363e25d024743675793
X-Patchwork-Hint: ignore
Message-Id: <20230830223233.990C7866DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/speex: force arm
 mode instead of Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d292bc080f42c0b74cb4363e25d024743675793
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following build failure:

/tmp/cclxE0xY.s: Assembler messages:
/tmp/cclxE0xY.s:118: Error: cannot honor width suffix -- `smlabb r2,r0,r4,r6'
/tmp/cclxE0xY.s:134: Error: cannot honor width suffix -- `smlabb r9,r2,r2,r3'
/tmp/cclxE0xY.s:812: Error: cannot honor width suffix -- `smlabb r1,r2,r2,r6'
/tmp/cclxE0xY.s:1202: Error: cannot honor width suffix -- `smulbb r3,r0,r6'
/tmp/cclxE0xY.s:2298: Error: cannot honor width suffix -- `smulbb r3,r0,r4'
/tmp/cclxE0xY.s:3133: Error: cannot honor width suffix -- `smulbb r3,r2,r5'

Fixes:
http://autobuild.buildroot.net/results/c55/c557ca72832c942f201b4a21f913f74534857cc6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 17cdf58f1cb85a786cdd884872486828fe416112)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/speex/speex.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 6d61e93833..0bbcb2bde2 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -26,6 +26,10 @@ ifeq ($(BR2_PACKAGE_SPEEX_ARM5E),y)
 SPEEX_CONF_OPTS += --enable-arm5e-asm
 endif
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+SPEEX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 define SPEEX_LIBTOOL_FIXUP
 	$(SED) 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' $(@D)/libtool
 	$(SED) 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' $(@D)/libtool
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
