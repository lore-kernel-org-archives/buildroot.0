Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2408CA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 10:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C25440818;
	Sat, 10 Oct 2026 10:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1s92BHZ5Boy; Sat, 10 Oct 2026 10:28:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 93B5C40859
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791628130;
	b=i3ITPv2wHR/us2VEMxCFD9vz8V1Q209apYGlNuiz+u7w6EBwguhrygyO1Lu7G+9QA4Um
	 JagznFbOYehXeAokbPzvpJy0oICErtKk40Yd8Q6dmjHY+8/1dT4QvxEvfLxZIhpgzOK69
	 xG5ZtlUnIPzj/ko9E6Fcrs+oxtzImrU6l2/G51Td7SssnymG8OSVdJm/XzkdoxVZcI+YL
	 ngMgl9YNDbd9OnNcY+oxglUeXNBKj7+905Erf8T/3rVzCxR3pEaPC4Q5rcyx4Z6+JWymn
	 SFqdJRrQr/fQIlDNUqJZM3wNm3EMJkxBjiKl/ID/AXhvQOUu51HCmL94ElbIs3qXwcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791628130;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TnGj6nWLZPzrLA8nJNzChXOXbKp0JKLHnBD2J0gmrqQ=;
	b=agWTl1zVQAcVeR92mEkGvnFWXIhKX/fDN4Se1gIHdmzeGTHkylxJxNjX8TMaMnrPcGpJ
	 Ne9juYKvtKiXOz9fht7jl3jRVywMsJZ//OpC/ZQSgX+/cSNXfqqXYhdPvHm7pqDl4y+ox
	 tiOC308/87pgceY2sSWXM671fn8vUSL8ZgIepMuXkJ57o7IjBr4eA6Z1ospdDL5yGyAXa
	 Wr0FntXrsb6BY0vRjFV1w5fuTcz1CoKLXesyMxep3CRjAAauhPp5j/lJ/cREvJLZfSxWS
	 +JJtthHGXZEguqA2n3did8WDzp7rcFyMGouqdXVFQs+k28C2O5MZcjPSQyfdtU9eMaw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791628130;
	bh=TnGj6nWLZPzrLA8nJNzChXOXbKp0JKLHnBD2J0gmrqQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CeIKvLbLkzRq5lt9hzhyasyzZjmyGgwAmn6JtyYeTuKekPRjqmHP7EDinCEGoFwvh
	 /5TYky7VYOln1SdfikjNpVcYtNOlMsDaKoYmj2Er1MXiecEqaAg32ehycPaLH8Ehye
	 TbMC2JEagMwIiXLA3ZbNgRTqD4KTO2kUe1BR4lWo0tRU2U2TlKFAKdW/9P+t0PvXFU
	 gpnUF2OJEqoHFLMGAg6xbF+9i+YscBLreOSKPBdD/rpUBn/hVPNPjEjNOtRaAB4oDb
	 7ULC+acdRsoF0co95WmFTuJhfDVt7L0OT4a1F/IOfoM6QJZuksqHSpP5VxyUB6j8bG
	 IzCTMFDAr3YJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93B5C40859;
	Sat, 10 Oct 2026 10:28:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 002F2356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5E9A6063F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbgwacYWzOr1 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 10:28:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EA94860616
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791628128;
 b=oB1YSWamo2UwqkPzq8ZKlA7s4lFLNv3eva4LdADW3cp8Kx+ZaaS2jrQ/+WwhLxIx3Bfn
 EIOMWX1MA13bPqZl0mKbyWiuFXfPjdnGuuWKuvd4ybiKBKPUUsTWl6fQCETnRvfSvbG4b
 zwYHfuqWMf3XMo31o3EFSk6XnLFblX9DbZRNdJsToEEVWJFjfRH/3C3R+PVlFk+2biE8u
 Vx7c+FsWNcChx0hHfbil8kBEIjd57CLv9FrjgvNpZc18rxSozdfjKi5cfVjzsl7UiUPpk
 /Ub7re4tm45Cj55MjFqKlwzmLcZ/3ws5Oi9zYOCi+/GrY8WrxRBgEu61fmfNT4LAcPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791628128;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=yokcWXuKWj+DKL6TVkdtrnxPFxlbnLaOH5ggG6cObH0=;
 b=CLL5ax2da7hgeoi/joQoKvblGmCyPTXwwrlOwZthFTLLzFxNa8aKePg6BIPIx5SVV6+A
 +8Mlk2ktfd4MRZAAncl56CBq+iww+JPvnb8+BFxUIgJ7oH7J5vb5I+SiVYL2Q99wxWw5i
 kd1UlCq3M60F89+tGqymDiab7Z/lANoMRkZ1JJC249LbqMsxCwmeWkYWpxPAtP9KxrrQ1
 LT1XlKXk762LCjbZrIVkHvI8NmGMFSJ1KX7ApkynrHCEysRFbNfOXeet5cJKzJTE4kmZG
 QhM9FzkY0VXcLWusvdN1ZVHpHpmm+75Y+6jeId3B8fW+U4o/arzYHKUARYN0NHhM/fQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ZUbGCaAu; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA94860616
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:28:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2A0541A116A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:28:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E3AE76075C;
 Sat, 10 Oct 2026 10:28:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C686211D70874; 
 Sat, 10 Oct 2026 12:28:43 +0200 (CEST)
Date: Sat, 10 Oct 2026 12:28:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <asoTVglH4zynCw1v@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-53-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-53-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 52/84] package/tpm2-openssl: Fix build
 with OpenSSL 4.0.0
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

On Tue, Oct 06, 2026 at 06:20:33PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Romain Naour <romain.naour@gmail.com>

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
