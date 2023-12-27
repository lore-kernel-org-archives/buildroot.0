Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC828C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 17:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9243C60D65;
	Wed, 27 Dec 2023 17:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9243C60D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUHuISZ5ylAI; Wed, 27 Dec 2023 17:25:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D593760B74;
	Wed, 27 Dec 2023 17:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D593760B74
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17C2C1BF2A3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 17:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE8C14040B
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 17:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE8C14040B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qZZudWDWcNw for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 17:25:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1B41403C1
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 17:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1B41403C1
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3CA8FF803;
 Wed, 27 Dec 2023 17:24:57 +0000 (UTC)
Date: Wed, 27 Dec 2023 18:24:56 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20231227182456.348ab316@windsurf>
In-Reply-To: <875y0jr2d1.fsf@48ers.dk>
References: <20231227170759.2902227-1-thomas.petazzoni@bootlin.com>
 <875y0jr2d1.fsf@48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703697898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4mNSzVEScibEv8hcRfxt7Fd0Ir05vw8C7+nRx7ifqhs=;
 b=Snu3Veu04SCzWMl2TAnOO1jeYvf8PHi1ntRh27qpChKWKLrF/89rcs/LWzeE9iRQXA0VSv
 L/1GQK5f6HpnegWN/YIxKvEFIy75ZrTrjORyfHi0C49pgPzcf0CUvSCFjsSPKE4tQREe9H
 dfMiBYl364eklGp4Cvs38wbf1L2mZB93z2oP+XaPMq57IGaCg1oBQZ17y8mOR1Xj32ChTF
 qoRLdeJvQNfhQOadoqWZAyKHZdGKUM63Pagr2Q0B7mBEysbr3vIXgGKBQyn8HS783OSoBf
 IbsBs+jsXKNhTQhnyVYYItTvUoIhATgN5T+6Xg9/d0gml4HdKQQG8daSVUwbiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Snu3Veu0
Subject: Re: [Buildroot] [PATCH] Config.in: rework
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Dec 2023 18:18:02 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > -comment "Forcing all downloads to have a valid hash needs a global patch and hash directory"
>  > -	depends on BR2_GLOBAL_PATCH_DIR = ""
>  > +	  With this option turned on, Buildroot will check hashes of
>  > +	  all packages, including those have use a custom version. In  
> 
> s/have use/that use/

Fixed.

>  > +	  order to provide hashes for such packages, additional hash
>  > +	  files can be placed into BR2_GLOBAL_PATCH_DIR directories.  
> 
> I guess it is really s/can be/must be/, E.G. the build fails if not
> done, right?

I am not sure, I guess this is really a linguistic difference here. To
me the hash files must not be placed, they can be placed, if needed.
No-one forces anyone to have those hash files, but if they are needed,
then indeed the only option today is to have them in the
BR2_GLOBAL_PATCH_DIR.

I will not complain if you insist on "must be".

> Maybe we should mention utils/add-custom-hashes to create such .hash
> files?

Good point, added.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
