Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E452C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 20:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F150F40330;
	Thu, 28 Jul 2022 20:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F150F40330
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfyha2NyNgZ0; Thu, 28 Jul 2022 20:58:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E773F40201;
	Thu, 28 Jul 2022 20:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E773F40201
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DEB91BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27E24414A1
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 20:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27E24414A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1fwK-3jP89kO for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 20:58:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDFC040611
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDFC040611
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 20:58:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AC0521C0006;
 Thu, 28 Jul 2022 20:57:58 +0000 (UTC)
Date: Thu, 28 Jul 2022 22:57:57 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220728225757.1a380e4f@windsurf>
In-Reply-To: <20220728154542.3061123-1-fontaine.fabrice@gmail.com>
References: <20220728154542.3061123-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659041879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1dWgHndG5lVsC1hb2gtPHslXmtFlZHZ6ern7BTGpl0o=;
 b=A173Ojxdw+7nqtiTfEim75as4lkND3KZinJbx0ScgfAcPu1gewsd7ALrSZ2nIcOgX/jbLh
 JYMnyDD72gd+JYTawXvgqKGTN1sb+EePhPn4Zctwrafbcpr+sX+gYRvuj3B+EhUqXWHU90
 hwCOTEkbM5krWYnF7QMmcuMR5f6cZNh1G2ZGvfiMcoCO56vYSSjHU1rAJGLlYBdSaSe/sU
 h3IZJlbLwcAq4zbbEPY4tl3lfCN5o5Yju8O8nele6R8T3egYuMpziCUoe92NalasZRzEqJ
 Z3AJsm7A07QSPXg4gMAyjg1F48zemZrEPZoqPWYWECobgQSPI3gz7z+QCdh+fg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A173Ojxd
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez-alsa: needs alsa-lib mixer
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
Cc: =?UTF-8?B?SsO2cmc=?= Krause <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Jul 2022 17:45:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> aplay needs alsa-lib mixer since bump to version 4.0.0 in commit
> e843433e186c6802ae0c31cb501b2212972ed725 and
> https://github.com/Arkq/bluez-alsa/commit/7050c9a81895500fe2d59ec6e4859633d4353e36:
> 
> In file included from alsa-mixer.c:11:
> alsa-mixer.h:16:21: error: unknown type name 'snd_mixer_t'; did you mean
> 'snd_timer_t'?
>    16 | int alsa_mixer_open(snd_mixer_t **mixer, snd_mixer_elem_t
>       **elem,
>       |                     ^~~~~~~~~~~
>       |                     snd_timer_t
> 
> So select BR2_PACKAGE_ALSA_LIB_MIXER instead of building aplay
> conditionally to keep backward compatibility
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d3faac6e49fe9cc21091a5dfa44780b8c63189be
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bluez-alsa/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
