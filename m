Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DE4C982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 072BA40763;
	Wed, 16 Sep 2026 21:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAJ_qa25Mu10; Wed, 16 Sep 2026 21:02:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 36F514075F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789592570;
	b=M7HNIwm9XCDHeQ0ctO2T0Iv2I9+WgtdwUc7QjkDQqk3NEfmjOv4jGYyvpZ0GFQpuZUhi
	 zze4CXc00H5Ut6XDrQT3f/eCWuhXWX17MguzEn+Dwviv4YDBbDSxvSPYPNqEkMGOx0la0
	 8t7cxSWJlBdivoNWp944EcjYE7zv6LcXful4GmkkOXgNUplsBNha/T7TUhpmh2bbaaMm1
	 7gyG+XZViyc05JqSaIcfJyppWmPoYCFRcswIP/1nhmgmjzicXuR6Daq8W9PBEZi5JAVpV
	 4P1g8vjBg1INjxOBNGuotAl2Slt1ZjE0mLnuPsw+Ki2EGKfpY7csg/1elBs2ilEm1ow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789592570;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=p2DK0rxWQrc5cWlupXVH5QNebOeYbZJM6cufNgdeDCo=;
	b=MNKdwi5EbekcUuzWol93UbtKhmngvl6XSCwHbzOlJe0v+rAa/lKxMEmq6HGpFUEkR7Zw
	 Qp2tryEEVoNuP4u58ws+uzzT2DM71mNG4Vvmr/XELhY8suEeETWvME+fcp/z814MNhAk1
	 +wkYoi+FG3/4VPZUVn4x1EAvUL19ndEEJa4UvPPRePv/zjUEK4ahvnQ8e7mIntIcXrsfT
	 O/ZXNh0Lp26BVj/dTMPhNQInJrgp/isTVIX819wGViapkgEhc1IUELhXcXnJDtCvHDdjq
	 kuOxzndw26Iu9aNeAUiD0WbUHotbnuXCeq/8mJqd38uw3dHbOyYmvy1lL/95Nue0oRw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789592570;
	bh=p2DK0rxWQrc5cWlupXVH5QNebOeYbZJM6cufNgdeDCo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FVtE0hCAPR7721UqUzbfNSp4WaB1z2P+lyTaCtcDrP8kcbBDdQv4w+HpAfAVye8Lp
	 EBVkZ3dajqkABIdUlGh9gokSUAw0mpHAcy/YzK3CZ9qsodfcWD/VFE815xVpnRDiAs
	 WOJG4dqspF2/XzqCtLaq4aJcHubJz1cAQl514m4xMJ5TUyWidE9EG9z9J+yIPAWXv2
	 iu8TIfCn8Pa6CkCrLewC6/1oYThWMadSZJliHvJj2hD8ondKXuzXbHldFrImduiige
	 0ISuAaGEChXM9aMG0GOLyp5s+y+FeibTuoEbRsKaYeeFX/5NCKUev3HlcshYpKF/Tl
	 HNVaHV8+23BtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36F514075F;
	Wed, 16 Sep 2026 21:02:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 677B424D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58A424065C
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eG5CMdPgki2N for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:02:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ED4D14060A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789592568;
 b=KGF9Y2qeuoDTOJSfwvGDz6+on+I1Cx3W18RYT+v6ktNlTPRU2/fBKQNzDNlIQBzn1OaT
 +LY1KuIkEkhdTezFoIxSQ1d2uwGGo4vBOcg6ojDa3uqv/7Kd8KjL1G54thsVK3Z8oaOLb
 n2aE+0T2lKMs7Ax/9d3Qkjj5PTjMMkP3aU4PblWY6Fu7/IDHcJADxkgeXhbKZdmdWDgKY
 ULjSFvoDcDPh5uVpkzhYMkPOckjOlNvG7Hr2zUO6mcr5TkV5Rqv0+jKYJg1vUHgXGRrRB
 I+WIpfF29k3GQvrbNPZMe311i2sZWWuby4A8D3SSHF+zWazXLpJzr6f1MwI7GvVif8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789592568;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Q9Idoz6fICsflPbLInT3Keti6dm8Oj+Y3Jl3b9bAYZU=;
 b=nBTg29UMfqQ6mDd/BIjpwdL0cA9I8nBXAIJWYwcZyG5h4+mjPJhJon69sLKrm18WnB9p
 NvFi40yNzzOVDn1E36GvqNAGHcYHMasRh3Fo3uEFEp1XbAJbxno4cD6C6glHN55KnKnBA
 z6L+iZUq+Y6k7O9InR1Dzb2TmYok7EpRiwQvBlN8UYv8NcSlCdbqw4kIhsqlhxzuoOLOM
 mkeYNsMYIXoq2X7vUK4joX9yAWGmXhYJQOY62+pUu3YExJcgR98m07JWD/omkSwGIKBNy
 9AEWFA/M+7GICPmvZNciK2iM/T/6+uD1PfSRU03GtzU/hxY+xVz8w3wJLUMPBx+7ahA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=khuIOOfZ; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED4D14060A
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:02:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5FC3A4E40754;
 Wed, 16 Sep 2026 21:02:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DF4D960337;
 Wed, 16 Sep 2026 21:02:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0AADB11C79C1A; 
 Wed, 16 Sep 2026 23:02:38 +0200 (CEST)
Date: Wed, 16 Sep 2026 23:02:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Message-ID: <aqsD5sSzZmkl5uha@windsurf>
References: <20260906105309.3690634-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260906105309.3690634-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/exim: disable valgrind when
 building with thumb1
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

On Sun, Sep 06, 2026 at 12:53:08PM +0200, Bernd Kuhls wrote:
> src/valgrind.h contains inline asm not compatible with thumb1 so we
> disable valgrind support for thumb1.
> 
> Fixes:
> https://autobuild.buildroot.org/results/720bfa00ca926a398e901366e7ab20d08cfa9a81/
> 
> Inspired by buildroot commit 26013972ce568e55a121c21a55afce45bc0675e9.
> 
> The oldest build error of this kind dates back to 2022
> https://autobuild.buildroot.net/results/85d/85d8e725a31bc1a3c41b2e388a17ff439274d437/
> so a backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Series applied to master, thanks!

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
