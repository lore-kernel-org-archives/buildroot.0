Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F2FC7EE23
	for <buildroot@archiver.kernel.org>; Mon, 22 May 2023 14:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 967CD613EF;
	Mon, 22 May 2023 14:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 967CD613EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4kNrDVmQTyMl; Mon, 22 May 2023 14:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D160660F96;
	Mon, 22 May 2023 14:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D160660F96
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83C681BF395
 for <buildroot@lists.busybox.net>; Mon, 22 May 2023 14:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E25F40286
 for <buildroot@lists.busybox.net>; Mon, 22 May 2023 14:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E25F40286
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vOyEnQXMywcm for <buildroot@lists.busybox.net>;
 Mon, 22 May 2023 14:16:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4457400C8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4457400C8
 for <buildroot@buildroot.org>; Mon, 22 May 2023 14:16:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C521424000D;
 Mon, 22 May 2023 14:16:43 +0000 (UTC)
Date: Mon, 22 May 2023 16:16:42 +0200
To: Sourabh Hegde <hrsourabh011@gmail.com>
Message-ID: <20230522161642.510747dc@windsurf>
In-Reply-To: <CADYjeSs9N0nKpwFYp9YioQfBUGnbRim5PQNVqSZLFjnXZPMDLQ@mail.gmail.com>
References: <CADYjeSuBBWWpoD3HKWQ6H0RV_EL4WAsBHxvHGTiV3P_-JrLy3g@mail.gmail.com>
 <20230520212437.2125e68b@windsurf>
 <CADYjeSs9N0nKpwFYp9YioQfBUGnbRim5PQNVqSZLFjnXZPMDLQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1684765004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PoVJf/lah851p1GHSzt2Ro3A2vC0PK6WTEtBuISJY9Y=;
 b=cOubn85jhOHu+mrNHGx7rcQbKBzApBYQL+DGn+s6uc8QeZXw4TwustebKrwGG90yxlC+Id
 gVhinx0P7bDgMfdE0q7CgDRYl9wqslnLFn5BO5tKxWfpxVG8ft59AL4s80DQMjkyznJQhX
 K1CYIDrtvaBIVT7t2dNOggbOHj9tEtEv+6E6dMB6CEB2SqcKa3wS66bn3tnjoSLQLXioop
 y4xMrXPqH7UCzSg+mo/NU1YhEWNgQq3qWxyn5+fbzEpfLMsq/2tDdauwGnkJquJmbtfIFo
 dZ7i+8uprqf8Ag9dgmCFfi0+2yleCDLMlBiuHRTc1mAT820Yev7vkQwPugf/Zg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cOubn85j
Subject: Re: [Buildroot] Error while building tpm2-tools package with fapi
 support
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

Hello,

On Sat, 20 May 2023 23:34:48 +0200
Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> Yes, you are right.
> But, I did make "tpm2-tools-dirclean && make tpm2-tools-rebuild" and this
> didn't help.
> Also, I tried "make tpm2-tools-dirclean all" and "make tpm2-tools-dircclean
> && make tpm2-tools-reconfigure". This also resulted in the same error.

It's tpm2-tss that you need to rebuild. When you enable
BR2_PACKAGE_TPM2_TOOLS_FAPI, it selects BR2_PACKAGE_TPM2_TSS_FAPI. But
the thing is that tpm2-tss has already been built with
BR2_PACKAGE_TPM2_TSS_FAPI disabled. Buildroot does not have the logic
to automatically realize this. So either you do a full rebuild ("make
clean all"), or you understand that you have to explicitly tell
Buildroot that tpm2-tss needs to be rebuilt.

So, essentially here:

$ make tpm2-tss-dirclean tpm2-tools-dirclean
$ make

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
