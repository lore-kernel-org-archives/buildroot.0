Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4AB606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 22:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h0w8cijl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 254C9409F4;
	Thu, 26 Nov 2026 22:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 656BAHZZMAMJ; Thu, 26 Nov 2026 22:26:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5A661409F7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795732014;
	b=F+W6+0E3nUtpDvYYdyygaP5+DxiXWZ7lj+f0lxnJg/1u7uD/VdGDB1o4y27+Lmdw+Htk
	 lg9uslxgFyRUFQJifsBNp5aeLxuPQxvl/hwLEjOvxqzQ5a3yR4kHGR5ktAd1vMST86fQA
	 2CLVu8TfMGsd/HArrhj+uQHg5bKqqZ1JlC+H0HM0bVyYyG7hEeDdf/aJTldHSMPABaimt
	 z0HxQzBEqmUuwLUw5NV95HwUznko0zanitX8y/cigHT8Cdx6RXl3oqZoLa6N44n9DUez8
	 atDMx5OoHi0oTCVBhCRefTj/60pa2QSXdMskTugEHIwWg0FMMnQ75dONXzKDA7RwBHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795732014;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eta8NhsCDxkSF4+FFcWKtJxiaEm3TExBZQxweWcOzo8=;
	b=oGgUAeVKqzey+xGRqEQQf2pMrHdJW9Sf2SvcdstKiF23ZpvpFC3MW88eSBcTXoKMcZA4
	 I+4QUVLEnLNI87jxJRd2cT6ot0oKCoREm+lGzU7/jrqkYzGeJtnQwv8GfypEjKYde8InC
	 HMIHpVagzMzECxqa2ImL3CnCrc6FU2AIrRCUn9+0ntGnB/BDhBS+fudo2lxkf01OHCbdU
	 TGyUNPioLD/JIxJGu8gJzlcpunLNi/w8zlt3umxMvh9f3AYc0cpHnJF/VQm2uAJMaZz/J
	 n79t61QAsJLdxqdhYeCxYFmygFKwJ+64M3gLJrJ/bGMF7ntLVF9CH84qcs/GsgSafkw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795732014;
	bh=eta8NhsCDxkSF4+FFcWKtJxiaEm3TExBZQxweWcOzo8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h0w8cijl9NQ2vMB+rpAru8jOjLqU3YPNgbVtZ7dKjXw9MgIjku4M/eh3+J8E6qXYW
	 8AyU9pVjP+/Bih+KWLeDTbiwMNZMCM/BZalG5Qo+qZ31bx9kavR8UM+pHpaDDj0dxX
	 h7sexX8QYDygWHBFtEGGn224pVz3N+B+urL1RAE7tkQN0GrPHi+LI0y/K4hnqGMZS+
	 y5agKPXK/xd5sROlLbe6sYP7iHVHIdmYAiPkPqRRLQHhiPPyUfrVcK4xSx07z7ba8o
	 AnFpUkxwoDbNTew9qviwyPKAczjygBm2VrN6S1gsjTx35jJ0G5A8UQh9/Ndth62E4r
	 foBlaLzqmxAqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A661409F7;
	Thu, 26 Nov 2026 22:26:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ABD4266
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C688400CB
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZjqTMHuBneVy for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 22:26:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2F672400A0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F672400A0
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:26:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 117C81A1826
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:26:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D481D60558;
 Thu, 26 Nov 2026 22:26:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3FFB911E690EF; Thu, 26 Nov 2026 23:26:45 +0100 (CET)
Date: Thu, 26 Nov 2026 23:26:44 +0100
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <awiyHbtT5ErjWhMd@windsurf>
References: <20261126113056.603096-1-chakrabortyshubham66@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261126113056.603096-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/font-awesome: bump to version 7.3.1
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

On Thu, Nov 26, 2026 at 05:00:55PM +0530, Shubham Chakraborty wrote:
> For change log, see:
> https://fontawesome.com/docs/changelog/
> 
> Tested using:
>  utils/test-pkg -p font-awesome
>  (Result: 6 builds, 0 skipped, 0 build failed)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to next, thanks!

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
