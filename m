Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D8F606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nRZHBaXH
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5479A41096;
	Wed, 21 Oct 2026 19:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vc6vJtYDfchP; Wed, 21 Oct 2026 19:21:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 57BE240FFB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792610514;
	b=Oj/RBhZotGqu64eY4YJvCSLRk0tXxletcVPZJCO+OM3xz5hwG/Ropm5Ce1G3atLzOjjz
	 QeUDAMm4X7BlvRMOV94ybYLANtVcrgEwNSscqn2qfq1QZGtwZXdyE31onuRt1lBbDv45+
	 igp1eV7qcITC7fsyVpdNVL/pvlO7MALrmdGRY6ZHB5SBn0YMlDesQqSTF/BWcq2rfNU39
	 tHbKD8trBWEAI3vRBx7feqkhp3+OAFPnnnGBXB6nzKIBK8MpiLrEieQxdUD25iiwhVMo4
	 ubCBH73BJ7x1yw9OJUqEhWMPpDw7T0WXOkI58QHGQs6b7wmjDN/6F7BiHebGSGZvsjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792610514;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qLnMtJtQtG7+ZlMrdn7Q6CCC/E4PZ/ZXiC2/efSME6c=;
	b=rwIFtRlH/F49YSXo6ChPpqq6h0zSNuX5CmLIbZW582FTHQJFroRkuLUok4PDbyHBZwHW
	 xejyXLdqrtwfEvUofoB5nLXlgFV26yzOjGZR+n3VXVloWeT8R2DklugVKHKrKKVYe9yZP
	 3K6IcjUangc/xntYmNAYUJaljRgpyEiL8WW9JHy2OZgllbXC7FV93Qbrqoc2nkKnwGhMv
	 8QCorJpqWC8uo92XMzX9MVA+2Akep1HtNZrfgWgW7+s6PCA6SBbTpXuJRfoHQB24Izubl
	 VU20KFWHM4gVgZvqXVdj6fzLyAXmoZEbx5+RC5sfI+kM2n6B5zkNrKK88RF1RkaJCFg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792610514;
	bh=qLnMtJtQtG7+ZlMrdn7Q6CCC/E4PZ/ZXiC2/efSME6c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nRZHBaXH3XKINO1lq7mC2kMjJ/KwK6hlRVj96fTKufDr4e3NLTZ+MTUi0zkhQZX/b
	 bBNIQPyzBTkVqMMUs3HQ/Ymtm9X3TB20PMysn1QCQoLSw9pphZ3ON04mAMxkq0E3V8
	 jV+9B13qsfWjZgqmtEgSDa9F2hg5tovBkXrax6qm4dwA3cvQM8VSe4q4V+DbBicLsa
	 tre09ee6Y7yDndx4I0kHcDMnJb2inLRj1FXUByrFJ4c6TyKSVlKpNtgL1SPo5HsJhh
	 xhh83rI0QgKc5zcf3azgwUmcdEsrmiuGnSMBR2GHjTAJxvxkNWww8pePF7lJVM7tHU
	 6jzg3uo3rQOXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57BE240FFB;
	Wed, 21 Oct 2026 19:21:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FE4B3C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8160760B7B
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h54IAZfBWK-t for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:21:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D4027610BA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792610511;
 b=Sgv/olnT/ckhtHOPTs5wnTWWOd1OAUayK4ntvK+Nnn2QRp5I9PHPjBdzo4/wJv16oj57
 5arsSajt79yjFX4D1civwYKMqJ4n6641ml8xrErszi4ngJsmfjlDGe+INuzaIWdr/g85F
 HU6ltv85MIa/5xFs30SO6Jn3J5EnUAitGfTQvO42FPw99Q/iRpRySe5J6D5+DDEX+tQLL
 UDekN23Iuw/xY+WKwuF3q6JGXk1daPQM5uBK2AU9UzGo3IY2dWjqVr/f0eLks4WcFUxV3
 AdzTWb6H3lXh4mkRRhoBAU0hUAVOznFonleez6xr0n/oE2j+5WgGxpnRMWzzEP9HfeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792610511;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=DwIl/eRUxhqsmZcnycUfcQncIZkIxx3cYR2C9RM0a7A=;
 b=poUyFR+za8Xs2bFnu73v+lN9Pp+5TTbys4op8S/ZhCg5Ft6AOx9lO9j0NScMKFVxy3XH
 uv54noSnK5vqTFY500bP+a3aw/2zQiV/ljtR6G6L1D7uWnaQmhocui7DIONols9frazYr
 dmy3xTux/YskI2gg/JNiHJCgLBl8jC3FBndBca/qy3QeMnUWqhoab8ToTeUKwkXhOYz62
 NZn7B6Qp8maCM1YAEWj7ssKkyvMFmCdYxZmvX6XidXZnZEoUX0g3dm7cwMdKng1+DD9vI
 7qz2yyUCxgM1aIYvRkIAvKs1OwzIviqDcToAaGO/jEQDnYHW0OJQFcRQnVG8o9/FdNw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=QzCRlJ2Q; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4027610BA
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:21:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0D0B7C5CD6A
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:22:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0146C606E3;
 Wed, 21 Oct 2026 19:21:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5985B10328E5A; 
 Wed, 21 Oct 2026 21:21:43 +0200 (CEST)
Date: Wed, 21 Oct 2026 21:21:41 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <atkQwXXTEJEgKP1I@windsurf>
References: <20261020221232.1579432-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020221232.1579432-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/tailscale: bump to version
 1.104.1
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

On Tue, Oct 20, 2026 at 04:12:32PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

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
