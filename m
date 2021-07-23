Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E2CC4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 03:39:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D1E060C41
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 03:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D1E060C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A21B940608;
	Fri, 23 Jul 2021 03:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uvh7yn0m5DbT; Fri, 23 Jul 2021 03:39:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C164E40605;
	Fri, 23 Jul 2021 03:39:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D22021BF9CB
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 03:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA4C48336D
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 03:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PccgzQADrng0 for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 03:39:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 733B18333E
 for <buildroot@busybox.net>; Fri, 23 Jul 2021 03:39:32 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id B5387440E6E;
 Fri, 23 Jul 2021 06:39:16 +0300 (IDT)
References: <20210720224806.09e5a5b2@windsurf>
 <BAACA597-C3FC-4275-9931-4D3F619F94EE@nklabs.com>
 <20210721094154.74005093@windsurf>
 <CAJ6EmCd-K+goctCfu5ygE8V1MAMh=C7RgxYmSfhJGQmRCuv=3g@mail.gmail.com>
 <CAJ6EmCfeA3e9-vmCbAUuN-yqPXaAMKci-g-G+OeW5UfrT=Uy_g@mail.gmail.com>
 <01c34092-b6d9-86ad-6cee-c78090e75b3f@mind.be>
 <CAJ6EmCeHd-7Xv0WSt+gLn31viKP2giaXzHKOt0=Z+7zWN8eGpA@mail.gmail.com>
 <CAJ6EmCfnhev8MLO7JNx3d8trX7uEn+DgkdWZHKguyW8kG92ZhQ@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Baruch Siach <baruch@tkos.co.il>
To: Patricia Holden <pholden@nklabs.com>
In-reply-to: <CAJ6EmCfnhev8MLO7JNx3d8trX7uEn+DgkdWZHKguyW8kG92ZhQ@mail.gmail.com>
Date: Fri, 23 Jul 2021 06:39:26 +0300
Message-ID: <87a6mdzok1.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] Question about pkg-config pc files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Patricia,

On Fri, Jul 23 2021, Patricia Holden wrote:
> I switched from ti-gfx to ti-sgx, now I get another error:
>
> /home/patricaholden/williamson/build07062021/Pro3-Linux/buildroot-2020.02/output/build/ti-sgx-km-4519ed3b83d1d72207ddc2874c7eb5e5a7f20d8d/eurasia_km/eurasiacon/binary_omap_linux_xorg_release/target_armhf/kbuild/services4/srvkm/env/linux/mm.c:69:10:
> fatal error: linux/dma-direct.h: No such file or directory
>    69 | #include <linux/dma-direct.h>
>       |          ^~~~~~~~~~~~~~~~~~~~
>
>
> I checked linux-headers and only see "include/linux/dma-direction.h", no
> "include/linux/dma-direct.h".

The linux-headers package is for userspace API (uapi) headers that are
part of the toolchain. dma-direction.h is for kernel code. The 'kbuild'
part in the path above indicates that you are building a kernel module.

linux/dma-direct.h was introduced in kernel version 4.16 (commit
ea8c64ace866). But ti-sgx-km commit cf7f48cb30a predates this kernel by
few years. So this it probably a TI kernel that carries the header.

The BR2_PACKAGE_TI_SGX_KM help text says this:

          Note: it needs a TI specific kernel to build properly.

baruch

> Not sure if this is the same file this package is looking for, but just
> renamed.  Looking through config for the kernel to see if I missed
> something.

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
