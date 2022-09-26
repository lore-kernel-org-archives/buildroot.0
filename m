Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB55C32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D81B40340;
	Mon, 26 Sep 2022 12:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D81B40340
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgaVjq4xDmix; Mon, 26 Sep 2022 12:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4DF540290;
	Mon, 26 Sep 2022 12:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4DF540290
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1B21BF9A4
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20AC340290
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20AC340290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EdlN6A_DxV4e for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:09:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A32B840209
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A32B840209
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:09:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C18982000F;
 Mon, 26 Sep 2022 12:09:20 +0000 (UTC)
Date: Mon, 26 Sep 2022 14:09:19 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220926140919.6a1b7dcf@windsurf>
In-Reply-To: <20220925123948.264951-1-fontaine.fabrice@gmail.com>
References: <20220925123948.264951-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664194161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cc+SMeBGuA9RdEMwRdOa9SEKq976lZO5NJ4GF2Ra35Y=;
 b=VYUNEoRo37EMbcWh1bWrG/Mlue0tcY+nFkXlzW5bi6URU5Exj4/1lwgbK09O9IIVluWReA
 U33vq9wM5wNBvH5vKyTqYPK47zCyWT71r6EFOKfHHygQVQkt4MtSlzDw8iY9Ppe52lSrM8
 yixJtEVeVx2rq9M5o+uvAphLRngtHfkG2KG4Of0emTvfMxgT5TW1DgA5IOUU39xobebcrY
 u/YCqhe6q6gB/5HuBaIBNciSiNR5B+1Uxn0xf+C9sOSgrJ8gt5dBBt8ymXuGR58EV3qsGF
 PCSZmN0U2Jtx3W8patcnyV2Hmm/MeU2rPejgwfzxLmabwDhSm0TsrqQ2Gtk0oQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VYUNEoRo
Subject: Re: [Buildroot] [PATCH 1/1] package/uhd: drop have_mfpu_neon
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 25 Sep 2022 14:39:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop have_mfpu_neon which has been added by commit
> b07de37540ee34e4e5fa8586ecc40da1586cd940 but is not recognized:
> 
> CMake Warning:
>   Manually-specified variables were not used by the project:
> 
>     BUILD_DOC
>     BUILD_DOCS
>     BUILD_EXAMPLE
>     BUILD_EXAMPLES
>     BUILD_TEST
>     BUILD_TESTING
>     BUILD_TESTS
>     CMAKE_INSTALL_RUNSTATEDIR
>     have_mfpu_neon
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/uhd/uhd.mk | 1 -
>  1 file changed, 1 deletion(-)

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
