Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BB5C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 20:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E977408CA;
	Mon, 25 Dec 2023 20:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E977408CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AYS3kkP_oWYA; Mon, 25 Dec 2023 20:47:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B8B140906;
	Mon, 25 Dec 2023 20:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B8B140906
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64DC41BF94D
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AF7880EC9
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AF7880EC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cGq4EZyLDMT1 for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 20:45:45 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03B0180ECF
 for <buildroot@busybox.net>; Mon, 25 Dec 2023 20:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03B0180ECF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EF93240004;
 Mon, 25 Dec 2023 20:45:39 +0000 (UTC)
Date: Mon, 25 Dec 2023 21:45:38 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20231225214538.2950ce17@windsurf>
In-Reply-To: <20231225193852.87983-1-francois.perrad@gadz.org>
References: <20231225193852.87983-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703537140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jexZjpSQ0BaxJfMiG3LP6pSnlY19Qcv9uZPXqfOFxTY=;
 b=MfkdmlxJ3+g+1/IlHi88exVvwoaOHGwRvo2TXsq5ROwtaQ1X81ob5+VhckTZTrn+3nNRVr
 GUOST7Al0GDGStf1E2wwmYNn6g9R8L17emfA21YgTWJawihV1vNxknOi25foLAaBFozq15
 1VFbqyXmbjqCaZ/DuDs8ac3UhKxVJFUbJFlcvIBo/3Txer62+uQBI/2e8KjdslSClOI2Jc
 GQHxZ6q5Y0YJeFrJ5Z9WDhw1UejACtLjFANWDKal3MKFAg0XjAHjhGb6A81YiiT/5fr02q
 ZzUV28XELoCXEFSsykusL8WNXN/F3JcTgAPTZm1f/EN0v6pEk4V3VG73Rk6YRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MfkdmlxJ
Subject: Re: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.39
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 25 Dec 2023 20:38:52 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/libgtk3/libgtk3.hash | 4 ++--
>  package/libgtk3/libgtk3.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
