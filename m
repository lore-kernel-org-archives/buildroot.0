Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5A3C6FA8E
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 20:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8158E817A6;
	Sun, 25 Sep 2022 20:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8158E817A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zbTmTxM8Ow0Q; Sun, 25 Sep 2022 20:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B817A8174A;
	Sun, 25 Sep 2022 20:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B817A8174A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEB701BF321
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A75664058F
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 20:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A75664058F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUXlgTKelhDh for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 20:43:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92C9640517
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92C9640517
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 20:43:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9C54B240004;
 Sun, 25 Sep 2022 20:43:40 +0000 (UTC)
Date: Sun, 25 Sep 2022 22:43:39 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>, Daniel Price <daniel.price@gmail.com>, Martin
 Bark <martin@barkynet.com>, Alexandru Ardelean <ardeleanalex@gmail.com>
Message-ID: <20220925224339.75d25878@windsurf>
In-Reply-To: <20220925204030.1661583-3-thomas.petazzoni@bootlin.com>
References: <20220925204030.1661583-1-thomas.petazzoni@bootlin.com>
 <20220925204030.1661583-3-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664138621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZlZH1LRL7T1JMAafOf2XZTH9uymMBL8c8d8bvK3HuBk=;
 b=onCIatuI3bWmrYUNh/5NiAKae9yRqIoESmdg/RYZqkLfoaP6R3b2/scnMRBrMCUkDvUZPZ
 KEOgNY4jt89EIBaO5iC3YtRvKfprWmeYpWCt8qf4u8KxFX8YBlZTusDD8jWezI3BneYpeG
 Px37+slj6shM1mrUNQfWolPPQyN1HypENvilFc/zXA5jhlQokmFJ5mgwFDwPQv8gaPazgh
 Wa5uEedmAe4ko/VMCguVSFZCscTSCV0X6HfgvhA8WGm8m4yme8dw8PgNrQvSrgevMYy+NT
 jq0a/qvrmLe2o01XMyy47Xnf03DeTbB/8VvIKIqlfkrZD6lmygPe/IBAnjRPNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=onCIatuI
Subject: Re: [Buildroot] [PATCH RFC 3/4] package/nodejs: make host package a
 virtual package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 25 Sep 2022 22:40:28 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> diff --git a/package/nodejs/Config.in.host b/package/nodejs-src/Config.in.host
> similarity index 78%
> copy from package/nodejs/Config.in.host
> copy to package/nodejs-src/Config.in.host
> index f7f2b80a9b..e8f50959de 100644
> --- a/package/nodejs/Config.in.host
> +++ b/package/nodejs-src/Config.in.host

Dammit, I was supposed to remove this file. I will fix this in v2.
package/nodejs-src/Config.in.host should not exist.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
