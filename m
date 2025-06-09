Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17101C5B552
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 17:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C145840D9E;
	Mon,  9 Jun 2025 17:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLOeurJh18py; Mon,  9 Jun 2025 17:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B4BD40DB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B4BD40DB2;
	Mon,  9 Jun 2025 17:55:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16746CD
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 17:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0752E820A1
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 17:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4maZbphYBuTx for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 17:55:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD36182087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD36182087
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD36182087
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 17:55:30 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 79D92440406;
 Mon,  9 Jun 2025 20:54:34 +0300 (IDT)
To: Sunil Kumar Dora <sunilkumar.dora@blackfigtech.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
In-Reply-To: <MAZPR01MB837141FB4F42F5F5EA84F1F29B6BA@MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM>
 (Sunil Kumar Dora's message of "Mon, 9 Jun 2025 17:35:41 +0000")
References: <MAZPR01MB837141FB4F42F5F5EA84F1F29B6BA@MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 09 Jun 2025 20:55:26 +0300
Message-ID: <87bjqwx0j5.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1749491674;
 bh=ZEpZP4evgG6InhseINpR1KUwhJXDUppTsvjBfPYDoTs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=upWOd5KFK3/AKmiAPM9yGH70eTjTVtH1rwrpooZNX8XxTieOwULOEbs9Dn9i+EDbb
 YspN/MjNx4gb/rYJpoUJm6eqpeo3cpbEI8i9Lgld8kQHABk1iTpas6wG0lP1GpzTrW
 8k5V8UcDXTJO9QQiqHK3sx02XEnee7/e9RfDtTiMyw2aGe8Ul7MO2t04Sn+wXrukKF
 Zr2x/0bSwERoAozOPSeGwb6jFU8tQBW6gTna1YtPpchV0ptF8rbqV2XeN8dHB4qQRY
 d+67A+ifQlc7LroweDccXogkjZb7t53PeHK1t+7u9ORgqsWPQ/goYfmiSGTAqpXPtv
 Q8PcwK82dsPzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=upWOd5KF
Subject: Re: [Buildroot] [Question] -- Inquiry: GCC's
 -Wpoison-system-directories in Buildroot
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sunil Kumar,

On Mon, Jun 09 2025, Sunil Kumar Dora wrote:
> I noticed that GCC once had a `-Wpoison-system-directories` flag to
> warn about unsafe system include paths, but it seems absent in modern
> GCC. Does Buildroot apply any patches to handle this case (e.g.,
> preventing accidental mixing of system and local headers)? If not, is
> there a recommended alternative for embedded builds?

This is a binutils patch that Buildroot applies to its toolchaind:

  https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/binutils/2.44/0002-poison-system-directories.patch

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
