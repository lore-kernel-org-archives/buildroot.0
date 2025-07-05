Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDEDC8303D
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 12:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE92E83CA3;
	Sat,  5 Jul 2025 12:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPbCgrKBrk1O; Sat,  5 Jul 2025 12:17:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 078AD83C59
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 078AD83C59;
	Sat,  5 Jul 2025 12:17:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5680D12E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 12:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47E9C402C3
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 12:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbctQT853yM6 for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 12:17:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B99240172
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B99240172
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B99240172
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 12:17:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6D2BB6012D;
 Sat,  5 Jul 2025 14:17:15 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 05 Jul 2025 14:17:15 +0200
MIME-Version: 1.0
Date: Sat, 05 Jul 2025 14:17:15 +0200
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dick Olsson <hi@senzilla.io>
In-Reply-To: <20250618-loongarch-v3-2-d11baae32eea@flygoat.com>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
 <20250618-loongarch-v3-2-d11baae32eea@flygoat.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <3f1060fd8783b35211b3de718d350dd1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751717841;
 bh=ca8zYDw3/qatXrq9IWajX68KY3UcHReQsObfsQ+JnsM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G6wvYAbQT388OpfBzAYWxusaI8aIGOWvA0g5qjnKxkFiQpA84qMbkRPqWX5z60jwO
 soBd9KTBul3ecXPTgv8FjwSsmkvEVWFadaQ1cx2bCh82U+juJQAhnuKwU9GY0pRxXP
 GaA4f1jkaa6Ggw0pZ0IC6Puw3aRGKa0MEa9JvsssJRQ4SEN03s6UNQgKmprwQX3cT1
 t1aEwC6bCd8U8zrCGtVWDMa58Kljh2qBzWzgLg7IoPeiuy0gZC1+UAiyP7Wut3l+xD
 5OFaM3L7lvstx0UxySLRhKQhu3QOBxKSg1OITVsCuRER0QEM3ta1nVgfNwEpVWrOM3
 i91S6ZXCdhgDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G6wvYAbQ
Subject: Re: [Buildroot] [PATCH v3 02/11] arch: Introduce LoongArch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jiaxun,

On 18/06/2025 20:20, Jiaxun Yang wrote:
> Introduce LoongArch64 at architecture level.
> 
> Config.in.loongarch is prepared for possible loongarch32
> enablement in future, thus BR2_ARCH_IS_64 is being depended
> by some 64bit only options.
> 
> Internal toolchain is supported, as our minimal binutils
> version is already beyond LoongArch minimal version and
> GCC option is limited by BR2_ARCH_NEEDS_GCC_AT_LEAST_12.
> 
> BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT is selected temporary
> and it's going to be rmoved after we gain libc support.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

I tested this series more extensively in the past weeks with 500+
Buildroot packages. Overall, this new architecture support looks good,
so I am in favor to merge those patches.

Before I do so, I would like to point out that enabling a new
architecture in Buildroot is not "just" testing the new
defconfigs are building and booting. The autobuilder will start
generating random configs for this architecture, including
any packages that could be selected for it. As soon as we'll merge
those patches, I expect to see new build failures for this arch.

They will most likely show up in:
https://autobuild.buildroot.org/?arch=loongarch64

Since you are registering yourself as the architecture maintainer
in Buildroot, will you be able to help solving those package issues?

I expect the kind of package maintenance to be:
- fixing package bugs specific to the arch
   (including upstreaming those fixes)
- updating failing packages to new versions
   (if their upstream already include loongarch fixes)
- marking packages as unsupported for this arch,
   typically by introducing a _ARCH_SUPPORTS Kconfig which
   does not list this arch.

If you promise to help us doing this maintenance, I think we could
this series merged soon.

What do you think?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
