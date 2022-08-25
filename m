Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1E0ECAAA3
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 21:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B11BA40C97;
	Thu, 25 Aug 2022 21:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B11BA40C97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UChAMz3bUxF5; Thu, 25 Aug 2022 21:57:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E53B40235;
	Thu, 25 Aug 2022 21:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E53B40235
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4209A1BF2B3
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 21:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C08660ABE
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 21:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C08660ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pCbxLSZ77AV5 for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 21:57:43 +0000 (UTC)
X-Greylist: delayed 04:34:16 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88BE760AB8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88BE760AB8
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 21:57:43 +0000 (UTC)
Received: from [IPV6:2a01:cb08:8f65:d300:4b96:ac4c:4229:8341] (unknown
 [IPv6:2a01:cb08:8f65:d300:4b96:ac4c:4229:8341])
 (Authenticated sender: thierry.guibert@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 79FD82003CA;
 Thu, 25 Aug 2022 23:57:38 +0200 (CEST)
Message-ID: <41228aba-342e-3f48-4ae0-d65386ce10da@free.fr>
Date: Thu, 25 Aug 2022 23:57:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <38884503-637d-7c23-5a02-be8f8c3a522a@free.fr>
 <20220823164040.GH2167049@scaer>
 <f882f86c-31f2-55b4-e3f4-9a64e93bd0e9@theobroma-systems.com>
 <CA+h8R2p0u-FerHf0y=QtQWo9s9HLBD0MxyCXGLmcCagD1Om4Xg@mail.gmail.com>
 <c9a96eae-198c-7901-515e-74458c3fd8c9@free.fr> <20220825180142.GA37358@scaer>
From: Thierry GUIBERT <thierry.guibert@free.fr>
In-Reply-To: <20220825180142.GA37358@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661464661;
 bh=X+HYt0+c2nC6fxtSxnx1RBg41gCIl48+BqBbJ0KQguw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vXGo87/9qmhTD1EJ43FHHrBRLehT86Zqn74ifnb0rc3Ky2gO5r4nxoLB0SpYAsMcG
 P8I0fPIWzcOsgf2xcj8rpIKbA/QQtkotEEZEucobtcClauXoxvYsR/7Is32i8j7oSG
 grU65b0WBjnLOGm5ow+iJ/zsX48rb+3NmFQwR0J8smcd/oXFp+wzlDXV61NIybU9Om
 8NhAG6NfUfw5v2pbwftXyciTQoKmWstuVeuuWPnCLYDQuDHBsR5ofDHh98YYep+rps
 QOpH6N4c0/eCrHDz8BjjW+4NHsskSetHXw3ozVVcnlI0yXe8LCVo0vJ0akOwqpZHeX
 STk8I4LpnUFvw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vXGo87/9
Subject: Re: [Buildroot] Docker container for 2022.02.x release
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since I could feel Yann tapping on my shoulder while telling "

Extended documentation is most welcome, though! :-)

" , there is a patch following this email ;)



On 25/08/2022 20:01, Yann E. MORIN wrote:
> Thierry, All,
>
> On 2022-08-25 19:23 +0200, Thierry GUIBERT spake thusly:
>> I think the actual situation is the good one, except that external
>> users can't pull images from the gitlab registry
> Well, it is certainly possible to pull images from the gitlab.Com
> registry:
>
>      $ docker image pull registry.gitlab.com/buildroot.org/buildroot/base:20220206.1756
>      20220206.1756: Pulling from buildroot.org/buildroot/base
>      955615a668ce: Pull complete
>      7d738676681f: Pull complete
>      447a312e02d3: Pull complete
>      7837e3ad09a2: Pull complete
>      efe9d49088e8: Pull complete
>      5d2098b1b57e: Pull complete
>      Digest: sha256:7d49ba734fbf15e153a8a66c95ae4aeafc7a398353a256f5513e9c6db5e97554
>      Status: Downloaded newer image for registry.gitlab.com/buildroot.org/buildroot/base:20220206.1756
>      registry.gitlab.com/buildroot.org/buildroot/base:20220206.1756
>
> And as far as I can see, there is even no need to be logged in...
>
>> But knowing that those containers are for development only, I have
>> built my own for production firmware construction.
> The image used for the Buildroot CI is I belive a very good basis for
> building one's own image; that's what I do at $work, where my reference
> build environment are docker iamges which Dockerfiles all begin with:
>      FROM registry.gitlab.com/buildroot.org/buildroot/base:20220206.1756
>
>> The question could be "what do we do with already published images"
>> (especially the one tagged as "latest")
> Sicne the gitlab docker registry is publicly available, it would be my
> opinion that we drop the iamges on the docker hub. Indeed, docker hub is
> rate-limited on the free tier, so unless one has a paid tier, one can't
> rely on images hosted in the docker hub.
>
>> It may be described in the documentation, and maybe it already is.
> I don't think it is in our manual, except the use of the
> utils/docker-run script certainly is hinted about (chapter 17, Adding
> support for a particular board).
>
> Extended documentation is most welcome, though! :-)
>
> Regards,
> Yann E. MORIN.
>
>> Regards
>>
>> On 25/08/2022 18:25, Christian Stewart wrote:
>>
>>    I recommend using [1]quay.io instead to avoid the rate limit.
>>    Best,
>>    Christian Stewart
>>    On Wed, Aug 24, 2022, 9:20 AM Quentin Schulz < [2]quentin.schulz@theobroma-systems.com> wrote:
>>
>>      Hi Yann,
>>
>>      On 8/23/22 18:40, Yann E. MORIN wrote:
>>      > Thierry, All,
>>      >
>>      > On 2022-08-23 15:13 +0200, Thierry GUIBERT spake thusly:
>>      >> I'm using buildroot to build raspberry pi rootfs for the french red cross.
>>      >
>>      > A noble endeavour, thank you!
>>      >
>>      >> Is there any reason for buildroot/base:20220206.1756 not to be published in
>>      >> the docker hub ?
>>      >
>>      > The rationale behind our docker image, is to be able to run our own CI
>>      > jobs, that runs in gitlab-CI. Since Docker hub now limits the number of
>>      > downloads permonth per image (on fre etier), the CI was very often
>>
>>      Could Buildroot fit the Docker Open Source Program criteria by any
>>      chance? [3]https://www.docker.com/community/open-source/application/
>>
>>      That would remove those limitations.
>>
>>      If that is not possible or not wanted by the project, I guess that
>>      pushing to [4]hub.docker.com but have the Overview page state that this is
>>      pull-limited and recommend using the gitlab registry instead?
>>      [5]https://hub.docker.com/r/buildroot/base
>>
>>      Cheers,
>>      Quentin
>>      _______________________________________________
>>      buildroot mailing list
>>      [6]buildroot@buildroot.org
>>      [7]https://lists.buildroot.org/mailman/listinfo/buildroot
>>
>> Links:
>> 1. http://quay.io/
>> 2. mailto:quentin.schulz@theobroma-systems.com/
>> 3. https://www.docker.com/community/open-source/application/
>> 4. http://hub.docker.com/
>> 5. https://hub.docker.com/r/buildroot/base
>> 6. mailto:buildroot@buildroot.org/
>> 7. https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
