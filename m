Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9F8CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 21:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A06981509;
	Sat,  3 Oct 2026 21:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfI4Y_XNhEYT; Sat,  3 Oct 2026 21:29:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 84148814D6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791062950;
	b=EdrspoFJnqiPCeRGjs2KXKlaSjCraLqjB2QZvkeSgyhRYfCovtuWtAknxLDYjNwzFIM1
	 tFdszUIztcXL7QrQ4qQCtKzfZr3dmWX4Uu88CVVrTKh8zBuAs/Hk/j/IYuPqO/4hgwg5M
	 BtjoNTuGrbLVdtTUuxS9ltYvSYBjMQZBNytqQdPyCW9uDnPrzsMXsikxMjp6hnRIfD9qp
	 uhRcAdyVsluACwZgJD6qF1hTvQtzYdB6jPFea5oHwcunUb9RnkKt0MWhgeIJBOlcrVC48
	 5KSSKbTlQXIEoCO9XIq4H2Pg0NRPbtzWhLl6UEP0HSGhq4pD/loWQcIMbwlLe2uAOlg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791062950;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:In-Reply-To:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wMeut0ggnDrr+WpexdOt6Ob8bmPJotPN1taFMfRKLTg=;
	b=J6sUCZQgFyoPDa4XGl4Ao5EWVGYZxJRbSabOKfQr18t6Tpi9Dk8x+0FguMGYgJfgIYvh
	 5C+IDjrF0LBOdStMyNEPrNR1Siism7DwapsY0YLXBeqgct05fqlCWAyaxPdIBGVY0Kmmt
	 LiedlVt2yWKZRmIKLAbFUIfWT7fmnfFN4RsKI5x8dnc6kOpt81ck8QDHxsAWnnSKgh8h8
	 Pn4JAsCduaEHBPVSLcanq6I/Qi5XONiloVVRJHZErNMTijvXRTr/riZ2fprtPteg47FUM
	 gOYtm5h6XMJCzpKGUF8T42m8Q9+yizKdPqVJD+G9pquqjV0iNQpR9MI/5eD60tTOYKw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791062950;
	bh=wMeut0ggnDrr+WpexdOt6Ob8bmPJotPN1taFMfRKLTg=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Lc9EXnw8FLR6P7w6ZVentdHqVfDlRnS3WBNmj0EFdpH3tUKYa1Um5vWlQsfw1a1pn
	 m6bL3z7DhznxQ9am0rJrCR3BKPsgyIs8+UcHxxbf5S/mdX2W+lj7IBhoe9MEw/3+kA
	 s28MmgNaQkpR6aC6Bo/snCiT06HKBQ2mASZbQyXEXFnvBMoI37KA0viWKiqSGuClvx
	 LDCo6skjBj6cXRvg2CNUmu6qRzJkeO4wW88oo05nCpo48CRwgiWqP82VOVeIgMcQAT
	 PBOsYamIMObE2s9ldX8wiCXbE/aTgAgQNzICzaMVaYkeH5whpKzwm42aMIdYQ1nbrs
	 3NsB6QCkJdFdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84148814D6;
	Sat,  3 Oct 2026 21:29:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6399335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB6874007E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SauFuN931oZ8 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 21:29:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B1DA240055
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791062948;
 b=m/UNHRw1uAW+FtjW7ZMr/AzFRVzbEmdzj+WW8bJv6cILDoA1FdnH0wiL2nXNnzRTVqPI
 VaBuCeWYm8Jx91keru8lioNXlpaoeyT0mGvAO0nqKHdukr8/D03VrXmI97J3psTm7Qe0i
 d5zwbjYemXYwox5oNzQdDSdOLUpe6uRnND2XZ6iITHm6a80DWcJKH7wT6+wzkQCQLw8Ah
 fArl+KIqUmJIoJKPyfU4fv1e+xHs7dEXHCQA+chvvlk1ScUjgMa6igHaoKja/yRKhc4Wa
 IzO/Sr9eDPBZaBrmsMVKQCLGSUVFR30oXEYmQx8rPA0Ht3a9oK7Q/wMDhzOPucQ6KZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791062948;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=aSonGN+xnB8RFe4949dTF52gCUTSg3t/A+ACl0ig4CM=;
 b=QOU7infLChatW34xguVZWVYyoUZZqhRgYk+Lpok5QjyuNbwGc//dKqB7up5bs1maPpoR
 znqJROji4V0Yf278BoE1jM3vW2OALTyzAkLbUctU2JHD7vFUnzjfLTczcyMQnv9AEVyeb
 5uZui7a3YqfCSXaSisRPfr2JMuMBweETY+8Vbylt5Tg1N1aN0TuXoYw0hqRNyTcGtjKjE
 gUY6ZYKOGL5pw0+Cws+mV/j+J8oc3K8mIQtEZVHZ8ioZt/j6GK5EgyS67uGlSnLTpQKd2
 +iybFfQeUfoH6GLyCQytWW2BVJT2Wfv8F2H85jvTnOV7mivQfwz7chSQDstyWqFesoA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TfpEZrPA; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=maxime.chevallier@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1DA240055
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:29:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0AFE61A110C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:29:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C2E7B604FF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 21:29:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9941F10328366; 
 Sat,  3 Oct 2026 23:29:02 +0200 (CEST)
Message-ID: <b0febb4c-2e9c-48d0-bc73-1114c2c35324@bootlin.com>
Date: Sat, 3 Oct 2026 23:29:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20260905093953.62996-1-maxime.chevallier@bootlin.com>
 <ap5WKkAd5WBJhAsj@windsurf>
 <dd27b98c-64cc-41ec-8312-60286fdb6c71@bootlin.com>
 <ap5xxEjbIUYUJMPa@windsurf> <asEt6wUgKLbeNuNM@windsurf>
Content-Language: en-US
In-Reply-To: <asEt6wUgKLbeNuNM@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/linux-tools: selftests: Use
 KHDR_INCLUDES to locate the headers
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
From: Maxime Chevallier via buildroot <buildroot@buildroot.org>
Reply-To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 10/3/26 18:31, Thomas Petazzoni wrote:
> On Mon, Sep 07, 2026 at 10:12:39AM +0200, Thomas Petazzoni via buildroot wrote:
> 
>>> So I think this should work even on kernels older than v6.7, I haven't
>>> tried though ;(
>>
>> Can we give it a quick try, just to make sure?
> 
> Gentle ping :-)

Sorry for the delay :/

So I tried and unfortunately I was wrong, the KHDR_DIR variable has another
use site, and without it the kselftests build fails on 6.6 :(

So we do need to keep both KHDR_IR and KHDR_INCLUDES, I've tested that and it
works for at least 6.1, 6.6, 6.12 and upstream.

I'll spin another round somewhere on my way to OSS/LPC.

Thanks,

Maxime

> 
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
