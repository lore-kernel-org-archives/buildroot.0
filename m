Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBB6606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 22:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VtZMkISA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20BA6409C1;
	Thu, 26 Nov 2026 22:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yLAMhn73ZWY0; Thu, 26 Nov 2026 22:21:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 67383409D0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795731716;
	b=qJYUxwtdj/DTsj93neKDmvI/aur09Fhy8gMUSOsFxrwhea/FnlDA2cHZfpG6ilAxTOhP
	 qZ/LQ2rBju73utzdgnXp3uA2d0KCS5LosX1K39ymUqrpeHbAeBhT2LyhygmHCuXXWBjlq
	 pDAESr5lYYJbHqTEZMxKmz1+b7zUDYiv9WjivZnwLQpWR/an7OGStcdnt62Q0WMjDU85X
	 nIWWTVaKu7ojEog0wg4QpKRq4K/DnLVFMHQC5poldzroUzAnb1pcYCvEjEk72xjUUu1RD
	 ORN8k0j6ImX881lBb/D4NR/62agsOzStrvdeQfXRfUvOzEIM+NUsR+wNSVJBhoo3H/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795731716;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MdrFS/p9VW9UorBj6DAXzUooM999Mc9PWKZiO9zFddw=;
	b=iXQOr4Q+coDnkA5wn3Qxp2xODX3usIPj8b0pW4s80zmM6h1Y8xvb0im0ytvjISPE6cT0
	 NlGkNLdkmjb381J2RB1KQSHnpuK7GuYpf3dEoksqA+X3ldOkPURnNqmXytNe8O2cKAKE3
	 m2E3kxxO2iH20xpNg+8PxtwlCI2pjyR1FWYcyrHjHXrRlGKRYH13Au/xaUtF59XTY1V1F
	 TWGhTxk+OZbNQL1ZBMxSG79D9ozvegkNqGlfZRbX91t1SswNRnoeQQaCNQNmQBoZXl6nD
	 w34heWQxiuyru8ZpEFBHX5UorkOv3IxjvHGFqF6zY7eEPifdFjreErUPMrDUv8jENCQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795731716;
	bh=MdrFS/p9VW9UorBj6DAXzUooM999Mc9PWKZiO9zFddw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VtZMkISAmYvj3dxvNlySQNGWoYmJs0B7VRpy0EdVD9xkpzktjrvLpw48IPM6uk69l
	 nYmotRec+hGVxGbnRpE7YrsHDTS0JNLQFaVKDNNeYCe7NZBaUm1q3p9A1b7rw1nt5R
	 mWx4o8tRmcO6q1kAAIFOoppvfw0qzFU00XJk0tRGawOXhh6NP3ct3W2mpHZiw1DqtY
	 4eU6NiYeNC1KwefR3n8jxH6CSYn8aubJQlESEeGx4WNa6gLZytEAXfBjzVK2B3TW3c
	 HQopxQ1rakiWazxCs/t3/R0i7YmBzegLt3Asix1CuUtWVOdCAeDp9YvnyWzDhYX8Ir
	 zhiRD71XQZvCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67383409D0;
	Thu, 26 Nov 2026 22:21:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BED231AB
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4428409D0
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvYeXelf_DDX for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 22:21:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BBC8D409C1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBC8D409C1
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:21:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 52004C2B9F2
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 22:21:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BE35160558;
 Thu, 26 Nov 2026 22:21:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3A21E11E68007; Thu, 26 Nov 2026 23:21:45 +0100 (CET)
Date: Thu, 26 Nov 2026 23:21:45 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
Message-ID: <awiw9NsijMtl61g7@windsurf>
References: <20261126113925.152685-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261126113925.152685-1-fiona.klute@gmx.de>
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

On Thu, Nov 26, 2026 at 12:39:25PM +0100, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> fdt_add_pubkey is a tool to add public keys to the U-Boot control DTB
> as valid signers for FIT sigantures, unlike mkimage with -K/--key-dest
> it does not require access to the matching private keys. It was
> already built if BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT=y,
> but not installed. Rename HOST_UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN to
> HOST_UBOOT_TOOLS_INSTALL_FIT_SIGN_TOOLS to make the slightly expanded
> meaning clear.
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

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
