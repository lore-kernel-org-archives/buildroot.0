Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53045C83F01
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 07:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B533E60FB4;
	Sun, 27 Aug 2023 07:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B533E60FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVvk94NnZowR; Sun, 27 Aug 2023 07:45:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB67760E43;
	Sun, 27 Aug 2023 07:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB67760E43
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CC291BF5F6
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 07:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 236774139E
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 07:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 236774139E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C40ThbrWCa4z for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 07:45:32 +0000 (UTC)
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk
 [188.40.203.114])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02523410DB
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 07:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02523410DB
Received: from [211.234.180.1] (helo=pony)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1qaASd-005RZI-Gb; Sun, 27 Aug 2023 08:45:28 +0100
Message-ID: <5bd02ea41d82fd4cb947de8228cb79c398d60b5e.camel@codethink.co.uk>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tristan van Berkom
 via buildroot <buildroot@buildroot.org>
Date: Sun, 27 Aug 2023 16:45:22 +0900
In-Reply-To: <20230822232800.1901678d@windsurf>
References: <049052a13b668b1243c1a035955b57e2b12c90dc.camel@codethink.co.uk>
 <20230822232800.1901678d@windsurf>
Organization: Codethink
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
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
From: Tristan van Berkom via buildroot <buildroot@buildroot.org>
Reply-To: Tristan van Berkom <tristan.vanberkom@codethink.co.uk>
Cc: Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

My inbox has been crowded and this email has escaped my attention since
wednesday, thanks for your valuable attention to my patch :)

Also, I only realized this now, but we also have a requirement to
enable -Dgallium-va=enabled in order to use the codecs - while the
codecs might only be relevant for the vulkan interfaces without also
fixing that in buildroot.

Came to that conclusion at the end of writing this mail but thought I
should lead with this, as it may make sense to hold back on this change
until we can also safely turn on -Dgallium-va (and/or -Dgallium-vdpau).

On Tue, 2023-08-22 at 23:28 +0200, Thomas Petazzoni wrote:
> Hello Tristan,
> 
[...]
> Thanks for your patch. I have one implementation suggestion (which I
> had already implemented locally as I was about to merge your patch) but
> also a more fundamental question that I was not able to answer directly.
> 

I've made your suggested changes and tested this locally and indeed
this works well.

> However, the more fundamental question is: what do those options do?
> 
> If I build a defconfig like this:
> 
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_VIDEO_CODEC_VC1DEC=y
> BR2_PACKAGE_MESA3D_VIDEO_CODEC_H264DEC=y
> BR2_PACKAGE_MESA3D_VIDEO_CODEC_H264ENC=y
> BR2_PACKAGE_MESA3D_VIDEO_CODEC_H265DEC=y
> BR2_PACKAGE_MESA3D_VIDEO_CODEC_H265ENC=y
> # BR2_TARGET_ROOTFS_TAR is not set

In one example case (we have several platforms which this affects), I
believe it is the BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI which will
lead to the installation of radeonsi_drv_video.so.


[...]
> 
> So essentially *not* defining those options only make this function
> report that some codecs are not supported. Defining those options do
> not seem to add any extra functionality to mesa3d.
> 
> Could you clarify what's happening here?
> 

Interesting, I was not aware of the implementation detail and indeed I
would have expected excluded files or #ifdef block being conditionally
included at build time.

> Also, since it's affecting code in src/gallium/, maybe those new
> options need to be conditional on having at least one Gallium driver
> enabled? That being said, even if I enable the swrast Gallium driver,
> vl_codec.c doesn't get compiled in, so it's not just having a Gallium
> driver enabled.

I understand that your concern is whether this added option should be
conditional to other options, and this is still a bit unclear to me.

That said, I think it would be beneficial to lean towards the expressed
intent of the added -Dvideo-codecs option in mesa, rather than the
current implementation in code.

Looking at the definition of the option:

option(
  'video-codecs',
  type : 'array',
  value : [],
  choices: [
    'vc1dec', 'h264dec', 'h264enc', 'h265dec', 'h265enc'
  ],
  description : 'List of patent encumbered codecs to build support for. ' +
                'Distros might want to consult their legal department before ' +
                'enabling these. This is used for all video APIs (vaapi, ' +
                'vdpau, vulkan). Non-patent encumbered codecs will be ' +
                'enabled by default.'
)

Here the upstream is telling us that the options are relevant for
vaapi, vdpau and vulkan interfaces.

Looking at the meson options, it seems that both va / vdpau are
interfaces to the gallium drivers, and so I suppose one could say that
these video codec options are only relevant if:

  * At least one vulkan driver is selected
  * At least one gallium driver is selected
    * AND either -Dgallium-vdpau or -Dgallium-va enabled

Now I realize, that we are actually ALSO carrying an ugly downstream
patch in order to enable -Dgallium-va, and I will need to investigate
whether it is still required (the claim is that libva has a link time
requirement on mesa3d libraries while mesa3d requires the libva
headers) - this part will be a bit more tricky to cleanup and upstream
if the problem still exists.

Cheers,
    -Tristan

[0]: https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson_options.txt#L626


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
