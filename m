Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2527DC6FA8F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 18:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3CC2415B6;
	Thu, 24 Aug 2023 18:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3CC2415B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P2RoJUKrAnqs; Thu, 24 Aug 2023 18:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12163415AD;
	Thu, 24 Aug 2023 18:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12163415AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA8FA1BF853
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AADF822A2
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AADF822A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2sRYFO7cgTl for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 18:54:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 377F181E71
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 18:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 377F181E71
Received: by mail.gandi.net (Postfix) with ESMTPSA id D06771BF206;
 Thu, 24 Aug 2023 18:54:20 +0000 (UTC)
Date: Thu, 24 Aug 2023 20:54:19 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230824205419.40dd9e10@windsurf>
In-Reply-To: <ZObkYg7QwKJVHGVw@waldemar-brodkorb.de>
References: <ZObkYg7QwKJVHGVw@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692903261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxzHE69BD8tPQ72xsshsEbzyWb5hgSaAW62aY2lW6zE=;
 b=eohXF/ovhzABiqcqXmOs+0MMf4zGYdVqIdh6abMVBSeyn8qSogc9zPhDbRkZ4NToG1G5fA
 nD9HpS8hE8S9uLhIWrCXlj7F+J8eM9C0psRCv7BDVEAzFv9xA5g0uqNsdz3P8BaoKQWPar
 x5EUOH3mBUwStp9ezPI85C61Ihwa9w+rE2l67CC+PfhYcguBa76AMs72+H1lKoonu+gmem
 j2FJ4fweqW+nsXd0ieSamVHs2UfnZNfnf30bIhuVFp54mobQU6QUtLFqkyOPlQYB5Oe6M1
 9OF9L587dYZ9rkFkwoMtaYRneq+8bRlbri+BbBMOlFcrV/Q2He/lXYHQc4WVlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eohXF/ov
Subject: Re: [Buildroot] [PATCH] package/gmp: guard riscv definition
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

On Thu, 24 Aug 2023 07:02:26 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

>  # GMP needs M extension for riscv assembly
> +ifeq ($(BR2_riscv),y)
>  ifeq ($(BR2_RISCV_ISA_CUSTOM_RVM),)

Changed to:

+ifeq ($(BR2_riscv):$(BR2_RISCV_ISA_CUSTOM_RVM),y:)

and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
