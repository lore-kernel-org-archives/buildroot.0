Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830FCC433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 10:11:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F096961216
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 10:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F096961216
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 946B480F87;
	Thu,  4 Nov 2021 10:11:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I82OJg7qnoOc; Thu,  4 Nov 2021 10:11:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDB6980F89;
	Thu,  4 Nov 2021 10:11:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2CA671BF909
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 10:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B0FC404C3
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 10:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=yandex.ru
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61uX_Ho-dtYv for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 10:11:41 +0000 (UTC)
X-Greylist: delayed 00:09:10 by SQLgrey-1.8.0
Received: from forward107j.mail.yandex.net (forward107j.mail.yandex.net
 [IPv6:2a02:6b8:0:801:2::252])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46466404BD
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 10:11:41 +0000 (UTC)
Received: from postback2p.mail.yandex.net (postback2p.mail.yandex.net
 [IPv6:2a02:6b8:c03:780:0:640:5dd4:3db5])
 by forward107j.mail.yandex.net (Yandex) with ESMTP id 5D2E288539C;
 Thu,  4 Nov 2021 13:02:26 +0300 (MSK)
Received: from forward500j.mail.yandex.net (forward500j.mail.yandex.net
 [IPv6:2a02:6b8:0:801:2::110])
 by postback2p.mail.yandex.net (Yandex) with ESMTP id 572051800FB5;
 Thu,  4 Nov 2021 13:02:26 +0300 (MSK)
Received: from myt6-2cec5828668a.qloud-c.yandex.net
 (myt6-2cec5828668a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4019:0:640:2cec:5828])
 by forward500j.mail.yandex.net (Yandex) with ESMTP id 537926CB640B;
 Thu,  4 Nov 2021 13:02:26 +0300 (MSK)
Received: from myt5-aad1beefab42.qloud-c.yandex.net
 (myt5-aad1beefab42.qloud-c.yandex.net [2a02:6b8:c12:128:0:640:aad1:beef])
 by myt6-2cec5828668a.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 4mSrzrAw2O-2QCaQTVp; Thu, 04 Nov 2021 13:02:26 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1636020146; bh=s8FEgdvdxMyirVt8Ec1q/0HkDVOngu4UHgVlLlWBq5k=;
 h=In-Reply-To:From:Subject:Cc:References:Date:Message-ID:To;
 b=pgEL4gCOr+2Ouu42D4IJWIRW4i0GvvZ1OTw6LkgdYcOXNhTzIgAqVh9VBs1pYtMmm
 Sok50xv10hoX45MDpAkfDO2aq/i3eFcb2v1Cdipxbqru+78xblUu8+WyMecsetZ98b
 UghQ/+IeiqwyNBZh7e7yGHe3//bdOxBtr0ivQiMs=
Authentication-Results: myt6-2cec5828668a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by myt5-aad1beefab42.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id
 nNviwQCPUh-2P8uUbUU; Thu, 04 Nov 2021 13:02:25 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Message-ID: <b379b067-4456-324c-f768-2f6eac1b155c@yandex.ru>
Date: Thu, 4 Nov 2021 13:02:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
From: stsp <stsp2@yandex.ru>
To: buildroot@buildroot.org
References: <3c3603ba-5719-fec9-9bb3-7b0f3967fc9f@yandex.ru>
In-Reply-To: <3c3603ba-5719-fec9-9bb3-7b0f3967fc9f@yandex.ru>
Subject: Re: [Buildroot] generic code with i7 bootlin toolchain?
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> Unfortunately some package(I would say many) has theirself a broken way to correctly pass external C/CXX/LDFLAGS.
> Usually they internally override some flag that makes null what we pass or worse they completely ignore them by using hard coded flags.
> To fix this specific problem we should go through every package and fix the package build system itself(a huge work).
I initially thought the same way.
But it seems to be after some more
investigation the other way:
$ file 
/home/stas/src/fdpp-buildroot/buildroot/output/host/bin/x86_64-linux-gcc
/home/stas/src/fdpp-buildroot/buildroot/output/host/bin/x86_64-linux-gcc: 
symbolic link to toolchain-wrapper
$ file 
/home/stas/src/fdpp-buildroot/buildroot/output/host/bin/toolchain-wrapper
/home/stas/src/fdpp-buildroot/buildroot/output/host/bin/toolchain-wrapper: 
ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, 
interpreter /lib64/ld-linux-x86-64.so.2, 
BuildID[sha1]=965fad722d4737f4373924e5b37b0973c0cd5f46, for GNU/Linux 
3.2.0, stripped

So it looks like buildroot creates
the toolchain-wrapper binary as
a replacement of gcc, and that
binary would invoke gcc (and
perhaps ccache too) with the
needed flags.
So such scheme should resist to
the "bad" packages you mention
because it doesn't rely on them
handling CFLAGS correctly.
There might be some other explanation
to the problem I see.

Thinking more about this - maybe
libgcc or some other lib from the
bootlin toolchain is over-optimized?
In that case I should ask at bootlin
perhaps instead...

Please CC me the replies if possible.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
