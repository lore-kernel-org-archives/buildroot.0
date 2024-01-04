Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52661C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0743D615D6;
	Thu,  4 Jan 2024 21:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0743D615D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XiFnKZC-s_Rw; Thu,  4 Jan 2024 21:34:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 547956158D;
	Thu,  4 Jan 2024 21:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 547956158D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BADDA1BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0BF742E27
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0BF742E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kc-auy7db9q1 for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:34:42 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5E7842E26
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5E7842E26
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 53774B005A6;
 Thu,  4 Jan 2024 22:34:34 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 04 Jan 2024 22:34:34 +0100
Date: Thu, 4 Jan 2024 22:34:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZZckauC7K7-qR0lP@landeda>
References: <20240103102311.4048759-1-abrodkin@synopsys.com>
 <20240104221941.044adcb5@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240104221941.044adcb5@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704404080;
 bh=h+aiWvFLoos8/KnjFEtq1G4Gsz0A+UJz+dWv4TYkW7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fpO8Pbqgd8u8HsnL6HM00qIFzuU3GOM389Uvspdj7+OpBMJBVl34x134EhrF6jLiw
 tTzt0OO0+UOvL4uaVSkF7YMnD5ofbP5FBySJ+MzR6qrL+Y6rPwSH7LNW5fxx78WQ4g
 WGxwmZBLCdEKWWgFAUfnpG//8YgfWbN8DVLi0lSdx2l3g8Cb78wD/M4jXOQSKixV3x
 djPEvRF+ZaCrCLUBlhWofyn0CU/ZJ5fSStPSgju5h/pPpUj3LqevMoaB93VbA5Yjj9
 an3XMGZN3CguNwwdACJcG/gnNuSI09RzUmBNHZSp/Hkx21+MSa1fAD9E/dmtVXKEHq
 uZ+Ld/k4sjZyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fpO8Pbqg
Subject: Re: [Buildroot] [PATCH] arch: Set max/common-page-size for libgcc &
 libstdc++
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Pavel Kozlov <Pavel.Kozlov@synopsys.com>, Vladimir Isaev <VVIsaev@gmail.com>,
 Alexey Brodkin via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Alexey, All,

On 2024-01-04 22:19 +0100, Thomas Petazzoni spake thusly:
> On Wed,  3 Jan 2024 02:23:11 -0800
> Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:
> > I would agree that it gets more and more ugly, but so far I cannot see
> > any more elegant solution. So if there're suggestions how to improve,
> > let's discuss.
[--SNIP--]
> But I'm surprised they are not needed also in the C library build. Why
> are you not seeing the same problem with the C library build, it should
> also need the same page size flags, doesn't it?

It is my understanding that the toolchain wrapper is installed as a post
initial gcc hook as well:

   package/gcc/gcc-initial/gcc-initial.mk:
   59 HOST_GCC_INITIAL_POST_BUILD_HOOKS += TOOLCHAIN_WRAPPER_BUILD
   60 HOST_GCC_INITIAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
   61 HOST_GCC_INITIAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS

So the C libraries are built using our wrapper.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
