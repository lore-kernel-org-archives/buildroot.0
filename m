Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBC6EE49A5
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 21:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BA2D4064A;
	Tue, 22 Aug 2023 21:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BA2D4064A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EA35GLOOi9HF; Tue, 22 Aug 2023 21:28:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C40B24048C;
	Tue, 22 Aug 2023 21:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C40B24048C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD481BF2F1
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 21:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 670814048C
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 21:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 670814048C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WTvAll_THTHM for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 21:28:05 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9F2240003
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 21:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9F2240003
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A2C4C0002;
 Tue, 22 Aug 2023 21:28:01 +0000 (UTC)
Date: Tue, 22 Aug 2023 23:28:00 +0200
To: Tristan van Berkom via buildroot <buildroot@buildroot.org>
Message-ID: <20230822232800.1901678d@windsurf>
In-Reply-To: <049052a13b668b1243c1a035955b57e2b12c90dc.camel@codethink.co.uk>
References: <049052a13b668b1243c1a035955b57e2b12c90dc.camel@codethink.co.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692739682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Igd+GeQG5GZorH0P9rscf45ef0aSChEwGsOX6tMK2H0=;
 b=m/d+UKTN6QAxLuhDKKIF/F8Sl3ZdXq1Y6xF4vNob7aQD/PDXWW4NJM2T6x5NkPJc4IrQS+
 Ie8w/CMJqcy7Pjb0NAumJaU9Rc/7q9qqGRkaeFOQ9UZSmbZcqSP7DH/ygNoX9n5L+XGhei
 MekHmOJTO+5ENzLDigQHAfCXKqnt6If56slqQ06QJWgofnUk5ZEakvYQFLgjtLkkmcEWpz
 w4VavYCDfl4SuJDjZtyRNerD9n/nJp6UOmP2lCVGpfbcNyWej4/iuQUY9F57ullPneKW8I
 03uzCpqzpeidmFx26V+EziF95aJT2TuC3PuNF69t3pGyhOtUpMoPMfuto9JAQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m/d+UKTN
Subject: Re: [Buildroot] [PATCH] package/mesa3d: Allow building patent
 encumbered video codecs
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
Cc: Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Tristan van Berkom <tristan.vanberkom@codethink.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Tristan,

On Fri, 04 Aug 2023 20:12:43 +0900
Tristan van Berkom via buildroot <buildroot@buildroot.org> wrote:

> This patch adds some options to allow building the patent encumbered
> codecs in mesa, such as H.264/H.265 encoders/decoders which are useful
> for hardware accelerated decoding via libva/gstreamer.
> 
> These codecs are now disabled by default in upstream mesa as per:
>   https://gitlab.freedesktop.org/mesa/mesa/-/commit/7d969fe9e91e39e03041cdfac69bf33337bc2c96
> 
> Signed-off-by: Tristan van Berkom <tristan.vanberkom@codethink.co.uk>
> ---
>  package/mesa3d/Config.in | 36 ++++++++++++++++++++++++++++++++++++
>  package/mesa3d/mesa3d.mk | 11 +++++++++++
>  2 files changed, 47 insertions(+)

Thanks for your patch. I have one implementation suggestion (which I
had already implemented locally as I was about to merge your patch) but
also a more fundamental question that I was not able to answer directly.

> +# inform the .mk file of video codec selection
> +config BR2_PACKAGE_MESA3D_VIDEO_CODEC
> +       bool

This option is not needed, and all the "select" of it can be dropped.

> +# Video codecs (patent encumbered)
> +MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_VC1DEC)  += vc1dec
> +MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_H264DEC) += h264dec
> +MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_H264ENC) += h264enc
> +MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_H265DEC) += h265dec
> +MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_H265ENC) += h265enc
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_VIDEO_CODEC),y)

Replace this with:

ifneq ($(MESA3D_VIDEO_CODECS-y),)

and tada, the option BR2_PACKAGE_MESA3D_VIDEO_CODEC can be dropped.

However, the more fundamental question is: what do those options do?

If I build a defconfig like this:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_VIDEO_CODEC_VC1DEC=y
BR2_PACKAGE_MESA3D_VIDEO_CODEC_H264DEC=y
BR2_PACKAGE_MESA3D_VIDEO_CODEC_H264ENC=y
BR2_PACKAGE_MESA3D_VIDEO_CODEC_H265DEC=y
BR2_PACKAGE_MESA3D_VIDEO_CODEC_H265ENC=y
# BR2_TARGET_ROOTFS_TAR is not set

Then absolutely nothing gets installed by mesa3d.

Looking more closely, the -Dvideo-codecs option is doing this:

_codecs = get_option('video-codecs')
foreach c : ['vc1dec', 'h264dec', 'h264enc', 'h265dec', 'h265enc']
   pre_args += '-DVIDEO_CODEC_@0@=@1@'.format(c.to_upper(), _codecs.contains(c).to_int())
endforeach

So it's basically defining VIDEO_CODEC_VC1DEC, VIDEO_CODEC_H264DEC,
etc. So I grepped in the mesa3d tree, and only found references in
src/gallium/auxiliary/vl/vl_codec.c:

bool vl_codec_supported(struct pipe_screen *screen,
                        enum pipe_video_profile profile,
                        bool encode)
{
   if (profile == PIPE_VIDEO_PROFILE_VC1_SIMPLE ||
       profile == PIPE_VIDEO_PROFILE_VC1_MAIN ||
       profile == PIPE_VIDEO_PROFILE_VC1_ADVANCED) {
      if (!VIDEO_CODEC_VC1DEC)
         return false;
   }
   if (profile >= PIPE_VIDEO_PROFILE_MPEG4_AVC_BASELINE &&
       profile <= PIPE_VIDEO_PROFILE_MPEG4_AVC_HIGH444) {
      if (encode) {
         if (!VIDEO_CODEC_H264ENC)
            return false;
      } else if (!VIDEO_CODEC_H264DEC) {
         return false;
      }
   }
   if (profile >= PIPE_VIDEO_PROFILE_HEVC_MAIN &&
       profile <= PIPE_VIDEO_PROFILE_HEVC_MAIN_444) {
      if (encode) {
         if (!VIDEO_CODEC_H265ENC)
            return false;
      } else if (!VIDEO_CODEC_H265DEC) {
         return false;
      }
   }

   return screen->get_video_param(screen, profile, encode ? PIPE_VIDEO_ENTRYPOINT_ENCODE : PIPE_VIDEO_ENTRYPOINT_BITSTREAM, PIPE_VIDEO_CAP_SUPPORTED);
}

So essentially *not* defining those options only make this function
report that some codecs are not supported. Defining those options do
not seem to add any extra functionality to mesa3d.

Could you clarify what's happening here?

Also, since it's affecting code in src/gallium/, maybe those new
options need to be conditional on having at least one Gallium driver
enabled? That being said, even if I enable the swrast Gallium driver,
vl_codec.c doesn't get compiled in, so it's not just having a Gallium
driver enabled.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
