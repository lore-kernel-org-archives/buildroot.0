Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C03C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 20:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1820C605A9;
	Tue,  1 Feb 2022 20:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgPxV1xGVEVN; Tue,  1 Feb 2022 20:42:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 224C860B08;
	Tue,  1 Feb 2022 20:42:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 161471BF4E2
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 20:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11D06415A2
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 20:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FoXd3AIyoYlL for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 20:42:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26D534159D
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 20:42:20 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id k25so57549853ejp.5
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 12:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=43m32BD4H3/8jNLXDB/EpDY4XqSSs2l3WB9L1KQxP0s=;
 b=U0m/HC78Am/E+Z6sHHZHQJ34c4KQttXYp+0M+3mNE0eErfw3Bvvv5KIQNfd0FPsJj4
 z4PYexfim4LY7AaQRHwdXaigWRJixoYnZoJ8OLS0s1WbmtbyHONiieo/oewK/dXsDZ1e
 if/Kybk3v5ji3lNigMU/4NlW5ixKgd4sJHC2CjnEonPFwGsPeWDEtC5JbX4G3p1SEpDW
 XKLUw1IktwguEObYVJeROdJOQZGTZML1Xi5w8KMux4QqycXXT7RIZ+FmCK+tvOt8u0eo
 Cgyg9XK5FNLOzLfnfOpaFUEDOJjs8EdH3R9qcOB9ICjfD+hY2yc5t/9GIgfIjF/dlcN4
 tq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=43m32BD4H3/8jNLXDB/EpDY4XqSSs2l3WB9L1KQxP0s=;
 b=wkYD3SzmpiTSJ99Lk25Wwfc5A0qfN3C9SO4L4hb02MdUY8vcaJrZVQS8I4h1/9YoZ1
 0hqrM7X0FWpt2q9PkAWhdBymT/1eK+/it9nkFzvwZE0TVKu64KLxtUdU9zfezS2uX66p
 rSNRqpXFIWDjVzojiU0KtQYWF9S+pvTbfZNP32kN3BEt/jUAhKzEtOBFKDXzbxE3hO7G
 nBsppz0bOdkmyXgp2r2+CDP/gIkp89Q/mFmOm7Z0ycTlaaTbtIEux0MwTqJrMzgIrnMZ
 rdkaOpl3xjmebfKfjxEewBlH/WeSvTi5u3JKO/9+iKpimwuc3gb8oCwd5YovE5hGO9O5
 x7Iw==
X-Gm-Message-State: AOAM531Iejji7d9e1uR9IM0PNPJPDZYpYY2RHOmOeKmFIUT03/Ga2OlK
 f/I//4GV//aw5oVZ32ypf9jM4Q==
X-Google-Smtp-Source: ABdhPJyL/dBWJehM/E+X7HkDUjz3M5iFhaO1Ik1UcvOKjjuWf2B0deVKjyFOJqGGAdTRuZUB+zM1mQ==
X-Received: by 2002:a17:906:974c:: with SMTP id
 o12mr13963155ejy.340.1643748139099; 
 Tue, 01 Feb 2022 12:42:19 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z10sm20339738edl.54.2022.02.01.12.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 12:42:18 -0800 (PST)
Message-ID: <46ea7193-ea68-c8b6-9b43-d5b17bb8144f@mind.be>
Date: Tue, 1 Feb 2022 21:42:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: yann.morin@orange.com, Alexey Brodkin <Alexey.Brodkin@synopsys.com>
References: <12945_1643724020_61F93CE8_12945_430_1_dfe1b340bf9e8e2c47987f28f8fd40cca7d16b3b.1643724006.git.yann.morin@orange.com>
 <MWHPR1201MB0239B756E843D8604AD86625A1269@MWHPR1201MB0239.namprd12.prod.outlook.com>
 <22491_1643728190_61F94D3E_22491_62_1_20220201150948.GB3216@tl-lnx-nyma7486>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <22491_1643728190_61F94D3E_22491_62_1_20220201150948.GB3216@tl-lnx-nyma7486>
