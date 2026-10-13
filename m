Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A15CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E67F5405F8;
	Tue, 13 Oct 2026 08:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUmOpTOP_p8z; Tue, 13 Oct 2026 08:05:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EBD084065B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791878721;
	b=OZ7xLIXA01ukCJLpjv3GjIpDuQOWdyzQKm9g3oqQC+9igI1zin6jGlREA6pUZyxfY5bC
	 yIH7MLuacUAhRE12CA8TdJDwGle9jLvLsKQeL+RNDuVPj04IMPD5afp09KcW4gqbeGDa/
	 DSEX9utw7NYSyFaVvJKUvWhqyQdqgrfb+66WBhqknURI4dUyJNGNmSI8eQYA0pWW8gQlx
	 LgdfKPG3Zk8UaXgT0srY6sTf/LJzXjaw2/12x+7J2fjI1WolcSFktdE9x/DOFfOv3OH88
	 nmqtJaAJGa0s4eym6SPLLLY4+UuIExbiZJC4/0eN4hpbhx7xcZ8p0jIvtCxOb3Meygw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791878721;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ucGCFi7H91tmeyrpvDYjq1lwT1MGznVlF+rzgRjobH8=;
	b=oQ/DHNxMwSsJ0/yQQTBitKhzS2ks/btLRqWC6ZsLKYQj4T0m/Ap4SZH2UyidHqPtSa2Z
	 0VK7og2xnZMe7pxQmCRsuMeumZo91j0VrcaC/53DksXBYlB9vqhO4VXBYEepBflUZI11N
	 OSl4fWTPn7ETVkZdQfNNVO3ydgmsrMqeIjNYE522Sxf2nVY/4D+JDkNrYA4/zIOgG2Zi+
	 M1CUASwIcPSotBSKTbYtbnIBtlxGgPFX+IlbrWK8fHTuB0MnGrryx4idJvucp5PbZJezw
	 tHSqcQ3SCYLDEYILnetW3b03eC+gTNX2K9/gnXjMGx6VPqHkfFRozK1ThVj/xSSX2Bw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791878721;
	bh=ucGCFi7H91tmeyrpvDYjq1lwT1MGznVlF+rzgRjobH8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mtqeabQt7xbzL6TUEjXBEHwe0K5Aue4gErr1EBzT18YOR2q1uKn5Tcjv/6kiM9Z59
	 XIZ0QK8iOcE7Nz01tqUXmn1wexU2fzZBFtG7i5CwVdRCmX4ATR0IGS3cuNZgDRshxk
	 LW6fiNwGl7gG8dx80zq1NSZrJf4A9H+SME8S3RZ1vpklFUTh3I7tNsil33sjGmFD9y
	 C/NG/vc+7UMtH3L3Z2ZBE2HsvykK4peezCDpFCtIKs/b+EDtEzF3bWD6Hw06wD9uGr
	 t/SgeprJI9ocMQJnkeRrt3I7joI+dfOlUjGCsWuOMA0RM1EauZ8L3cM7kFkJ4h6DS4
	 vYg0JyWhWiHUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBD084065B;
	Tue, 13 Oct 2026 08:05:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7997B788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AF0F60763
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkE4Hp2cfxHu for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:05:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 749F86075F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791878718;
 b=eDUTzrWJP89FKz7vlcP1zdh7oU1glwKNVs1wV4QRErnDTZysQkzXyloitfvDQPkYoDfG
 b2vxf6wtyfNlBslTgWejJtQOHXzG0PXz1troLBZpyGOTxYfh+rPVVAra/fsbOb/ur9egg
 fykrZuQ2T9bfyHaR8ecjY2hBwo9dYQrjZt8E41dPssvzZ9D9ltiPwOdCcrCA9MRU9HKRj
 BZXEr5QKm2jTyTkWGikaRWlG6hcOUc5MJ7YhrguMCEleL+xz6WAC6s1IQzYdxgMwki5Kr
 zB2rZz64eAxenFZgsjQMnfVsnZIoZPA9R2UKP9EfY0zMBFUy6FDd7+xNR7IlKThBewQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791878718;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=KsruETLZcLMNOshYRh13x0e1MCPIfPOrayJUv6TaV+4=;
 b=bVhrpa6WWFHL4FSHT9DNMysyVuIv7Jl8vCq0VDRxvvCzg1qwtMIaYIQod7S1t8d6A7xi
 QtxEenEvJRNDzbEJ0/NiHAy18Wh2GazRcOSjjH19qXeIZRUFZ1Qslx3LLxjpRRCMqSQWb
 sBhED4Bmi9MhwmRha/RlGNxry2eMFocwZjoUcpbcZvJBZ7XMRUg7/dtjga2vhrGElKaDN
 yaT7p9FFx7Ua30Ay2FRzhBPM/g51r/3gxp8qN/daMpOEXDADC2HBLMp3KlF/Wvu/mAAZ0
 Nc9QrnT8h+NEg4S9qA268CUj1GRMv1lp9+F0L7xQof9BOLYRJ4wlgV6VQS/jnGJIfWA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=cD5G9GWU; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 749F86075F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:05:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8252A4E411D2;
 Tue, 13 Oct 2026 08:05:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5721160362;
 Tue, 13 Oct 2026 08:05:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 83A7611D70160; 
 Tue, 13 Oct 2026 10:05:14 +0200 (CEST)
Date: Tue, 13 Oct 2026 10:05:13 +0200
To: Bogdan Radulescu <bogdan@nimblex.net>
Cc: buildroot@buildroot.org
Message-ID: <as3lw8h7cEQnb96R@windsurf>
References: <20261011185735.3200892-1-bogdan@nimblex.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261011185735.3200892-1-bogdan@nimblex.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/nettest: not available for the i586
 Rust targets
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks a lot for your patch!

On Sun, Oct 11, 2026 at 09:57:35PM +0300, Bogdan Radulescu wrote:
> nettest depends, through rustls, quinn and rcgen, on the ring crate,
> which refuses to build for 32-bit x86 targets without SSE and SSE2:
> 
>   error[E0080]: evaluation panicked: assertion failed: cfg!(target_feature = "sse") && cfg!(target_feature = "sse2")
>     --> .../VENDOR/ring/src/cpu/intel.rs:26:9
> 
> Buildroot uses the i586-unknown-linux-{gnu,musl} Rust targets when
> BR2_ARCH is "i586" (i586, pentium-mmx, geode, c3, winchip...), and
> those targets do not enable SSE/SSE2. The i686 Rust targets enable
> SSE2 by default, so ring builds fine there.
> 
> Make nettest unavailable when the Rust target architecture is i586.
> 
> Fixes: https://autobuild.buildroot.org/results/d04f770538412bee77851142ee007f2ff107e0ec

Could you trace back which Buildroot introduced the issue in the first
place?

Adding a tag:

Fixes: <commit hash> ("<commit title>")

would be ideal. If the problem exists since the package was
introduced, then you can simply to the commit introducing the package
as the commit being fixed.

> +	# ring needs SSE/SSE2, which the i586 Rust targets lack
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH != "i586"

I believe you should rather have a dependency on SSE2, like
https://patchwork.buildroot.org/project/buildroot/patch/20260617161331.141666-1-shirokovalexs@gmail.com/
does.

Indeed, there are some i686 platforms that do not have SSE2, and they
would continue to fail building even with your patch.

Could you work on a v2 to address those two comments?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
