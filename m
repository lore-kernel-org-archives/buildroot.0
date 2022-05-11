Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E457C433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 17:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABF4B60C0F;
	Wed, 11 May 2022 17:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7HJ2Iv-M_iC7; Wed, 11 May 2022 17:06:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B374760BEA;
	Wed, 11 May 2022 17:06:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 902C21BF402
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 17:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EBDB60BEA
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 17:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoUC6-sojO9e for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 17:06:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43CC660BD6
 for <buildroot@buildroot.org>; Wed, 11 May 2022 17:06:43 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id i19so5301980eja.11
 for <buildroot@buildroot.org>; Wed, 11 May 2022 10:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tsxXsTD4Ccb+zgbNVbDsTbUuxnzoZDiuSv+p1m9yH/w=;
 b=Cc+bq0sGL35365+yX/4YNvlmKvgRh51GFe6/rl7SV7ddlNVnNOHAs26ibsSbOnKJrA
 u/KBGWNMnFNZRrKA8xXrEY+wuGJA2Fy2gC9TGdvhXn4UU2+R4eFIgwA40bmmCFTXFKzt
 RNYBUL5y/QPG9dUGGCMEvmiqRVZCXlFlN1QCk6KrzDM2FNj0Rq/oG3JNPcZItW78Vv2Z
 stwZAhUWiBiwW6bmSURIgzu/oWQXXDmyOGTbk1CnxUg9MjBQZFBrjXl9509jRg9+fd5H
 h2veeOnqFG0EMbflEuO+cKpdnYG5AKkEg38rCwRKpBcWmLoVYIbB9fV0DJHP5NUZbWnN
 IVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tsxXsTD4Ccb+zgbNVbDsTbUuxnzoZDiuSv+p1m9yH/w=;
 b=xtYJhynbzi6XQswL2/+9Yn1AbZccxHfMiNw9z/PieMlGxJgwWXCkMBa+F6Zbzh3WS2
 UoIXc17k8S0DdpRh58DlFLcHriaxOMZXCtsP0QMrdPBBtRvHqOfEzpBHAU01aezZbL65
 1/VR0PAsmbRMKa+Oyt6pDfNpKgLNRdcHxWZC1kTu1xPlfwndQtNktXKPgSm0kS2Q0ycP
 7TerD4djHIJ8/EwLuYAISeu9tRYV80nVIxWdvkYL2VELcReQz5kNobawYUuIu+2QXGQ1
 11xs1P/gNOsDPD2VTE3uQsQjhaO22/OIBQDxcidlPkT4sc1DborYgvLSPFjMjMn3aje1
 V/sg==
X-Gm-Message-State: AOAM533M+PB0d6CmpL+PmCGOKpbFz9MgobMYJDF6i4mQoV/Gflg7sPE3
 adWKs7PByli0W8MOmYGW9A6oQw==
X-Google-Smtp-Source: ABdhPJxy7QbeV/G26bXHTHYFne46qFGihPNZAtjTRDnkZ3Ccht+tyDqwRwL2LB070O7CUYEjYlYw6g==
X-Received: by 2002:a17:907:6e8b:b0:6fa:82f5:14bd with SMTP id
 sh11-20020a1709076e8b00b006fa82f514bdmr13973940ejc.182.1652288801430; 
 Wed, 11 May 2022 10:06:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z24-20020aa7c658000000b0042617ba63c7sm1409110edr.81.2022.05.11.10.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 10:06:40 -0700 (PDT)
Message-ID: <a9747d23-3cab-1e88-6fac-f91d8e5c5057@mind.be>
Date: Wed, 11 May 2022 19:06:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Tim Harvey <tharvey@gateworks.com>, Baruch Siach <baruch@tkos.co.il>
References: <CAJ+vNU2OM0n2gFGy4K04NjXSQWDeAd434zyVD2vSLXvk4Y6d-Q@mail.gmail.com>
 <878rrfibvx.fsf@tarshish>
 <CAJ+vNU3KHR+J0y9o3CVOC+1zA6G3=kQG2G_bQ2PSegFho8c9BA@mail.gmail.com>
 <8735hl9kdt.fsf@tarshish>
 <CAJ+vNU3an938LM3HPnsAuNjNVnC9VfDcy4s-rvVxsTGRpqe=qQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAJ+vNU3an938LM3HPnsAuNjNVnC9VfDcy4s-rvVxsTGRpqe=qQ@mail.gmail.com>
