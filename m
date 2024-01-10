Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD7BC4707C
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 15:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06C0E4206F;
	Wed, 10 Jan 2024 15:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06C0E4206F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QgUgl_vlyPSc; Wed, 10 Jan 2024 15:37:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 135FF42095;
	Wed, 10 Jan 2024 15:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 135FF42095
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 201A21BF364
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02EBD42095
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02EBD42095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id avnjj8QhzHhS for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 15:37:14 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B37A4206F
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 15:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B37A4206F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C3CB2000C;
 Wed, 10 Jan 2024 15:37:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rNadh-008bsY-2H;
 Wed, 10 Jan 2024 16:37:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231109212901.5596-1-ps.report@gmx.net>
 <ZYyiJOUePibRgeQq@landeda>
Date: Wed, 10 Jan 2024 16:37:09 +0100
In-Reply-To: <ZYyiJOUePibRgeQq@landeda> (Yann E. MORIN's message of "Wed, 27
 Dec 2023 23:16:04 +0100")
Message-ID: <878r4xci8q.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v1 1/4] package/libcamera: pipeline option
 'raspberrypi' changed to 'rpi/vc4'
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2023-11-09 22:28 +0100, Peter Seiderer spake thusly:
 >> With upstram commit [1] (since version v0.1.0) the pipeline option 'raspberrypi'
 >> was renamed to 'rpi/vc4'.
 >> 
 >> Change the buildroot option name from BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
 >> to BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4 (and add Config.in.legacy entry
 >> accordingly) and move handling in Config.in/libcamer.mk to follow alphabetic
 >> ordering.
 >> 
 >> Fixes:
 >> 
 >> .../build/libcamera-v0.1.0/meson.build:3:0: ERROR: Options
 >> "raspberrypi" are not in allowed choices: "all, auto, imx8-isi,
 >> ipu3, rkisp1, rpi/vc4, simple, uvcvideo, vimc"
 >> 
 >> [1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=726e9274ea95fa46352556d340c5793a8da51fcd
 >> 
 >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 > Applied to master, thanks.

 > Regards,
 > Yann E. MORIN.

 >> ---
 >> Config.in.legacy               | 10 ++++++++++
 >> package/libcamera/Config.in    | 16 ++++++++--------
 >> package/libcamera/libcamera.mk |  6 +++---
 >> 3 files changed, 21 insertions(+), 11 deletions(-)
 >> 
 >> diff --git a/Config.in.legacy b/Config.in.legacy
 >> index 6fef2318b0..06a40f0b38 100644
 >> --- a/Config.in.legacy
 >> +++ b/Config.in.legacy
 >> @@ -146,6 +146,16 @@ endif
 >> 
 >> comment "Legacy options removed in 2023.11"
 >> 
 >> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
 >> +	bool "libcamera pipeline 'raspberrypi' was renamed to 'rpi/vc4'"
 >> +	depends on BR2_arm || BR2_aarch64
 >> +	depends on BR2_USE_WCHAR
 >> +	select BR2_LEGACY
 >> +	select BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4
 >> +	help
 >> +	  Since version ... the libcamera pipeline option 'raspberrypi' was

I guess ... should have been 0.1.0:

git describe --contains 726e9274e
v0.1.0~78

check-package also complains about too long help line:

Config.in.legacy:156: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

Committed to 2023.11.x after fixing those issues, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
