Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4B1C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 19:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24EAE81413;
	Fri, 13 May 2022 19:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QsnQ2EoVyLNR; Fri, 13 May 2022 19:42:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D76581388;
	Fri, 13 May 2022 19:42:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A84AF1BF5B4
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 19:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92FC560EE1
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 19:42:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RtzGBKYHrx1A for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 19:42:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6141A60EE0
 for <buildroot@buildroot.org>; Fri, 13 May 2022 19:42:03 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id k27so11122753edk.4
 for <buildroot@buildroot.org>; Fri, 13 May 2022 12:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=60X2vw1guFvbTC6UYhpa+wpp8yc7j1Dhwx5FTYXGvWM=;
 b=Ibrl7+tpR2u1tY8Ur17lKMStqOHZhHEZMi3OtO5Ob4ETQLdlFNWT8Ba2jXr5y25hhh
 EwSX7gICIaJ1mbzfc1cVgg3DX2b3v03MIbNwjFtm0QHasyEmG69satsD0GkUQuU2XDrw
 dKG8DmQ8+0s2vElrTSgv9jT5STlCfF7DoQVlZ9P6mezSa/ltVQzPzgu9QmmVYrXXpFMh
 lt7AUDkx0Dr1MG5if9c//nCrMYQawl4bYb1jWUB8+5xQp7+GncyD4olxC+K1yNrUn2GY
 GJ/Nv6WNJ6/JTPnVjxCb11WbEoLrEcZjLvZpoDRaBAys3tTg7MeFVWd+2UYumLabjS8g
 APkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=60X2vw1guFvbTC6UYhpa+wpp8yc7j1Dhwx5FTYXGvWM=;
 b=Xn1OdMuEIAUV4+Z/s7RIAbh0cFaPgqxxklF/BFKxkG1ThsxOkgUfwqHaXfQ4or+1mz
 5ZElNVjE6Z4EUDvpcrBe9+pBB24PCRRHemCs8H7Cni/LY1SuVDWi6yGWK+JgvuMwTWsn
 +TxFXtk+cNzQRb3SU3gNKOVmMhCum9OFUzKC0SOj6PDrc80QuZkacRc7Y4lgErbmCVF4
 Gv6wNnHGrJK06gaymJXwadyGlOIrwT34oRxVcZALX7acdGrYd5VJ98OStrVXZlqbty27
 WWWzDaFKDdKxRg8ndNGspGpCp/5hpmMhqTsfpEe1i7X87Qh/1K5dhO3b5EXL2qTjJ5Bl
 Pwqg==
X-Gm-Message-State: AOAM533E4XaWZPLZGb3c7aL2GPZitZqmgGfJDTsJ+t2J3GShcsiqT3an
 yPPw74xqcVCRJgZhssB2cZ6GYw==
X-Google-Smtp-Source: ABdhPJyHDxa9A1FKNmqeCWGZcc/TR3963LS1/nifHmsYWKMRu4mYO2QVYglnQKSOuI4v0CuT85KeXA==
X-Received: by 2002:a50:8a99:0:b0:42a:42d2:e7fd with SMTP id
 j25-20020a508a99000000b0042a42d2e7fdmr286931edj.154.1652470921475; 
 Fri, 13 May 2022 12:42:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 er9-20020a170907738900b006f3ef214e25sm1051782ejc.139.2022.05.13.12.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 12:42:00 -0700 (PDT)
Message-ID: <d31498c0-ae87-12ed-eae6-6efbd37bcca2@mind.be>
Date: Fri, 13 May 2022 21:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>
References: <11033_1652186063_627A5BCF_11033_340_1_f3b8c61ce2f116c06c455a1f0163db9ca541896a.1652186060.git.yann.morin@orange.com>
 <878rr6ahop.fsf@dell.be.48ers.dk>
 <d7ce3402-a37a-ca9b-52c5-1f85eeb79a7d@mind.be>
 <87wneq7yqf.fsf@dell.be.48ers.dk>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <87wneq7yqf.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH] fs/oci: entrypoint and command are
 space-separated lists
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
Cc: yann.morin@orange.com, Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/05/2022 08:06, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
[snip]
>   >  That way, the usual cases (which Yann put in the commit message) are
>   >  covered, but weird stuff is still possible as long as you pay
>   > attention to spaces.
> 
>   >  If you really need spaces, you can still use $(space). So, after
>   >  adding single quotes, the following should work:
> 
>   > BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="date;$(space)date"
> 
> Nice and easy for newcomers :P

  Sure, but do you have an actual use case where you want spaces in the CMD or 
ENTRYPOINT? Note that even in the Dockerfile itself you need to switch to JSON 
syntax to support that case. I think it's exceedingly rare.

  If you really have such complicated cases, you're probably better off doing it 
with a post-image script that imports the tarball after all. But the simple case 
that covers 95% of the use cases can be covered by fs/oci.

>   >> In general I'm not sure how much value the oci support brings over just
>   >> doing:
>   >> docker import -c '<Dockerfile command>' output/images/rootfs.tar
>   >> <name>:<tag>
> 
>   >  That requires a docker daemon installed on the host, while
>   >  sloci-image can be run as normal user without any host support
>   > required.
> 
> s/docker import/podman import/.

  So it requires a podman daemon installed on the host... podman can do rootless 
containers, but it's still mediated by the daemon.

> With that said, wanting to build an OCI
> image and not having access docker/podman is quite unlikely I think.

  As explained on IRC: it is very likely that your CI does builds in a docker 
container. You normally *don't* do it in a DinD or socket-mounted container. So 
CI normally doesn't have access to docker.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
