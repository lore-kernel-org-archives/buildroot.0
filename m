Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7331C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 16:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43E6583ED6;
	Sun, 14 Aug 2022 16:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43E6583ED6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vKFOrYUnpp3E; Sun, 14 Aug 2022 16:11:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33ECD83ECA;
	Sun, 14 Aug 2022 16:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33ECD83ECA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB3331BF410
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B474F83ECA
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B474F83ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A6AEE1oSYdCv for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 16:11:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7209483EC4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7209483EC4
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 16:11:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 57D046012B;
 Sun, 14 Aug 2022 18:11:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 18:11:42 +0200
Date: Sun, 14 Aug 2022 18:11:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220814161142.GO2775145@scaer>
References: <20220814125656.1227977-1-francois.perrad@gadz.org>
 <20220814150444.GH2775145@scaer>
 <122138b7-6c9a-b054-c986-62745b6b6f82@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <122138b7-6c9a-b054-c986-62745b6b6f82@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660493505;
 bh=W53MEYUX4OD+x6+CQwQdGWXEJ0FGtobUuJlUp2Gcwdk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N9kVH/lzUbeojggb5SvdSKcIs3cgKIxEOJoqj5XeJZqyO4L8ioS7C9CRaTYQWFSuz
 rtiNtkGj9gmCT3Z7oZQskOxCvkw1N4zvnvIaxO0+zUP12ethdU+ksaiS2LPISLjHEN
 zi1R/g8ww/KRw5xLCcwnd/u8UGvcVGE9tm9WqbjPrrfox0QhZp3MUBPhs3d/yKH/i7
 h+zoUF/nNqw8tztFJI5vSjih9yCO/lwhW81d8g6qCQyMgQfXdej/ADdIlQ67wsPbj8
 xe7UBvo8ZEu3enhCS6zVlxm1WiDCN6sJjNj/mHbrghQ+Bc8aFB7NCGyuCZkRpjdISW
 5Mzbz1QvmadDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N9kVH/lz
Subject: Re: [Buildroot] [PATCH] package/qoriq-cadence-dp-firmware: refactor
 with FREESCALE_IMX_EXTRACT_HELPER
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
Cc: buildroot@busybox.net, Francois Perrad <fperrad@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-08-14 17:56 +0200, Arnout Vandecappelle spake thusly:
> On 14/08/2022 17:04, Yann E. MORIN wrote:
> >On 2022-08-14 14:56 +0200, Francois Perrad spake thusly:
> >>avoid code duplication
[--SNIP--]
> >Also, when we have packages that share some infrastructure, we like them
> >to be in a sub-directory of a common dir (like qt5 and all the Qt 5.x
> >packages, or like indeed freescale-imx and all relatedpackages). But
> >this qoriq-cadence-dp-firmware is not part of that freescale-imx
> >collection.
> 
>  This, on the other hand, is pretty essential IMHO.
> 
>  The solution in this case may be to move it to a global place, e.g.
> package/pkg-utils. With the number of places where we need this crappy
> extractor, it can be considered infra on the level of the gitlab helper.
> 
>  So, I propose 4 patches.
> 
> 1. Fix license files as described below by Yann.
> 2. Move FREESCALE_IMX_EXTRACT_HELPER to package/pkg-utils.mk.
> 3. Rename FREESCALE_IMX_EXTRACT_HELPER to NXP_EXTRACT_HELPER.
> 4. Use NXP_EXTRACT_HELPER in qoriq-cadence-dp-firmware.
> 
>  Yann, do you agree?

Yes, this is fine with me.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> >
> >So, in this case, I prefer we keep the duplication.
> >
> >Yeah, Freescale is now part of NXP, but this is not a reason yet.
> >
> >Also, note that the extract helper does extract a fie named EULA, but it
> >it not present in LICENSE_FILES, even though the comment states it
> >should be.
> >
> >Additionally, one extracted, there is also an EULA.txt file that is not
> >in LICENSE_FILES wither, which I think it should be.
> >
> >Can you address those last two bits in a separate patch, please?
> >
> >Regards,
> >Yann E. MORIN.
> >
> >>Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> >>---
> >>  .../qoriq-cadence-dp-firmware.mk              | 27 +------------------
> >>  1 file changed, 1 insertion(+), 26 deletions(-)
> >>
> >>diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> >>index 23643d24e..1a97c5803 100644
> >>--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> >>+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> >>@@ -13,33 +13,8 @@ QORIQ_CADENCE_DP_FIRMWARE_REDISTRIBUTE = NO
> >>  QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
> >>  QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET = NO
> >>-# Helper for self-extracting binaries distributed by NXP.
> >>-#
> >>-# The --force option makes sure it doesn't fail if the source
> >>-# directory already exists. The --auto-accept skips the license check,
> >>-# as it is not needed in Buildroot because we have legal-info. Since
> >>-# there's a EULA in the binary file, we extract it in this macro, and
> >>-# it should therefore be added to the LICENSE_FILES variable of
> >>-# packages using this macro. Also, remember to set REDISTRIBUTE to
> >>-# "NO". Indeed, this is a legal minefield: the EULA specifies that the
> >>-# Board Support Package includes software and hardware (sic!) for
> >>-# which a separate license is needed...
> >>-#
> >>-# $(1): full path to the archive file
> >>-#
> >>-define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_HELPER
> >>-	awk 'BEGIN      { start = 0; } \
> >>-	     /^EOEULA/  { start = 0; } \
> >>-	                { if (start) print; } \
> >>-	     /<<EOEULA/ { start = 1; }' \
> >>-	    $(1) > $(@D)/EULA
> >>-	cd $(@D) && sh $(1) --force --auto-accept
> >>-	find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
> >>-	rmdir $(@D)/$(basename $(notdir $(1)))
> >>-endef
> >>-
> >>  define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
> >>-	$(call QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
> >>+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
> >>  endef
> >>  define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
> >>-- 
> >>2.34.1
> >>
> >>_______________________________________________
> >>buildroot mailing list
> >>buildroot@buildroot.org
> >>https://lists.buildroot.org/mailman/listinfo/buildroot
> >
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
