Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD37C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5533436EF;
	Wed, 10 Jan 2024 20:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5533436EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HKEMVularE2U; Wed, 10 Jan 2024 20:46:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3133436D6;
	Wed, 10 Jan 2024 20:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3133436D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EED761BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7ED083DA5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7ED083DA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QFjnsTcoJ1Av for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:46:15 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5161283B10
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5161283B10
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46C8A40003;
 Wed, 10 Jan 2024 20:46:13 +0000 (UTC)
Date: Wed, 10 Jan 2024 21:46:12 +0100
To: Jesse Taube <mr.bossman075@gmail.com>
Message-ID: <20240110214612.69db6c48@windsurf>
In-Reply-To: <20240109141132.654749-1-Mr.Bossman075@gmail.com>
References: <20240109141132.654749-1-Mr.Bossman075@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704919573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyb1DOrzXhaSzyYEnkuGT6uvFRMTw4XsnHER9gezWt0=;
 b=Yvodo4ogjfJmBu7AcbBi3nSm/75x3ojTpb6AfSTtpa/R0TDdg6bDPyhd1poJJQWHGr+I4P
 8xMtT7HXgPs9WjoAqIywk4a5qmiZFmS/zbBY9ECComvAqa+sIPNmJxvPy7hywjnAVkRwL7
 484yY6NbWOnr9+slLwfWvVSbvPrMfwWjeTiGfNh3iJsFmbI/kk9vV43Pz12FtXEZ05PLoP
 9fOWaYNWC25TmYbb9dGhVjP+4bsjdVKbe4TMMUl0hcZ72jn8r6OxjNIQUPBFLOiG05t69C
 oGSkcEUCxYTYdPTqWIugKu8x7A0yzxAo9bK53yKvz/hwApHZHxx8Ymv3cuqy2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yvodo4og
Subject: Re: [Buildroot] [PATCH v2] configs/imxrt1050-evk: Bump Kernel and
 U-boot
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  9 Jan 2024 09:11:31 -0500
Jesse Taube <mr.bossman075@gmail.com> wrote:

> Bump Linux to 6.7 and U-Boot to 2024.01
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  configs/imxrt1050-evk_defconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

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
