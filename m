Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EC4C52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 06:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97C7A40720;
	Wed, 21 Aug 2024 06:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXKf47fDoJIP; Wed, 21 Aug 2024 06:18:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67BDA40722
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67BDA40722;
	Wed, 21 Aug 2024 06:18:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 221AC1BF2A4
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 06:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CD5F812E5
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 06:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5k-iLZ0pZqH0 for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 06:18:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.4;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE84D812D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE84D812D0
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE84D812D0
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 06:18:38 +0000 (UTC)
Received: from tianyuanhao3$163.com ( [59.46.133.34] ) by
 ajax-webmail-wmsvr-40-139 (Coremail) ; Wed, 21 Aug 2024 14:18:25 +0800
 (CST)
X-Originating-IP: [59.46.133.34]
Date: Wed, 21 Aug 2024 14:18:25 +0800 (CST)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: buildroot@buildroot.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <ZsUSEXO-x4RnuiZG@landeda>
References: <ZsS52zTjT0Ca9twG@waldemar-brodkorb.de>
 <ZsUKCVcZheIlzo00@landeda> <20240820233250.3293444a@windsurf>
 <ZsUSEXO-x4RnuiZG@landeda>
X-NTES-SC: AL_Qu2ZBv6Zvkkr4yefY+kfmksSgOg6X8CxuP8g3IRWO5x+jBHo6gE4VkdAP2TQ2fmDOQa+mxuUbBlCzd9Kf65gf6kAom02iL3GVUefP3FCQi9+3w==
MIME-Version: 1.0
Message-ID: <29b5f7df.5240.19173962677.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: _____wDnD6OxhsVmMPs1AA--.33203W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXR5CjWXAm2ZxaQACsO
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=1/GUJoDGRNumDn5Wpg5SKWC1AniJ1DbVklRfAFkf/nc=; b=W
 uanTxuUOoeNJH35rT1w7zFn/0NZV8yfehegIEP1ptBbLBTLuqQGi405aAjMO/nPr
 mxPAaF329LPzVuEpI0hAhp6WSmu/KSl65A7iKAPtrrlsWf//UNteNEkcjyqnMTb1
 Tsw8bWzaVpkGPhQg8Z8Tn8SmAUHjcX0K3/2MpGuMV0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=WuanTxuU
Subject: Re: [Buildroot] [PATCH] package/docker-engine: fix runtime problem
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At 2024-08-21 06:00:49, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>Thomas, All,
>
>On 2024-08-20 23:32 +0200, Thomas Petazzoni via buildroot spake thusly:
>> On Tue, 20 Aug 2024 23:26:33 +0200
>> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>> > On 2024-08-20 17:44 +0200, Waldemar Brodkorb spake thusly:
>[--SNIP--]
>> > > Add the missing kernel module to allow starting containers.
>[--SNIP--]
>> > > +	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)  
>> > As far as I can see, this is an optional feature, and is not strictly
>> > required:
>> >     https://github.com/moby/moby/blob/master/contrib/check-config.sh#L235
>> > So I don't think we should forecfully enable it.
>> On the other hand, Waldemar is encountering the issue while doing a
>> simple "docker run <container>", which seems to be like the most basic
>> thing you would want to do with docker. So if CONFIG_USER_NS is needed
>> for something as basic as starting up a container, I believe it's not
>> really an optional feature?
>
>In that case, we are missig way more options, like CGROUP_PIDS, SECCOMP,
>MEMCG_SWAP_ENABLED, and a good bunch of others...
>
>The way the moby (alias docker-engine) config-check script make that
>flag optional is very peculiar: they run the check in a {} list, which
>means any failure is ignored, so their check_flags() failure is ignored
>for those options, meaning they really are optional from the point of
>view of moby, and they do not require it.
>
>And indeed it is optional, as our runtime test for docker-compose (test
>which uses docker-engine) with a custom kernel configuratio nthat does
>not have USER_NS, does not fail although it does run multiple
>containers...

In fact, USER_NS is optional for runc, but mandatory for crun.

>
>Regards,
>Yann E. MORIN.
>
--
Regards,
TIAN Yuanhao
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
