Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BC9C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17BC340721;
	Wed, 16 Sep 2026 21:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwsoL4J-3HlF; Wed, 16 Sep 2026 21:43:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C4B71403D3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789594989;
	b=kWwejTNr4A6bwm1qbbD79JXbYy5ArtXnYBPXk8akfIY5jbJoHet1dS3MEctgGCevlesS
	 5krYDV+6k1jMmjD2ji2J9LlpLSMhdcK8IXjI1mlSGImUgkzsVduKrBFfaCHO8zApprJ+M
	 duhsSSTxaPpCm802jEpcy8TqX6EdCeEiyziYF5EI5DWXE+sY5sXjAbuylqQ2hhFgXzT/i
	 YPUH4iIl9f40EAlwSiajCZKB8z8Jvv2u9WiREKUB+r0e6zVn8tK7ScGZ7fD3OYQMC1KXR
	 SjRpIc9VmXdf6pJa74VIgxia+LEWNZYNSY3+lwC4QBWuCuAgwlNiOyvuQoLMKJd4ZMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789594989;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Sm2cJMQjzML6GDNEx5SRhPOuAvDweY1/8k5g8F18/8w=;
	b=dN3tFyXj3or6BLwLZrNRrxHrLLYnuZRc3QCdsR0HO/+FahYWSCIgEeLF1nzD/bSlLxEV
	 UxsV2U3T7O7e0A1Gmo/je4iWyavy8zQet65gbEedKVq8kIhWyxRhjF7r9PGKsNwixJQxy
	 I6Xu/XvA4pV3A+N3vNG1WVZ3yHC0XHQd9bijNsFDJco7qW4rqeHWgS1sgGzb3ztKECmO5
	 6FaexobXveBsALFIRBUxAgAcapoPBzYVcBj1Ye+vOTKtve/Oi5vzjxqtIpFAAmlJlNQjQ
	 g0Vy3nxBaKO6HwCepumPAiKhP25yL5ZlpLJo1VTBufT0i3Fk0b6h9CHNCXKQj+kL5tw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789594989;
	bh=Sm2cJMQjzML6GDNEx5SRhPOuAvDweY1/8k5g8F18/8w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NDKdkQp58aFCHJ5PlvuPbJD2coQlifau4Y/ewPqMfPqcMCD109HaoGdXBqtw1aTZH
	 qCZ9aImOvmtS5SV6fPujYxyLHO70WKao4YQjXNPBNwdp0jIgZnZCEP9S+tHfYLRPUb
	 KQeqFVULM8j/C9OO7AR06WgCZCOqC0jbhTl5yY7D3ZornqPZqkeze2sXCV9XeDwzMO
	 EYglg24Um/dsVSFgmrWq6AKv18TGNO79V3qHSrxI/LpEBNMVE9rCZUCVnnRi1CjsWp
	 2bMBVY2W+p8dTG2hP4ER91mRf9KkftjpqM7lr9w1AT+MzRmLKFpu6OdZ+RTnakxVsb
	 zislY28l8IGeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4B71403D3;
	Wed, 16 Sep 2026 21:43:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80C8F2E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65F7880C0B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErPRNK_YTBYW for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:43:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EEB1E80AD5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789594987;
 b=sDMlmha4jQuA946Qh1CcBAGSv+fyyHmsZYyxudrYx9nANMGFx/MXxVny1EjcHeB/vB4M
 zF0LGEaPwcxyLTdi2V3/Y4jdPApDgoovVexzFaWcEXtqssqZ/w6rsNGZTLG5sNUx9rnz0
 wNlHNNHYlYbQPVC4naRDL+mXE8acCWXkd8p7/U77O0jGQBONS4PKBwUMeULwZgWsonIGI
 +d/PyVg7KmirqPWWbDNIJPdchJBqulraKJHRN86JICPvuz9SwXt0NEyAVu2iBK4EsX+ln
 kit5KK8xjW8y5/3cTLfJgkLpKEFLvNUVWv70quCRWIdcJv2Kh0acOKBgimRmrhIQt6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789594987;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=bCwdPysSuSGLUQUnYMWqyqKrl+ly7qpqUvTZJZ4XS4o=;
 b=BGybUYp7+BOCuBzVLow8SZYbihMnjy+h7kwQj1I5DaO3jegVRe5B1+cJEU53EVfvOryx
 0MZP9UAXDfklDwSzLTdVSvy0NgSz7UeOYBrAJ9crJct5mPrqoz1DysFSxeJvrZt564M91
 N+dtmJv10fWpVjg3SAImS1KdCayiMFZyK8DxsMJLYpdvuFUv5qY6yJOFcpRUcCNC8F1IX
 v4l+SRMEu6pSX9AdHJtqn5YkBziaUheCVkweka01UZfwgKyzZ26APS12tdbRQ03LUSDRI
 ld2214SwTzru4R8RIzkwjln2JDGs9mRRkaJJN14lEkWED1EJLuAvixz86n3RtiJ6+1w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=gKQmRIwB; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEB1E80AD5
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:43:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 59A8FC5CD6B;
 Wed, 16 Sep 2026 21:43:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 22C0A60337;
 Wed, 16 Sep 2026 21:43:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1B18E11C79C1A; 
 Wed, 16 Sep 2026 23:42:58 +0200 (CEST)
Date: Wed, 16 Sep 2026 23:42:58 +0200
To: Andreas Vida <andreas.vida@ginzinger.com>
Cc: buildroot@buildroot.org, 
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Message-ID: <aqsNOXVQH-_nT6ed@windsurf>
References: <219210df-977f-44b1-9db3-55c783935a95@ginzinger.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <219210df-977f-44b1-9db3-55c783935a95@ginzinger.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/cups: install D-Bus config file
 cups.conf
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

On Thu, Sep 03, 2026 at 03:37:54PM +0200, Andreas Vida wrote:
> When CUPS is built with D-Bus enabled,
> install cups.conf under /usr/share/dbus-1/system.d
> as it already happens in other packages that have D-Bus configs
> e.g. dnsmasq, wpa_supplicant etc.
> 
> Signed-off-by: Andreas Vida <andreas.vida@ginzinger.com>

Thanks a lot, applied. Note that your patch was white-space damaged,
so I had to fix it up manually. For future patches, please use "git
send-email" which ensures patches arrive clean on the mailing list.

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
