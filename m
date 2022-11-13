Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33390C433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 21:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C667C60BEA;
	Sun, 13 Nov 2022 21:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C667C60BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vu2NCRW8Na72; Sun, 13 Nov 2022 21:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC43860BE6;
	Sun, 13 Nov 2022 21:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC43860BE6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 54CCF1BF3AF
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CDDC60BE6
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 21:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CDDC60BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jiajdl7P4DZl for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 21:11:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 909F060BE1
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 909F060BE1
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 21:11:32 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 450F3100004;
 Sun, 13 Nov 2022 21:11:29 +0000 (UTC)
Date: Sun, 13 Nov 2022 22:11:28 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221113221128.6e820018@windsurf>
In-Reply-To: <20221112133707.1674986-1-yann.morin.1998@free.fr>
References: <20221112133707.1674986-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668373889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MEgjp9iZMgsxvUMGSsgaPozRsaleUw+OiMaL6ANvWXg=;
 b=VnT4FeMw/1ZYKN2m9ZO6fvlmD0y0U1k7B5oNr8SRdIPZHgPM12gEEszAOsqHcH9XTn3HCe
 Y/dmxArwE5Gw9ejXAcLXk2M+09NbQ1rozUTu7I2lHjsMBEKFV+aCb5xlTGaLh7XGuMe8S1
 zqXzixz9MgfvUgPqZdnWJcFTku2azySPrrvjs1FdVgJeV7OQ7YvkMdqE/bx3z+h9bUTZ0Q
 fXy3Ydx38klerh0bt35VhBS2jaPge1B9+hkUqfzcoe5XDycSohvCML3LPrGkcCAzAHIfaV
 PsNn/O8hstbZE3m8LEEzXrPNPfpzZ6V6trocwTbvDN8g6GSLZFXK83+fpsOQCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VnT4FeMw
Subject: Re: [Buildroot] [PATCH] package/dracut: workaround breakage on
 non-merged-usr hosts
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
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 12 Nov 2022 14:37:07 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> dracut is not really ready to be installed with a non-/ prefix, and it
> has a lot of hard-coded assumptions that it is going to run on the host
> for which it is goign to generate an initramfs; for example, it
> hard-codes calls to /lib/dracut/some-file in some of its modules. It
> also uses the host system layout to decide whether it needs a
> merged-usr or not.
> 
> Furthermore, dracut populates the temporary directory which content will
> be used to generate the cpio, with a bunch of files, even before calling
> any of the dracut modules.
> 
> The name for that temporary directory is not predictable (looks like the
> output of 'mktemp -d dracut.XXXXXX', with names like dracut.1Vfn9F seen
> while debugging).
> 
> As a consequence, we can't prepare the temporary directory with the
> proper symlinks beforehand.
> 
> So, we provide a very-early module of our own, that will (hopefully) run
> before any other module, to fixup the messed-up layout prepared by
> dracut. This module moves the content of /lib, /bin, and /sbin, out and
> into their counterparts in /usr, and creates the usual symlinks.
> 
> When we do not require a merged-usr, then we have nothing to do, so the
> module checks for /lib being a symlink, as the hint that we want a
> merged-usr or not.
> 
> Note: currently, we've seen nothing that dracut installed in /bin or
> /sbin, but for trying to be future-proof, we also handle them; this
> causes a spurious warning:
>     mv: cannot stat '..../build/buildroot-fs/cpio/tmp/dracut.YQnzNP/initramfs/bin/*': No such file or directory
> 
> Since there are already quite a bunch of similar failures in the
> official modules bundled in dracut, an extra such issue or two should
> not be too scary...
> 
> Fixes:
>     https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261241
>     https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261239
>     https://gitlab.com/buildroot.org/buildroot/-/jobs/3282261236
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> ---
>  package/dracut/dracut.mk                  |  2 ++
>  package/dracut/merged-usr-module-setup.sh | 26 +++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 package/dracut/merged-usr-module-setup.sh

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
