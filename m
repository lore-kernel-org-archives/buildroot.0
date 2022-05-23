Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0746C433F5
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 15:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CB38408F0;
	Mon, 23 May 2022 15:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Si32eUa4FKco; Mon, 23 May 2022 15:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F33F405BC;
	Mon, 23 May 2022 15:44:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 827891BF390
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 15:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70AD5405BC
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 15:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kJyFzokWNWSI for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 15:44:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15FAE40017
 for <buildroot@buildroot.org>; Mon, 23 May 2022 15:44:26 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id E3CE144053C;
 Mon, 23 May 2022 18:43:11 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1653320592;
 bh=LGPNNe2O1h5KbmWBVLRIISPXFHGDcdbluvfv2KksKok=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=Z+BaCofAjPIUjYm6jiYJKi9g+eUOP5gf2gE02M856NsgDelRsczlDsNZpckv+rD+a
 jM2nGIYorLaBNBsi6FMdNy+uA8cU5ImKwdv4jjGpNoO4ga7ZsXi6x7vfG9cTVn/ph0
 RrpS/pahaIovpeKlSiRXn/lCUAJ0SOGvAXPaZrtdEBw9YbmvSamRY0W1UvDEr2OjtA
 lVd4Fv6FkJGT2mViR25IyA3oUmvLLDRJxRyHAavrE/vvx0I0gMc/eRY4BMmlCYZGLP
 0czYKpV/BVJOfAgVv3MB217Ua529TQC3mWYDwMkUO9QXQnnXadExKK4UObmzEdJPhQ
 3sLuKgVmrf2Cg==
References: <CALtfCQaLxNdrKhSjMfShjb-nQWUnqa3DSOwbyZm1+Q0fU1UUqQ@mail.gmail.com>
 <87zgjapr8a.fsf@tarshish>
 <CALtfCQaBG_p15ASxYKSyZhYOePW5uE-BW8F1KG7DkPeJ8bjLiw@mail.gmail.com>
 <87r14kq55b.fsf@tarshish>
 <CALtfCQY1a6sjLNUh42zsrsu1hPLTMHNDj4+5v5k8w8kv8u6tmg@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Mon, 23 May 2022 18:38:58 +0300
In-reply-to: <CALtfCQY1a6sjLNUh42zsrsu1hPLTMHNDj4+5v5k8w8kv8u6tmg@mail.gmail.com>
Message-ID: <87ilpwp82x.fsf@tarshish>
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

On Mon, May 23 2022, Oscar Gomez Fuente wrote:
> On Mon, 23 May 2022 at 05:50, Baruch Siach <baruch@tkos.co.il> wrote:
>> So BR2_HOSTARCH should be "x86_64". Is that what you see when you lookup
>> BR2_HOSTARCH in menuconfig?
>
> YES

It turns out I mixed BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS with
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS. BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
depends on the latter, and that in turn can only be enabled for musl or
glibc. The default libc in Buildroot is uClibc-ng. So you must select a
toolchain with musl or glibc to enable BR2_PACKAGE_PYTHON_CRYPTOGRAPHY.

Sorry for my confusion.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
