Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC518C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:58:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55DB961090
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55DB961090
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FE0540749;
	Thu, 14 Oct 2021 21:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IGo1s461xKOb; Thu, 14 Oct 2021 21:58:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81A0A406B9;
	Thu, 14 Oct 2021 21:57:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 799591BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7600E607D5
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IXJecakCTc6O for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:57:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F7FF605DA
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:57:56 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b8jbmx2P7XRKtb8jbmFkQb; Thu, 14 Oct 2021 23:57:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634248675; bh=nEe7EGJuhqMb+EpgTKec5APm4MQNhBK09EOY27UpzvI=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=W1VFOCbijT5NCma1sdITLwBNoGDXamdsEySWaC9lulfspwPIp8Mr65pCvo78Bi0Bn
 r3qq2I9eBEJG76zvVL786PqvvRPL+U+ntuGU46XRdhdZZs7ckGViEEwqaHERaXjHnh
 MAAH3eyZUNAS2NfOUsKM2PZwSSAwNx+AWQ6OGY3yXtWWk4sh7J4kQXN2L+GBjyLXev
 QLpbvw9c69/RwOIco4ylICG/4CfEDl4gagEs162jT9H7lKCQyzNimD7QI5T+f8gDTo
 O3aA7nHHOvHlgG5tz2YnopR8J/XLvvV8YVOZ5WyYLoq7/FqzTKL6RVhIVnph/97Pte
 s/Zr3u+hLROTw==
To: buildroot@buildroot.org
References: <20211014215455.2444205-1-giulio.benetti@benettiengineering.com>
 <20211014215455.2444205-3-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <3621e4bc-d369-be86-6c02-164dc1a9e709@benettiengineering.com>
Date: Thu, 14 Oct 2021 23:57:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014215455.2444205-3-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfLiKhp+yUpCeiuvU69zM9vli1dvBi3HzsfLSFZyzXGOtgdT9410fKcuU/YLwfH4rJ3UjyNfS0HbFWTXE829yMovzYSEdSDUpivo2NPFs9xdSyZVnIV2V
 vP16I3EJj+j5z13mGFdN1HBdfDqvLVvu3F+qjFjI3yzZC/3tfv6vsuX77pMdKq1+C4Q39dVa2M4mH2VY7IBRJrrMNUlRvxRgJq78Gs4JsKyhSg5WtjbVXOFn
 GjoIlZGKCQgURE9X874TXHLP/YXxkDWlFBA4bHiLboc=
Subject: Re: [Buildroot] [PATCH 2/2] package/erlang-jiffy: fix build failure
 due to lack of -fPIC
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
Cc: Will Newton <will.newton@gmail.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I was too fast and made a mistake, please drop this patch in favour of 
this patchset:
https://patchwork.ozlabs.org/project/buildroot/list/?series=267107

Sorry for the noise!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 10/14/21 11:54 PM, Giulio Benetti wrote:
> Package erlang-jiffy needs to be linked with -fPIC otherwise it throws
> linker error:
> ```
> failed with return code 1 and the following output:
> /home/giuliobenetti/br_reproduce/60296a48210e7ffc6bc9fa50ee586441a8957e85/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/9.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /tmp/jiffy.so.FCaOXC.ltrans1.ltrans.o: relocation R_X86_64_PC32 against symbol `dec_destroy' can not be used when making a shared object;
> recompile with -fPIC
> ```
> 
> This is architecture indipendent, so let's add -fPIC flag to LDFLAGS in any
> case.
> 
> Fixes:
> http://autobuild.buildroot.net/results/602/60296a48210e7ffc6bc9fa50ee586441a8957e85/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/erlang-jiffy/erlang-jiffy.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
> index cd94632962..25e7227c39 100644
> --- a/package/erlang-jiffy/erlang-jiffy.mk
> +++ b/package/erlang-jiffy/erlang-jiffy.mk
> @@ -11,4 +11,7 @@ ERLANG_JIFFY_LICENSE = MIT (core), \
>   	BSD-3-Clause (tests)
>   ERLANG_JIFFY_LICENSE_FILES = LICENSE
>   
> +# erlang-jiffy needs -fPIC to link succesfully
> +ERLANG_JIFFY_REBAR_ENV += LDFLAGS="-fPIC"
> +
>   $(eval $(rebar-package))
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
