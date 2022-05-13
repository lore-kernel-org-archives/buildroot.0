Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222CBC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B331F403A4;
	Fri, 13 May 2022 22:11:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5utG7fYs3HH; Fri, 13 May 2022 22:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C674C40207;
	Fri, 13 May 2022 22:11:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 775101BF868
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6680E40980
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZeU0HWGKuHSC for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3565F41487
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:12 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id n10so18694170ejk.5
 for <buildroot@buildroot.org>; Fri, 13 May 2022 15:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ENTsYJssLB0hSwoJfBDVJzddAIlQL2C3ik91H9eiOTo=;
 b=D6rjIupQ2UjBJd6HuH0NQ7npo/AeoeygyM6kfEAakGpyTPRbtAZs1HowO8eUhhEkO6
 ScOyyikwbxPyVgNOlyTpGYeGgpsCqbqc1mZyPZ29FMHxiSjn8i8pgRRdNejwgg1sKyc8
 8Ops6A7B62j0gogphn/BMhOEKLfGOBZxl2auacp52b7Saw+X3FaXSgxiNWsvl43C6ipn
 1z+5M3cXKyoQOW3YHYo+oX7h183Xm3cdKdHSJcpR367reG3JCBS5AUF6doiA1tuxGAUq
 RqaENXuzWWsDL5sfsTc/IFmGVTy8bsSLpC0hGs7grEFfo99dTexxoB5FPPmraNj5AeVO
 WHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ENTsYJssLB0hSwoJfBDVJzddAIlQL2C3ik91H9eiOTo=;
 b=Ifa0M8Na3R+79Rmfdwj40GqDi7cZORMwzdnFQVkRiz/FiuIYCB1iru1YqWBUX0TMKm
 SBWjUPg6iiwc6pMaRMNZMVeyi0TtIq/4cogtHpxviH5Kcz5/O6+IeDo5mkiTxdvlipZ/
 YtM7rwaTPheap14UCuMvFehhPmR8Bju84HkzzObC6WmkJ+DCLxipwKaLOBKZtzOFuBLl
 Tlvby8c7dDBDKNc5sNrJ/+rL3tTLBq/RJqkouHoS93Cd4ChG0eOjS0HkEE2nR1rhDH2V
 YVUtPFZ0DdIm9VnhXqL9jI5C95miTAMBYoOiKdFqSkbeBINFWNFJCaIKCcQWS5O/OpKM
 Vs4Q==
X-Gm-Message-State: AOAM531RqpR5IJ+bLvnxSyc6SPYqVK+lRIsK/qWwHoSkQ8uX6gWGN1IR
 uNFWRmcH04Ee/AAvw+EwGwP4w6/U7sV3HQ==
X-Google-Smtp-Source: ABdhPJyf7UNDvKxoynzJlqf1Fmm67pgbBlptd2mCy3yWYfd+j6qFmpv2JL+KcmlAyQ3Un6ARiVluHA==
X-Received: by 2002:a17:906:6a0b:b0:6f4:d4d7:7c83 with SMTP id
 qw11-20020a1709066a0b00b006f4d4d77c83mr6087117ejc.667.1652479871796; 
 Fri, 13 May 2022 15:11:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 rb48-20020a170907693000b006f3ef214e59sm1113462ejc.191.2022.05.13.15.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 15:11:11 -0700 (PDT)
Message-ID: <c7474a00-bdb0-b0b5-c46f-50769ccb4f92@mind.be>
Date: Sat, 14 May 2022 00:09:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220508213724.1402946-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220508213724.1402946-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rust: add host-pkgconf
 dependency
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/05/2022 23:37, Fabrice Fontaine wrote:
> Add host-pkgconf dependency to fix the following build failure raised
> since commit 4e3be3ae9d4c9f1b0c035eee0c923a724f9a9316:
> 
>    run pkg_config fail: "Failed to run `\"/nvmedata/autobuild/instance-6/output-1/per-package/host-rust/host/bin/pkg-config\" \"--libs\" \"--cflags\" \"openssl\"`: No such file or directory (os error 2)"
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/b046523960079cbf85931b8f67c3b98dd07fbbda
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/rust/rust.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 6ac75f39c4..445fde70a4 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -14,6 +14,7 @@ HOST_RUST_PROVIDES = host-rustc
>   
>   HOST_RUST_DEPENDENCIES = \
>   	toolchain \
> +	host-pkgconf \
>   	host-python3 \
>   	host-rust-bin \
>   	host-openssl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
