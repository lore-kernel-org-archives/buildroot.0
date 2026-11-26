Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D037606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 22:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=c6Hri5qX
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02C34811FF;
	Thu, 26 Nov 2026 22:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7IBBC7XQeMr; Thu, 26 Nov 2026 22:22:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 30828811F9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795731737;
	b=RQu4odaP0alNDWWrOTPVFJeZqJGnxySG29QLZBtqytDVDMCSSYyXBS4tlH/M+0GXIw3w
	 v/6UnVvQu6uIZO7Qa/jqnFBzrI2ZHiIW1oTf/JuIy8rHQ9c2UsGl8leJGzHth5oV0SQxD
	 laGsCCFgywziCxg8ctBy+/iOVXc+amhKaFArJZJbZksiPno4OnbOALd/jOKqCSN4CX4tW
	 6tfPvj+cs0u0NeTXyli9v1dZ6/r/CKxzH5avuK10/ZVPfXL6BUMo/ic+QyD2y26A+HWML
	 ubRnabKQOXY119iF9IKSJDjm2gCSFIWui1LELhFs3+ah1YsdzB+hpqe25vhjjYFH+1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795731737;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3hoyxiU6zouxxOypxygkQMBXzt5sTg0YwIp7PHU1Ppk=;
	b=C5lqGsRD4ZppRzXw9snrs+llUr0XCdB53M7NVjvAkBEUIG5K5EumDtG8v5RF9pM5VZeT
	 QAaOh7Vbg9EgiTUWfr7DbVmgdt60of74juXNlLSVQcsoRxlOxR8rkUuPygGYufj8B6o17
	 V1RjdAIg234NMuaAqYJ3DHAJ2yK4XEOz2x61Jzx3zVWXGIWGNrHF27SEGDctvDKcNHVED
	 VdEphQC3VQQ+wHgMyyxdtrw/EY15IEHik7lyipMjlVhA6azTSwdXnz5ClFIyHeuCe9A4I
	 CUYPgjV0kJuUUCzMYtyYJlMfxP1CBTGeZC9/vIVd/fulvfpHYYziN5Kca2/tQWpvp/A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795731737;
	bh=3hoyxiU6zouxxOypxygkQMBXzt5sTg0YwIp7PHU1Ppk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c6Hri5qXEb/UoOc0b6ThVhFnmNCZiccHDQFOMKt+i0hdT7KrZ7he1pdL1SD3ccBqZ
	 kO1cv1O4KAwACMnokQRnKFAyhsnve63cyyLi08nsrPQ9Jzgo2X/2iB+n7w3djBV11y
	 JaJXZOqesKcbZJfmSMvuTximq3ZPZL8FbrffqPeB5T6wGDg9W7VSe4qpc7wtAyeH6N
	 +9e1/WOK/FnqvCoLdQ6RwEkHDDbyuy7mz9pEC0BCGtgZOyChXvNa2l2VEU3caX0lhR
	 xgSdS/MEdQPTAvHjWNXAkiBCYyb9w4KNAPseSTC3tX89/p+abx54O9DcjT1gIvcqfh
	 NwX/osCBIbOyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30828811F9;
	Thu, 26 Nov 2026 22:22:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AD8A260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20A9E60AA1
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCeY7kubCxvJ for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 22:22:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0D52A60A8C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D52A60A8C
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:22:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0271E4E417B9;
 Thu, 26 Nov 2026 22:22:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C2CBD60558;
 Thu, 26 Nov 2026 22:22:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 317CB11E69117; Thu, 26 Nov 2026 23:22:08 +0100 (CET)
Date: Thu, 26 Nov 2026 23:22:07 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Message-ID: <awixBb67lvyDS8ld@windsurf>
References: <20261126113925.152685-1-fiona.klute@gmx.de>
 <awiw9NsijMtl61g7@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <awiw9NsijMtl61g7@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: install host
 fdt_add_pubkey with FIT signature support
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

On Thu, Nov 26, 2026 at 11:21:50PM +0100, Thomas Petazzoni wrote:
> On Thu, Nov 26, 2026 at 12:39:25PM +0100, Fiona Klute via buildroot wrote:
> > From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> > 
> > fdt_add_pubkey is a tool to add public keys to the U-Boot control DTB
> > as valid signers for FIT sigantures, unlike mkimage with -K/--key-dest
> > it does not require access to the matching private keys. It was
> > already built if BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT=y,
> > but not installed. Rename HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN to
> > HOST_UBOOT_TOOLS_INSTALL_FIT_SIGN_TOOLS to make the slightly expanded
> > meaning clear.
> > 
> > Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> 
> Applied to master, thanks!

Sorry: applied to next.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
