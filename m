Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6E8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 20:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6DDA80C1B;
	Thu, 17 Mar 2022 20:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ic_p04xH5QMC; Thu, 17 Mar 2022 20:53:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2039380060;
	Thu, 17 Mar 2022 20:53:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC7E1BF40B
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 20:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 182AE60A70
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 20:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aDiLu44CtDnk for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 20:53:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EF5760634
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 20:53:26 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id p15so13234745ejc.7
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 13:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=j4QEFa2wSXuQVyBJhoHiRdlTm7boDIJ08s8gVI9Y+OU=;
 b=Y5T1Z3CrPz2KrcbVytZJF6RjHvNLxfW3k0vuwuWweY9MGEbUwr7QCrPEFskwLvqIbW
 lklwyscCNP1tFzmlF47v/14h7PMgZBCW+LgQhU/aNQt2YFA0Mbyy6tBGHJbPK/JIqCVw
 IMoqEFwQYnjGFTwqH25JfD+9efE9TlH1Tx+zxlhuAksZJQ08zOUGbTsGYmDFH6zzuf6m
 CNSsyUxsdrc+rJ2G1e37ucOz86mJZTp15YxAiDqy3HNaD9BcQOyt01stJrhegRMQxYun
 +UIdzS3g/G/p65AOJsiSR2Dm7w58Hrp5z5Ut7rUxdxxt8oFQG6g/q3vIBMQumaX1J/rH
 pTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=j4QEFa2wSXuQVyBJhoHiRdlTm7boDIJ08s8gVI9Y+OU=;
 b=LkpbBL+WFl5zlQwdrCmsF95A9PRYzMoevRh6RG+SVoasR7CjOlJU2Ijof+GinrD/XL
 FYRHIc2sQYKnYSa60GnrSpzKsIndcAVl+Ije6pQgJ3bDKnqla6jndznB2hX16KqLguEw
 nh17RX4cC2l1hz8OzhqbwzrOyEEcvUItBAQ9kAs+3pu7ooG6bE8TA1krj+1QApduN3Ob
 4cOsKu4nHcA96TSG8YWSI4+a6iROE2W8WOCRxxLEFovmXdcJzLiyuTErhG6FIAlAf3+Q
 Oaxcbrs5zjNa2vuB4sf2neTUPVWEiL4tMvj7M0dT0NRIvwY6NGl2qG35BaMGpv5reuvl
 mbBg==
X-Gm-Message-State: AOAM530SW5xVNOlKHIb/Wv+zgcP2fMTonBwubhZ4IKlutXQdpUD52XsH
 21ub3dJ+012ZLyrOD4GlGhwRtDsBt9SElQ==
X-Google-Smtp-Source: ABdhPJwp/JdUdoWtxkyMPnzpXtmfiiB97J6WFbPU1wgLiOyNAZxgi+G4UKrj1Rm1aqWsRgqy7bL1Vg==
X-Received: by 2002:a17:907:9607:b0:6db:570e:63f6 with SMTP id
 gb7-20020a170907960700b006db570e63f6mr6253884ejc.592.1647550405244; 
 Thu, 17 Mar 2022 13:53:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 eg28-20020a056402289c00b00418e989edf3sm3016690edb.87.2022.03.17.13.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 13:53:24 -0700 (PDT)
Message-ID: <5feaf128-d85d-9d40-7708-80e2bf5f88a9@mind.be>
Date: Thu, 17 Mar 2022 21:53:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: thomas@ruschival.de, buildroot@buildroot.org
References: <8735jgs7sa.fsf@ruschival.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <8735jgs7sa.fsf@ruschival.de>
Subject: Re: [Buildroot] RFC: Patch "Gallium VC4 driver depends on NEON"?
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



On 17/03/2022 20:23, Thomas Ruschival wrote:
> Hi Arnout,
> 
> the Patch "package/mesa3d: Gallium VC4 driver depends on NEON"
> commit a5cdb54ed78b136c83dd44aebfa27f715cda5ea3 prevents using VC4 and
> hence OpenGL on Raspberry Pi Zero.
> 
>  From the referenced autobuild logs I gathered that the build that failed
> used the bootlin-armv5-uclibc toolchain.
> 
> Since I wanted to use OpenGL for Qt on a Raspberry Pi Zero I reverted
> the commit. The package compiled without errors and the system works as
> expected.  Since my build is using a buildroot toolchain
> arm-buildroot-linux-gnueabihf (gcc 10, glibc) I guess the assembler
> errors are due to the toolchain.
> 
> I am not sure how to proceed in this case.
> 
> Should I investigate further on a more elaborate dependency logic to
> allow for usage of VC4 on Raspberry Pi Zero that doesn't break
> autobuild with bootlin-armv5-uclibc?

  The easiest is to test if it still fails with the bootlin toolchain (you can 
select it from the external toolchains list). If it doesn't, then it's probably 
something that got fixed by a mesa3d bump. Ideally you should investigate what 
changed exactly to fix this - I had a quick look, nothing changed in the files 
using NEON instructions themselves, so it must be that the V3D_BUILD_NEON or 
PIPE_ARCH_ARM macros are defined differently (they determine whether or not the 
NEON instructions are used).

  If it builds now for the bootlin toolchain, please send a revert patch with an 
explanation why it works - ideally referring to the upstream commit that fixed 
it. And a reference to the version in which it was fixed, so we know if the 
revert can be backported to the stable branches.


  If the build still fails with the bootlin toolchain, then yes ideally find out 
why it behaves differently with the two toolchains. Again, the NEON instructions 
are still there in the code, so the difference must be with the V3D_BUILD_NEON 
or PIPE_ARCH_ARM macros.


  The only other explanation (I can think of) is a difference in binutils, where 
your binutils accepts the NEON instructions even on an architecture that doesn't 
support NEON. Seems pretty unlikely.

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
