Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00B7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F3AA408C3;
	Sun, 30 Jan 2022 14:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hexByGpMxe3X; Sun, 30 Jan 2022 14:05:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D523408DE;
	Sun, 30 Jan 2022 14:05:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E32031BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0E98408DE
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ddiaVHopUyU for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:05:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1CE3408C3
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:05:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A5B2D1BF204;
 Sun, 30 Jan 2022 14:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643551529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qWhPZFf6Nruof7rxY+YBRizpcjZ5RvkLX3q4SNJntCo=;
 b=RUzCP6g8Coib60R8msSihR4xaDB5OESzPx3laugcSSPXuprEvTWEGjUKGB8Uu1vfY9jY5r
 POBWIWPeVhVLPfDfCWDiTj71th+Mmt2zm7eI9ABRr/vS/fY3Sd2FtxxgGE1yQNzaaiU2H/
 UCgA/jzFDHavmpwPD2xhE56E0NE6i/BYTOQlObzHKrQN6y9FwKH6dFH3clG0/vSBIpC23+
 C1nqfiEZ+ul/O7rSLVnn7Am2CuXQZ9Hdg3G8W/afw3GVdcigE8hU++Z8yu/Jm5dZ8cDgNW
 sNa8S9Wxf03JMYnz5J0ZToHR4kJYhOTjj5RPQvwrlruAfgBRDrl9l7W5j/maAw==
Date: Sun, 30 Jan 2022 15:05:27 +0100
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220130150527.12c67565@windsurf>
In-Reply-To: <20220129224651.1282263-4-romain.naour@gmail.com>
References: <20220129224651.1282263-1-romain.naour@gmail.com>
 <20220129224651.1282263-4-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/5] package/efl: handle input option
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 29 Jan 2022 23:46:50 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> +config BR2_PACKAGE_EFL_LIBINPUT
> +	bool "Enable libinput support (recommended)"
> +	default y
> +	depends on BR2_PACKAGE_HAS_UDEV # libinput

Should be:

	depends on BR2_PACKAGE_HAS_UDEV # libinput, efl-eeze

> +comment "libinput needs udev /dev management (eeze)"

Drop "eeze" between parenthesis.

> +	depends on !BR2_PACKAGE_HAS_UDEV
> +
>  config BR2_PACKAGE_EFL_LIBSNDFILE
>  	bool "Enable libsndfile support (recommended)"
>  	default y
> @@ -216,13 +229,11 @@ endchoice # OpenGL support
>  
>  config BR2_PACKAGE_EFL_DRM
>  	bool "Evas DRM Engine"
> -	depends on BR2_PACKAGE_HAS_UDEV (eeze)
> +	depends on BR2_PACKAGE_HAS_UDEV # elput, eeze

You fixed a bug from the previous commit here. What is "elput" ?

>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
>  	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
> -	select BR2_PACKAGE_EFL_EEZE
> +	select BR2_PACKAGE_EFL_LIBINPUT

Is that the explanation for PATCH 3/5 ? But even that doesn't seem to
justify PATCH 3/5: you could have done the same with a "depends on
BR2_PACKAGE_EFL_EEZE".

Again: I agree with PATCH 3/5, and I think it's the right patch. I just
don't understand the justification it has in its commit log.

>  	select BR2_PACKAGE_LIBDRM
> -	select BR2_PACKAGE_LIBINPUT # For elput

What is "elput" ?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
