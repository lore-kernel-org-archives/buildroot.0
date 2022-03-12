Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBB5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 16:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6269E60E52;
	Sat, 12 Mar 2022 16:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7-tpW_xS5boV; Sat, 12 Mar 2022 16:07:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 764F360E4C;
	Sat, 12 Mar 2022 16:07:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A82A71BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 910AB4092D
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gx_w2jPgTlmK for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 16:07:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E15840928
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:07:00 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id qt6so25153164ejb.11
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 08:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IQi6V2CdNPIa9+d6/YsIb510Rklup1/hmDr54TM6SAY=;
 b=FsTXqBd5m63Lhz91u5R8Dz7eQfbsJCgokk9mQrHru16cze8IK93y7yby81TIoyE1Sj
 Ep20quXdfc9I4CYskZvkwFHRh5k/wzLYb2OIqXikZw6NvYw9ejNeE0TRaPSAIrvOZDVX
 PsoDAXKTwjeu6jKOmhbHCzQg2EXJs0Mwi7xR/RaSsdHQtyNbPPlwsM6twTc/3NZNa5rl
 s6pRK+eaLFOikhLkGCVTN5DrwjjNqRtgwrJEBZ+Ix+hA1UxsSbe9IZvgohCDSvhmL9Wm
 dcxBd/07zY8fEOwZPpuwPLRyFnbLNNH8KHsN2YuKoZMKM294tX4lD5TqpLj5UiHGDTws
 dhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IQi6V2CdNPIa9+d6/YsIb510Rklup1/hmDr54TM6SAY=;
 b=vhbUdYxFeuWeLei45Yu1g4DZDv54cUg2y4w2WvKtww2i6l+KMskzJE5A5szDVYvab1
 j70bniknz/0fNM2EeP8GxpMB5qXVUQvbMmYF2HzQSdNhI6gCSLY90uGz95dJUFXcNrjz
 akD2MnDWnYWkiUzisy8w5znEdakghQjNZyadJTg+hmxWGREOCPgGuQDPz5cWRtK1Eygk
 a0jf9d9zrvKBjEWfuLJwvMOsOCCfWUp19DY5iNjXgSyDoR3T/2GSe8ZFw3iwDWkVhT8h
 2i6IcMCBItvsPom+zThqDj/ggCppV8nAH09zuPrwarouOeNIEJATRI7huQS/bA2VJZWP
 7U2A==
X-Gm-Message-State: AOAM5304uPaxu01MGXXmyPoukITlOy+iuClhDlOZxkH2xQL33k/qE5Gw
 J5lZDgNLnUBEc4Mf5U8tMj0+3Ko9jJ3VMA==
X-Google-Smtp-Source: ABdhPJyNG/xfa9BA5THhUVYAbivoJLLrKC4E0zspGG3+WQ4ZAPY4eTd9eb859DoXS9S75IfgWEwBsg==
X-Received: by 2002:a17:907:60d1:b0:6db:ab80:78f7 with SMTP id
 hv17-20020a17090760d100b006dbab8078f7mr6367764ejc.755.1647101218437; 
 Sat, 12 Mar 2022 08:06:58 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 si13-20020a170906cecd00b006cded0c5ee2sm4613955ejb.61.2022.03.12.08.06.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 08:06:58 -0800 (PST)
Message-ID: <105a4a50-cc20-9286-4121-96847904e5e6@mind.be>
Date: Sat, 12 Mar 2022 17:06:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>,
 Buildroot Mailing List <buildroot@buildroot.org>
References: <CA+h8R2rU1EhsLTx38qHG0Q5BrNjBDi43D6rw+Rq3KA7dQAremg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CA+h8R2rU1EhsLTx38qHG0Q5BrNjBDi43D6rw+Rq3KA7dQAremg@mail.gmail.com>
Subject: Re: [Buildroot] sshd: fails with seccomp issue on arm
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/03/2022 05:55, Christian Stewart via buildroot wrote:
> Hi all,
> 
> Running sshd on an odroid xu4 (armv7) w/ Buildroot 2022.02:
> 
> connections fail with seccomp errors:
> 
> SECCOMP auid=4294967295 uid=103 gid=105 ses=4294967295 pid=1041
> comm="sshd" exe="/usr/sbin/sshd" sig=31 arch=40000028 syscall=414
> compat=0 ip=0xb6bf41b0 code=0x0
> 
> I found this relevant issue & patch added to gentoo to fix this:
> 
> https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg1844602.html
> 
> https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=9cbbc55aee6b2534bbc8d8fe12128c1083ee6850
> 
> Shall we include this patch in Buildroot as well?

  You mean [1] ?

> 
> https://github.com/gentoo/gentoo/blob/9cbbc55/net-misc/openssh/files/openssh-8.9_p1-allow-ppoll_time64.patch
> 
> I also ran into a build error with fzero-call-regs, there is a patch
> to fix that too:
> 
> https://github.com/gentoo/gentoo/blob/9cbbc55/net-misc/openssh/files/openssh-8.9_p1-fzero-call-used-regs.patch

  As in [2] ?

  Regards,
  Arnout

[1] 
https://git.buildroot.net/buildroot/commit/?id=10c1d887d6082d8806b38b86097c212c4c3ec8f9
[2] 
https://patchwork.ozlabs.org/project/buildroot/patch/20220311065511.14015-1-ps.report@gmx.net/


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
