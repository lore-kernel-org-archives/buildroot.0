Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACA7C001DB
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 08:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7398F416FF;
	Thu,  6 Jul 2023 08:53:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7398F416FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHl-_KPJkWHB; Thu,  6 Jul 2023 08:53:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BDC74085D;
	Thu,  6 Jul 2023 08:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BDC74085D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF40A1BF575
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98AA160B99
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98AA160B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jgW-K8fbBpKf for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 08:52:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 840A060AAA
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 840A060AAA
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 08:52:51 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3113da5260dso324089f8f.2
 for <buildroot@buildroot.org>; Thu, 06 Jul 2023 01:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688633569; x=1691225569;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+fdFIqCnJIMeg7G4EGxK2H1HNMixT0ySk8XuWeqPZf0=;
 b=WN6CFqquGfE4FuDi0azz9Y9rJ3VCciPqrCVbuXef/ugGzGLw2GDFw6MulcMF+54rBV
 njqmbaInqa1Sy0UGl2RjqLuuw506HtfBNmvL/2R6CWiZ7/4Qso6e2ewLXaY831+z89oD
 2/2vu8CpYX0yNkbP7e68RBYGPYQNPfSFi+4OFZ/WQQGwXPfUPEL7669N7a0/XoR9rleH
 KPk6bSQATq2pk2mj0s5CT/oYFhRoSKO4AHPnP6//i2bKej8b7pVl/M9vLvQJC5fWMPBj
 l10aaZRegUMxku2YFt2HmJoNb7CK+HisPapjJCeKDvc1xpTSwwRzEcciR/kuX85/C5rN
 jbKg==
X-Gm-Message-State: ABy/qLaikygzcWMIlPE2lIOIAJU8v++G+ZlrJ3wDu6qS4SatidG5AWNo
 quGfoJcv419I1U02+7l25SbL+W0GWeQ=
X-Google-Smtp-Source: APBJJlGy18HmuN/LYwtn0wYIwj+cVoze8vPukvNlzucfD2/7Oyxk1/aZc7Tx9eyEzBXOET1CjCldfA==
X-Received: by 2002:a5d:4ed0:0:b0:313:f94f:3b15 with SMTP id
 s16-20020a5d4ed0000000b00313f94f3b15mr865428wrv.2.1688633569319; 
 Thu, 06 Jul 2023 01:52:49 -0700 (PDT)
Received: from [10.0.0.120] (static-90-255-244-241.vodafonexdsl.co.uk.
 [90.255.244.241]) by smtp.gmail.com with ESMTPSA id
 a12-20020a5d508c000000b0031438257aa9sm1283506wrt.36.2023.07.06.01.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 01:52:48 -0700 (PDT)
Message-ID: <aebc452f-16e7-d5bb-3ee2-4ec982dd16e7@gmail.com>
Date: Thu, 6 Jul 2023 09:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 buildroot@buildroot.org
References: <be0548f0-8762-0e55-6441-02897a7b22df@gmail.com>
 <0bc3ae44-0a96-4a72-ee9a-8620cb474c3d@yoseli.org>
Content-Language: en-US
From: Nick Betteridge <lists.nick.betteridge@gmail.com>
In-Reply-To: <0bc3ae44-0a96-4a72-ee9a-8620cb474c3d@yoseli.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688633569; x=1691225569;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+fdFIqCnJIMeg7G4EGxK2H1HNMixT0ySk8XuWeqPZf0=;
 b=g96Og+yhzxNzN/hyRB4wLOoGvRuyQ8wb0EH6BLfAUE1DlMi5KrFkQaWKQoBRXSUILt
 qw8Sk8lcAI42EnIqALHV8S2Zc3kb1cThop73aKoki1+MYpA7YHBfup00VOjcyyTKEKmJ
 Az0jx/HmxASRcos80EIP+rS4H0gf9btsc9DsXRCn+zstftL6k3cMserIiywu4jd4OyPg
 s0x19YVzRweG+3vrYm3o4OaNjcbVhajztQJH6bZTbVpxRHMbyHTbtIfAF36McRKsh8c6
 TdJWywuJzYJ3P5+Up9XoFp8SdrYDZe0aHng5/nizH7sCPgN+mS6UHm05q9kJsiHXPCvv
 vW1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=g96Og+yh
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


>>
>> I'm unable to find an option in menuconfig which allows me to specify 
>> a kernel target for 'make' - is this possible? In other words, I can 
>> see how to specify the kernel source location, the defconfig etc, but 
>> I also need to specify the target - in my case it's 'make 
>> nanopi6-images'.
>
> If this target is a defconfig, you can use BR2_LINUX_KERNEL_DEFCONFIG.
> But I think this is a custom target in a non-upstream kernel.
> In this case, I don't think you will be able to do it directly and 
> will probably need to modify linux/Config.in and linux/linux.mk files.
>
It works, of course! Setting the 'kernel image target name' to 
'nanopi6-images' and 'kernel image name' to 'Image' - I had neglected to 
set the 'kernel image name'.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
