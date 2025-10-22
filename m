Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5429CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 20:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BC1A8407F;
	Wed, 22 Oct 2025 20:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHmbZaFy6D_j; Wed, 22 Oct 2025 20:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF92484080
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF92484080;
	Wed, 22 Oct 2025 20:01:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B14BDDE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A19A884080
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhIavabzJuEq for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 20:01:06 +0000 (UTC)
X-Greylist: delayed 448 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 22 Oct 2025 20:01:05 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D613B8407F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D613B8407F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.152;
 helo=fhigh-b1-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D613B8407F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 20:01:05 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 70FEA7A003F;
 Wed, 22 Oct 2025 15:53:36 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
 by phl-compute-06.internal (MEProxy); Wed, 22 Oct 2025 15:53:36 -0400
X-ME-Sender: <xms:QDb5aAPzdsQtgOaVFJNvNS4f23sTC9lxvBG9iu5tdBPt9N2nVS730w>
 <xme:QDb5aBz-TAGuoq9GsM3vRkZTHRdzlZXemuVsDWvQ3zoosjytDk3_LflWCCBZWaYrF
 dUfyRdE50sFUSZRsrvCSyJjFLvqbxXpNfGOFxlasvZOn2Ci05J_2Nw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugeeggeejucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertd
 ertddtnecuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeelhfdvfeefveefue
 dugeethfegveethefhkefhieeiudffgfegudeiieegjeeinecuffhomhgrihhnpehinhhf
 rhgruggvrggurdhorhhgpdhkvghrnhgvlhdrohhrghdpghhithhlrggsrdgtohhmpdgsuh
 hilhgurhhoohhtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspg
 hrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghuihhlughr
 ohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehjuhdrohesfhhrvggvrd
 hfrh
X-ME-Proxy: <xmx:QDb5aKNltj-KRDeOxHbnxs6l5gs-sxdkcbOiT3BTsE8yjYG-np8BlA>
 <xmx:QDb5aO9X0eQfxgOvjOBDlTCG4vgcHMe_q_MYi9B_o6fPzyPRkNRMTw>
 <xmx:QDb5aO4gwAipqwxtR-m3eu7HaKEt4zwFp8nJhfaWBpH_n6Ha9VHqvQ>
 <xmx:QDb5aF0ipj7_iO0dDoAfEkk4vqfg3R_NHFL-SB1hTga8HLuozbu9Bg>
 <xmx:QDb5aEn-eSw1J96nMZEIPIuHR8YkZtkEWCZ5dGkl7HdQ6azunMSryopi>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id EF9312CE0071; Wed, 22 Oct 2025 15:53:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AKLs6l7lsTDo
