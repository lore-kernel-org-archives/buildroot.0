Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F4BEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4259C6104E;
	Sun, 30 Jul 2023 21:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4259C6104E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xuvZHPOaJXX4; Sun, 30 Jul 2023 21:36:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 867386103F;
	Sun, 30 Jul 2023 21:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 867386103F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13AF91BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC7A36103F
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC7A36103F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LnMB9_uL_30Z for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:36:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE41F6103D
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE41F6103D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAE8E83D2D; Sun, 30 Jul 2023 21:36:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 23:35:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2aaa0fbe2fdf6e599c68169aa7b2e55237190c7
X-Git-Newrev: 17cdf58f1cb85a786cdd884872486828fe416112
X-Patchwork-Hint: ignore
Message-Id: <20230730213624.DAE8E83D2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/speex: force arm mode instead of
 Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=17cdf58f1cb85a786cdd884872486828fe416112
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
