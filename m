Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1489C433EF
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 20:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02623418A8;
	Sat, 21 May 2022 20:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cjETN5rEZaxk; Sat, 21 May 2022 20:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F5344189C;
	Sat, 21 May 2022 20:26:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A15771BF286
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 20:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9088684485
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 20:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EIZDNtNpL5pJ for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 20:26:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 075418448C
 for <buildroot@buildroot.org>; Sat, 21 May 2022 20:26:17 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 5B759440538;
 Sat, 21 May 2022 23:25:04 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1653164704;
 bh=dBMyWcAEEGddKXz0iyUrGS/o12dA6iOvQSR9SxMjZqw=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=GOKCmgHOjoUHs37qctbsUocli3jbtoCd4ZuRAuTokTdLOcGGPYVy2OhpwZVQ9876l
 2o2PA6kWjII+ffexlWWZIdJKFxGHbUxnUX36ElhHLvnlbOhXHTFC7k0A2LnUV53uig
 UwPAZVPH9yjO6uEUUWWfpj3mh0IR5rfXWdj/DR8EEnQ2cJtrl2FMQGekrTArjRzOZO
 EWDjgEL5NAPIWHdP0uAv0UNYTnZohFpVGKuWdt5eHCSQkamRRI/Zr7ReZDtpTcqwuC
 9mtF7zy90APLs4B8Cd7d0rbqYQnSzRlK+3isCWjDP9MsXVUdmpm77aOx/N9EBYuJ1m
 /qateEx/T88Ew==
References: <CALtfCQaLxNdrKhSjMfShjb-nQWUnqa3DSOwbyZm1+Q0fU1UUqQ@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Sat, 21 May 2022 23:22:26 +0300
In-reply-to: <CALtfCQaLxNdrKhSjMfShjb-nQWUnqa3DSOwbyZm1+Q0fU1UUqQ@mail.gmail.com>
Message-ID: <87zgjapr8a.fsf@tarshish>
MIME-Version: 1.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@busybox.net, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Oscar,

On Fri, May 20 2022, Oscar Gomez Fuente wrote:
> I am trying to build an image for a Raspberry Pi 3B with Buildroot
> (Vvrsion 2022.02.1. I have selected the package python3, but I need to
> use the package python-cryptograhy (BR2_PACKAGE_PYTHON_CRYPTOGRAPHY),
> but it seemed to be that in this release 2022.02.1, it has to be
> selected these two packages:
>
> Depends on: BR2_PACKAGE_PYTHON3 [=y] &&
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
>
> But I am not able how to select this package:
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS.
>
> Can anyone help me out?

BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS is a blind symbol that is enabled
automatically based on your host (build machine) architecture. Being
blind means that you can not enable this symbol manually.

BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS is defined at
package/rustc/Config.in.host. What is your host platform? Do you use
something that is not listed there?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
