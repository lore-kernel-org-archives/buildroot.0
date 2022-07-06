Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA1AC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFC1B61126;
	Wed,  6 Jul 2022 21:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFC1B61126
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zB7-Kytm4zu1; Wed,  6 Jul 2022 21:27:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB88661011;
	Wed,  6 Jul 2022 21:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB88661011
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 838D01BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5ECC7812C8
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ECC7812C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PXwmPBv8fDk9 for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:27:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46579812BB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46579812BB
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:27:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 97105FF803;
 Wed,  6 Jul 2022 21:27:07 +0000 (UTC)
Date: Wed, 6 Jul 2022 23:27:06 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220706232706.06af5d71@windsurf>
In-Reply-To: <20220628183213.2838372-1-fontaine.fabrice@gmail.com>
References: <20220628183213.2838372-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1657142827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+KGRVp08pfnhyNFCdsDX/WvKnKPYZab5gIVX0HSm5uY=;
 b=i6RlHlgRktZNsAV8f78kQulWd0dDYWiMPQppA4mRzLEIsAXaXC/sZX3crXRROB8uhel/Fo
 Ak3ez3ZB88go74SLIbYP8TBv/IiTNjtQv6nZzwuLL7ouqOz7MjDFnjXwf7y12O8PrkHmzt
 fdzcDHfZLmmsBCrYwTjVnIKgW0wDg3ZiH/8Hstfr1dBsxdAE0QBDfZWuWFYG7oASRDY24O
 at7DXVJaakgvBP9dV4E8DF7UFkvesvZ6suZ2iSeBcUqpZ23Jd0wlnwWPItLEnFQAdylKVH
 90yy8bq/jnyez53XPwVG+lOtz9X6grrFWSTJnkRqYcTb0Lk9PnDlQq5S72PWQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i6RlHlgR
Subject: Re: [Buildroot] [PATCH 1/3] package/libsamplerate: use --{dis,
 en}able-alsa
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

On Tue, 28 Jun 2022 20:32:11 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 5b679d7806767206f2c7bd7ff69b412bebb504f8 forgot to set
> --{dis,en}able-alsa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libsamplerate/libsamplerate.mk | 3 +++
>  1 file changed, 3 insertions(+)

Series applied to master. On PATCH 2/3, I've added a comment in
libsamplerate.mk to explain why we're passing --disable-sndfile, so
that someone is not tempted to re-add an optional dependency to sndfile.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
