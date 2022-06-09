Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353BAC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E739B40C4F;
	Thu,  9 Jun 2022 20:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nt2MAFgKHqmM; Thu,  9 Jun 2022 20:38:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 056A4409C1;
	Thu,  9 Jun 2022 20:38:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA10B1BF35E
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C67AE409C1
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lhbpXO22Tcby for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:38:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C922F40327
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:38:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ADE291C0004;
 Thu,  9 Jun 2022 20:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654807112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfbpT/Berl0ufzpoV8mWN+X5NHajvk81ZXNyDRqF/Bc=;
 b=mSIvi9Omysla2oRK9Z7aHO3iw9cA8x0bof6pYvis1GyiiQEcxkvTc636QyEJTlEgHBWyv0
 LTChpCsBHWP8Pg3pZUjBSMdkoCgos7loQPWvDVPzf3WsDES6fEGnx/Nw+ZujZQoZ1v9yWM
 LEe2VBdm/DX+4zvNKCJsvnf/tj3GYOLr6n90Pqy3tp5/qEG8MFppPpDLaVycOZ/BP3VS6s
 c0SkFOXbT+rQbWfrZ9cCjO6FWiXVIrcocIhifRhuY87OxN1vgS4S01r/ngsKVkL+bgS2xY
 n3lhqHt4nTfQVmfgqjjLFRnfAksczXDX7RFVqsf5rMhECOAckuqG1D5OTB/Mhg==
Date: Thu, 9 Jun 2022 22:38:31 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220609223831.13344e13@windsurf>
In-Reply-To: <20220608195618.2243703-1-fontaine.fabrice@gmail.com>
References: <20220608195618.2243703-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/noip: fix static build
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

On Wed,  8 Jun 2022 21:56:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Pass TARGET_LDFLAGS (which will contain -static) through LIBS (as
> LDFLAGS is not supported) to fix the following static build failure
> (e.g. with musl):
> 
> /home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/10.3.0/../../../../microblazeel-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/microblazeel-buildroot-linux-musl/10.3.0/libgcc.a(unwind-dw2.o): in function `__gthread_once':
> /home/autobuild/autobuild/instance-15/output-1/build/host-gcc-final-10.3.0/build/microblazeel-buildroot-linux-musl/libgcc/gthr-default.h:700: undefined reference to `pthread_once'
> 
> While at it, drop CFLAGS (which is not supported by Makefile)

Be careful with this: $(CFLAGS) is used by implicit make rules, so even
if it's not visible in the Makefile, CFLAGS may be used by make.

However, in the particular case of this project, they don't rely on
implicit make rules, as their make rule is:

${TGT}: Makefile ${TGT}.c 
        ${CC} -Wall -g -D${ARCH} -DPREFIX=\"${PREFIX}\" ${TGT}.c -o ${TGT} ${LIBS}

So indeed, passing CFLAGS has no effect.

However, what you could do is:

	LIBS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)"

Yes, it's a hack, and it will need a comment in the .mk file, but at
least with this, all flags are properly passed :-)

Cheers,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
