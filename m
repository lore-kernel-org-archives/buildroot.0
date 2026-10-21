Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1946606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SJaxV3td
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9AF261329;
	Wed, 21 Oct 2026 19:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2dCnZDkLpOZ; Wed, 21 Oct 2026 19:25:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A3ECB615E2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610721;
	b=mE7Ox9ehtJBtyzL9q+zsPqK0YPjiut0V/JMqbuvYO+fiKEWXrmLvgKex26sP9JzwkDcp
	 Kb9AhxOyjD8PG89WvyCn6hkn+BMhxk8O+7twivaH4rMDRUhvQFltKuYYN92n1KSgMsbNu
	 orpQJV9sOHq8y2bEcE9/9/VoFwzEe+JVki0Eae8KBynYY18jlCdrY3xjKgapE2vsPm+Ce
	 oZ8hZZ/1HhdxFsH0nr6Xpop2E6/IhntXr9idi+QOkcZRb/MhxaziUbYD6hOzHGzNAsVzn
	 SzJ6TpNpAnbWojLcYasHFOWwma65u2YVC6lfeSoIRuicIOfU01m1vSFgX3yEcjxLDaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610721;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=iWrJ+kZ8nV+EFcgyVm2zmUKWAJJ8zER8PwBGi1AEgy4=;
	b=H/WwETLXnOfAV81xt2kRNXINJom3xv1t2AMlIB5a0MguQRW/FudrsKlBCyXw/OPjMFnx
	 u4v2JZmhRVl8OW6/3fvSE/4iG1mY6lGuwohexrNKZsQqMGvQAA8fP2v7d6BZkeYpYM8p8
	 HCnzKn//NvRArxvHn+rc8t+DBQBR+aFolwbEPXE6qwvGDv5GX8joZHEKIzCoJFwLr9z1h
	 hep3UvNePfPNVd4Z2w8rXJHRoHlbA35NenGBvC+qc09Yaf5bRYop9X+uAkgs+b33TDpih
	 9ivjD353oGAPudWPw4sz5DkGrJF4NwbwYSWJ1JnqXNHEp9Xaegh8RwK1qtzXTFve2vQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610721;
	bh=iWrJ+kZ8nV+EFcgyVm2zmUKWAJJ8zER8PwBGi1AEgy4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SJaxV3td/kE+ViNynsxOy1rMj7/tlk/QotiEoLERvT1/WQqrM7voW4DINuRL4Ddim
	 x4SbqSiwzVYflvmSg96tdF2zoOuh28fla640RIQ1nTk10u4UdqUKEcLSJEvMtRqadB
	 r0aDhgzhpajy2w+59XlD66MWO3QkfmhAMaTKOdIj8VCt+JH0G6lw6yDas16EPm6vzN
	 7SLWcP9NVOK40g96AsXnc9wWs0pVT6zFLpwE6y+lbZTi8m0sTEYOrKtCgCTLVT08KW
	 S59eFGXGCQYv3mGgQ/WqqJw9vpA1NdcDJmSMt6NF8s+NDbrrgpDPoEsAePBt9BvOK1
	 vG4CpxRLGpd/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3ECB615E2;
	Wed, 21 Oct 2026 19:25:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AAC03C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50356615E2
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-w98AIYmv8T for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:25:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5DF7A611FA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610719;
 b=tawj+bE1/Fw/eG783GEkMhuFJWqEq7kW8g27Y3I4QbwKOE+RfpVGW6k6Fv9QmEXDti3Y
 PJvkCJ4jz7FzRm055Sp2B2i4qIBVcRlq21YAazN8Kjh76xwj90vyoQXAiV8BI40ml+c/S
 eu5/8Wd3irBIzv41F1u/SeZ+wtzvsrxsWTDZw7N6AcKwYSJD8ZiV5AZOdkej3+/abNcd6
 7SLxz48vVokaum2OhUk/fVcZR0Af7JKtGAiyMUlGa4vXXNpTtZfddLUSqdUa9XLKV7hPh
 00EN/pZZyifAzP9W5pKC6KO2r7dx6EtKB65urKM2C+oLzP2qw9Nrcz3roVfr5LZHHww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610719;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=aPCUQYBBON6K2+IB6bqq08Ftc61WyGbRSF3GBZHDgIY=;
 b=YhFNe+D6Pf26hgxfiJBs1/P6n/4SLePPbKnKzxnggkvI3mDhPFGfgasMZkv+WLSMBLgP
 P/4414MxSU9j8crVVaZyhmAmXeUmiYov2Zj1gUjlZ5BR1naWK5ailUHP5GESDLhf9ZRtv
 kOFuIl3YwUtMRCkVzmRDtu0aYgN+sBozGqlr22jWusi3Wv4kNzFURB8nFZueOihKyN0Vv
 nz9lRaik+Ok+h6Zy9Z5SrcQNwK4aGF20trpyK1AekYHhKpq0YeefNMRlUpIg6L/ryB5ge
 m0WrSmrzyj9fwW2CS3QJdDCWq8IKTMxOSaBs2bWtwPOFrwxp0XDZGIF2r0haxwEZtlQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=mZ51h+r0; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DF7A611FA
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:25:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3888B1A12B2;
 Wed, 21 Oct 2026 19:25:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 074E4606E3;
 Wed, 21 Oct 2026 19:25:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8637810328D6E; 
 Wed, 21 Oct 2026 21:25:11 +0200 (CEST)
Date: Wed, 21 Oct 2026 21:25:10 +0200
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin@orange.com>, 
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>, 
 Thomas Perale <thomas.perale@mind.be>
Message-ID: <atkRkv1c2Yz2U_Lx@windsurf>
References: <20261020195145.32754-1-christian@aperture.us>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020195145.32754-1-christian@aperture.us>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v1 1/1] package/pkg-golang: use external
 linking on ARM Thumb
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 12:51:45PM -0700, Christian Stewart via buildroot wrote:
> On ARMv5, runtime/cgo calls __sync_synchronize, which comes from
> libgcc.a. When cgo objects have unresolved symbols, the Go internal
> linker loads libgcc.a itself to resolve them. With
> BR2_ARM_INSTRUCTIONS_THUMB=y, gcc is built with --with-mode=thumb, so
> libgcc.a contains Thumb code, which the internal linker rejects:
> 
>   link: R_ARM_THM_CALL, are you using -marm?
> 
> Go already passes -marm when it compiles the cgo C sources, so adding
> -marm to CGO_CFLAGS does not help. The call from ARM code into Thumb
> code must switch the processor to the other instruction set, which the
> internal linker cannot do. Force external linking instead: GNU ld can,
> by rewriting the call to BLX or routing it through a small stub.
> 
> Fixes: https://autobuild.buildroot.org/results/7534211959577546c3777939d11e411d8a417baa
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> 

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
