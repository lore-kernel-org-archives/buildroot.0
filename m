Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E83AC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3558F400C1;
	Wed, 10 Jan 2024 20:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3558F400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wlM1ey2HFKTQ; Wed, 10 Jan 2024 20:45:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 570E0436E5;
	Wed, 10 Jan 2024 20:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 570E0436E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88EC41BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 460DC42238
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 460DC42238
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 528BN1lv-3v8 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:45:44 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 531F742230
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 531F742230
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D553FF805;
 Wed, 10 Jan 2024 20:45:42 +0000 (UTC)
Date: Wed, 10 Jan 2024 21:45:41 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240110214541.546b3061@windsurf>
In-Reply-To: <2d3d2290-9d8f-4ba3-bf03-5db0e1d584a0@benettiengineering.com>
References: <20231109035947.1852675-1-Mr.Bossman075@gmail.com>
 <90fc81f5-d445-4917-bb02-46e2e353642a@benettiengineering.com>
 <2d3d2290-9d8f-4ba3-bf03-5db0e1d584a0@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704919542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b92Kz12wRaRU8L63IDMc36twKYElxLjmggKITFlh5Xk=;
 b=jZwARcLqhbNO/F4KC3OxGXunEEh+klhk3GZHqx9O36UMrqr+u+hkDs4cpIlkaGz9fqEPxf
 VSOpuEnCjFLv2G1eGX8GjfsjyL+FQK+eEJd0qTCXdsF5fMuWAGkYNt+Pgj/Ue9tyWGJ+rq
 LwYc2MzYTHDDOB0jftIXbaVfVZIF4b34sqxiTgBHzV8VE641P2MCR7fUxT/fLROZY6xLVy
 FpS02LrkpN8u8+5fXYqTAthrNYTJYfX3Ne365Qt4z91OKq0eI31NhfJI11Odr3/yCgSIjI
 XHeqUKRapi99QBczTNz4zd1BxrzkAt4eflVN+jWfpb74FntIt7ReKUSWWWyTiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jZwARcLq
Subject: Re: [Buildroot] [PATCH v1] configs/imxrt1050-evk: Bump Kernel and
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
Cc: Jesse Taube <mr.bossman075@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 9 Jan 2024 23:00:09 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> this patch has been superseded by V2 can you please set it in Patchwork?
> 
> https://patchwork.ozlabs.org/project/buildroot/patch/20231109035947.1852675-1-Mr.Bossman075@gmail.com/

Done!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
