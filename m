Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A383EB64DD
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 05:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA067408F7;
	Wed,  5 Jul 2023 05:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA067408F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iSNZ8jhGfujY; Wed,  5 Jul 2023 05:50:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6B22408F2;
	Wed,  5 Jul 2023 05:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6B22408F2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 027B21BF5A5
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 05:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF9694023F
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 05:50:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF9694023F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id li91nQU-EUDB for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 05:50:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60B91400D9
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60B91400D9
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 05:50:00 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3142a9ffa89so5477088f8f.0
 for <buildroot@buildroot.org>; Tue, 04 Jul 2023 22:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688536198; x=1691128198;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fKrCGxtt/sYeCr7ZGjTRBbXe0v210RBWp4i1nzyPETM=;
 b=C9EwLqpe/9Z1FLOJDk8O7wFWDd5lss+w6LRvB1wKq+rU6YMcTj5Ddh1jicgDfsQpL1
 g1V8WXP8uD4Ezcjld8RvjwQTluUv78t8Sbw5e/uYJVntlO6iZ+0mh+3k1NUILSWkami1
 F5aC71cEMxue11eYaPhdPQWQjHEE2WbNZU+WM7zxoEz2ONReSELMqah0dXVrQy6NTMgD
 Kgsi5l9fzC2inI8oMIoOnv+mQ0m9CuIuSRZDAd7PonpbDrgaaF0XMnpeAo7g3QQ5DUwI
 foFE99SlDuXBERYeMSTCe820QjBQ6ddxhoRkBaQE9qHdlZ326lvE2xV5UiD/Q0OgvSYn
 NWeQ==
X-Gm-Message-State: ABy/qLagcDKv18JCvT0CNLvH81ss8IlwVb9O5qIWA89fBd6BJ7/LwKd+
 Ha/tJmp15ZHbHwF9noEIUF00TUIZOu4=
X-Google-Smtp-Source: APBJJlHLHbRLb5p3PjOVx7ooVYnlfErwodlMWKSxGQ0yEzY3K9cD+l/I8Y7TSscl/E4GLK5ENvTacA==
X-Received: by 2002:adf:e4d0:0:b0:314:1025:96fd with SMTP id
 v16-20020adfe4d0000000b00314102596fdmr14075028wrm.47.1688536198155; 
 Tue, 04 Jul 2023 22:49:58 -0700 (PDT)
Received: from [10.0.0.120] (static-90-255-244-241.vodafonexdsl.co.uk.
 [90.255.244.241]) by smtp.gmail.com with ESMTPSA id
 cs7-20020a056000088700b0030ada01ca78sm30012517wrb.10.2023.07.04.22.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 22:49:57 -0700 (PDT)
Message-ID: <a9024743-7872-2837-3e0a-ba5ae1b2f760@gmail.com>
Date: Wed, 5 Jul 2023 06:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 buildroot@buildroot.org
References: <be0548f0-8762-0e55-6441-02897a7b22df@gmail.com>
 <0bc3ae44-0a96-4a72-ee9a-8620cb474c3d@yoseli.org>
From: Nick Betteridge <lists.nick.betteridge@gmail.com>
In-Reply-To: <0bc3ae44-0a96-4a72-ee9a-8620cb474c3d@yoseli.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688536198; x=1691128198;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fKrCGxtt/sYeCr7ZGjTRBbXe0v210RBWp4i1nzyPETM=;
 b=O4c2BZOU6kSSCV28ZQZwcZBjvZUg1YUT98R1rxwLI/cd9zSuMqliYx/HWcGOh/pZv/
 JOPLhLkO331FhZ9Hggx5tOR+YXHAloVxp7FztyPTax4MIGLGCVEtegnXRIaP0O056FPD
 ws4spq3i/GXqR2EWAZhohFY1KfFVumKli6ElFtRf7n3VvM5CMCkyliuV8dzL+PxAbwma
 lmANcOWrE+gsKHwWfwcX1ox0DoWtlpPzKUSGtPgkhoCXbcbvo5dDeZteNzREIxAd+UjY
 mx5MTh0I9x8m8uraRuAmhlIZaivCO2Qc1bCWNdRJMeq+RmNSNzVRQWwdDolP7Xzi2Eid
 Bi2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=O4c2BZOU
Subject: Re: [Buildroot] Linux kernel make target
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Salut JM
>> I'm unable to find an option in menuconfig which allows me to specify 
>> a kernel target for 'make' - is this possible? In other words, I can 
>> see how to specify the kernel source location, the defconfig etc, but 
>> I also need to specify the target - in my case it's 'make 
>> nanopi6-images'.
>
> Can you be a bit more precise about what this target does ? Is it a 
> post-install target somehow ? I don't know nanopi6 nor the kernel you 
> are using ;-).
>
The friendlyelec nanopi t6 uses a forked kernel [1] and the build 
sequence is defined in [2] with a 'make' defined in [3]. The 'make' 
command also generates a 'resource.img' which is included in the 
construction of the image [4]

I guess that if I'm unable to add the target to the menuconfig kernel 
build options then I'll have to create the resource.img in a post-build 
script.

Just trying to avoid writing another script :)

Regards,

Nick

[1] https://github.com/friendlyarm/kernel-rockchip -b nanopi5-v5.10.y_opt

[2] 
https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6#Build_kernel_linux-v5.10.y

[3] make CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 nanopi6-images 
-j$(nproc)

[4] 
https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6#Install_to_target_board

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
