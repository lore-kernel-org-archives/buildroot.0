Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D940606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=tFurjUee
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADAC86061D;
	Tue, 27 Oct 2026 19:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stjjWndbwFbi; Tue, 27 Oct 2026 19:23:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 567FD605F7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793129034;
	b=nkAJ4kIEjWv0J1Lo5lqeoB2ug+vcWWqf0teAbXoVTl82bZLgymZFH+xrBbV4jGSmdVoC
	 aumclgTyIXTShOpR5ANR6nuTy9nIkFoJ6aF9mMdqcfuh4quCs2Rx0cG3Gjrgh7/0z5sqr
	 /vOt5xjqCI6uosD0fkQYf07OcjeIP3eeAnId7E4tXy0J58B5MljwyxGIU5+Fu3m8S36HR
	 sHDEEgEktHI/lvEYNhBhfXmEaU7JvyylHPIaakgsvUgGs1tbekJV8S2vqI4yEsKyEZ5XZ
	 6jpYIZQxhYfW5yQFplAYlZN4oimvUseCmdw/WAAU4fRyDIjNx68SlXGgZ5UAV+OxTNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793129034;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Sl21JdDeXH3ecidcokx+O5wb5rVcIKO5lTWvlUWgz84=;
	b=in6cMjxAVBSwvX64+V0Cn/9lcWigvpBRSpqJCVLzDDBrlDhOLhRxhAi5SfjhHUEpLgoo
	 kWnhYkz2l1J9iNJYM46YnpEnHWqqhHaBcWPiWCn3pazPSbPRh/RYo1nBQIC8OCM5I8rpM
	 nUeFoAYj1WtD3s83rXSTjeW7h9vK97LfPcwb5iub5cnY6Zhb8DxmWcppmGRIgz6Lmptru
	 Z/BUjGEjssKmxPBswhQP9cmaLhfIuEr8BCdXv9zxCdyby8G+Rb5uFONPDoDlhYWmDTc4N
	 2/CvotvulzInC1oWVx4CHmF+xgxtA7184wYNy4S9/fXxsUfGTIM4ZIhGnnCL8+x/BBQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793129034;
	bh=Sl21JdDeXH3ecidcokx+O5wb5rVcIKO5lTWvlUWgz84=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=tFurjUeeL15+d5raVWbff0mHhcu4M4dR2CaVDLZFHFu8x1vV5eexXn4Eg2bN1xuC5
	 v03I50ZrtyXxGW3RZ5WOc6I2NyPAzoxC22Gfa3/dLSxZnXZdvWdKofKsCb5vNEX1nJ
	 SaOkUH7M5mtU6mEVl/sL9tv+65HYYol7Io9zhf/f9a961uh81ZiCjbEQgyWeOiFKA+
	 mHQj+h7BmX7OI6NO1iMn5f6qoJtqGjH5TBxGm9O+eoNyjhHy++r+MC7fJDc53c1MjD
	 bREGSm8BDBvYmnpIr0Qw3wxFhndjYKF5Z8lDTP+f9FI5iaR4xGHe+oHYRpJ/+JIsFR
	 O2tVSTFErcBYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 567FD605F7;
	Tue, 27 Oct 2026 19:23:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74F2F473
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66CCC80D6A
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNbtxnXhBPla for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:23:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CAED380CD8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793129031;
 b=exQyvt+exASGFZ++VWoJkSDarx5PeQa7XFMmHTtpT15vyIl47AK8rQ2fOjU7niGNHkxW
 KKRtdR+sDVe0A+Q8tE13SmDS7fVUwHQ1+sESujX4wA0RbjHkmPxdZqyemvKJA0zySYvt9
 cK2UKFv4OfDjXD5k1NQGT/nQOyC0NBEq9llQIQUqnlfCBJ27OAu5HXvT8Td011/+8CuUq
 OzyP7X5FfwaupgNpdnKd3VYZF0o8prMmeZMy6d15cwOkuYrJEmLAL1xlMWxveepSauk+O
 0opwbiXNkeHA84HunQW8gwL3pDezNuHlhBW8wZIrqnvZ9f2Dk24aUukW97i22REbz+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793129031;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=tVkkvMeK3hoeyR0QV6nQiCelLMEnS1UqqhM3LfzbBg0=;
 b=C+Mj6H3GoWi45RhBC5LGyVvgAS1z85i33pmvBjbNMtvMEjxVCFCZCbh7rfjSY+S3A7oS
 uhmpOIgRV1zptNFktvelCW9W2Vhj9iv2GVnxyj3lXUYOCxb1ZEiFljuzXT2OF/ONAzMPo
 dS6tTBfnyRSYPz8Uf1lRg9CdWV353pbXQlWCMJUmtGbkqvgfvN13jALc9Cry6tg53FPaZ
 sCiBAey0yHDXqc3XHZKB09oSuRb0roD+b1aFRg/JidkoBiSnq1526Ra3gI9PKhujLKQRF
 f4Bqy7yuc0Jx5jB5t0bROVbHmNhFqcYAZwtu73CWDUd7qb7C51hB9YhGBr6JvNaOlPg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=iMs3+29S; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAED380CD8
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:23:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 907D1C79AB3;
 Tue, 27 Oct 2026 19:24:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ECC1D603BD;
 Tue, 27 Oct 2026 19:23:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BED6510328A20; Tue, 27 Oct 2026 20:23:40 +0100 (CET)
Date: Tue, 27 Oct 2026 20:23:40 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <auD6AVoh10Byfa_E@windsurf>
References: <20261027170600.130042-1-thomas.petazzoni@bootlin.com>
 <20261027173853.301624-1-thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027173853.301624-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/drogon: add CPE information
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
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 06:38:53PM +0100, Thomas Perale wrote:

> Also need to include the following
> 
> DROGON_CPE_ID_VERSION = $(subst v,,$(DROGON_VERSION))

Makes sense, but...

> 
> To strip out the 'v' prefix. As seen in [1], the prefix isn't used.
> 
> After applying those changes I ran
> 
> ```
> make drogon-show-info | utils/generate-cyclonedx | support/scripts/cve-check --include-resolved
> ```
> 
> Which correctly output:

... I'm already getting the two CVEs with just my patch, i.e with
tweaking DROGON_CPE_ID_VERSION. Any reason for that?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
