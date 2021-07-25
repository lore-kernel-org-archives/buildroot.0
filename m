Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11794C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:15:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F8E660F13
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F8E660F13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F7AE823A7;
	Sun, 25 Jul 2021 21:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3UJbztT9-fk; Sun, 25 Jul 2021 21:15:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B351481DBF;
	Sun, 25 Jul 2021 21:15:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 242F21BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 201D140150
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:15:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jgglV7-6R_ct for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:15:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5C514013B
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:15:25 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.181.181])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 7lT2m0widnxSq7lT2mm0eg; Sun, 25 Jul 2021 23:15:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627247724; bh=KY4XVAWdPLnsL9ylR9lgCafRu4/SOf2s7DM4q777EXU=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=ZefZZ8zT5Hp+pHPFittbapq63GX31qqTj1d7txmStvkgZ6tVl16j+jlctc1kBPn/m
 8yImXIAJP7FBEoJ6bYgGCGL8NphuQhyKqdmpGd/uSRB7uqqZdUL0oPUlvkvEhkgg4o
 hgz8SLTEQgr4CUMGBzUJ/e/9lJbamcGRmc4k2DipKd4aEMd/2cVoXgZWGv7tD+Gyi9
 VeajqounIZasghIgi8HIh20ucnr3hRH2rJDFcfRpKnxMRRG3px45jV0fDnnwY420v9
 IT0JfFrJYNP2tLkWXF4bAC3IEw5Jg1QCX1Sr/8U4m/9SXT558F2vLU2nTniwEtM0bA
 VcXrUb7k+UKVQ==
To: Petr Vorel <petr.vorel@gmail.com>
References: <20210725210054.1534823-1-giulio.benetti@benettiengineering.com>
 <YP3Td024jBRWDVsH@pevik>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <e1c46dbd-1f45-62b3-ecba-2dfdd73b7452@benettiengineering.com>
Date: Sun, 25 Jul 2021 23:15:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YP3Td024jBRWDVsH@pevik>
Content-Language: en-US
X-CMAE-Envelope: MS4wfD1upn9Mm0nxiwIKMjc3B8JQ95MqMhe2kXaLGwGTKfdxnxH3SaLTlaS3BsnbuYz5UDsyRxFfWWd4tsVKIU7zv0AMOglWkAmlV174QeKEG0tbreg/zF3Y
 XoAg5lWNb0uoKu16uwY8i9tjKvYbQgiKIiZrdqkV7ALcziAtaXGrx3lxii8+7qrf8N/CR6LZNVM0lBOIvbjmuNnSiQqPSzGl00P71WuTlOac/SIUxD2QP87n
 OET28A+QkvGSO5xJlVVHEw==
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: fix printfs format build
 failure on 64-bits platforms
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Petr,

On 7/25/21 11:11 PM, Petr Vorel wrote:
> Hi Giulio,
> 
>> Add 2 pending upstream patches that have been pointed to nfs-utils
>> maintainer to be committed soon. They both fix the build failure on 64-bits
>> where time_t is assumed to be a long long when passed to printf("%ld"), but
>> that is not always true, so in these patches the author(Petr) uses PRIu64
>> tag.
> 
>> Fixes:
>> http://autobuild.buildroot.net/results/9bc1d43a588338b7395af7bc97535ee16a6ea2d9/
> 
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Cc: Petr Vorel <petr.vorel@gmail.com>
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> 
> Although I'd wait till Monday, when Steve merges them and then add
> upstream commit hashes.

Oh, usually here they accept pending patches, so I don't think that SHA1 
is that important. At least this is what I've experienced until now.

> Or at least add links from lore.
> https://lore.kernel.org/linux-nfs/20210722161545.26923-1-petr.vorel@gmail.com/
> https://lore.kernel.org/linux-nfs/20210722161545.26923-2-petr.vorel@gmail.com/
But yes, I've forgotten to mention that they are pending there ^^^.

Let's see what Buildroot maintainers answer. Otherwise I send a v2 with 
update commit log pointint the links where those patches are committed 
or pending.

Thanks a lot for reviewing

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
