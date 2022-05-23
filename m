Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5358CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 10:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE1141963;
	Mon, 23 May 2022 10:22:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vi3dDiIh59nf; Mon, 23 May 2022 10:22:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD40341958;
	Mon, 23 May 2022 10:22:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CA4A1BF30A
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 10:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B0F840B0D
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 10:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t5VO6eLUb88p for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 10:22:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31D6C40223
 for <buildroot@buildroot.org>; Mon, 23 May 2022 10:22:40 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id ev18so13600898pjb.4
 for <buildroot@buildroot.org>; Mon, 23 May 2022 03:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/VfCf86QUB1aTVyZRDCjNvsarVXZ+DO/1oCnBAfc0z4=;
 b=FeTcnxYMWucqnHhPoHMZOJdNMKMENyiZsq35P10KQoUifQJ/VhKlzNQMamtaqUYdSK
 Sr5wX/R5iaTbPUglgbx8md+nv5HyWG59In98Z5/0D8pdnZuLp6tK74AZadz00ZjKokHp
 LJ0/oBN5ev3mKjy9e50KaDnHKYbln5qOxjptyjNw6BC2hTDAiNCxmTd26Vm+b7X5yVLC
 5GBwi8P55i9Tp7Mvt90lftb3aKWEs4aTsxLa42VlR95e8BqGgYwu/EXRf6Va9aLtjGzr
 EkzaQF2+4AVHycbE+XPUceKUWN2VUUeqdf+Ia2iK1TFvQraFlbj1lzv9kd9UCOJmeudy
 2rbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/VfCf86QUB1aTVyZRDCjNvsarVXZ+DO/1oCnBAfc0z4=;
 b=swRmr4csv1N9H/tqNkjcacnyKvbLjinDmJLMhDfzpW3feGPFN7o1YegpH4U/FSD99t
 rGR463NJ7ifnAo5hTeXAhuFi/88D+a92+f4gtfX75djoztb+jIUQsZ/Nt9mm5jAxsLnW
 /freu9iKOZK4mRqNPDt/Y8TYTk4EwJ5LhxK6mC8eh97wOGYzJZFUdwUri/2Nwvi0kq6P
 YeNdSrp6HDQCr3uaS6WG2gL/Lp+Df3awSwb2yB8u588tgbIQ6H3M0kPQezvSdGsmfa4H
 nhtGGI9dlJQ25UChgaUOCZKa8WOMGWKbye5mQPWglX7LTm5ct3AIekKJa7BGexZopaUU
 qJCg==
X-Gm-Message-State: AOAM5321Nv7vTXF+paP4rYG+PT4yU0KK6O4hmd6FRVVV0XdPbXyuiY4G
 UhoceobIsc1b47ssNYayMxscc2S6W/RT3ZBH4BGcKgaBF8o=
X-Google-Smtp-Source: ABdhPJwmHRE4VVvKZQ6g167z/b2U8m76r55WsYZZUQg3W6TzhqYZA8pAtpAH39lLaqxlTyzHpZ8enMUWYSgdsMaJXgY=
X-Received: by 2002:a17:90a:7847:b0:1df:a16d:2bfb with SMTP id
 y7-20020a17090a784700b001dfa16d2bfbmr26284427pjl.71.1653301359579; Mon, 23
 May 2022 03:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <CALtfCQaLxNdrKhSjMfShjb-nQWUnqa3DSOwbyZm1+Q0fU1UUqQ@mail.gmail.com>
 <87zgjapr8a.fsf@tarshish>
 <CALtfCQaBG_p15ASxYKSyZhYOePW5uE-BW8F1KG7DkPeJ8bjLiw@mail.gmail.com>
 <87r14kq55b.fsf@tarshish>
In-Reply-To: <87r14kq55b.fsf@tarshish>
From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Mon, 23 May 2022 12:22:03 +0200
Message-ID: <CALtfCQY1a6sjLNUh42zsrsu1hPLTMHNDj4+5v5k8w8kv8u6tmg@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [Buildroot] How to select python-cryptograhy package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

On Mon, 23 May 2022 at 05:50, Baruch Siach <baruch@tkos.co.il> wrote:
>
> So BR2_HOSTARCH should be "x86_64". Is that what you see when you lookup
> BR2_HOSTARCH in menuconfig?

YES

> What is the output of 'gcc -v' on your host?

Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-linux-gnu/9/lto-wrapper
OFFLOAD_TARGET_NAMES=nvptx-none:hsa
OFFLOAD_TARGET_DEFAULT=1
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu
9.4.0-1ubuntu1~20.04.1'
--with-bugurl=file:///usr/share/doc/gcc-9/README.Bugs
--enable-languages=c,ada,c++,go,brig,d,fortran,objc,obj-c++,gm2
--prefix=/usr --with-gcc-major-version-only --program-suffix=-9
--program-prefix=x86_64-linux-gnu- --enable-shared
--enable-linker-build-id --libexecdir=/usr/lib
--without-included-gettext --enable-threads=posix --libdir=/usr/lib
--enable-nls --enable-clocale=gnu --enable-libstdcxx-debug
--enable-libstdcxx-time=yes --with-default-libstdcxx-abi=new
--enable-gnu-unique-object --disable-vtable-verify --enable-plugin
--enable-default-pie --with-system-zlib --with-target-system-zlib=auto
--enable-objc-gc=auto --enable-multiarch --disable-werror
--with-arch-32=i686 --with-abi=m64 --with-multilib-list=m32,m64,mx32
--enable-multilib --with-tune=generic
--enable-offload-targets=nvptx-none=/build/gcc-9-Av3uEd/gcc-9-9.4.0/debian/tmp-nvptx/usr,hsa
--without-cuda-driver --enable-checking=release
--build=x86_64-linux-gnu --host=x86_64-linux-gnu
--target=x86_64-linux-gnu
Thread model: posix
gcc version 9.4.0 (Ubuntu 9.4.0-1ubuntu1~20.04.1)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
