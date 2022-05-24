Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71B9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 19:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93AE28244D;
	Tue, 24 May 2022 19:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfj84BUHelAC; Tue, 24 May 2022 19:16:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B020D81D11;
	Tue, 24 May 2022 19:16:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9956D1BF28C
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 19:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CE96408FB
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 19:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQCSVhEmn_Z7 for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 19:16:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BBD140104
 for <buildroot@buildroot.org>; Tue, 24 May 2022 19:16:28 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 9FD05440150;
 Tue, 24 May 2022 22:15:12 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1653419712;
 bh=nHWnvmNEjrTUqJM/wEhafkQehODKLDsvAarpNvMrR8U=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=hUWt+GBSieKZcZQzFBH1OXeqorAV3C2S2/pO/CFpVx+2W/Ql5hSXTcgtME0dki+Nh
 J+CeqhpSrZcAZIEUnMnmZwEQ6dn4bUZXSAnTYv+yBZvmScA/vQHIyUdED30kWGDhtL
 fErsdyP1o16R3zzHWsdZJlt2V2HLqCnO2Cfaedk2tKAVurICZzxLyyzXxljnYGAjY5
 kljVyLpIaRaVEVoRaMK8mGExZjWv7Fn2Hn8ndpDt92fV314UlUA/B+4fjdBbed1XGb
 Z/7CRW8B6aP7ymO6YxjH69AVdgpuwD2KhLQ5yi1vJbMvITGBPSrXWoMTqVrhGO9AG/
 NeCqiWXxd/eBg==
References: <CALtfCQaLxNdrKhSjMfShjb-nQWUnqa3DSOwbyZm1+Q0fU1UUqQ@mail.gmail.com>
 <87zgjapr8a.fsf@tarshish>
 <CALtfCQaBG_p15ASxYKSyZhYOePW5uE-BW8F1KG7DkPeJ8bjLiw@mail.gmail.com>
 <87r14kq55b.fsf@tarshish>
 <CALtfCQY1a6sjLNUh42zsrsu1hPLTMHNDj4+5v5k8w8kv8u6tmg@mail.gmail.com>
 <87ilpwp82x.fsf@tarshish>
 <CALtfCQauLNMOfBb6Zm8M8v-VHakY_Bs+p6CeQh0tVuTtfKyUDg@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Tue, 24 May 2022 22:14:18 +0300
In-reply-to: <CALtfCQauLNMOfBb6Zm8M8v-VHakY_Bs+p6CeQh0tVuTtfKyUDg@mail.gmail.com>
Message-ID: <87a6b6pwqf.fsf@tarshish>
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
> On Mon, 23 May 2022 at 17:44, Baruch Siach <baruch@tkos.co.il> wrote:
>> It turns out I mixed BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS with
>> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS. BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
>> depends on the latter, and that in turn can only be enabled for musl or
>> glibc. The default libc in Buildroot is uClibc-ng. So you must select a
>> toolchain with musl or glibc to enable BR2_PACKAGE_PYTHON_CRYPTOGRAPHY.
>
> I have just changed the toolchain from uClibc-ng to glibc or musl, and
> it didn't appear the package BR2_PACKAGE_PYTHON_CRYPTOGRAPHY.
>
> Do you have any suggestions?

So now when you lookup BR2_PACKAGE_PYTHON_CRYPTOGRAPHY in menuconfig
search do you still see 'BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]'?

Please send your .config file.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
