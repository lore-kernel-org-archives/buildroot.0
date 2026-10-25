Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F036606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EFgye1af
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFE0A405F4;
	Sun, 25 Oct 2026 20:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4s3VexHUh_Sa; Sun, 25 Oct 2026 20:57:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 24D77405F5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961870;
	b=aYbGrJA+wxGWMvLgqKVjt0xFAV/dmj611v7b4Ozqj+NQPvGYzYjEYp6xnHSAVVTPcC6a
	 AXexApfDHq8Hq0gPmOn6ghIIwm4Tm7OCRgEDGkMTOu81WtAv5S95vjDDuus73Q1RV4qb+
	 FrDg+lioOIng2DCMjW+db6yCtVTFkzfxLbNK48F0W1AxFVdCbEa+XpRsLjatJzqgp8yj+
	 yBZ0mRwOvsiDnkukL6VAwGkNXc48Urou0TolbNXCGy3bXy5m0gsHJXr44sKlhAWTMGEbP
	 aVYPTXlvqD+s4Y/bBlt5A5h0Qlxgy5X8sEenbEhsPxs2Y7S1AFY6Z2VM/4ESQkQYulg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961870;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VKH8PnpWtAAgfdWmX+EeQcTXNjcsGJ0r7RWMCrHPJNY=;
	b=qQYmgO68S20duhtfq3zASt+LYjaBbdLPAImYP057TsUkMmdnHkfdxxlf5QnVxlKdppCK
	 s7vn2w2HWYX3BxBNhz/bLWiE9x3B51fqDTsOYa4SliD8yKfDngrooNnYOOwjjsasEAaND
	 18VVkWFAXq/Hw76ifTpWPi72qzsgqG7I37I2VFG0Uft55SEQxhhdI/8YUHviZj/G0m+uQ
	 69e/RjSRV0C6kYcof4ibe8fRlGGYsxvgpoOe2LlfFL0p+xzQE35dd9dJz8YqYH5S6JZZu
	 Lbp+lZiMHYA44eux+wYgBHa3T+KlVqQVP3uIS6D8wOkLALZZt9sczbpHfNsrtMgVzuA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961870;
	bh=VKH8PnpWtAAgfdWmX+EeQcTXNjcsGJ0r7RWMCrHPJNY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EFgye1af4eBWB8tStoWDqDUArwBL16xSSvkzqm5bNt3oTlqeZA8Os/P7h0xfS0Xju
	 r/nr1s6H1uSSFdQ7TD9oX66OzZ1mTCMnmuvY/5E8TBoJ3GDfEiXVh+pfsiCHOGNH1s
	 5JVjfRd9vrFa7Qalr7vq69vtBl7by3uSylYUWS3EILew3NdIcIWat06jbOSmpG3fh3
	 jj61kTkYYp2fWHT+rWJnff2HKAOCD/WQbjL75jVwhhHbkhgMsAiDK3rvsIwf3hbavr
	 VZU5pBtuyC2ctRofYkIn2+F8jhp28j/MT15IqSVG/B337IB1QdwXocMA/jPV/Pw1Ug
	 kMElmADe8zUtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24D77405F5;
	Sun, 25 Oct 2026 20:57:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F4C2380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91004405F5
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2oS2p6cxg8T for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:57:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2B021405F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961867;
 b=sveMIXLxrxea7DgtZ4l7J2W37WLybGn8I+abGmsbN/qF653nUt0rwI67V5vj9ofMcsxL
 w/6gWc4H3IykqQQmhYBt2ugFV6QK3FDC6qnNs+xXgOH42fmk7piRBXy3WWmLyVD/uNZLH
 vzAckU+RqAI3KUbnUtmtKFqFNBG6cVjHOJjaYBpzBRVQJ7PMTsKhZ4QRu40uYVIbxCx7/
 5gyO5LFHEVEDjg9dCy/+MZ5Tt5fNroYM8DoZETdvgITAfZXmRVZDR6/thhTWcDsn37Onp
 of5mAZIrU5RwjwccCjwB4B9sCTzG9kpZEN0vlrJZMWxX/Vi/ygeEmK/w1nfQ+wQNsZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961867;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=9XFaqD4MBk4ycs+v7NKuSVyVnKmZjf0VfJ5PXauiw2Q=;
 b=ARjAIKC66LazHO/WFLz6XMQua4IXM0Q7XRWCQ48NuKhB8b5Nej3Fud8lkJyrLMWdg/uQ
 68IvGR2+0DpXetiZd6FFF+gJ/RHx9TZp41XXt7/hOxHuhEIIbOddW9NACPYa+23RajEBY
 4Ydfuuwx34b9/9rZ69mGCh/Jrqmjb/tPJ0TzT0Ef8n7olvk0LnkCNHjpJ6dMeqxQxCyfq
 vHyR1ELA6MILDd3eQiz3xHmvaEJWOeDtjHOD/jAP2RBTzqj4s1A0pSwwVh3vYWEfdNLru
 JQOAxrZ//OjBf8sfgYmksKnHihWNQgthnC3sKQ9+G7NgQ+S/LWirskvhedg608CLqgw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=PFjcVBuW; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B021405F4
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:57:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 835901A1340
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:57:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 48D4160740;
 Sun, 25 Oct 2026 20:57:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E0B5110328E76; Sun, 25 Oct 2026 21:57:42 +0100 (CET)
Date: Sun, 25 Oct 2026 21:57:42 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Mark Corbin <mark@dibsco.co.uk>
Message-ID: <at5tMQ3AmGKNMhF3@windsurf>
References: <20261020202639.1094960-1-ju.o@free.fr>
 <20261020202639.1094960-4-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020202639.1094960-4-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 4/4] arch/Config.in: change default target
 architecture to AArch64
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

On Tue, Oct 20, 2026 at 10:26:39PM +0200, Julien Olivain via buildroot wrote:
> This commit switches the default target architecture in arch/Config.in
> from i686 to AArch64. AArch64 is now one of the most common
> architecture on embedded Linux systems. The default CPU for this
> architecture remains the Cortex-A53 (Armv8.0).
> 
> While at it, this commit also refreshes the .defconfig to:
> - align to this new default,
> - remove stale options (BR2_alpha, BR2_cris, BR2_ia64)
> - add the missing options
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks!

(We can separately take the proposal from Arnout that drops the
.defconfig file, which I believe is a good idea)

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
