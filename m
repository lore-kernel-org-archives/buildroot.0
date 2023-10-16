Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB028CDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 10:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8234F4174C;
	Mon, 16 Oct 2023 10:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8234F4174C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wyxPpR8bT23J; Mon, 16 Oct 2023 10:13:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6322141554;
	Mon, 16 Oct 2023 10:13:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6322141554
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C72251BF327
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 913E44173E
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 913E44173E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1dymMxmbCx1b for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 10:12:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FB5341751
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 10:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FB5341751
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB0CAE0008;
 Mon, 16 Oct 2023 10:12:30 +0000 (UTC)
Date: Mon, 16 Oct 2023 12:12:29 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231016121229.7b34612d@booty>
In-Reply-To: <20230924151205.2099293-9-neal.frager@amd.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
 <20230924151205.2099293-9-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1697451151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pIOFaq2TPyfvCLDNzxAftIRH9wHIE79UoZ6pkl/9dto=;
 b=dMi2HB0N3Bx9mS/1nTjbPgbMQ4eVInNZdtUgJixvpJKDrPaTvH9MLaKZnlnuLhjL7Zk7Jo
 pPu4gDeGjS4bLrfQXOgFwQKxOrDetac5x/jvGbIoivb+P/hPPRLxFnDGoQx2MCmhrJgHi2
 7jo2FFtjgysImicdGMvdALeSEd7tgolMrPEQsJ5sEKaRlRLIgWzPkJ3dYGH7xgSB2XJJFI
 2ApV3byPTi0/bJ67FBMVvvHSdV7gAOd40JjpZmquuc7SQiqjrnU4LrksDru8OB9a2oirow
 C562C2bujlMdXav1j88IwzYda5Rmvotf0nBzvgs6TsZROgMp2STUspbNUJUdgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dMi2HB0N
Subject: Re: [Buildroot] [PATCH v4 09/10] configs/versal_vck190_defconfig:
 build plm and psmfw source
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Sep 2023 16:12:04 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch migrates the versal_vck190_defconfig to use the new
> versal-firmware package for building the versal plm and psmfw from source.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
