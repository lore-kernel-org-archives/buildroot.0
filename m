Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD67C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 11:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07C7581F92;
	Wed,  8 Feb 2023 11:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07C7581F92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lrJQhLoN37bR; Wed,  8 Feb 2023 11:16:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B04B81F8C;
	Wed,  8 Feb 2023 11:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B04B81F8C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E5DE1BF3A4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AFEF40BDE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:16:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AFEF40BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BcofjVakkcGX for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 11:16:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CBDC40BD2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CBDC40BD2
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 11:16:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2C9522000A;
 Wed,  8 Feb 2023 11:16:30 +0000 (UTC)
Date: Wed, 8 Feb 2023 12:16:29 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230208121629.756b938e@windsurf>
In-Reply-To: <20230207171721.2973997-13-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
 <20230207171721.2973997-13-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675854990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1N2fzp4Q7BZSW0lu9A8Pw9j1naiQTXjeHQ4oPhaMXbQ=;
 b=Te4fDlITeAeXIyTs4LhmSIYAkZ37N0OTakml++7fWSv87S4MwR7JzKJ0QGqKmr6MtdajmR
 Rtw9Fx3yNYCIUiwQ0RooYuFFy9C1TntNl2Q24uFoZGqvZT4EBkcmkmiEyUBiObrr44OZ/E
 cVL3reHKbU3lcNe7bebFNaFmo+uNujCtF3OmrGuEr8FqItEfIjpkJdrlyW+v/GTNxwfIaL
 JZRUtiB5vT6xOcAfJF/8Cv738nVo2zbc+LJ94mgcNWasVWFJtRqoPfB+W4eScL9gKJgyQp
 EObPCu9d5+alDMOF1FUOB/lBEGkqUUAs4ntezoKmOG3eS+gLPcULr/kxa6upmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Te4fDlIT
Subject: Re: [Buildroot] [PATCH v6 12/13] package/qt6/qt6base: add support
 for building examples
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
Cc: jesseevg@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Feb 2023 18:17:20 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> +config BR2_PACKAGE_QT6BASE_EXAMPLES
> +	bool "Compile and install examples "
> +	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
> +	select BR2_PACKAGE_QT6BASE_DBUS
> +	select BR2_PACKAGE_QT6BASE_NETWORK
> +	select BR2_PACKAGE_QT6BASE_XML
> +	select BR2_PACKAGE_QT6BASE_DBUS
> +	select BR2_PACKAGE_QT6BASE_GUI
> +	select BR2_PACKAGE_QT6BASE_WIDGETS
> +	select BR2_PACKAGE_QT6BASE_OPENGL
> +	select BR2_PACKAGE_QT6BASE_OPENGL_LIB

Due to comments/issues on previous patches, this option does not exist,
so I'm not able to apply this patch right now.

Could you resend as part of a new series after checking this
BR2_PACKAGE_QT6BASE_OPENGL_LIB thing?

Also, are all those options needed to have the examples? I believe with
Qt5, when you enable the examples, it builds only the examples that it
can build based on the features enabled in Qt. This was very handy. The
same is not possible here?

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
