Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DFCE95363
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 09:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5FE680633;
	Wed,  4 Feb 2026 09:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZTtoA6ivhW1; Wed,  4 Feb 2026 09:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDAC983BFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770198567;
	bh=5KiOeQLcx9jhranq2n/LLR0F5deDOCWQ9Q/GLEOe6f0=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OGtU4fv5EG0w+Q9GmuXyAyBjl1pyFVsqrVm8kTQoUS3NcSneiazfc8amubpZcolb6
	 TrM888dPiYwwFzpReToSAwZxxzTLydG0ZLPfTK5bKJdZoKrE246tbcFUd7ACB6JWQF
	 h8KgnU1hcVa6PpWXiz1xvNXCNH1mF+jbeWTqg3Gq6FO53mHMoH44VKYrOM8SwAatvX
	 0GAb3fkdlw8eC2w4wtzmMgnC39NoG/w2WQQelXpDW9TxBCQeXoAI0rkeIWTO8oTA9r
	 PSoONjxGmCzf2tOpUKf5Aj/rfrNV3a3XAZeK904d966u1cuQ3jDtNCbJId1ZZ/MQ6V
	 iMf2yeDiF7qdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDAC983BFD;
	Wed,  4 Feb 2026 09:49:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F983173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D8744016B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id son9LaHr9L2p for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 09:49:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.133;
 helo=smtpdh18-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6BE634005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BE634005C
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BE634005C
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 09:49:22 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id nZVgvEn3G5StenZVgvr9U7; Wed, 04 Feb 2026 10:49:20 +0100
Message-ID: <520804aa-cb63-4ca5-9355-76e3497376c6@benettiengineering.com>
Date: Wed, 4 Feb 2026 10:49:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260203110659.2127935-1-giulio.benetti@benettiengineering.com>
 <87ldhahxqv.fsf@dell.be.48ers.dk>
 <eec3c48e-3ac5-482a-a85f-074ccf485fe6@benettiengineering.com>
 <87v7gc7sds.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <87v7gc7sds.fsf@dell.be.48ers.dk>
X-CMAE-Envelope: MS4xfO87h53bMJOFqiOZSNXWk11tbHZiJj4G5IdLzBfujibeAVEShrMoTedHxfKpVixssITsbXPmQTyxFz5CRmrHzhm+E6CpuvNdSl09v4ipJdNYPAxQo6Kl
 qbkjAhhaxpsT5kylrE+IRSSIhHRBhVKMN15gMIqBeFCHXRttV1vXy+ejOKtnCFh4u6/SIsj2hAoSSCkLPNZauWBOuiLcSWybL99ZUR/JJl5r5B2K9ix3ZwJC
 mNgiUDnWl7ukyKinQV5EIupHU4G5iEHwpPzSKAZ0mUu61Jej2kXtVuZdpgCINz77
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770198560; bh=NrmWK7UlGMerBzOtjWUfm7olfZ9rAwvSRG9TK+DqlOY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=kC/8aooWNeZ8kWX+1J6vld9w7aoak1URUteNiQgWL2tAdaGaO7+Zte6iQtqE7xKYN
 kEQAONMhZkvliiaXbxducZFnjZlW8N1R0Z4yuaAFZDZhyjquroF4uurtZLRL2wEJiE
 ZxmjeqmUFq/Rx1h/upxouOA+ZKIeXOMSloifPy/wOaUh9L2gt79IPJF+hTq4tsA9FF
 AzXK9I2BWZF/daWLXXvGFn+PXdjB8tBx2JDeQEEo1JANNFSY2lycCP/0V4U/GuXSUL
 l/Tt/vjrmwyD6lIdsmDwQjjBAjkh96+rF9dheaAMjs7zYsQW+F2tEgkICbXw8WEUUq
 xZYJzTfr+//sg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=kC/8aooW
Subject: Re: [Buildroot] [PATCH v2] package/bind: security bump version to
 9.20.17
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

On 2/4/26 10:46, Peter Korsgaard wrote:
>   > That's why I've pointed only those 2 CVEs. Was it correct?
> 
> No, they were fixes for issues only introduced in the 9.20.x series, so
> we were never vulnerable to them.

But if we were bumping to 9.20.17 they were required, correct?

That's why I've pointed them in the commit log.

Otherwise really I don't get it

Giulio

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
