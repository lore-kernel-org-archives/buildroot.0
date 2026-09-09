Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB7AC79FB6
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 13:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C61605D5;
	Wed,  9 Sep 2026 13:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mM06VgiYHaEV; Wed,  9 Sep 2026 13:33:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 949AD60756
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788960820;
	b=kZvHV0NKJ23jdAARQOiW9QBMPkjpXMvd6lpnsF5uOWSHRlIy+++GqX8smg9vxom3yg2M
	 ebBfTLBA7IM6nhjvOysa/N6juJKXWoHp33HbwZ09f8M+HLiQo39pamBpAQvPewSsfOFnx
	 VzkHlkJhVk1UdciQAnwdyDBv3dkUCxxnXz+SAY43KKeMKVhlBBDcAwM3HBa6o9cLOC+ve
	 ueKTA4AKJQWce9DEyqkk6XSQCs0IfCkpEKTgxY090ykCABd4yBX/ez8X/253Q2ht9tBoZ
	 QBziVsr+P5OEfOreyBDyVTDNrhkLn6vtv419tiEyYDCvYxfGvQghTkJvjAFsW8WMt5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788960820;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NP8vDN5pLnkbtKHRwphRGaZuZrHuNg717YSnVCl3Wao=;
	b=YFoXJOhXzLMH/4YHaWcgPrWYicvL2/5Yn0wZC4aqHIiqKRIPnw9WG6tcIjn3RKRxtT69
	 mnGq9UhqC/mExte9LrJZ92S6f/f3fYxUwTelQa9UCueOq1JB0YGSBesc7i214dsodEPTh
	 MkSYpw1WPuHRVADfL9+TQtBdFyEAKyXwaTYHUWSgn1jFuiorhZgsCLIjauySfacXDGgJf
	 cps2aAlt3cpmFB63oIEqWF3RfHjtZWY72KJneiQtl0Oaexm/DHgWUlXQFycu6fkdHeBxl
	 eXpJh0qe00jozp59pQnhUCvBaCHe4HgTL6oQL1PncYu6ycmaTrMzBnZhdAAsAwXgnZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788960820;
	bh=NP8vDN5pLnkbtKHRwphRGaZuZrHuNg717YSnVCl3Wao=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UL5XWNyCm6HQykspxEiRDu8MW4PH72ZxrMHd9gwduAjcp1e1PLklk9GfV7R+4VCY5
	 j1nS2Mt7ZGTc2fjzLtAWfNFzzmoMZgX4thwGRrS/jr/niPBliClyKgWP+C/V2mzr4N
	 XH4YNfI6vVxCmPlUUDZX2A9yqlQHQlFFA6GG+C2eieBfT0h7p4i1j5YFU+82zu/EuE
	 OYMAG0fV8G4EcCT+3bUWYyhY6/bY3ITcWy4Liz4ayk8m19Xp0vcqXhs+RKefhBd2/P
	 ouiyLzfmmLifay6JTNDQDavTJQmJu2UwWmO+HFS5wRgz4uQIhq+miT5r1ZOm79uZjs
	 ls1RbpKCOVHHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 949AD60756;
	Wed,  9 Sep 2026 13:33:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2C062D2
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E42380C7B
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 40Li1lqH0pnh for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 13:33:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1131380993
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788960817;
 b=mOjSniJzKQuXKfSdlw1bqmmAiyaHyuhLNbp+7MGkgs0oVrhGRXSmKZjGYuQR9bb9YQ/t
 KCSJef7RIrmpsgtAFU3YnbZh/BSOH6P5j50BP74ncW8LeYsGbwgkrsDfUi9Cvm64tjoex
 R+LlY2yD84UaKUrHv7VqjeHEaojcFyVkR1XWjoiGgiuaF5or8rL/1umlgwuvBQZMi/AVG
 g+1oNN8blym42Tv9hXzC+FOiioxeeB2UbIQDhfCof0Yj81wrg8ABhqgGakoFKNhw0VS2C
 5rounogvz9p6sdbUapA0vieZo+m+29AM+/6yJXMEwFfWtT73MEdoL65dHPnNtoAbIZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788960817;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=6+73sU3qzgVtDr2W5ii8QqhTwX92+hhioDGgapT+53Q=;
 b=CY+dExuqsfg9ACBYfPFRbClUBHZheGEUtOYmc6QRLzcFcxUs8pHOh/LpsB+UcKIPZXYZ
 jIh4SsaGvX2P5AMwKc3dfSfB6zWK3FidDsdy9sw8aScCCRxwZDRR/MoDKE3VZ7YC2Ozq1
 81KlbAVfhv0Ka6tSpqG4rQ2YxK2usd5lpZYZ/6lGi5bYeVDpvaqcVZuKCfy3vA2Sp9mrU
 aHDNBM7zpJUFKw/rHxyHQstkZ1TPJ05pJbj+keKxQC+KSBsQic6MAgiTjKNDaO1Ufej+d
 8GYr4FVv0mrwQQBV8yM5gILlaYTu3E/6ar+HBSjOaE+cybq/HhvKGmGyNmq+Re5dypQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=aCfGCR4J; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1131380993
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:33:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7B1274E415B7;
 Wed,  9 Sep 2026 13:33:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 47BB360448;
 Wed,  9 Sep 2026 13:33:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2CF3011C782BF; 
 Wed,  9 Sep 2026 15:33:31 +0200 (CEST)
Date: Wed, 9 Sep 2026 15:33:31 +0200
To: Matthew Weber <matt@thewebers.ws>
Cc: buildroot@buildroot.org, yann.morin.1998@free.fr
Message-ID: <aqFfvqJ4otcmHA50@windsurf>
References: <20260909123925.29971-1-matt@thewebers.ws>
 <20260909123925.29971-3-matt@thewebers.ws>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260909123925.29971-3-matt@thewebers.ws>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 3/4] support/scripts/check-host-bins: skip
 RPATH check for missing libraries
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

On Wed, Sep 09, 2026 at 07:39:24AM -0500, Matthew Weber wrote:
> An ELF with only non-toolchain dependencies absent from HOST_DIR cannot use an
> RPATH to find them. Report those missing dependencies, but skip the misleading
> RPATH diagnostic.
> 
> Assisted-by: GitHub Copilot [VS Code]
> Signed-off-by: Matthew Weber <matt@thewebers.ws>
> ---
> Depends on v3 of the check-host-bins series:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=520240
> 
> The test script is available at:
> https://gist.github.com/matthew-l-weber/34fae15a4319a81462961eadf0e31164
> 
> While exercising v3's missing-library check, an ELF with only external
> non-toolchain dependencies was reported as both missing a library and missing
> an RPATH. Since no relevant library exists in HOST_DIR, the latter diagnostic
> is misleading.
> 
> Test 3h places /bin/ls in a synthetic HOST_DIR without its non-toolchain
> dependencies. It verifies that check-host-bins reports the missing library
> but does not also report an RPATH error when there is no HOST_DIR library to
> locate.

Hu? Why do we care?

If an ELF has non-toolchain library dependencies, then those must be
in HOST_DIR, and the binary must have an RPATH.

> 
> Test 3l builds a binary with its non-toolchain dependency installed in the
> synthetic HOST_DIR/lib but an invalid RPATH. It verifies that this valid
> RPATH-check case still reports the RPATH diagnostic and not a missing-library
> error.

My understanding is that this is the nominal case and this commit
doesn't change anything about this.

Honestly, AI generated stuff is meh. Takes a massive amount of brain
energy because the commit log is meh, all to figure out that the
change is useless (if I'm not wrong, of course).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
