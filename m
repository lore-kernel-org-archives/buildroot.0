Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC70606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SgYPixRF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12BE080D43;
	Sun,  1 Nov 2026 16:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WohDZBdx9ygr; Sun,  1 Nov 2026 16:24:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 13D2980CB2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793550247;
	b=EBgYfXmREWRML2CnS9c2cQN11mY5317byWGJr89b7ZvPr+g/lzMWmHt2r8QvX+/oxerl
	 2QHFvMCxYCZGMBS1hjb7XOOOH7XjqkTSAEHbWCJkxGqkaVVYPeHMtQ3irNAazkMsUugDY
	 SIYOdAVXH/XdRnEENggUeVdG7DK7pYjhCpXsOUFVStdMjNTi72xGPkbJrJwBoKCUTkmRj
	 +loVclOf7sKZfqEGWf7G+5+gjLFjNcWmC+Few8FvS4zwSEaAmJn2yGKIZKGeCg2OycE7Y
	 aJ9vwpVcVX8UuiTewPee1cielLUuJSrDd3yVkdhZqllfbZenClFcSvZV0oMYJnCPgHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793550247;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+fTPvp0UhGajcsjzOj8YnJxlcyWZzadp0LAghFnxDlk=;
	b=oI4pK1+QlszZg5lg+JTKUqFIHeAMiLFBw8ZrdBy9u1qoPceEntx0ZGwhLD5MZMuB8aI3
	 a6C3+804YGPwBSZebcGmVwd5ECd1HqGj+m4rNtI58q3rzXfhxkNYAqGoRQvjU5Eg+S8oJ
	 GxYJk2t15gdhEBWGtF1aMMZ27YZQpZDA0jaT65YAsW7C40+cSN4zXwlBX1duOQNGEQhUg
	 /b1lVVDOdHZH0c3X8ynbxEoCkQxAVQfpAiVuV3+07LUOhffiaSIw8wtJaZvXYx8iJO23b
	 P76aQ0E1a2hxBVcQAy0nErx6vFo6NUJIoQus+EE6pHQoqAkLPjt3ZLnlSrOt1Xwanpw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793550247;
	bh=+fTPvp0UhGajcsjzOj8YnJxlcyWZzadp0LAghFnxDlk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SgYPixRFz7HXM3Vz9frMGNvuOMsZlSF/t/Qe+Zs8lqI/aan2lbnCW39QQLMRxX5eg
	 uDUx628gn125O0CwgaoUot3QwBCsGNccMy1v1ZIXSi2G5pNpiXuzcj0TXyGYPS0GfC
	 C5fH5XMGs/GVdgzEPPf568Pw2yRqpFY3kNuPJ0S4OrxegrmCTBsRRbJNEAQD9rKBI3
	 gaV5O1Fbf9Hkcm1OgN1qw7RtOztygc3Loh0QDCNZdrGKcH7PCUxy18xU7LRB58StiT
	 UIK4MYZdIANkgbnwgbb6fvXvz11/bxavACo/Ik8Dy5UOW8ETfFwyY/CzF8bx36g59z
	 JDhIPb0vtgEzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13D2980CB2;
	Sun,  1 Nov 2026 16:24:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6E7D3A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8AEE80D02
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJULAVgFqXSX for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:24:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 128AF80C97
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793550244;
 b=OeVd2gZfxs6AGlIcOlEuGl4zE4mBdNSLj8s3MXxL3wN5kt+twPPUv4DleRjCdeVZJ059
 Vezbo/66Kiz5VUwibXw4hYqnCWRftRU/z8EbL4D6Ups0EtSD3VzNecCNbuY9RsmKaOwn2
 NUc+1jXTnH4OC2iTpj9ItMBz3d4cCCrT2m9oZz/vF1XovLy81+uqN67CezQfXQ6EkDi2B
 lzA40dtKOPzHuvQ4oe1DvLLCWY58OFECIk4h2H5MSReZgSPUNVD6MD1zP2kISN3azOmz6
 n1+a4W17phh33H5fsuk6CON5wma/AqWbw2Wp2ZpW1/PP3xwN4jjfSHPpvOOFcZos9Pw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793550244;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ERGfCm6dZfWElrJfHo9a45uQVJxv0YWfHIX5Q7mcbDA=;
 b=qkgHmPcjMHRFbVuxG0eblF4Firc7ejMPZgFDbMW9VfMZfWZikBv2De+7itjZo0I6/snt
 2la8AP2ZWcWmX8Q6RWP03051So6AmuOcq7fLOJXOW5kr39CetphB/sFcql0v7ABWOGNkP
 L/5QqYNR+z1tUUEPZICYm+7Cy4rhgGJkt035OeoXl9y9hfEHOd05pCWkF/THL3H0V24uR
 1LHsqIYdNlAlyQrFE+pbfK2w2PxSpBJNismQzp0OGzUNwKDlx8gAdx64oIT87kfIFxGHl
 5BPwdMuMqOvRCy15Po7bgXQ1PM9VBhipkT0KjhVKUsuAVeBQHzVDq3MuNSsWQt0POyw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Td0IijCz; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 128AF80C97
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:24:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2F986C49F76;
 Sun,  1 Nov 2026 16:25:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5D0E260750;
 Sun,  1 Nov 2026 16:24:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7B31B1032912A; Sun,  1 Nov 2026 17:23:59 +0100 (CET)
Date: Sun, 1 Nov 2026 17:23:58 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Sergio Prado <sergio.prado@e-labworks.com>
Message-ID: <audnmrBROqVImdu7@windsurf>
References: <20261101102813.2047542-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261101102813.2047542-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/wolfssl: fix build on MIPS r6
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

On Sun, Nov 01, 2026 at 11:28:13AM +0100, Yegor Yefremov via buildroot wrote:
> The MIPS assembly code in wolfcrypt/src/sp_int.c uses the
> multu/dmultu, mflo and mfhi instructions and clobbers the hi/lo
> registers. These were removed in MIPS release 6, so the build fails
> on MIPS64 r6:
> 
>   wolfcrypt/src/sp_int.c:4217:5: error: the register '$hi' cannot be clobbered in 'asm' for the current target
> 
> and on MIPS32 r6:
> 
>   wolfcrypt/src/sp_int.c:4418:5: error: the register '%hi' cannot be clobbered in 'asm' for the current target
> 
> BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS was meant to exclude MIPS64 r6, but
> the mips64/mips64el conditions test BR2_MIPS_CPU_MIPS32R6, which can
> never be set for a 64-bit CPU, and the mips/mipsel condition has no
> r6 exclusion at all. Test BR2_MIPS_CPU_MIPS64R6 for mips64/mips64el
> and BR2_MIPS_CPU_MIPS32R6 for mips/mipsel instead, so assembly is
> disabled on all r6 CPUs.
> 
> Commit d8dc5315eb71 ("package/wolfssl: disable assembly when not
> supported") introduced BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS to fix the
> MIPS64 r6 build, but used the wrong r6 symbol for mips64 and added no
> r6 exclusion for mips, so the issue was never fixed. It therefore
> affects 2023.02 and later, including all maintained branches.
> 
> Fixes:
> https://autobuild.buildroot.org/results/10c901b8c57f6322b127f1b14c78f73dbb7f28b2
> 
> Fixes: d8dc5315eb712eca0a5cbf793a6714a47ab6e57e ("package/wolfssl: disable assembly when not supported")
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
