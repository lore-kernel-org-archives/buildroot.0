Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA4D606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 09:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rgkZMo63
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6D5E80E12;
	Sun, 25 Oct 2026 09:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lW6ZfSxRVxhs; Sun, 25 Oct 2026 09:13:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E027280E1B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792919635;
	b=og7u58pYvtf/lqiDtH3ZRcOFGnLNz9Ijui+aYZVV0noRuAX8BDuMalZ/CLtgeYd7CHE5
	 o8G9wSxoIzVqaET3s1SmiGa2GnYmzQVBpIX3U+hnlzb0rIyMrCgranH3cIw8tVudkgXyT
	 gZ0ZlWcxz73/iSu2/K8XdFRILy+wz3MjYMGaWfxbNP7GWFG2RDIygcnp68bayFsG+aBGT
	 CcGyM0NZfd77nKPfYKDaQ3FFjQJgleMppYDnI7d80omFralOLa2/euvJk/Bdov/MMwpqg
	 6aQwkcYgUtJ8SpK1HVUpLXfY+Nz1ubmWvgdQBDEjbT0grJq04LeMtJUs/OMZq4N+RBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792919635;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Date:To:Cc:Message-ID:In-Reply-To:
	 References:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Liswd5UxncdY/GRjupg+xCSFjzp5JLRSmEsNETP6Pp8=;
	b=AhdKn90uRBzduEqsE/GVMj6zePGSXvU+ctxk7IdpbJAoGOoLhwDbc3QbBqoEeageqmzn
	 72KVFoh9SmrheNS9tugIGkfDc+0u6+6bSz6WLc4r6mO2QQiULozlXkW3Hz13tPu9PkxJs
	 F+gMNupSqhu6NuABzkde4DWZMP+npSwLtP9/YTtJzeYwvDbDqJl1udyHbqCj37Y549nzx
	 ezyN91jfgx+S33OZbXV2fv7FhSl5J6GUKI5JFlcffDTGudsl54PTitgQc/u/Dq9Ye1jnl
	 9D3F2e69cwe34YrEbe+KLGqVUz/p6YusHvkrOw3JeLVQHldPnehnxZEG6qb7rx+2aPA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792919635;
	bh=Liswd5UxncdY/GRjupg+xCSFjzp5JLRSmEsNETP6Pp8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rgkZMo63lvq0t1SPA1jlIkgxYBO7G1vN28igKfhZmmzNwMpmjE6JJC3U+wEC12+Uk
	 CNG4SbniPT/xr4clZ7zJo5KlOiSN87XwNcIE/v/cf6YuJgB97/P7hAgAwyr0waTmYx
	 XaA6eywspDHxjSdZ6yE8DRE1eTuBfX57fOhzvODMhFxhqsI8eARaD3ZZSzqbMRCT3x
	 zFJWqGZCt0CVsKdjhBvNbQ60p/KEVzkMu9hYUjZAuukPr8YAlNrP0VQlTFmkLSq8Dw
	 quMVBb4g399Oc6YHMkbJ2n6pIRm83Yd2e4RLqFA68AAs6le2ITlsUjyxisSSzmIZe3
	 IX3UMx9yaZ+Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E027280E1B;
	Sun, 25 Oct 2026 09:13:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3638A35F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BF4680E1B
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLTq5paUXnn7 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 09:13:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7D6CD80E12
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792919632;
 b=oAlh3ff5fnRud1mC9k600ZgH4NBWUOUX9CeGfzZ8A6bZv1CSbZI9N86Yh4+/2Z53V3hy
 RMOXGGPPwNUjhNTfnONsF9NzhggoNzjT9VQvZxCSGPE+qFfDIBLN5cZDPCF2dWyIu/Kic
 ZIxo1iJ4jKaInlx0sVPwzwujaRRgojeZ+M0ZUbUo84D0Rd/JRn3ftbdj2fZ1VyAI64/LE
 qlzfhCIU6UEjueZFE/U4g1bIAAPUG42OAzBgcjDjtSKm8JlPPciib47gorWFplk1XbRz+
 YuTayBrhbiGbwALXPuIFxtz4CzhdCY7B8pXIp/PltsoAo3f4cL22V0ftWa0QaS3l4YQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792919632;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Date:From:To:
 Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
 UI-OutboundReport;
 bh=UsKJU9MPAdo/A9iDirWvOmDQ8daneeqWWGcOpy50eNE=;
 b=pGB1LVDfWRQxQENEECQk9BdF1r9y6PiYZKgqwt6PhYCHJVzO9qgLL9puKUZpBwWfwXiv
 taLLQAjhVbFBg1e5eF8gWM5bkJREKe7vngUrR6mW63JHfuBHQ3nP8076UrE/CtaTGuAwk
 hV+XAS/i4TQsmF1wqCBKLlQt0p27HCQ1VwiH65kQ+GV2KbO4FbwNgVodnYm5gO6fXc9af
 pXPn/o9mHp17fpl8Rp1Gfng0hqdFjgKsNjn4+PHuNzOwNtTbZpFohh2CTtrDK63UCJYjJ
 Jl+/LvDx+KK2RHPf7bDIT+ntWYA5k4kL5CKoyGHAunTOSmTudWz3GY8c1a6l+gNWzfA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.net;
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=Y+EXsF0H; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D6CD80E12
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 09:13:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mt757-1wRQEH3U5p-00r451; Sun, 25
 Oct 2026 10:13:48 +0100
