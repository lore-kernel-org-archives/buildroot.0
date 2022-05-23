Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B08DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 03:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5D3283EE1;
	Mon, 23 May 2022 03:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-R1PGoK_o1I; Mon, 23 May 2022 03:50:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B485D83E78;
	Mon, 23 May 2022 03:50:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99DAA1BF3E8
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 03:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 815674182F
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 03:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XzZdZSe9F3aS for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 03:50:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D711441708
 for <buildroot@buildroot.org>; Mon, 23 May 2022 03:50:13 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 4AAD344046E;
 Mon, 23 May 2022 06:48:58 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1653277738;
 bh=tmidbhQfKUIepJb43V2Cq6XhLOytby5izGgVxz4DmMg=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=hpaAuUdGBs8dh/luoDHTw9cDYvyDw5cUDCbKM26ASOCvUpe+IGxhCId+CL0BdjBQ/
 dw05EiXM4gPQg2eMGLGkbGfkbYjm0otrGmsqoWaG4mysV7Hmj41oWGasZmcEPf24Lt
 XTQy8y8ANPQ0dMw1tacPD+DG3U5NCdLsQh9bAN/TOQbDEoIqiAWZ3tuw6q1jNnyZHL
 QV8AEVqz240D/phvTEiOtL2tB81rm+c682cVTFNCPm0mh+ItoOL5tLoCIiZNUWuvCq
 jz3yDd9HuyaqOCnTStjsyhWraOms+afJdyBMOiIZ452C12slwpbCSdqR8mjbRV83PH
 EsMSjgh0saKeQ==
References: <CALtfCQaLxNdrKhSjMfShjb-nQWUnqa3DSOwbyZm1+Q0fU1UUqQ@mail.gmail.com>
 <87zgjapr8a.fsf@tarshish>
 <CALtfCQaBG_p15ASxYKSyZhYOePW5uE-BW8F1KG7DkPeJ8bjLiw@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Mon, 23 May 2022 06:38:13 +0300
In-reply-to: <CALtfCQaBG_p15ASxYKSyZhYOePW5uE-BW8F1KG7DkPeJ8bjLiw@mail.gmail.com>
Message-ID: <87r14kq55b.fsf@tarshish>
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Oscar,

On Sun, May 22 2022, Oscar Gomez Fuente wrote:
> On Sat, 21 May 2022 at 22:26, Baruch Siach <baruch@tkos.co.il> wrote:
>> BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS is a blind symbol that is enabled
>> automatically based on your host (build machine) architecture. Being
>> blind means that you can not enable this symbol manually.
>>
>> BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS is defined at
>> package/rustc/Config.in.host. What is your host platform?
>
> It is Linux, Ubuntu 20.04 (x86_64).

So BR2_HOSTARCH should be "x86_64". Is that what you see when you lookup
BR2_HOSTARCH in menuconfig?

What is the output of 'gcc -v' on your host?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
