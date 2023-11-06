Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A173C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2DF5402A3;
	Mon,  6 Nov 2023 21:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2DF5402A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UeiI2q-w3XrQ; Mon,  6 Nov 2023 21:59:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FF1B40284;
	Mon,  6 Nov 2023 21:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FF1B40284
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E3B21BF215
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1013540284
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1013540284
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hLB0HU9uImYi for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:59:52 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0F8A40170
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0F8A40170
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCEC4C0006;
 Mon,  6 Nov 2023 21:59:50 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:59:50 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106225950.7e88dc9a@windsurf>
In-Reply-To: <20231105023707.2759107-1-james.hilliard1@gmail.com>
References: <20231105023707.2759107-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699307991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r8Jk/S2rzJq6BhFfMjGCH17eOR4ajFB51Rz08qIyZ6o=;
 b=gMMN9PhexQX+S8Sgzq4HozVPpw91BHluykhjNtMEqgd1DsuhIzg1nP2K7j0+e8x3Ccf1Yf
 LAQENf4RxmOabW4kHLFqukWPiWjqhupVdRBZ75XiPO9TxextebJQ1chxJp++yNNiXPRi2G
 n4aKjdVKlrrJtfCZazQHp9FTPNh8pZzvZ7EtyxVChulCrv4bb+9+di7ClAvWETHG/B9/aJ
 BrMfj/8cmvBs13+5IHL2qy9ByA2Z4/HyJYsq2JzvDawMT39JpYRd4KTRS10pXoPeqcRlSl
 BTw4UhuCNKWA2Q0NA2eDe2Qc7/7mtneD5cToy9vKtcx61IL33YF/bqO3Vbvs6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gMMN9Phe
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version
 5.5.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 20:37:07 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-cbor2/python-cbor2.hash | 4 ++--
>  package/python-cbor2/python-cbor2.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
