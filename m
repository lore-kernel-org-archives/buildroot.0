Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C82CEE4993
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 08:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 975CF408E0;
	Wed, 23 Aug 2023 08:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 975CF408E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ZVNoGCMboLH; Wed, 23 Aug 2023 08:39:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E6E8408E4;
	Wed, 23 Aug 2023 08:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E6E8408E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA2771BF5DA
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 08:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 936584047D
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 08:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 936584047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zkKVWJpwHFHK for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 08:39:37 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE65040128
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 08:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE65040128
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 888E3352BDDB; Wed, 23 Aug 2023 10:39:31 +0200 (CEST)
Date: Wed, 23 Aug 2023 10:39:31 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZOXFw5o17WS9rg8n@waldemar-brodkorb.de>
References: <20230822180900.6953F86114@busybox.osuosl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230822180900.6953F86114@busybox.osuosl.org>
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1692779972; bh=s7b/iyCAC9FVdAv1OXfeokLnJYqWoSH9VHCt2t71Znk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WvsgzVIhxmUjvYk84cAUhxpyItNor2q50Cb4DqyomdtUU1YV6AAO2/yed6W+EPf2Y
 nDgzjBaHTspxj+4iZxZS21FeCnru9jA0CMiQhoTEaC5rizIhUvTj6CofzLt3k43dlH
 0cm2xC7iZazy92sJdlaOAKk6hzFt0lzL8ekCqjCZFd0t21AULnJnbj6be55yTRl5jG
 N5F+VyQVd1AhnuAT1bbkqSPgFcIjSFWOWy1140rPQx22zboVsuvnuos0ZvN2+Yc3oL
 6hkMkLRqYHlKyFC5eEKHVwSF3mUk4JKEUUEt6og2Fk25sye3GQlJPzTwdGBORdvUc/
 olPEbGVAMiHig==
Subject: Re: [Buildroot] [git commit] package/gmp: fix compile error for
 riscv
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni via buildroot wrote,

> commit: https://git.buildroot.net/buildroot/commit/?id=6d8deb4b23ee57a69308bcdc5ceafa02aacc1edd
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> In commit 87b2a30319394c2cc79efae1af7833cad8c62b32 gmp got updated
> to 6.2.1, since then the compile error exist.
> 
> Compile error looks like this:
> tmp-mul_1.s: Assembler messages:
> tmp-mul_1.s:55: Error: unrecognized opcode `mul a5,a7,a3'
> tmp-mul_1.s:57: Error: unrecognized opcode `mulhu a7,a7,a3'
> 
> Patch should be backported to stable branches.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/2f2/2f2112bea73adbf49eabb62fe6cda6a9cd5d0567
>  - http://autobuild.buildroot.net/results/566/566a4945555b781ed127997176f73b3c17ecab5d
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/gmp/gmp.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
> index 9b402767fd..3b732dfa71 100644
> --- a/package/gmp/gmp.mk
> +++ b/package/gmp/gmp.mk
> @@ -23,6 +23,11 @@ ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CP
>  GMP_CONF_OPTS += --disable-assembly
>  endif

 I think we need to guard it with BR2_riscv or not?
  
> +# GMP needs M extension for riscv assembly
> +ifeq ($(BR2_RISCV_ISA_CUSTOM_RVM),)
> +GMP_CONF_OPTS += --disable-assembly
> +endif

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
