Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D732AC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 19:29:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BEB061050
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 19:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BEB061050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4EAA402A2;
	Mon,  2 Aug 2021 19:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aO5JtNaBkJ8K; Mon,  2 Aug 2021 19:29:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AC514028A;
	Mon,  2 Aug 2021 19:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADEC81BF419
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 19:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C4F44028A
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 19:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rDRVSaDuZIKZ for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 19:29:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4742F40277
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 19:29:44 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Add7miAakrXl6Add7mhd1u; Mon, 02 Aug 2021 21:29:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627932583; bh=wJKD3BOOnOHyWhQg2UZKt0bdtLj31dD465+teunWHZk=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=Io8lpxIHyuzL6ITHnzq2CJI/qqTcXBbNXvFdXRRADr0Rhh1+4ylh2pawSLIKBladj
 OSB/AuBk2fwivdI+w6f9muznYBs2rmJlWrZ3uT3zYGFX2BOcRLMAXkqKoNivSDf+Xt
 hbOIQMhwi9waOL0drbBygBSwhbS2qy5NcURg/sHwlcaUmYRvnD06OP/uEIYFG+k/bU
 NnBaRIzg0ep7RzOzpklN4t/+80iKiGTvvI7TJfqH1+FXpFaK0Exe28lAij7ruxgIbC
 CobczV0bNb+DnIWPkEo2LEPTR8kzDlGrruKlcpis97nAi98OuoyyAqP82nS+qcypwd
 mrAjpOMQUtIOw==
To: Petr Vorel <petr.vorel@gmail.com>
References: <20210802172116.10073-1-petr.vorel@gmail.com>
 <2A61C2B3-401F-459C-9DD1-727E041D1A20@benettiengineering.com>
 <YQhEuH0okQM/3P03@pevik>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <d977d4d9-e596-29e4-288b-5a52ca13f01d@benettiengineering.com>
Date: Mon, 2 Aug 2021 21:29:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQhEuH0okQM/3P03@pevik>
Content-Language: en-US
X-CMAE-Envelope: MS4wfATTKCLhpaGqC2bQdls6n0y66jpqUu/UR7J9l2UVbyiikqX3BtTSUDdWzv7cl9tNajrlmEa71vfdlVf+S/sVLxqXwb3WA3Ex+eX2jKqhV3z94kwMi2c+
 0flIAp2kc+moKDuyori3q619RaUK3v5uwvYhT/HQUce7ti29s8qm6ZKDX6Ca9wnJixutKhM4Icab0M490xYzuqM0bgi18HUQQ7RmheADU/UHrA+gntGuX8ar
 yGy54tc4tYer45aywfuJfDWU7QzfiUOSQsKxOMKGRkE/vEZpiSqWAaKkiQSTi7RI
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: Backport yet another
 printf fix
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 8/2/21 9:17 PM, Petr Vorel wrote:
> Hi Giulio,
> 
>> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
>> And thank you for fixing this :-)
> Yw. I see time_t printf format is more tricky than I expected, 

really!

> your traditional
> approach with casting to long long would not require this change to uint64_t :).

Yes, but Steve preferred your way that is more portable. ;-)

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas

> Kind regards,
> Petr
> 
>> Best regards
>> Giulio Benetti
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
