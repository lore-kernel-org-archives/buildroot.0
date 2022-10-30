Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844DAC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02F8460ABD;
	Sun, 30 Oct 2022 14:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02F8460ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLaZOZ9bVo9s; Sun, 30 Oct 2022 14:00:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E8FD60A72;
	Sun, 30 Oct 2022 14:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E8FD60A72
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7DA81BF489
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89B4A40302
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:00:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89B4A40302
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1y9bP5cDY9vZ for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:00:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C501402C3
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C501402C3
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:00:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 11BD840005;
 Sun, 30 Oct 2022 14:00:36 +0000 (UTC)
Date: Sun, 30 Oct 2022 15:00:35 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221030150035.48cf618b@windsurf>
In-Reply-To: <20221028191526.122405-1-bernd.kuhls@t-online.de>
References: <20221028191526.122405-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667138437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+JYetLlWn4a1AhAdSv1MVqWSJtQcmEczTeqMtmiJbA=;
 b=SeFHGBG/6gtfq2GEV/bOtpyvfHD1xm7bXkhBqPVE67WnxF0Fo3RsPp8CBCKt8nqXKN+6Oc
 yk243F8OtZhukhUujESc1jHjAEKZmcjI0smgtcbZ36UnR92c6AVqvUrjnS778BefELnpln
 MLrkv2E31pEc+LDXUF+1nehHYdSiWiKEjVg5WEkjM67TEC6ng+n8RuyM6sQsfpmKaIVhnI
 +yPt1+7wouFwYbTSIfmgOWom9Wx/esSWHn7hr3dJjD/x/Gi5K37MW3oGLUGzNNUE/81vqc
 8SWs91lXzY4Ksh/In94eu4tUyeYV7UX21vXx3RSTQQXMYicG2Z+Zxy0pLqbwew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SeFHGBG/
Subject: Re: [Buildroot] [PATCH 1/4] package/alsa-lib: disable topology
 modules for static builds
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
Cc: Charles Hardin <ckhardin@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 28 Oct 2022 21:15:23 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> With this fix to alsa-lib we can remove a patch from alsa-utils which
> fixed its static build. A static build of topology modules is not
> supported by upstream however:
> 
> "Note that it does not make sense to build static topology modules.
>  They are not usable."
> https://github.com/alsa-project/alsa-utils/issues/152#issuecomment-1144485929
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/alsa-lib/alsa-lib.mk                  |  1 +
>  ...nfigure.ac-fix-build-without-dlfcn.h.patch | 48 -------------------
>  package/alsa-utils/alsa-utils.mk              |  3 --
>  3 files changed, 1 insertion(+), 51 deletions(-)
>  delete mode 100644 package/alsa-utils/0003-configure.ac-fix-build-without-dlfcn.h.patch
> 
> diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
> index f3ed195a5c..6e474aa5e2 100644
> --- a/package/alsa-lib/alsa-lib.mk
> +++ b/package/alsa-lib/alsa-lib.mk
> @@ -25,6 +25,7 @@ endif
>  # Can't build with static & shared at the same time (1.0.25+)
>  ifeq ($(BR2_STATIC_LIBS),y)
>  ALSA_LIB_CONF_OPTS += \
> +	--disable-topology \

I think we should make this an explicit Config.in option of the
alsa-lib package, which depends on !BR2_STATIC_LIBS, so that the
packages that need that library can then select this option, and
properly propagate the !BR2_STATIC_LIBS dependency.

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
