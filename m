Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8A9606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YcIka/se
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A59F80DBB;
	Sun,  1 Nov 2026 17:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgE2XCwesmIo; Sun,  1 Nov 2026 17:51:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4835280DA6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793555476;
	b=SbDArpLlicwo/lnNCYd0S9PTvhpWVYKGfta+c95Gy3NyYzTYM1hrsXRLiKNMalZQuOk3
	 woIpxqVAfQXRDCrjyuuW6YgCYd5JCn92czHldeKXfzQWI256yM06jeYOgmsUQf81JvQLA
	 6VkdsbYNyaUfVkrf3BDdPEa1CWRY15h16qL5hIcs3fntWzh2DlzDJHSCYxv9FpgT1gKJ7
	 Jfj812QlPy2MP4xUCvriNGbNj3o0Vpj2DRyDm52xHzx4wHhOiQsosPxWDhwAffr4RYTAp
	 ZZTQw7poB0c2vjKakq1jtL8DzLu8+urjA6scQtiB8ZI0iO67YQCdA458bEIfDj45tpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793555476;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hM5RxARulGCUjJGaMWNt5q7mhohvu0DRHS2y6/LSVvQ=;
	b=PvMN+QtIYdUN02vLbMdiIwapJlwe5fNJ2HL6OG0K2DMVM8JS0LK93XPC8DIj/VwQ6DDI
	 Crax/hx/+KnR7p5gmEVcWSk+EjcMEDMpj2JOKHtR9mazRldsOuq+osfMqTjIRxKeLRT8q
	 vR83dVtIm3c1rk0NRkprAPOoRJVWT34m30gjbTjYzvEXxbcE0eX2k6WOINs3n9kP0WfYq
	 Yz7ezXHZYBauqw5atcfu/WigzVhGP5gZI20J3q0AJA8KuGm93e+Ogy/uzZxTNt9BlMxHF
	 JG0zeP00fu/7zELPhd22Aga60mUh2GCkHcaq6+dcVqYST2dCIlhtaexz9LovjZBmnDQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793555476;
	bh=hM5RxARulGCUjJGaMWNt5q7mhohvu0DRHS2y6/LSVvQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YcIka/seJ5QkG28M5IEEf1nRTtUh+SRyBS2DeUsqf5WI2OPcZZFBmvVF/fVU4t34M
	 lRtIB1T4SA5i9MgcjVnuvSLYAh/iDn1ddv15eIgrmCgXCnocplduLFCiilNgfVeo1q
	 P6REW5L/W7p4dJT1ecsZL4hKq0CuxthXlcxifapcxrFXnjfsLYMa/cUEPLAgZxjqac
	 4whxKmZjljUs8n7J6mZ4Ew4ndIdx4D6hCwHIlsJdzeMkFFV0bXOu8USXFwPLVotquF
	 JEkowsauV7cjKTS9QRSMNDzb2SSL6k4Me++bfhbDBoJADwVxONX+l4qZTAYDZ82EmI
	 ZU24dFeGbZatg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4835280DA6;
	Sun,  1 Nov 2026 17:51:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 702E2323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5614040076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56j4KY27s9MP for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:51:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 058364004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793555473;
 b=DaStpkJNuNYghTRaqFqaJOipoJARa4sQu902UAzvhMbYOEfaYmvMHYymkxEm6lXQgD1H
 tKqWGH9u87heyD+ZQatHoBnoShyucnw+edreyF2eUFR5uyn7PTGZQDul5+SvBOqf58U7A
 ipgWHdGAZLIvO5jTTU7B3bVaNsMaKSQvIabO2ATAhEtqvOZYOGW06SPRSUyTog8C0SDSl
 HRIJTE6raxXK8eIMqDvJTT+gFCm+5VPQcTLVOVG6CWR7WDZcLdqb0dfHGpHXI8Fj9Hske
 PMA6R8RBSCnS5rGjxkoAOWBLx5eogzkzvCVllbOSA6qUw6YzBzZTZp0RkBckgA46VFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793555473;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=5F96HmpDM4tCyfJ7jTBeRnNOWNIlyE7b3AOexin59B8=;
 b=biQ4sTnvOixBaG84Ugo3RBCLXCs3TMzet/g4r8vJw1+yMVgO/VgFYb2UxTxsT/kKSa3r
 BAIgfCik+evFgcRZpzDybsDVK3l3LT8xFLhdEWetOOTVK2QASa6mukj8LP9p1nphBhxS3
 wzHLUZbEAkz1jzRCcr61knJmYNtMnYT1hMeZ1dRCsudW/rjd3eTFieYD9aVjxCbK0XEfG
 4SFICURY0oHyBRab9iPm6bENpuZTJa8lEXjPXU5RsMadAM2pafTQrPhJwlAhXzmscIAg/
 7E45SWNlk1Hnb2y9IOpnUUxmO1VwtGFObQcDMBB43lXj4bJF+HHMASBGu19txvOFQ+Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Xx32NPy+; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 058364004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:51:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 417401A13F9;
 Sun,  1 Nov 2026 17:51:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 06A4260750;
 Sun,  1 Nov 2026 17:51:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5FE4B1032855F; Sun,  1 Nov 2026 18:51:09 +0100 (CET)
Date: Sun, 1 Nov 2026 18:51:08 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <aud8B33ssmMsDOPw@windsurf>
References: <20261030115016.1094292-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030115016.1094292-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/18xx-ti-utils: fetch from the
 BeagleBoard GitHub mirror
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

On Fri, Oct 30, 2026 at 12:50:16PM +0100, Yegor Yefremov via buildroot wrote:
> git.ti.com no longer serves git clones through its cgit web path, so
> the download fails:
> 
>   fatal: unable to access 'https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils/': The requested URL returned error: 403
> 
> The https://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git URL accepts
> requests, but fetching all references, as the Buildroot git download
> helper does, fails for this repository with its ~1000 refs:
> 
>   error: RPC failed; HTTP 501 curl 22 The requested URL returned error: 501
>   fatal: error reading section header 'shallow-info'
> 
> The cgit snapshot tarballs, used before switching to git, now return
> HTTP 400.
> 
> Fetch the sources from the BeagleBoard.org GitHub mirror instead. Its
> R8.8 tag is identical to the one on git.ti.com (tag object
> 6e8dcab3a39a, commit b23772347318), and the generated tarball matches
> the existing hash.
> 
> This issue has been present since commit d8b15b078aeb
> ("package/18xx-ti-utils: switch to git repo"), which introduced the
> cgit URL; it worked at the time, until git.ti.com stopped serving git
> over it. It therefore affects 2025.11 and later, and 2025.02.x since
> 2025.02.9.
> 
> Fixes:
> https://autobuild.buildroot.org/results/500ab1e5fc96b226bc6dd9bd7c738e7bc9b9cd9f
> 
> Fixes: d8b15b078aeb9b9f3b42b9bdea91f2adff02fd09 ("package/18xx-ti-utils: switch to git repo")
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
