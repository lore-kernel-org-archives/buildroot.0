Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B300FC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 17:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F86660E63;
	Wed,  2 Nov 2022 17:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F86660E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vd4EgQUfp-AU; Wed,  2 Nov 2022 17:06:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AD2260E5B;
	Wed,  2 Nov 2022 17:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AD2260E5B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E2CD1BF294
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11C9E416D0
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11C9E416D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAA7nC5w_gDY for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 17:06:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9BAA414C2
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9BAA414C2
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 17:06:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DD28060014;
 Wed,  2 Nov 2022 17:06:09 +0000 (UTC)
Date: Wed, 2 Nov 2022 18:06:08 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20221102180608.4ac368ae@windsurf>
In-Reply-To: <875yfzf8gy.fsf@gmail.com>
References: <20221031174632.377586-1-troglobit@gmail.com>
 <20221031174632.377586-2-troglobit@gmail.com>
 <20221031214739.6b258cb3@windsurf> <875yfzf8gy.fsf@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667408770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dPFbqao72VyNqt+XAkzR0Vr1T40bjk7vD0mLomsrrOo=;
 b=PTf0jUSx0vNO5UUkL9p9+LnFHHwGvkIrRIeagcU1O/2xjxTDjyqvhVAA8GdXDK/YU/2XWE
 5FUvSnk4r+TSQtFhON6n1MNzsxhrYOywcCf6rSR0gmOdlgzxDY1/fJhLNoT76aNdMg2wWT
 ZWVUVYzzDv/QD4v7Ac1BJb3uV8aKpDXHbOdB2+2N06gw3By+Y1sWgogpcHrUaV27yyV5eS
 x8Dnx4Pu9PvR2zxFVVxulK6fvhb6mOxsI92xlz63o21h2vCIA1J+lds/R1yKrzJr40eqMJ
 mVYjUf5v1EX8X7f01ObBONGSN+4p+rGnZO4cc5dDa4h/Yi9x9+TBYI9KNxseMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PTf0jUSx
Subject: Re: [Buildroot] [PATCH 1/3] package/ssdp-responder: bump to version
 1.9
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

On Tue, 01 Nov 2022 08:18:53 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> I tried to be as clear as possible about this, even when I did the
> release upstream.  Maybe I should have been extra clear somehow?

All we expect is a short note in the commit log, which clarifies that
the submitter of the patch has changed the hash of the license file
after properly checking what the changes in the license files are.
That's really the complete extent of our expectation :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
