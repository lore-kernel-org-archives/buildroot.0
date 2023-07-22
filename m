Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7332C001B0
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86BCE821CC;
	Sat, 22 Jul 2023 21:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86BCE821CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZqL1Ms-DyZX; Sat, 22 Jul 2023 21:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65938821D2;
	Sat, 22 Jul 2023 21:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65938821D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D578D1BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DB62408AD
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DB62408AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CuxTRS8RuJMu for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:28:57 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D04D040949
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D04D040949
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68ACC1BF204;
 Sat, 22 Jul 2023 21:28:54 +0000 (UTC)
Date: Sat, 22 Jul 2023 23:28:53 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230722232853.29d39f2c@windsurf>
In-Reply-To: <20230716135557.4180899-1-bernd@kuhls.net>
References: <20230716135557.4180899-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690061335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wDZblTR3hgUGTgZt8ofXSr16NYMMF4/HkHUy4SZPiMo=;
 b=VCnrZd68fMmuAfRUZYtjAQgCtl96iKMuOtTXCeCE9MFQvFTVNnUjIAs6ywOZQ3eERjsYnw
 X1dysdziaaCFcApszhq2KL7UmV0ioKRq6jH8gyUocPJ/NBE/tgRD4gwi0u8pN1dK5PqCrA
 ewi7u51hLh2uvbCrmy6QY7V5g1GLZWcRMsAb6e2FEHJagdFKzQsobPHEOf1Pa4up15QsFz
 2leDvSffUn7y8DkSd328Ea4A9cFEfqMAj0zA7ibqTiEgu59uyWS61B8HwFKUN7X60GWzRC
 aNTVkylDuLLKCtBHVpStr2lrsyiVio2hG3dDKRhZFA13iQ4lvBiEmpyn2VfBJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VCnrZd68
Subject: Re: [Buildroot] [PATCH 1/1] package/supertuxkart: fix build with
 bluetooth enabled
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
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sun, 16 Jul 2023 15:55:57 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> The wiiuse code force an out-of-tree build:
> https://github.com/supertuxkart/stk-code/blob/master/lib/wiiuse/cmake/cmake-4.0.0-modules/RequireOutOfSourceBuild.cmake#L41
> 
> Fixes a build error not yet caught by the autobuilders:
> 
> -- Configuring WiiUse version 0.15.5
> CMake Error at lib/wiiuse/cmake/cmake-4.0.0-modules/RequireOutOfSourceBuild.cmake:41 (message):
>   You must set a binary directory that is different from your source
>   directory.  You might consider
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/supertuxkart/supertuxkart.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
> index 1f9ad4102b..6bdd512eac 100644
> --- a/package/supertuxkart/supertuxkart.mk
> +++ b/package/supertuxkart/supertuxkart.mk
> @@ -44,6 +44,7 @@ SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF \
>  ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
>  SUPERTUXKART_DEPENDENCIES += bluez5_utils
>  SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=ON -DUSE_SYSTEM_WIIUSE=ON
> +SUPERTUXKART_SUPPORTS_IN_SOURCE_BUILD = NO

I was not really sure if putting this variable within a conditional was
a good idea. Normally a package either requires out-of-tree build or
doesn't care, and it's probably the first time we have a package that
sometimes requires it, sometimes doesn't. But as it reflects the
reality, I've applied your patch as-is. We'll see if other maintainers
disagree, which I would totally understand.

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