Date: Sun, 25 Oct 2026 10:13:47 +0100
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Cc: Arnout Vandecappelle <arnout@rnout.be>, Julien Olivain <ju.o@free.fr>,
 Thomas Perale <thomas.perale@mind.be>
Message-ID: <20261025101347.34f787e4@pc-1>
In-Reply-To: <20261024170830.543982-1-arnout@rnout.be>
References: <c3ab76847e4dd0d716ea7cbaeeb5e8fa@free.fr>
 <20261024170830.543982-1-arnout@rnout.be>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.53; x86_64-suse-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:V9hGCtfT2zgPqxor0FkggNkQmD/wCxV+pioSsXQYoUC6YBD5t22
 fuIV9E5IqBxGHHeSkqL0+ciqmhS/c4SRZWDtGOyzl+2P9lYuopj7/i/dLtCBU5rrp2Pm1fR
 oh8E90Zf38FAeMVC/ywIP+yF7GHzNww9ppC80QD5Jdu85a42eBQmZLEjFRWpNCy0Rvxquok
 G8HEVJ065l25i3FHUM1cg==
UI-OutboundReport: notjunk:1;M01:P0:Gd9U/Rv09P4=;PvsF+GfOalNpignX/i4XuFwFxwY
 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
Subject: Re: [Buildroot] [RFC] Makefile: do defconfig with /dev/null instead
 of .defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Arnout,

On Sat, 24 Oct 2026 19:08:30 +0200, Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:

> For `make defconfig`, we use a .defconfig file. This is inherited from
> the kernel, which has a different defconfig for each architecture. The
> kernel defconfig passes ARCH on the command line rather than in Kconfig,
> and defaults are very different for different architectures. In
> Buildroot, we don't have that, instead we have a .defconfig file which
> only has the default architecture. And it's not actually a defconfig,
> it's a very old full .config where only the first part is kept.
> 
> Since we have architecture-independent defaults, and any architecture
> specific things are expressed with "depend on" and an occasional
> "default ... if ...", we don't need this infrastructure at all. We can
> simply make .defconfig an empty file - the BR2_arch choice has a default
> and that's all we need. And we don't even need an empty file, we have
> /dev/null to do that job.
> 
> Use /dev/null for the "defconfig" target if no DEFCONFIG is given.
> Remove the now unnecessary .defconfig.
> 
> Note that this also makes one hunk of
> support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch redundant.
> Let's not do the effort of removing it now, we can remove it if it
> causes issues when updating the kconfig infrastructure.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
> ---
>  .defconfig | 50 --------------------------------------------------
>  Makefile   |  2 +-
>  2 files changed, 1 insertion(+), 51 deletions(-)
>  delete mode 100644 .defconfig
> 
> diff --git a/.defconfig b/.defconfig
> deleted file mode 100644
> index d25c62e104..0000000000
> --- a/.defconfig
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -#
> -# Automatically generated make config: don't edit
> -# Mon Feb 18 09:11:56 2008
> -#
> -BR2_HAVE_DOT_CONFIG=y
> -# BR2_alpha is not set
> -# BR2_arm is not set
> -# BR2_armeb is not set
> -# BR2_cris is not set
> -# BR2_ia64 is not set
> -BR2_i386=y
> -# BR2_m68k is not set
> -# BR2_mips is not set
> -# BR2_mipsel is not set
> -# BR2_powerpc is not set
> -# BR2_sh is not set
> -# BR2_sparc is not set
> -# BR2_sparc64 is not set
> -# BR2_x86_64 is not set
> -# BR2_x86_i486 is not set
> -# BR2_x86_i586 is not set
> -BR2_x86_i686=y
> -# BR2_x86_pentiumpro is not set
> -# BR2_x86_pentium_mmx is not set
> -# BR2_x86_pentium_m is not set
> -# BR2_x86_pentium2 is not set
> -# BR2_x86_pentium3 is not set
> -# BR2_x86_pentium4 is not set
> -# BR2_x86_prescott is not set
> -# BR2_x86_nocona is not set
> -# BR2_x86_core2 is not set
> -# BR2_x86_k6 is not set
> -# BR2_x86_k6_2 is not set
> -# BR2_x86_athlon is not set
> -# BR2_x86_athlon_4 is not set
> -# BR2_x86_opteron is not set
> -# BR2_x86_opteron_sse3 is not set
> -# BR2_x86_barcelona is not set
> -# BR2_x86_geode is not set
> -# BR2_x86_c3 is not set
> -# BR2_x86_winchip_c6 is not set
> -# BR2_x86_winchip2 is not set
> -BR2_ARCH="i686"
> -BR2_ENDIAN="LITTLE"
> -BR2_GCC_TARGET_TUNE="i686"
> -BR2_GCC_TARGET_ARCH="i686"
> -
> -#
> -# Target options
> -#
> diff --git a/Makefile b/Makefile
> index 9b62da3e40..aa3826b5b4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1037,7 +1037,7 @@ oldconfig syncconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmake
>  	@$(COMMON_CONFIG_ENV) $< --$@ $(CONFIG_CONFIG_IN)
>  
>  defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
> -	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
> +	@$(COMMON_CONFIG_ENV) $< --defconfig=$(or $(DEFCONFIG),/dev/null) $(CONFIG_CONFIG_IN)
>  
>  %_defconfig: $(BUILD_DIR)/buildroot-config/conf  outputmakefile
>  	@defconfig=$(or \

The Makefile part looks very familiar:

	Makefile: always use a base config file for defconfig

	https://lore.kernel.org/buildroot/ZjyqwNLypWWS21v5@landeda/

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
