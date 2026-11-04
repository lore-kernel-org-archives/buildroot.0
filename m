Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8181160A3831
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RSPJMjLq
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14D7340958;
	Wed,  4 Nov 2026 21:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wVaivaIWMLGQ; Wed,  4 Nov 2026 21:12:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9D0BF4089E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826740;
	b=r/Q3dDO+1IUKlY9co/nY2dRKAMPrq2VxOM9ZxszVCQGkaf83XXXZeIF3PUyxF3/qv1/w
	 N0zGLE/XIQbHPSzuieFgjYPW9FASNIzZE/sw8nYXU8zxC5ZdQtEMW3J85RKNIw26zoeRi
	 8vvVmHkCowFE+5/HaVgqPDrzfkcn9YdvFSukqASv1hRzenemRePPLVqWoVYCKwXvSdk1i
	 BMVPnRsxRneEb2/rvWT/N1aiIwcYhze3sr1JsV8dOjT16r50UolHwZFFjHZ4V3q1dhB/4
	 1weOtaEwsRqoT00I7jS+vDg2P7ytut8oTKCKTtTEop82EMbkUQ717W3oxh/8fHbQpGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826740;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IdstPyQIDg8JFMdavATqwd8zG5w5/j1/L24maEx0jgI=;
	b=eJVq8mBGZdYu+8V+3SeIvGmvby40Wp8oO15iTQemS2L3ocUjDEkK+xPzBrxcQcRTB12w
	 0EtdrLlAv9qqTTJ8l16qglXcTA7InvE608vn/FS2XTL0dxLoeKRwaia/g4sF/FpBeS74s
	 RbnApcfoNUkRTol6gLZt1QwZIrw8pb/GKI0LtnuAW8AL7CZtTnL9Uo0mNFh13/sbZCAPy
	 WNwZdoo0x/+orUNvGSXUxiMT8kosMKilg5D55xm7xMK3LQ50d4CwANYfilhMvS8M1h3sj
	 oR6KtkhkOXiJAE+tq+R0DDUP6tZ3iPqkOElbUvYP1gPXlgr1joUmtqlr596bInvSbrw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826740;
	bh=IdstPyQIDg8JFMdavATqwd8zG5w5/j1/L24maEx0jgI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RSPJMjLq/CLN7dSVq4AMfIN9VoViN5wFs9vwjnnB5ZwQoxFj6tkI1C9JteSZBehtT
	 sZ9B30B57o8EMyaZ9u0RgpkHUSaYfdmmfFeeUA43MNvk4nHFNxvKYu9QOjKPusWrAD
	 YsfQMzev5IBg8215bAMMmJjhr4dNVXp6DVqJ+FrPmk3qjoSug/9GpTpQLM0m1aFLaF
	 gkR7icZR3mWwGmbApfrHLfp6qUIAWnJ6GQTBh/cUEBtenRAnNJotzEIEvUGSimr06s
	 Qya4NBiMb4lonc7y9uGZitW4methyR3dtEjVVYZN+rAIbjZLSa2jKRL0mJmBvh5Fsu
	 h+7m6EHcnZINg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D0BF4089E;
	Wed,  4 Nov 2026 21:12:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B471E362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99F2680D34
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kq-dpiG7aE5E for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:12:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0CBD280937
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CBD280937
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:12:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DEC3B1A03B5;
 Wed,  4 Nov 2026 21:12:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 96ED85FAEB;
 Wed,  4 Nov 2026 21:12:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E01310329248; Wed,  4 Nov 2026 22:12:12 +0100 (CET)
Date: Wed, 4 Nov 2026 22:12:11 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Pascal de Bruijn <p.debruijn@unilogic.nl>
Message-ID: <auufqO0iS21z6WIP@windsurf>
References: <20261104082735.4134892-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261104082735.4134892-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/linux-tools: hv: fix build on
 non-x86 build hosts
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 09:27:35AM +0100, Yegor Yefremov wrote:
> Since Linux 5.4, commit 9b5434196529 ("Tools: hv: move to tools
> buildsystem"), the Hyper-V daemons are built with tools/build, which
> first links the objects with "$(LD) -r". We only pass CC to the hv
> build, so LD defaults to $(CROSS_COMPILE)ld, i.e. the build host's
> plain ld. That only works by chance on x86 build hosts, whose ld
> handles i386/x86_64 objects; on an aarch64 build host it fails:
> 
>   LD      hv_kvp_daemon-in.o
> /usr/bin/ld.bfd: relocatable linking with relocations from format elf32-i386 (hv_kvp_daemon.o) to format elf64-littleaarch64 (hv_kvp_daemon-in.o) is not supported
> 
> Pass LD="$(TARGET_LD)", as already done for rtla.
> 
> This issue has been present since commit 2703383c7201 ("package/linux-tools:
> add hyperv integration services"), which added the hv tools while the
> supported kernels already used tools/build for them, without passing
> LD. It therefore affects 2020.02 and later, including 2025.02.x.
> 
> Fixes:
> https://autobuild.buildroot.org/results/86c33797a5f09dbb1162a554cb6019f7c0702fbd
> 
> Fixes: 2703383c72011d38a1e3559cb7a5a2b0071b35c6 ("package/linux-tools: add hyperv integration services")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

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
