Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00755C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 12:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D73E40A5F;
	Thu,  9 Jun 2022 12:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NruPn_bc-HNO; Thu,  9 Jun 2022 12:26:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE1BD4074E;
	Thu,  9 Jun 2022 12:26:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD4BF1BF42C
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 12:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB14441CCF
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 12:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yi2auNfP89gm for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 12:26:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 20A8641CCD
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 12:26:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 88DF56000E;
 Thu,  9 Jun 2022 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654777579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CfmVHs2flaXGCxib32jiEIbIH5jh/x2edanOrYqwY50=;
 b=Ba5d/JPPXRlot6F4+TMmTB5RfBdACs3DU2PW0Qwww4tZ71RmPtfht6ATjNZrTf5tEIxUZL
 kSt6/7jctiQG6ZKTdSjtlkCButRaIkaM5gQDnzEPm0J2LTxqyqEpwg8CWp+6m8wctB5ahR
 nvrg7iSZppaVb+MPUzGqZPR0NYYBPfAoHZ+RK+9N6JPUHgHEdtMtZ1KTGaQqr0CJIBPvIy
 nvgQvjrigPt4qS6Yzmdg8yAwAz3vjsEbsqZEPV828jlSoZrP+PP1+Mnl0Ut5lHtyT0HkXX
 xH2pygRPzxfg6RJiLGbm1VYuQkIqU30wdK4pYXIx6FBQ2CGCMd9JDwUjbWIdNQ==
Date: Thu, 9 Jun 2022 14:26:16 +0200
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20220609142616.2483414f@windsurf>
In-Reply-To: <5d4a4e2b-4d1d-88d6-4905-67083c154775@suse.cz>
References: <20220606184320.8210-1-petr.vorel@gmail.com>
 <20220606184320.8210-3-petr.vorel@gmail.com>
 <5d4a4e2b-4d1d-88d6-4905-67083c154775@suse.cz>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] kvm: Fix undefined reference to
 __stack_chk_fail()
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Li Wang <liwang@redhat.com>,
 Cyril Hrubis <chrubis@suse.cz>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 9 Jun 2022 10:26:55 +0200
Martin Doucha <mdoucha@suse.cz> wrote:

> > diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
> > index 8d5193d8e..bce1a4eb5 100644
> > --- a/testcases/kernel/kvm/Makefile
> > +++ b/testcases/kernel/kvm/Makefile
> > @@ -9,7 +9,7 @@ ASFLAGS =
> >  CPPFLAGS += -I$(abs_srcdir)/include
> >  GUEST_CPPFLAGS = $(CPPFLAGS) -DCOMPILE_PAYLOAD
> >  GUEST_CFLAGS = -ffreestanding -O2 -Wall -fno-asynchronous-unwind-tables -mno-mmx -mno-sse
> > -GUEST_LDFLAGS = -nostdlib -Wl,--build-id=none
> > +GUEST_LDFLAGS = -nostdlib -Wl,--build-id=none -fstack-protector  
> 
> We should use -fno-stack-protector here instead. Your patch probably
> enables linking of libssp despite -nostdlib which we don't want. The GCC
> stack protector may also break tests because bootstrap initializes stack
> manually instead of letting GCC handle it.

I agree. Assuming -nostdlib means you're building freestanding code,
then indeed, -fno-stack-protector is most likely what you want.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
