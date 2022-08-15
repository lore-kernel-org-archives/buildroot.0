Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C680DC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FD9140A96;
	Mon, 15 Aug 2022 09:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FD9140A96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fAzaVTej_BFC; Mon, 15 Aug 2022 09:17:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CC2840A8B;
	Mon, 15 Aug 2022 09:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CC2840A8B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01AB71BF990
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE75B83EB0
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE75B83EB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YUe66RimhAeh for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CC7A82890
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CC7A82890
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3B0DF875B1; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:03:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a25026f3b95df36f2d18ab1e1dd5e805c73abb22
X-Git-Newrev: 4a8753719312bdc99785f59896bbe4455ba69d8a
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.3B0DF875B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: fix typo on
 BR2_powerpc64le
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a8753719312bdc99785f59896bbe4455ba69d8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The typo was added by commit from 2016
'0480bbc1a0 package/freeswitch: new package'

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeswitch/freeswitch.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index c576e5f267..24c1ee4dd4 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -80,7 +80,7 @@ FREESWITCH_CONF_OPTS = \
 
 # zrtp supports a limited set of archs, sparc support is also broken due
 # to a broken ld call by gcc, see libs/libzrtp/include/zrtp_config.h
-ifeq ($(BR2_i386)$(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpcle)$(BR2_x86_64),y)
+ifeq ($(BR2_i386)$(BR2_arm)$(BR2_armeb)$(BR2_aarch64)$(BR2_aarch64_be)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le)$(BR2_x86_64),y)
 FREESWITCH_LICENSE_FILES += libs/libzrtp/src/zrtp_legal.c
 FREESWITCH_CONF_OPTS += --enable-zrtp
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