Date: Wed, 22 Oct 2025 20:53:15 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Julien Olivain" <ju.o@free.fr>, buildroot@buildroot.org
Message-Id: <cce15bb7-5e6c-4a66-8e55-78a8058c5f7e@app.fastmail.com>
In-Reply-To: <20251022190736.978991-1-ju.o@free.fr>
References: <20251022190736.978991-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1761162816;
 x=1761249216; bh=iMoDWrmjS80EjHqwc1VO9u0rLYGxne8gogUNpsNig2E=; b=
 EFP6lDfXZSeciHvoUo6da40iwABZxG5ZnL44j6NhhB+Vwadm27OFsuUzKUj0Ii0T
 XLlwILTnLNVo+sK4zgj80B2xge2raFHWDetZbBT2P4XsT/aFgoPofuDyIfpkTk34
 byQ3Qe9aLh3+OawWqMh1IFd6MDMu8ZlQc1DK0UqJxKPuBbkSRfTBV9pF5O8bNc+t
 VtHcmvud53+V/FUqdGc+iDXDFrhUVluofTqU07d9mazq4N4+5kGGLHCAnuuMWrO3
 fkNacPGOo/A4VCYKzOIbrqpSx06s4RSzWLGouQ7c5JVolfKmJ9a2J9Lfz/T+bELb
 d9Q7wkeJbt8QAB/GRZsc5Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1761162816; x=1761249216; bh=i
 MoDWrmjS80EjHqwc1VO9u0rLYGxne8gogUNpsNig2E=; b=UnYqPdq63ttsAYNn7
 1eCV9EiTejdFLR3RhkYnopuiqxn/8Ocf1HyTm0S2bTI2XFh6GyZQJDlaLzcz11r3
 ESiLxw0Z9xVeboo/Rp+XIh6beeS+z6aqC9eozrfr65EDUuehaqyt5f35OD1yfgMI
 /R7f7YzMY/axNboCZu0HI3aSai3YYnkjtvCFvTDitC42KMr36RW2rl+BY5hIhvES
 MiTilAPvcXb/QdEckGyeqUhhL9fr18m9CLa9pGVt/f+42nAbOIeoNY3dPejVV1pw
 WUB9D3A1vpcr5tJomkKjoi0AgY9BKgM19wQSx3qtbAftL3Ba6ovKo/nT4e/B0E7B
 ekqcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=EFP6lDfX; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=UnYqPdq6
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.32
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On Wed, 22 Oct 2025, at 8:07 PM, Julien Olivain wrote:
> For release announce, see [1].
>
> This commit also adds the support for LoongArch64, which was added in
> upstream commit [2], first included in version v2.0.26. Note that
> Buildroot introduced LoongArch64 support in commit [3].
>
> This commit also updates the COPYING license file hash, after a minor
> update in [4].
>
> This release was signed with a different pgp key, so this commit
> updates the key ID in comment.
>
> [1] https://lists.infradead.org/pipermail/kexec/2025-October/034019.html
> [2] 
> https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=1c8bf2dc0127b06f97a7973488c7f8cf9a5f7c19
> [3] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/54895db9c10a26283b25a393cb6c872d72c245d1
> [4] 
> https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=591ebf60649de53dd7a9c916ef4e831626ab1810
>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks!

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Briefly tested in QEMU.


> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/11812882618
> ---
>  package/kexec/Config.in  | 1 +
>  package/kexec/kexec.hash | 6 +++---
>  package/kexec/kexec.mk   | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/package/kexec/Config.in b/package/kexec/Config.in
> index 707f8663a4..2e3efb5a2a 100644
> --- a/package/kexec/Config.in
> +++ b/package/kexec/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
>  	bool
>  	default y
>  	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
> +		BR2_loongarch64 || \
>  		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
>  		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
>  		BR2_sh4 || BR2_sh4a || BR2_aarch64 || BR2_s390x || BR2_m68k
> diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
> index 45113f2936..f1f6356b68 100644
> --- a/package/kexec/kexec.hash
> +++ b/package/kexec/kexec.hash
> @@ -1,6 +1,6 @@
>  # From 
> https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
>  # After checking pgp signature with key:
> -# B8868C80BA62A1FFFAF5FDA9632D3A06589DA6B1
> -sha256  
> 8a8f350ddc66e1c905a3ab525a7e9ba96c81e04e70ef69397b0155b67b922c31  
> kexec-tools-2.0.31.tar.xz
> +# E27CD9A1F5ACC2FF4BFE7285D7CF64696A374FBE
> +sha256  
> 8f81422a5fd2362cf6cb001b511e535565ed0f32c2f4451fb5eb68fed6710a5d  
> kexec-tools-2.0.32.tar.xz
>  # locally calculated
> -sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> COPYING
> +sha256  
> edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  
> COPYING
> diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
> index f0c39f4188..240c219a9d 100644
> --- a/package/kexec/kexec.mk
> +++ b/package/kexec/kexec.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -KEXEC_VERSION = 2.0.31
> +KEXEC_VERSION = 2.0.32
>  KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
>  KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
>  KEXEC_LICENSE = GPL-2.0
> -- 
> 2.51.0

-- 
- Jiaxun
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
