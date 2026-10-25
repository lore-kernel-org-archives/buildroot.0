Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107F5606A31D
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mG/0J709
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C7A605E0;
	Sun, 25 Oct 2026 20:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7x191Tz8LP2; Sun, 25 Oct 2026 20:53:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 227706061F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961613;
	b=TP0cXIX92XSsmZWTRuxmHDTet9XSUVQbiF1Sw/FlRPIVChaPDfJ5Jqp88vZe977EeJiL
	 OEJBNcsrImfI2dhVcNlDGu0+bJwwkeJsACCVnGSNynHZNFbj+aKsK8Slrw0oRwF+LeDOm
	 LqoFfzoHWt0FaoFmRIOwSaPQHiTaZZ0sEVoqivAK0FV4Jr+DlhjAuqJHW/JPoTQXE9WRO
	 hoTgH39dFhKgg6h+iGIvRBCGeH1avLd+WhgDQ7h5ECztL6wf/jFFrBnxDzbrHGi2Txvid
	 eDETiQ2AsVMsE1P6fcE5iElSz0JnQCyeHaW3zwDJ6fZY8Vqpem8I9EpB4BZvmLBBLWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961613;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3TT08kr90Q2oysqvrOTUFaPyfH0kCohs8kss5XK9TlA=;
	b=FyN+1DMnojICnLECsIzbwQHehfwj0xNEt8yM3Z3PoBttr07VcBpRViRJkuIp+5U0uSyF
	 1Imd52Rmwfmt3IU9yWsf/eqZ39b+SOwP2VFZhMbtvuH8nKQNkfdDYQA1R0lJV7lNHejJT
	 tKrZ91Wp5EC5tt9KcEZVGB1JZ+TW0EIYmF88BtmtREgXuYYO3bQUbv7gItSGOjA3r/hJI
	 5QPYmZFrP6yr+FKw54HClFazqCC+ehux/0aU9sw2EJKUR86B17Py8msoGEWeFWTUVhPPp
	 y1pHEqIXZxiH2g2vDMr/WAzs7OuhzAwX6K5lHc0ZjNwGymW7didYnkIC5IJlayio7Fw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961613;
	bh=3TT08kr90Q2oysqvrOTUFaPyfH0kCohs8kss5XK9TlA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mG/0J709/Mm6cRf5nYTjwh+flxkDlMQ6zrqJ+GCavmAcldd0bpl4BXHzgJ2E2grJc
	 RzgHv8SEcSGSrANSAx0yN278cSGPzP3T7njikp1KrQ5VmbNysVpjf9lLj09P2XEXaf
	 fLAwc2J29K6SbQHDeJKFhfSVmCQLeADBPMQtMZi8UjdBkjRUFlzPmlpc8EoPLtHgTa
	 tOyicP8MqFRG4YZWnNyMyKwpS8j5W3CQMF+lOv2LyFaSV8zPb2pSZoajh2ZQovH6Aq
	 rpUp03ILMk97IKCSjVIhNflvVaY7x3I/a4MXVtoX6vpEhttLWpwd+UGD1dbobG01aP
	 AC2xH9VjRFuEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 227706061F;
	Sun, 25 Oct 2026 20:53:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DAE6356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B15C405F5
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2EAwf7zuGeS for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:53:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 59B6D405F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961611;
 b=BH+NxEYsQV2S/tqGq/sZLxldPgATjBC0u0WjcSUigoZb4BRrInaHHmIs6QGC5FZ4Gd63
 DN+sQO6GwUBag7csa12SuKxB5DsM47hAs4bYP2TvDgMJWCHYEPP5eF0PI4HDAYArLzpl3
 qJqUfVb08UxYLSRxGD3z3vFUIicuD0Tx3ElT5+iX87AgvcBGfUpWmmfNNYi/63NKKrV9b
 baITeIYgA0j1GdB5mR/+z7sEzhc4epqDPo5cjYdQogEzY4s34QWT7Ea1WnG1PP+c+2BGA
 5MzPV7jZ7ZfG/r9sSto5uotpwoj0oFpEcXeqtRqmB3GG2gTUGW39ejE8MecZ3zlfG9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961611;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=ZqMHT9bC2l/g/covs39sfj3kW3d9UMmkjQXGkMa8vZE=;
 b=RTjOe5+s5hu5urVZLROh/Qk/petIbO7w/D9iYw4lFS2ehxyy8iF9q0PfjHECKEPOICQT
 3SGRgPsYOp4W/Ng6IGx+ulpdpmE1m7cy+WYIXoH7EbkaMpRG0EhAHzhPwZbHKmeUEweI+
 lgwZq+mB6r1WyAmedRNzJ05cRh7q5JkuBfyxBnlYi+Q2pOeoD19sG9/x4FqRx87JqTqPJ
 nilKp/o8t0AO3cLi3AtnBEdlyTKx2cFauCRWYhljME6vMsCVMB7lWPJ7BUWPZ+H/ygZfr
 v8vcdPgLduQmVyzyMeWBpNnvQGybqxn7xnlHL+h4HFi84gLBAMm4P6sABJwl57S29zg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=amdfq1VR; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59B6D405F4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:53:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B375FC51477
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:54:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CC4AC60740;
 Sun, 25 Oct 2026 20:53:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 200BC1032902C; Sun, 25 Oct 2026 21:53:27 +0100 (CET)
Date: Sun, 25 Oct 2026 21:53:27 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <at5sQjx0NrD1lUxF@windsurf>
References: <20261024142121.4102029-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024142121.4102029-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/iptables: fix arm64 build with
 kernel headers >= 7.3
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

On Sat, Oct 24, 2026 at 04:21:21PM +0200, Yegor Yefremov wrote:
> With kernel headers 7.3, iptables fails to build on arm64:
> 
>   In file included from [...]/sysroot/usr/include/bits/sigcontext.h:30,
>                    from [...]/sysroot/usr/include/signal.h:301,
>                    from [...]/sysroot/usr/include/sys/wait.h:36,
>                    from xtables.c:37:
>   [...]/sysroot/usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
> 
> Linux 7.3 changed arm64's asm/sigcontext.h to use the __u128 type from
> linux/types.h. iptables bundles an old copy of linux/types.h, lacking
> __u128, which shadows the one from the kernel headers as the build uses
> -I../include.
> 
> Add a patch, sent upstream, dropping the bundled copy, as was already
> done in ebtables. iptables only needs __aligned_u64 and __sum16 from it,
> which the kernel headers provide well before 3.12, the minimum required
> by the iptables package.
> 
> This issue has been present since commit b216661a73f7
> ("{toolchain, linux-headers}: add support for 7.3 headers"), which made
> 7.3 the latest kernel headers version. It only affects master, no
> release or maintenance branch has 7.3 headers.
> 
> Fixes:
> https://autobuild.buildroot.org/results/3d3d40449ed637fc7cfe49872f35ed6667510058
> 
> Fixes: b216661a73f7b8e21290a1bc9033e7f9b5fb230e ("{toolchain, linux-headers}: add support for 7.3 headers")
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
