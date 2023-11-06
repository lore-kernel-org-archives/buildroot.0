Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE1AC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4BAB420E3;
	Mon,  6 Nov 2023 21:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4BAB420E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VJGasGb4RG0T; Mon,  6 Nov 2023 21:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6E45420F5;
	Mon,  6 Nov 2023 21:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6E45420F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16C451BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D66A041F88
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D66A041F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVylcPWIiLFT for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:46:50 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C63E341F7C
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C63E341F7C
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE1181BF205;
 Mon,  6 Nov 2023 21:46:47 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:46:47 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106224647.3a57609b@windsurf>
In-Reply-To: <20231105193719.1039595-1-fontaine.fabrice@gmail.com>
References: <20231105193719.1039595-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699307208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GdF0Fgyl8eY1oG/Ylt/dZsV01Y53IWnBUHuAw5+3n/k=;
 b=LCY3uWYenipk4OcgMRpfTRdxnh6BwLIENC2/3ufnUxRAquxvV0AmbSEfYts08tk6m7rbTp
 1cvnQzdEUcVVsWzhZm5lp7dhBOU1Bd9e7qy22dIbWWJ++HW67fz2VMYHerm+4IhNr9Byyt
 sXD1acOhGLrOrlODjDYoEFhg8zSnCGCjX2CyxjY8WkyNkGd/IXQzOxfNbaOAAzFhOyh5/o
 PkCGJ9cE0ekHb6WAzA4xHvj9L3ttRI9iFlybu25ZsI4NOPNhpasML5ggVDWQONBfEEL6Ut
 4pijkWcGucd1KgXAdWlSI4VG/V30sIpeRJ7lqJoqsUnR/iYrsQMIGIDdpYmlSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LCY3uWYe
Subject: Re: [Buildroot] [PATCH 1/1] package/system-config-printer: bump to
 version 1.5.18
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 20:37:19 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop first patch (already in version)
> - Drop second patch (rejected): cups-config is deprecated in favor of pkg-config
> - Drop autoreconf (no more patches)
> - intltool has been replaced by gettext since
>   https://github.com/OpenPrinting/system-config-printer/commit/e653c1a860aedc306828e60f4b99a80e0d8b3523
> 
> https://github.com/OpenPrinting/system-config-printer/blob/v1.5.18/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  2 -
>  ...n-to-disable-xmlto-manual-generation.patch | 73 -------------------
>  ...figure-accept-non-system-cups-config.patch | 35 ---------
>  .../system-config-printer.hash                |  2 +-
>  .../system-config-printer.mk                  | 11 +--
>  5 files changed, 4 insertions(+), 119 deletions(-)
>  delete mode 100644 package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch
>  delete mode 100644 package/system-config-printer/0002-configure-accept-non-system-cups-config.patch

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
