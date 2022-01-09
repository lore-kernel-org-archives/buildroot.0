Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31BDC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 23:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EFF740167;
	Sun,  9 Jan 2022 23:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 62ECzIJxiPSL; Sun,  9 Jan 2022 23:47:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C08140377;
	Sun,  9 Jan 2022 23:47:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADFB51BF2E5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 23:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 956AB81355
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 23:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4G2-MTt7Xgk for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 23:47:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A0928133A
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 23:47:11 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id m6so23316325ybc.9
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 15:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s3NeHjGZgCE510nkiYq3rFMuKcF8+we6UmpWiunUCUw=;
 b=OVfuLNdowrGn7iyrTsKmxk8RMcw0Hu9aIqCIDikiGx2ZTxmgFtOfo9tbuZfvWfiCau
 4w+sQAC6czf+VCevkjgB4u6WKiU0MbKFrV5Trk1ewyTEdUEDrOoD7fsmzrDBXfMlJVhX
 nONQ2Gy9+KhYtrywWekRcZYD58ML+euNHfoBWVofJoKT44wqWsUzFZxCKLwG4vX/HI7B
 wP+rrhCCacl4U5XqTzuyeNGDw+eQFWHEx6ly4UDjqNiOGyrRANvaJ39apa5P7/ek+hez
 g+2AJuehB/j8K60zWHx8rMv6wTTploiYzMofiJCKnI2AXwozJG181Ze3aaLMZFdnGTyj
 7tTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s3NeHjGZgCE510nkiYq3rFMuKcF8+we6UmpWiunUCUw=;
 b=37Tnj3xsy5ASIljmN+nRXTDW8idlxLMkT5uQB8e+t8ts5bm9CrhncApUUF843X5UbP
 IreK0G/0Il8Jtse6yJik+mXwPtcAgDGI3vKBNEB7tRznzwjP0F9vOtIQYVOADUvWAY1s
 D4I//rTCyhzyaYPtSOgxVnYEMEbMHRFzXtJTGF2q6x8qtfi1LeRfSCjha5jenYLjF965
 BIQ4HydYwm6pNFd1O7vTqQMay/zRp2twnqAN3OOUyeTZd2BfiWlRda9MMxhEHId3pjpM
 rF0m8REylsSFngmKMIQY+miYxLAuo7UlCfaYe0l7Yg9ORXGV97FyjC1jV6yLGXTnp++D
 F4Hw==
X-Gm-Message-State: AOAM532We4N2Jup4Ni1ox13FISNP4cxLUZFzjt66UUG4gTGUnY852gZu
 OqjeB05XK84xuH3tjilGfc0ndiHevHvR9b7h+nGaOTK6eKY=
X-Google-Smtp-Source: ABdhPJzU9Sj2fcLpaaLUcYQlgfVRTR6+jfYW1l/OzbXRf/KuJTuXD8Okxw5/qDngo1YrrSGvQcrQDCtdPgYXDkAptNk=
X-Received: by 2002:a25:9c87:: with SMTP id y7mr4184677ybo.437.1641772030517; 
 Sun, 09 Jan 2022 15:47:10 -0800 (PST)
MIME-Version: 1.0
References: <CAF8i9mOtQLce7b+H_PzHrsiUe_5qphpk-QsXq=WeLZodMv1heA@mail.gmail.com>
 <d85d6f3c-2315-8583-a48c-b0b58e443a4d@mind.be>
In-Reply-To: <d85d6f3c-2315-8583-a48c-b0b58e443a4d@mind.be>
From: William Tambe <tambewilliam@gmail.com>
Date: Sun, 9 Jan 2022 17:46:59 -0600
Message-ID: <CAF8i9mPphK+bKcnTtd6soqP1_vfPaE=F=GB945sW+Xdwqm+h4A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] BR2_PACKAGE_DHCP_CLIENT fails to build:
 readline/history.h: No such file or directory
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jan 9, 2022 at 2:08 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 09/01/2022 19:18, William Tambe wrote:
> > I am attempting to build:
> >
> > +BR2_PACKAGE_DHCP=y
> > +BR2_PACKAGE_DHCP_CLIENT=y
> >
> > However it fails as follow complaining about not finding readline/history.h:
> >
> > making all in /home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/bin/nsupdate
> > /home/tambewilliam/Documents/buildroot-build/host/bin/pu32-elf-gcc
>
>   pu32 doesn't exist in Buildroot, so this may very well be due to external changes.
>
> > -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35
> > -I../.. -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/lwres/include
> > -I../../lib/lwres/unix/include -I../../lib/lwres/include
> > -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/dns/include
> > -I../../lib/dns/include
> > -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/bind9/include
> > -I../../lib/bind9/include
> > -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/isc/include
> > -I../../lib/isc -I../../lib/isc/include -I../../lib/isc/unix/include
> > -I../../lib/isc/pthreads/include -I../../lib/isc/noatomic/include
> > -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/isccfg/include
> > -I../../lib/isccfg/include    -D_REENTRANT -DVERSION=\"9.11.35\"
> > -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> > -D_FILE_OFFSET_BITS=64  -Os -g0  -static   -W -Wall
> > -Wmissing-prototypes -Wcast-qual -Wwrite-strings -Wformat
> > -Wpointer-arith -fno-strict-aliasing -fno-delete-null-pointer-checks
> > \
> >          -DSESSION_KEYFILE=\"/var/run/named/session.key\" \
> >          -c ./nsupdate.c
> > ./nsupdate.c:104:10: fatal error: readline/history.h: No such file or directory
> >    104 | #include <readline/history.h>
> >        |          ^~~~~~~~~~~~~~~~~~~~
>
>   This sounds like you changed your configuration without doing 'make clean'. Is
> that possible?

I am building from clean or from scratch.

>
>   Is BR2_PACKAGE_READLINE enabled in your configuration? Has it been built?

Yes, BR2_PACKAGE_READLINE is enabled in my configuration.

>
>   Regards,
>   Arnout
>
> > compilation terminated.
> > make[5]: *** [Makefile:473: nsupdate.o] Error 1
> > make[4]: *** [Makefile:79: subdirs] Error 1
> > make[3]: *** [Makefile:88: subdirs] Error 1
> > make[2]: *** [package/pkg-generic.mk:270:
> > /home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/.stamp_built]
> > Error 2
> > make[1]: *** [Makefile:23: _all] Error 2
> > make[1]: Leaving directory '/home/tambewilliam/Documents/buildroot-build'
> > make: *** [pu32/makefile:67: pu32-build/buildroot] Error 2
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
