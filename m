Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1576FD0066
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 14:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C03D8143E;
	Sun,  1 Mar 2026 14:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lil_K5nzS_I2; Sun,  1 Mar 2026 14:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCC50813F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772373714;
	bh=oIopybzhXxyQV28R+YdZVxL2CLTvC8+xxieY1Y0W+TM=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rRYkPGa/PVhHL9ez7TxfmUU9EUm30xXTpC2vqxOTZ8BqvQKyTCkSbyXnqwN6VcjaY
	 CpHZRtmFTdFIiCNbRxN4Q/J6+Hp0AuqD09DzkKC8c0X97+x3MhGqjo3XP7K3DcUHoL
	 a+dONpi6O7XX03+bxDB8rDZ/Uask0B4qjcM9xv1hSlWNqR4JZAAA7k5zuXsp4KYkJi
	 CwJYCaK7g9V4g44kh80AjX+I5uwLUmnagTjxuQCREd0ji5z7K+awrQzxSNBCCdlnH3
	 jEXuMXwiz9+2K2LPk6wvwv5MNKs4QaJ2e+P5S4IBHVmCMENAugtdHDTsE92AAvFSYO
	 xjmtpRN3SgHaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCC50813F8;
	Sun,  1 Mar 2026 14:01:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CE97024E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C007C813F8
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZqklY-Ff5t8 for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 14:01:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C2EC81380
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C2EC81380
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C2EC81380
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:01:52 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id whMjveliXclBZwhMjvUOCy; Sun, 01 Mar 2026 15:01:49 +0100
Message-ID: <302dbe28-478a-4fd8-80c5-82c219a78272@benettiengineering.com>
Date: Sun, 1 Mar 2026 15:01:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
References: <20260220133622.2271059-1-giulio.benetti@benettiengineering.com>
 <20260221072716.GA405421@pevik>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260221072716.GA405421@pevik>
X-CMAE-Envelope: MS4xfNP7V0kG5WhD5hcEHMeZCZ3vRENkxTHvKoVI/QA1kgkxgCGum2xPxRAbsnMtfWNOiEmL2/lLHphu4CxqG2A4Ed7Y/0R7P4WeJAVgEjMRAWJM5ariuzX7
 yq7DAgB9BB31Jqi25incpxUy9+ZZ2idCk0RkgFHwyPrJwyebA306s1RCzV8OAxW6u9beZB1eAPdB8tVW3pKQS4xbCl1Krq2pZ5y0INFP5/BKo+4dUZNfSz9I
 hiEOMUk1m4qVZotmy7huog==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1772373709; bh=54VGXTVbc/zOkNUgJRE4vD3xNITjXCzMbhByJGYpYiQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=K4tx0A80BLtvvKmFQuBEANgAg7vYjNPDqGYTI0S77tZXxpSV9LeOCkWG8/6psUTv0
 vK3iEv/eQNtiW3x+quA7cIzNPWNuJjRRELQ/oB3PmJ6eLo71JZP02KjnAUHYhnTlpd
 PVaDP8DJS8iuTRI9ArE4iOc9YhGgjtt5h5xT9hgYc5xYJv7n5pA2ElARU/Yx9GP06u
 IBgFdRqgrLwK6Ru8LU2jcw1tvWYiRclkPoAMXEALrWgYcjmUhSoaPjeIX9zWgFLQiH
 N981ZEhYr+juS3g7u8m5z1AjBr55h6cr1x2GQrgBHfcQJ0dYQYAfzelVGSpx7mDP9o
 zWPsR80PfBaIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=K4tx0A80
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.5
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Petr,

On 21/02/2026 08:27, Petr Vorel wrote:
> Hi Giulio,
> 
> LGTM.
> 
>> * blkmapd not built by default (--enable-blkmapd to re-enable)
> I suppose we don't need blkmapd, do we?

We do, thanks to triggering this point, otherwise option nfsv41 was 
ignored completely.

Kind regards
Giulio

> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> 
> Kind regards,
> Petr

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
