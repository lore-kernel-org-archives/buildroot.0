Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF74C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 18:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F286140391;
	Wed, 27 Jul 2022 18:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F286140391
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6x7pAt9S_ac; Wed, 27 Jul 2022 18:37:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA82440117;
	Wed, 27 Jul 2022 18:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA82440117
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6C291BF422
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DFE881D65
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 18:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DFE881D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C5EV8OypMifh for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 18:37:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C54CD81C58
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C54CD81C58
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 18:37:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 260D660007;
 Wed, 27 Jul 2022 18:37:45 +0000 (UTC)
Date: Wed, 27 Jul 2022 20:37:44 +0200
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20220727203744.40f2fd12@windsurf>
In-Reply-To: <20220113210431.1361727-1-paul@crapouillou.net>
References: <20220113210431.1361727-1-paul@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658947066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IOJSpCdvcJ6cRS4c7qUPWxfpZgZQkQAHYhoHnHOn0xI=;
 b=NiF+WmCMKl8o5BHoEgWKyzmzETGZzj251MLDOaUK0O6JffrsdKupNHJQq0Gd6IlDD90Pd9
 f5j8ygmZI7Sxfs9L/u/b0J3T0nxMrjLrR4vSYvL+ALbgAYBG7BihAosrCKhRB25yGR90CD
 cY/vVR4LAxzgmlXz6EzY8/JmFGe/EYtIjFF5znRJVbF+KUruuFMZA6atIBzM08fQQmZGwR
 QmeEr/8FYFTTnssJZ4yElS9jH4GIPf8qYFN7LYhG3R23zEiNfzmnDCKrIs4sbnyPSAkf83
 TojyLmxXrSUeiKbnqhlyo/U5i+7r2LOWHXQE88gt7pbVlwYGobRBuHYAgmDmEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NiF+WmCM
Subject: Re: [Buildroot] [PATCH 1/1] Config.in: add option to only use
 ccache for BR
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Paul,

On Thu, 13 Jan 2022 21:04:31 +0000
Paul Cercueil <paul@crapouillou.net> wrote:

> Add an option, disabled by default, to only use ccache for Buildroot
> packages.
> 
> When enabled, ccache will be used when building Buildroot itself, but
> the toolchain exported as SDK will not make use of ccache to build
> external programs, unless the "BR_USE_CCACHE" environment variable is
> set.
> 
> The motivation behind this change is to be able to speed up iterative
> building of a Buildroot based distribution, without forcing the users of
> the SDK to use ccache, which has the problem of clobbering the
> filesystem in a hidden directory if the cache directory is left as
> default, or trying to access a cache folder that existed on the machine
> that built the SDK but which may not exist on the machine on which it
> was later installed.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  Config.in                      | 9 +++++++++
>  linux/linux.mk                 | 4 ++++
>  package/Makefile.in            | 4 ++++
>  toolchain/toolchain-wrapper.c  | 5 +++++
>  toolchain/toolchain-wrapper.mk | 4 ++++
>  5 files changed, 26 insertions(+)

We have applied your patch, but with some significant change.

We have dropped the Config.in option, as we believe the SDK should not
use ccache in general. We have introduce a BR2_USE_CCACHE variable (not
a Config.in option!) which when set to 1 tells the wrapper to use
ccache. Buildroot defines/exports this variable globally in its
Makefile, so that during the Buildroot build ccache is used (if
enabled, of course). ccache is not used in the SDK situation, unless
explicitly overridden with BR2_USE_CCACHE=1.

Thanks to that, we could also remove the BR_NO_CCACHE variable, so that
we don't have two confusing variables doing almost the same thing.

See
https://git.buildroot.org/buildroot/commit/?id=d5c0eaef1f7c3b705cc1cf3087bd83ad9098aa2f
for the final implementation.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
