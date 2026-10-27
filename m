Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E7A606A31D
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dUk2qQAd
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84D9780F91;
	Tue, 27 Oct 2026 16:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gw-3xKNjtQuu; Tue, 27 Oct 2026 16:12:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 569B480F72
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793117579;
	b=tcZyt1Eeif38GsVK0Gy78HEV5rCEC6mnzA8VRKkzvqdj37G2b47sXFcSIsA+72aYzs3C
	 BCi48gEmb4T7V2+ltPW5JewNXmnnYgHAhdHfYHVqz7UX5s0H0LZgFpCpONK7V21B2VVCO
	 6LLJuTs+tSjpWrvjyyU7MaZHmzjU+C7mCX+fsS/eE8E8kTzmd9GGjLKZ02ojhXVuDFTFl
	 0zdq/WUcPXiAtvBDcekjog9y3tDJsHRlYoz+c6XvBhPAqn0yp5rlLuE5h7ZchSYHwZsHj
	 Sa5/UPj44uRHNuA+Am3xvQdzb5IgJ2l/lFxQnnBcwgyNQuLxUrYdLyggw8vZYrZd4PQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793117579;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SSMH5Q6sqARcra9KhMrtLseykJHIE4m3KfzhDDTlHVE=;
	b=AX5bvVvTMt+wYJdBywdbv0dj0XcnVivcJjxRlvLSO2AjsZMtGF7iNQQ3YSC9zxuogExn
	 LVkAfJe+IVIq8QEZn5b0jK0Q7ppRqUEHVVpNHniNluA8+Ef41L6tqEIYwouM10krIlF7W
	 e1BbL2qf1VO98DAD0lNCDz11EK1sGSuOBHh8Usv+pB76VZBk/mIA5iO4pFp+raM82MzAc
	 04Ls6LouhV6y8IR7MmIRiA/J26LlFr12wUB60gn3gVsL0Ad3AShUxJo2a4RceJm++zJ/a
	 zaUinn0FxscCRZE2jsU5lmHh/qCyCtGL3WOIzsiQ1nNagfaPEhHZy4Zz8OP1A9HZkKA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793117579;
	bh=SSMH5Q6sqARcra9KhMrtLseykJHIE4m3KfzhDDTlHVE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dUk2qQAdxapy44v1ogJSbEVREabu9ZYBtWacPmjCPYSuPb46bkj9t2btBzV/5MWKk
	 xpnkdRfLlqfVEbvqmMGWNF0UMe1q6/E2P3aMtkW4z831T4CDsZxIgCGK2bfnlMjb0o
	 x8r64oIG0ooYcepcHBZ/tbTFLJ1aC7hds6+qZFXfjGfodrl5lb7RhOla+ShyQT7aTi
	 sn9mxKX5yR7jF0zSP1DmsjH6QNQ8FInoxCr5BzgV/T0XoPz+ZAZe/b428b/Q9sRF9V
	 pJymYHoCur1r6sg9n7BcJHamg2+9cnxt4TRloxEWh4cfQVPOR6CdAyBIXWcLaQIrxh
	 UgH4xNZd1Xa2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 569B480F72;
	Tue, 27 Oct 2026 16:12:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6FED279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD9C64060F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3ZEJFwm0u0K for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:12:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6E9C94057D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793117576;
 b=I7d9lBNezLITlvmJmwphHuiOixxwBts3MpzIgJDp/vsyrirPtO+jOIVfazXFOnZ9qBxw
 B9GlYE5yXGPndgtNYXyqAQiwgAWIxko8U2LJ5yYJyVIuNy+e0u/EvqAzBR1TDu9H7NczG
 n9KwAHCQaXEufq5vPrV04pliBWCv1A6+StJ5hV+oIdZldj7AMW9Egg17dx30PV2fLyRa8
 RW2A3eKbHL1VGTveTYGT9WH7/GOGZMKUGC/Cpj7BpMThh8VWQbMdwWj6wXGdX4GqNv3Qr
 oFjzwtCtF7QCyx2vWvZ/DP+6QTok7maRr1+3AtW0bOlGcQsoJSUA3bfkuUArUN3xk6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793117576;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=4yNCOIgr+EAs/SLfnBLKbNZ98tFdawi2ZH1r4DbEiJI=;
 b=PU8Jha4oCsonDN5Ew/Ea8/EeetD1sJ/EZ+Stl2y8yNlAIKzh6Sa3J5qKGKTE9mMkaXwq
 Lq4fnJGLKM2AVZTMszJ4BEN4nW30ZvMDArKz6myEZRqNlUTKxiynAqhecKbhO3LFmeoxL
 sElRiBipGSydpYr0KTbBkh/kzd2BbyAOJx3ZSOvlMGriK0VensIIZ4Ebn7D1t8dqdmS9c
 T9UkVl9WHmLb0yTxTjVGUFz1jbAvoLQP+GoVaCdUlp/v7Be+ftvIzwVLj8CE4iHUYJ3XJ
 94k/zdouATeI4dNIDOa+Bfu2GzxM8f0AMDY5X3kxg2jFLBGw58yiCXZSCiUtiSst9Bw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ZdZgCXp+; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E9C94057D
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:12:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7AAF1C79AB6;
 Tue, 27 Oct 2026 16:13:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CB85A603BD;
 Tue, 27 Oct 2026 16:12:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA85810328A20; Tue, 27 Oct 2026 17:12:51 +0100 (CET)
Date: Tue, 27 Oct 2026 17:12:50 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <auDNf_ajKP43hfYv@windsurf>
References: <20261027063318.33340-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027063318.33340-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/shairport-sync: security bump
 version to 5.6.2
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 07:33:18AM +0100, Bernd Kuhls wrote:
> https://github.com/mikebrady/shairport-sync/releases/tag/5.6.2
> https://github.com/mikebrady/shairport-sync/releases/tag/5.6.1
> 
> Fixes GHSA-vfxr-hxq9-9h35:
> https://github.com/mikebrady/shairport-sync/security/advisories/GHSA-vfxr-hxq9-9h35
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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
