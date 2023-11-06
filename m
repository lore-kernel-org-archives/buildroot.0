Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C569C4167B
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48DE641FAB;
	Mon,  6 Nov 2023 21:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48DE641FAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3PTPGazTxT_5; Mon,  6 Nov 2023 21:06:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8044E41F44;
	Mon,  6 Nov 2023 21:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8044E41F44
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 677631BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CB8182290
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CB8182290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L0yKA0NMp_5p for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:06:12 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4055C821D7
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4055C821D7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68437FF80D;
 Mon,  6 Nov 2023 21:06:10 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:06:09 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106220609.7645d540@windsurf>
In-Reply-To: <20231106201509.8600-1-fontaine.fabrice@gmail.com>
References: <20231106201509.8600-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699304770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kLqs6EQdm0YckwudSNptf7+KooxrgD19T0RQRrTLg20=;
 b=mI7gsHa+15D/8RPMAbL5wVIIOPmcts0JZc0SzQAjNidNKppPtQUB5/kBlUMi4SAzGDmaet
 lSDt1kc+SdEDFS7sEbEm5WxvMxIlgnJ54PHKSer8w41dv5fhjein7Q84AjzFoK+WORr/zb
 rNkZgubCPiYL052jrvpp3DLngMq1vWV1lg/E9JWvzM8dNKyjBBQ7artCT+YmsTQJMP7FDH
 K//hkIN6qHK6uKod09PwfLDNQv+/bAlYqYHTKCFCeEuI4K1gU/7hXWtqnBkxB/owLNYl6x
 n/zFxdVrB5LVb0cw6JhNmMpJwyI+IBBpRRT6OWCeVwg5Y8ZblzEuGc98NYqV7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mI7gsHa+
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: fix legal info
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
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  6 Nov 2023 21:15:09 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> For an unknown reason, hash added by commit
> c1d5eada4d4db9eeaa1c44dd1dea95a67c8a70ca is wrong:
> 
> >>> host-nodejs-src 20.9.0 Collecting legal info  
> ERROR: LICENSE has wrong sha256 hash:
> ERROR: expected: a6871483905199033882d66453649675f0e88ffaa07f9f8acb257ce7504bc758
> ERROR: got     : 93ac846282ce6c5255e00fada2fd2e7e292255239fe58d5502b0a554859e6a3e
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a199f128bc1d59a311f3ae683dcc14a1d6f3bb7b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nodejs/nodejs.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