Subject: Re: [Buildroot] [PATCH] package/glibc: allow runing on kernel older
 than used for the headers
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
Cc: Frederic GARDES <frederic.gardes@orange.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/02/2022 16:09, yann.morin@orange.com wrote:
> Alexey, All,
> 
> On 2022-02-01 14:23 +0000, Alexey Brodkin spake thusly:
> [--SNIP--]
>>> +config BR2_PACKAGE_GLIBC_KERNEL_COMPAT
>>> +       string "Oldest kernel version supported"
>>> +       help
>>> +         If you plan on running on various kernel versions, enter the
>>> +         oldest version you expect to run on here.
>>> +
>>> +         Note that the older the version, the more backward compatibility
>>> +         code is added, and the slower the code may get.
>>> +
>>> +         Leave it empty (the default) to use the same version as used for
>>> +         the kernel headers.
>> I'd say there's the third option and frankly I like this one the most - default
>> oldest version assumed by the glibc itself. The beauty of it is it's really the
>> oldest version of the kernel which is supported by a given glibc version for
>> a particular architecture.
> 
> I also considered that, but I believe that a user should explicitly
> request the oldest kernel they want to support (yes, they'd have to do
> their homework to see what that version can be for their architecture).

  I'm doubting if the added value of this is sufficient to warrant the complexity.

  I could be swayed if it would give a build-time error if we know that it's not 
going to run on such an old kernel. But as mentioned below, there's just a warning.

  In addition, if you build a userspace with recent headers, this is going to 
allow packages that depend on TOOLCHAIN_HEADERS_AT_LEAST_... Which may cause 
runtime failures when running those packages on an older kernel. So the whole 
concept of allowing older kernels is already a bit shaky.


  So I think that a simple boolean config (still called 
BR2_PACKAGE_GLIBC_KERNEL_COMPAT) would be sufficient. Doesn't solve the 
TOOLCHAIN_HEADERS_AT_LEAST problem, but at least init will be running (well, 
except if it's systemd and you try to run on 3.4...)


  For context, this is the commit that originally introduced --enable-kernel:

commit fd5bcd0eda8fb21f639c34a09b212e6f9b066a04
Author: Sam bobroff <sam.bobroff@au1.ibm.com>
Date:   Thu Jan 28 04:51:23 2016

     package/glibc: set --enable-kernel to match kernel

     Glibc is currently configured without any "--enable-kernel" option.
     This causes it to use the oldest possible kernel API, slowing it down
     and preventing it from using any kernel features from later versions.

     Since we are likely building a kernel and matching glibc together,
     backwards compatability is probably unnecessary so this patch
     unconditionally configures glibc with --enable-kernel set to
     BR2_TOOLCHAIN_HEADERS_AT_LEAST.


  It's true that the slowdown will probably be smaller if you only have a 
partial fallback, but is that really going to be significant? You can convince 
me with numbers :-)


  Regards,
  Arnout



> Letting the system decide on itself is prone to providing some
> surprises... However, letting the user provide an explicit version is
> also prone to surprises, because if that version is too old, glibc
> resets it to the oldest it actually supports, and just merely emits a
> warning message, which does not prevent the build to succeed (it still
> fails at runtime in the usual way then)...
> 
> So, in either case, meh...
> 
> So, we'd have to differentiate between the three cases:
>    - use same as headers (should be the default to keep current
>      behaviour)
>    - use oldest supported by glibc
>    - use explcitly specified version
> 
> So, two options there:
> 
>    - recognise a magical value in BR2_PACKAGE_GLIBC_KERNEL_COMPAT, like
>      'oldest' (bikeshed, go) to mean the oldest glibc can support, empty
>      to mean "same as headers", or an actual value.
> 
>    - add a boolean "Specify oldest kernel supported", and hide
>      BR2_PACKAGE_GLIBC_KERNEL_COMPAT behind that boolean; then if the
>      boolean is not set, use same as headers (as today); if it is set,
>      then use BR2_PACKAGE_GLIBC_KERNEL_COMPAT is set, or let glibc decide
>      if not set.
> 
> Thoughts?
> 
> Needless to say, I don't have much sympathy for the first option,
> magical values are bad... But I am not too fond of the second option
> either, but I can't see a better way to provide for the three different
> cases...
> 
>> [1] https://sourceware.org/git/?p=glibc.git;a=blob;f=configure;h=8e5bee775a651fcbaaa96ede8039ae1f049e296e;hb=HEAD#l3529
>> [2] https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/configure.ac;h=197b7e66c8fe6eb0a1136c992478b9a2272713e7;hb=HEAD#l30
> 
> Yeah, I already had a look at those for various archs.
> 
> Thanks!
> 
> Regards,
> Yann E. MORIN.
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