Subject: Re: [Buildroot] how to get buildroot to update a git repo that has
 changes? (ie building HEAD vs a specific SHA)
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/05/2022 17:28, Tim Harvey wrote:
> On Sat, May 7, 2022 at 1:07 PM Baruch Siach <baruch@tkos.co.il> wrote:
>>
>> Hi Tim,
>>
>> On Fri, May 06 2022, Tim Harvey wrote:
>>> On Thu, May 5, 2022 at 8:21 PM Baruch Siach <baruch@tkos.co.il> wrote:
>>>> On Thu, May 05 2022, Tim Harvey wrote:
>>>>> Greetings,
>>>>>
>>>>> I use buildroot to build a Linux kernel+ramdisk using:
>>>>> BR2_LINUX_KERNEL_CUSTOM_GIT=y
>>>>> BR2_LINUX_KERNEL_CUSTOM_REPO_URL=<gitrepo>
>>>>> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=<gitbranch>
>>>>>
>>>>> When the upstream branch changes I would like to build that kernel but
>>>>> I find that buildroot caches the repo in dl/linux/.git and doesn't
>>>>> seem to know how to check to see if there are new commits.
>>>>>
>>>>> I realize that this is atypical as typically you want to configure
>>>>> buildroot for a specific package gitsha/tag.
>>>>>
>>>>> How would I go about getting buildroot to update the repo? I don't
>>>>> particularly want to rm dl/linux I want to instead somehow check to
>>>>> see if the repo needs a refresh then refresh it without a massive
>>>>> network download.
>>>>
>>>> Using a branch name for _VERSION is not supported. See the rationale in
>>>> the manual section 18.6.2, note on LIBFOO_VERSION description.
>>>>
>>>>    https://buildroot.org/downloads/manual/manual.html
>>>>
>>>> You might want to consider using OVERRIDE_SRCDIR to make Buildroot build
>>>> your local kernel source tree. See section 8.14.6 in the manual.
>>>
>>> Thanks for the references. I do understand that it is not supported. I
>>> guess I was looking for a few simple lines of shell that would tell me
>>> if the cached repo was out of date so that I could remove it.
>>> # get branch from BR2 config
>>> KERNEL_BRANCH=$(grep BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION .config |
>>> cut -d= -f2 | tr -d \")
>>> # get the HEAD commit from the BR2 cache
>>> KERNEL_HEAD=$(git -C dl/linux/git/ rev-parse $KERNEL_BRANCH)
>>> ^^^ but I'm not sure how to check to see what the latest revision is
>>> on the remote branch?
>>
>> Check 'git ls-remote'.
> 
> Thanks - thats what I needed.
> 
> I was able to add this to my auto-builder:
> KERNEL_BRANCH=$(grep BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION .config |
> cut -d= -f2 | tr -d \")
> KERNEL_HEAD=$(git -C dl/linux/git/ rev-parse $KERNEL_BRANCH)
> REMOTE_HEAD=$(git -C dl/linux/git/ ls-remote --heads | grep
> $KERNEL_BRANCH | cut -f1)
> [ "$KERNEL_HEAD" == "$REMOTE_HEAD" ] || {
>     echo removing kernel cache
>     rm -rf dl/linux # otherwise won't get kernel bumps

  You don't actually need to remove the git repository, it's enough to remove 
the tarball. At least, I think it is. So:

	rm -f dl/linux/linux-*-br1.tar.gz

(the -br1 indicates that it's a tarball created from git).
That's going to save you some download time.

  Regards,
  Arnout

> }
> 
> Best Regards,
> 
> Tim
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
