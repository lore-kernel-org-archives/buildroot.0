Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0F8ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 21:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A6488308B;
	Wed, 21 Sep 2022 21:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A6488308B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JoViGLhiivt5; Wed, 21 Sep 2022 21:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51A2283077;
	Wed, 21 Sep 2022 21:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51A2283077
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7EF461BF25B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5486B61047
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 21:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5486B61047
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TUY9uNSZwpSs for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 21:22:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD1CB6101E
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD1CB6101E
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 21:22:31 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.95.233])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b7AroDtKSlHojb7AsoGDBB; Wed, 21 Sep 2022 23:22:30 +0200
Message-ID: <e4cef475-0247-1bd7-c5fa-9ec366fd79bf@benettiengineering.com>
Date: Wed, 21 Sep 2022 23:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Christian Stewart <christian@paral.in>
References: <20220921205815.1082192-1-giulio.benetti@benettiengineering.com>
 <20220921205815.1082192-2-giulio.benetti@benettiengineering.com>
 <CA+h8R2oJOq0RcPnX+0W-HC6omsF9JivDAAiCVdTarwWZFpfMpQ@mail.gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CA+h8R2oJOq0RcPnX+0W-HC6omsF9JivDAAiCVdTarwWZFpfMpQ@mail.gmail.com>
X-CMAE-Envelope: MS4xfJjdzrGse7NXSziF1WMgs2GQ70sWmV3jbh2mVzsjByA7NY/c7Q1II0m6qzWVUxpTznDy0iuJjUScFPua7UPYPDx63R9jC0z73mg91HJkgsrRh6G0z3KF
 KdM6753yTuR3QrYu2pdsm8IDEHbj4WceP3P6N1r+2lELJCk2V4cHUHgHZl0TGb1qRTVYofECNapVHl2/j3kDv1/FHnc7HK7D09f1KDULXZHWa4t85dgnqyMl
 TXKaABkiRP9zSlq0qkeNKg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663795350; bh=dcV0eQMQst78NO4YM1eT/oUhNN2RVNbQoY6ANZjvmgs=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Q1tKApJV3EdbRfQad9ndmOZtvcoSdu5oJMULKav4bqEnQN66LhQ1ylVp5R3ZipJqC
 8DPulLaNEuZr5Mymme71rsCKUVroNL2QL1dzO2g+cd5lPW/Nkj3f9UJo02UMxCIbrY
 2VgLWuh8T7SczXw5UUse35zegBdXR/UmUmaLhfGxcEGXZHlEHdhvMvI/f8VTabrhtX
 l7Ex3LRrwR8lM5bWSyM3CbKs8XVT+H51177BxNsCIc9X01ugmPgioxjJlQgndp/jUr
 f1HOpqzM4B8iR8AtuEf5T+zP5vFrxM8V5wB3pgy71u0wVfUhljjTxDhCwiI3ShT8y9
 /Cgm6KfOfatBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Q1tKApJV
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8821au: move upstream and
 fix missing linux options
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Christian,

On 21/09/22 23:04, Christian Stewart wrote:
> Hi all,
> 
> On Wed, Sep 21, 2022, 1:58 PM Giulio Benetti 
> <giulio.benetti@benettiengineering.com 
> <mailto:giulio.benetti@benettiengineering.com>> wrote:
> 
>     This package builds to fail with Linux > 5.15 and abperiasamy's
>     rtl8812AU_8821AU_linux repository is not maintained since 2 years and
>     there is not a fork where all pending patches have been upstreamed, so
>     let's switch to lwfinger's rtl8812au repository that is well maintained
>     with Linux up to version 5.18 supported. While switching let's drop all
>     local patches. Also add me as maintainer for this package in DEVELOPERS
>     file.
> 
> 
> We have been using this fork in SkiffOS for over a year now, works fine.

Perfect!

> https://github.com/skiffos/buildroot/commit/1ace9158ec1000099b2f474cc01ffb019ac046fb <https://github.com/skiffos/buildroot/commit/1ace9158ec1000099b2f474cc01ffb019ac046fb>

Oh, you had the patch ready too :-/

> Reviewed-by: Christian Stewart<christian@paral.in 
> <mailto:christian@paral.in>>
> 

Thank you!

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
