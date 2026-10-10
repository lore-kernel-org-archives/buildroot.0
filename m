Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB049CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 10:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35F34408BA;
	Sat, 10 Oct 2026 10:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJkSJzDOxnTG; Sat, 10 Oct 2026 10:15:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D1C1A40969
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791627340;
	b=P+LfhwWGhpuzku7j7kxBGEEJga3xiGkUbB7hyXdW89w4TBv3aRK4IIzcu/5irgsvSumB
	 i0aABriqs9iLMiY6OZ/cwEim78rteMcRPK7rREHMJDxGnLEwAm0lu3BRFJ1GE4AVhqn7+
	 4IOkM9XXpcXyz+dcsNsSDwoB/8wj5j9l54eDf8K1YCb17Ac6Kup6as+RJ2kfkelvGUoGU
	 iMC5/dfv6XZ7+4mJKHDHdyVpe7QP+1iWhPMQCJMDPWhQob2MAM8VC6BuTvOUKdJyzjkm4
	 N44CtgnkoRtevQpWAEKzIQdTOwrx9egSqSK62au/2wN221JKZyF8vqlfzeJ5ohvFTEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791627340;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=t+2Kv/pf6imSmkbGyeFcr+3Mejk0SQGnb2bKwBvTcWk=;
	b=l/zoPZTSgJolcv3z94yL3x94W9Bf2LuTkrKvwOLqWgMZlWAlMhCllRO1RpMbAvax/VUp
	 wQJMd3RRA2xAfffnY56ghbvOKKLYYySJlIQ9nY/s1hKE678Vds/FYyX3pJVg2K+3txB6/
	 WoOXncQdFE7vYo6DBmA3LFnwntDfv30mn9cRP5LHEWwMbWWwSpn59VPmIBx5VtLxOYTc/
	 uTIix2it7jm2GBc93FJU1NiIzkT8rtdMM97nIf4Q8tqWgApRldH1dP10FBu8q5z9jozRL
	 /cuDHC/XpkBxOm9LbyAQfrqDBygTWytVvJflSwUqe8gvd1oqBH9L4JAfxORPi0QTM1w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791627340;
	bh=t+2Kv/pf6imSmkbGyeFcr+3Mejk0SQGnb2bKwBvTcWk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mg6eVTxkJ33/d+KeEgRIlZGbjQbg00iMsFZRb0s1Tv5YnMWEbRPPE6fS5IH5sPZUA
	 DpMShsoYV4s6y+VfrfeyFT0xRliMRuipKHDt7GA50MOaMMj7ByyIyVOmb432/n12Zy
	 U/Ziivrekn4bgKeC9VaSmqacDZ0ayloGtVECO8pjLoLO9s0oS0if8IIjnXGOCzULpL
	 q5xOhe3aUBQgYbcn+5A7HSydB5o1eYTaf3C7Obkv8n6htFv6+U5nqaXVUU2MTIiHAT
	 9TBG7V64gPnVLRG6op2BZy3zkblLBQKuDH1wBG8Ii7LmzbYedLP0N8iMYksm+Wv3h8
	 oeEN0j00+fpDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1C1A40969;
	Sat, 10 Oct 2026 10:15:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C6C5105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 327E8400D5
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ly1Dco-Bqg2x for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 10:15:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EA5CA400AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791627337;
 b=Jx5oadiMlXgRuOYNYn7wcF2V7JVKBjLfZqjFUTR2MnFMvvm6xvaRNFfTPeeUGAKjzVxT
 xroyLE+DJMwPBFYVRADn55I9qK0yOrLauN8ZRCmQ/qjlqJZY2HYJIITPgIQZt2HR4ajgN
 vHwI+KJm+NV4nX2Ot562J4/vh0l8ticeUd9lFl0pOvb8QfajBbiA+Y0sNZRaxfU8lheB4
 K4aVpz36LNO+o29gH1+dHebLsiyF5RHhbbRmpC0YsOCGWHWwJO3EFXTumGbzJf257Up9T
 m52vbnu3R2+aXY/OJzfZzwqmQA7cURJST1PwB1Dc3kjPUTOeDQ424UwUeAq/F7olMyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791627337;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=akH2c56UkwVs9ckTarIDhKnvdISKrmq8UgNc3XmSbOw=;
 b=loiVrgMG7T8ZOGCBYx70VUu84teanpTlHsiuusLJhB8RuabkUWKiWNouf6RugeKEeW7P
 YcdalNoWRD6ceKLgWVswSuJDFOG/o+6YFq922DIvQzEHvPeza3HbJ9IfPWhuj/+Ub+7kX
 GktkojXdEfGNZXJnT2sd03YJJf9LU/V2ceoN/xu/K4Mo0rDvtA5Q2DQ7kdLhkTxOLJOUi
 AhSDl1A+lBiANzUUldNgavnAoAUt64qF+GqR9hKM1C6z9TT5kZaMJoK5OSXFro/6jTrqF
 //rj0N5MwxB15xNRGoN2o9FVMZFA66bYkZFQo2O3xBHveknfHI+iF3wodQKjDd/xNIg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=hs5hNV6B; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA5CA400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:15:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8A3C64E411CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:15:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 58B956075C;
 Sat, 10 Oct 2026 10:15:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 601C311D701F5; 
 Sat, 10 Oct 2026 12:15:32 +0200 (CEST)
Date: Sat, 10 Oct 2026 12:15:31 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asoQP3xqlE3_8r3k@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-50-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-50-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 49/84] package/squid: Fix build with
 OpenSSL 4.0.0
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

On Tue, Oct 06, 2026 at 06:20:30PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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
