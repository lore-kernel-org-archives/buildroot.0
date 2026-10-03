Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE53CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 18:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5032B80F87;
	Sat,  3 Oct 2026 18:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQjEnJgO9o3R; Sat,  3 Oct 2026 18:37:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9F1DF80F77
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791052647;
	b=m+YAsefYEGy6HETcEDo4HqJio2zSBA4Xw/RibMQUIJjXXYCOKT/d5ajfESp/Q+kdZNEl
	 e3Zm8BGpm5auNkYD221rrLwggJt/lqtzFUMKk5Zsj3QfT6ou8PSZ/09DWY1OKh0ZoHp4t
	 r1yO8I9gr7Fp+QzJbp5teGpkIi+w7QG+NOjdF4+k/zsg11/9fHPde+Igo+ut4JSdZTrC3
	 8rnQ7M2nHU35DC3jwONRtvXLCjuqmgz72rSx54+DdjX4g33FEuR9uVzG9HC06Dj6klDqL
	 PyP1LxSXRlG1XdYzpi8wov8S1Qfv2fJIU08kWNmQ0ZIc7LETueldtdnRJClKG2D18Tw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791052647;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0CuFNitBy1tWy4KZeTjWsTRbJuFywt83t+wRBWiEbz8=;
	b=fkaGCfq6Gu+1p9tOrazqGvSsAw1dmT+OJwaX51+Tfzud0BCH8JPAUZFyv9riCl2Jzjz0
	 sfSl80IooCAEFnk8HtKGKc5JaGo2c8EXhhvPQlDc2VtMV4zLI1nC0JXyGHYxrWTVai3um
	 cG58PFbSExHTdgi0behUGUexWpHhl4m7mr58QghZNgJ1ExvnTw8JPKoPwi9Agt67s8Pri
	 GKwPqc8j8C79jFUoqBMUDU2ilvftvoG20w6kFEV1nxrZ787coPlOAjPUIoycFJeiTP4Jo
	 gyRtBchhvdeLhTC1PjgueYvjDloPCIjURsVe3ahJ3I17f+Dal49dGvESJxW/wyxmpOA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791052647;
	bh=0CuFNitBy1tWy4KZeTjWsTRbJuFywt83t+wRBWiEbz8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mi9+rj9596tzbZLtsht4g7cegxgh+5Uid07M27e311PbMQrLKGfnauBwaLuMKZ3q+
	 btyo4QbzXE6J6JwgT9QXkHaXrlxzwaPLnBMp4B2FlgiTvo7jO+6L4B5TwU9BpCb9Zo
	 QPHsmtcIlcclEzUdT7UJJepoZnQs4WKf1duLRbp/q8xqhALnwptdSlArNq515/m4M7
	 MczqcpKZEUgabt5CDlFjMBOODgG5Ho2x4Abd8nfaKMoGJJ4sxG8gVERtbuVn0dza5y
	 a6hTEUytx919DuIYF87p/ul7yUwqQSwyodec8w3/1FVq5gvMp+/rtqrGFxWjTrG7ai
	 uMtX7SKBAtlNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F1DF80F77;
	Sat,  3 Oct 2026 18:37:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74A7F435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66BA24008E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3-Z0IfHMn8Y for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 18:37:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 01CB940064
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791052645;
 b=bNyBfrPcJHRK+tWAK8OIFUDU4zi76PMcJXahmHuM3NBxzhI/NRgOaCSI0ycE+c27Afhb
 AYq3xf59e9/FZQj+Lv3ixra/YHMcdjCuxSaKeJjN4Dz+3vpC86Ne7tsxDc1neOeEJpf72
 2FbOB+6h2FDycmfJYs8SPnZr7hYnwXeGeAczKANsIXB77Vg3x4bDT5V+6zrS42hsDtti0
 /9jSQg6b+pEJEgpv6IV/T9ZqH6efBzmwONZhDbioUS0eM4pJB/oUWdxGjs6g9LOMw7o8i
 IQPkljZtJhBF4qpA5f/jv9wEVmS/kTGuksasBaU/NUItl5XvvRTLtnuwclcc/IL3FNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791052645;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=mBYM6lhn9TB26a7DNXH/bQXeWM00xFwtFnh1LQBD22s=;
 b=dxp0YHGqcq2OHLRjQ8QPRX6Kpv5kuX/Ib0wj2O3G3DS0dFKYxDQBmk1Sf/tAFnTXNUAH
 EUcrp6/lyUWGK6yFV6+MIKApO3GVh0mztOIyzCIhZzzPeMr5bwPS7MD0eV8EyVVbYQFy+
 RCzHFhjCDPM51pRd7+2cfD5p326JCcwbExMx1HSZ+05L3Y5oMK/sE8zBVsw+QDuiGzhUV
 6a26Zw8+cduEvyypx5CoHQiVdoXneRSWw7AKJhVAUqvny7wzeUA9LdYXAxNR42YLyoiZt
 8s5TITXRpOqMkSpCauo7GEP3jgisUi8/E7vdvMMo/2JpzL0aVPcZuS3YvwSWIW6RI3A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=kXosLSsp; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01CB940064
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:37:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CC6721A1106;
 Sat,  3 Oct 2026 18:37:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 99179604FF;
 Sat,  3 Oct 2026 18:37:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6BC3D10328170; 
 Sat,  3 Oct 2026 20:37:20 +0200 (CEST)
Date: Sat, 3 Oct 2026 20:37:19 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <asFLWqOxU5fmhumS@windsurf>
References: <20260924131533.2302137-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924131533.2302137-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/swig: also create a swig4.0 symlink
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

On Thu, Sep 24, 2026 at 03:15:33PM +0200, Yegor Yefremov via buildroot wrote:
> FindSWIG in CMake searches for swig4.0, swig3.0 and swig2.0 before it
> tries plain swig, and it searches the whole PATH for one name before
> moving on to the next. We only create swig3.0 and swig$(SWIG_VERSION_MAJOR)
> (swig4.5) symlinks in $(HOST_DIR)/bin, so a swig4.0 installed on the
> build machine, as Ubuntu 22.04 does with its swig4.0 package, takes
> precedence over our host-swig for every CMake package that does not pass
> SWIG_EXECUTABLE explicitly. With CMake 3.22.1, libftdi1 with Python
> bindings ends up with
> 
>   -- Found SWIG: /usr/bin/swig4.0 (found suitable version "4.0.2", ...)
> 
> Also create a swig4.0 symlink, and update the comment accordingly.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

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
