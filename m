Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36A7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 16:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 552BB81CDC;
	Wed, 20 Jul 2022 16:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 552BB81CDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kbXNkjwQB95V; Wed, 20 Jul 2022 16:43:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E16681948;
	Wed, 20 Jul 2022 16:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E16681948
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA5C91BF352
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7651A60B43
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 16:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7651A60B43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id flCUYrKE0GzP for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 16:43:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41C106080A
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41C106080A
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 16:43:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E917524000C;
 Wed, 20 Jul 2022 16:43:24 +0000 (UTC)
Date: Wed, 20 Jul 2022 18:43:23 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220720184323.02e79e32@windsurf>
In-Reply-To: <20220615205026.117274-1-fontaine.fabrice@gmail.com>
References: <20220615205026.117274-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658335405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TV2OD0XVcpQTl5TgGr18RkyWgXOyqxuYFCGMKV77lGY=;
 b=OI/UFRxOAO6BQL+lqIywsUYFTMmev9mbhnDhzmu/ZhTeANQbN4TVRO4xdpzbzTF+LPgeQo
 L23mC+pxmt8iTN+DjCIAJsy9eDgwbFPhzHJHGAjKoP+gwQV7qED6BeCFOnG3vY8vbENCoy
 VWYlOLIdGR90F2rMI73/M8MT+9GMJ8smhgHV9VNp9stECUXEN+xwFIasJhFLds3vbyiag8
 N7g9fPu7bFhi4xhrWoQA18TK7oHay6l9QJWyuwPhIU+H2D22rgzUSxPFoILa4AqOZS2bX6
 AXOULlHvf8SGGUHx8g7dWm97TGvvBEcfd2csHxWmseofzPaD2aJBDZriHCp2oQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OI/UFRxO
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-utils: selects
 BR2_PACKAGE_ALSA_LIB_{PCM, RAWMIDI}
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 15 Jun 2022 22:50:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> alsactl (which is unconditionally built) needs
> BR2_PACKAGE_ALSA_LIB_RAWMIDI since bump to version 1.2.7 in commit
> 4dc8563363d639255217ffc59482eaccf93a1b51 and
> https://github.com/alsa-project/alsa-utils/commit/bbc74a61ac7c35e506c3d7f76ecf943cb55736a6:
> 
> info.c:83:44: error: unknown type name 'snd_rawmidi_stream_t'; did you mean 'snd_pcm_stream_t'?
>    83 | static const char *snd_rawmidi_stream_name(snd_rawmidi_stream_t stream)
>       |                                            ^~~~~~~~~~~~~~~~~~~~
>       |                                            snd_pcm_stream_t
> 
> aplay (which is always built as BR2_PACKAGE_ALSA_LIB_PCM is selected by
> BR2_PACKAGE_ALSA_LIB) needs BR2_PACKAGE_ALSA_LIB_UCM since bump to
> version 1.2.7 in commit 4dc8563363d639255217ffc59482eaccf93a1b51 and
> https://github.com/alsa-project/alsa-utils/commit/90f59671784a7e47b40485095cd66892d4840ed7:
> 
> aplay.c:44:10: fatal error: alsa/use-case.h: No such file or directory
>    44 | #include <alsa/use-case.h>
>       |          ^~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/708aecfafccecd99f8a4178412a9dd0cf9123f72
>  - http://autobuild.buildroot.org/results/366aa43e82615e2a5a36fcb98b3bdfbc5e99786f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This has been fixed differently in:

  https://git.buildroot.org/buildroot/commit/?id=83bad5e0f00df3b03fd55916f5e03e64946ff177

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
