Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB38606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 11:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Jjjmx6Nm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2936581201;
	Thu, 22 Oct 2026 11:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EuiCJMMLLO2T; Thu, 22 Oct 2026 11:28:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 577BA8121E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792668498;
	b=DT17fGpLOi+gqSbhxkiadkPZ4mSgAgeE/2JoQBML6lkyNi0or5KTva5s/kaOA/tzNOsA
	 Ujf5VGITYTchH5yLXxLjMXWLZ+nNgydP1cFWBb9FkhZJO+iyzwlTf7Eh4pq5HuMSru7Mp
	 cxi57ANg3NKyec7Z2BE1swyM/2WSE2yCI3q7UfqfZte2sep93Qi81ropsfzcqocH1Kaep
	 PvxWhyCl7+oNZnL2lGionoYWGcmqPdfos3IK4apXWHzQNmA5ZfE8LxlsUIlQfrCEZITxO
	 hgpZDY4Tx+I7XfWhYPKDyJulmQlN+CH3+VcWd3P+2EFwI3r4p1tyKu+GuQMAMyYiuQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792668498;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=fTgY3AwXPCeKMVEUeotTyuqxf8rVhxJ67wgHVMC/X0k=;
	b=WDa0heiUy65ldS49+01oc0HjCFMn7FRw+ScHJxWY0N0CGETI4waSSktun3hdixrRV4SM
	 o2YPjX1K7YkV2knFnhPEWp2PGiY5HzodT+kQ4+xQxOmbXq2yxnpohS06oZxRVY/DuTtCv
	 thlBXcCLfLmyr8ySR8sAEtQHVlvV90Oh3PlHSJiOHrgybqBmvpcmBeqvMaNLN6S5W5EWe
	 p61zrRhMv3lYFL6gL/2yfp74RgQnHNTyZorKOzvTRjt3VYSWQce4S6M7MutjGsG6giNro
	 TSAHToU+rLGikQqQOG67iFaLuvIjz8zeTTFXPLPkxXUUHDkHJ1zvLla72A1ZU5edkKA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792668498;
	bh=fTgY3AwXPCeKMVEUeotTyuqxf8rVhxJ67wgHVMC/X0k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jjjmx6NmNzQ0wC6/tevxqkJJrLGqov3SQoVgvPr8n0BeRZHBiWgxglc3TTXTtX0/u
	 iLuuL8sXlp8aY21FOCiYrGUPuMNN9qkXlmEqU7kDNfd27k5HnjYhgJ7nTXdQcM8gIi
	 XD8YGdox8K84U6jmGz3QuKpGSqR7ygBvg2Zjk8yvWBR1nyBx6WDivugKokpoClF3Am
	 JcTjEtph1NfIxa4olmID7wPLS9BeBZebOYxYgUhdttDDXMYkMTHghqNG/P0FP6nb4k
	 j7Pydjfkitb9bhMTNPElQEHUhCUe0aP4hWbV57A2pad3SuaYOlZp0bXuUd/gVbPftr
	 fEStvZ0NWY8vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 577BA8121E;
	Thu, 22 Oct 2026 11:28:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B9733A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00E268121E
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ioXaLIFxOnj for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 11:28:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A99ED81201
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792668494;
 b=Fva4dXi/mjj933jEjBPvqaT++szbASQHW6/u77CQc9xz4+ZRHnh2fvMQEIEItXcMjlwE
 aj3Y+EOCgWG54TkolqcPWBMlRElZmdrK6hhP5o07AWKUVNBFTvb256gizto2+7dIQXdoM
 5FLKLlPtPDtE/hKQYdUpc/2XUNtlMlw04YhdWazc7qzayQ4SFSfGWRUcgM+sC/PaYAZ3m
 jr2FC4u6pDo3BsB2Scszg/GhEgaSmaVAc/QuM30O6mx2nLPrXSQgZW4eszotlxqhpHev/
 py3DQYBRzpLanEj1YNdxnT3PZpos4FjwwoRTNOu3lV/Wk+PhxZdjoLpBkUy0DcIpr0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792668494;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=h6qndzffDWGfux1V/sKXvCnexiAoDA/wQLc11peLg8o=;
 b=KnvzCp6P37NpwUyZiDipxvA0jALpqD7C28R9cszH149tXjUEpmYS8deXLPVwJUkGOY1s
 py7m6lt7clFFsYWrK7j5g22YMLbj3qEEczCFS8jo7OyRopUHhQ5lKSN/zqpsWd4P/DZ4e
 wx6e6z0HuPlN8zbE3x15A2VOYHDIWwivoaJwi52xPrmvXS/uKjTjhD94L+ta2d9ZjehFo
 ZtVGKVyzHNGSlXtz606vsFYTqXuSBgUE6nwubZCryohtnFzRVcfK039rMuxV9y7X7Vo7d
 9tJ9iJwBEtkENB2Kc2uH/PX2YYze/LVkHlCuqNFm0HSJyC9fRza6n4Sui2nOQiTO1ig==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=lfK1nOIE; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A99ED81201
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 11:28:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2E21D4E4129E;
 Thu, 22 Oct 2026 11:28:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E8DCC60360;
 Thu, 22 Oct 2026 11:28:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5E6CF10328E44; 
 Thu, 22 Oct 2026 13:28:00 +0200 (CEST)
Date: Thu, 22 Oct 2026 13:27:59 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>, 
 Daniel Lang <dalang@gmx.at>, Simon Dawson <spdawson@gmail.com>, 
 James Knight <james.knight@collins.com>
Message-ID: <atnzG9LDHRtP5bmG@windsurf>
References: <20230916154940.746749-1-fontaine.fabrice@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916154940.746749-1-fontaine.fabrice@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/at-spi2-core: propagate dynamic
 library dependency
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

On Sat, Sep 16, 2023 at 05:49:40PM +0200, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of at-spi2-core to
> version 2.48.0 in commit d1757fdfb0010d29f20cd68cb6e16f019e236424:
> 
> Makefile:576: *** dbus is in the dependency chain of at-spi2-core that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/511a682abd233ba90543044fd9102dc08c762f78
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Sorry for the veryyyy looong delay. Turns out that in the mean time
this problem has been fixed, indeed by propagating the
!BR2_STATIC_LIBS dependency, through various commits over the years.

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
