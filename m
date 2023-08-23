Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A504DC3DA66
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 21:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 458DC8121A;
	Wed, 23 Aug 2023 21:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 458DC8121A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5B82fOJsaOIK; Wed, 23 Aug 2023 21:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7734B80F51;
	Wed, 23 Aug 2023 21:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7734B80F51
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83A201BF2A4
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 21:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F66E40193
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 21:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F66E40193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K1G_VCApHiux for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 21:18:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0865400BF
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 21:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0865400BF
Received: by mail.gandi.net (Postfix) with ESMTPSA id E72AEC0002;
 Wed, 23 Aug 2023 21:18:40 +0000 (UTC)
Date: Wed, 23 Aug 2023 23:18:39 +0200
To: Ryan Smith <ryan.smith@density.io>
Message-ID: <20230823231839.0494433f@windsurf>
In-Reply-To: <CAM7Wg-VCtAdw276BDujEX+7g2v793st6d+m00-6qLHcRz-opQw@mail.gmail.com>
References: <CAM7Wg-VCtAdw276BDujEX+7g2v793st6d+m00-6qLHcRz-opQw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692825521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nO1YFDwLYwwVF+76mdBJEb4Jg41KPvHC1mO0gSZ1Deo=;
 b=XuZGvWM5cnUgrr3zUAUuXZBN8LpODXPH2ZcyFCCbvKIO3wCeEmmSS/GskWHPGydI81XWOB
 WRmSPXfkeCVPUQm8ZlB65pQmGqKCUcWwaj57TovBRmXcfJLcim1xfVwYYHgX/blGAbesvW
 JQzIUoCZriugKKeKwtlqVVPgrft3I4xs4HeAkg7azcyw64e5mjGIW4Q6B7obRM8AsjUuhL
 YvoancoJGxeHzsIXjeSSPZk6nW/CXB6KQwgqL9IGwvr5KYO9PfRO/C+U9nnxVf+/wMMUIV
 TACRKJrdLVrgoDexrbCLmUVa8i0cucJXs0vmWKtsh82r375fzEZ0Jm3ToklxuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XuZGvWM5
Subject: Re: [Buildroot] Embedding Python Interpreter with pybind11
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

Hello Ryan,

On Tue, 22 Aug 2023 22:26:10 -0600
Ryan Smith <ryan.smith@density.io> wrote:

> I am attempting to write a program that embeds the Python interpreter
> in C++ code using pybind11. When I attempt to compile the package in
> Buildroot, I get the following error message.
> 
> /src/output-internal/host/include/python3.11/pyport.h:601:2: error:
> #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc
> config?)."
>  #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc
> config?)."
>   ^~~~~
> In file included from
> /src/output-internal/host/include/python3.11/Python.h:38:0,
>                  from

                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This is the problem: it's including the host python headers while
building code for the target. That's why it says "LONG_BIT definition
appears wrong for platform".

This is typically addressed by passing the right sysconfigdata, using
the _PYTHON_SYSCONFIGDATA_NAME variable. This is done automatically by
our python-package infrastructure.

Do you have a reproducer for this issue? People on this mailing list
are more likely to provide some help/support if they can reproduce the
issue.

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
