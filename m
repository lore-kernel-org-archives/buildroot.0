Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493D4CD5BD0
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 12:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22C5F81638;
	Wed, 27 May 2026 12:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cb4dIut9XwFf; Wed, 27 May 2026 12:03:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0732C815B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779883392;
	bh=IXt8o6vKFwN+XFZYaNXzfHfQhaZw9QLherNZuwN8ehU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MCjWPGherxsR98xL/RdvgtOpXZfrhOUVqDIq+poFqP8aq5976anKTB4gY0CoaEb73
	 R/OIHgybl/kY/7zftPha57DWHauxNSbX65MOTUyFxM+t63PSRL8g4ilZzVV6FW1T1G
	 MEgOxxtFAYb5lLxcLD59V7ti4YpMLliYrgcgWDAn1t7HZXi4ZnV1UK1JiIEjiFmIhC
	 wW48fmY2apCk/le+Vo/J1jwcP/YHpbVQw5T74T2kR8m1uFtRerx9siuGG33YA/UHAi
	 oUmYVDzgF3vnlRF5mdB+DQd5kWjqqfDpr2fxmK991yZDVMbfPp//HcHW1+G9FpF5Xo
	 lQYO4APkS4ikg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0732C815B2;
	Wed, 27 May 2026 12:03:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 043F225C
 for <buildroot@buildroot.org>; Wed, 27 May 2026 12:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 012FA81583
 for <buildroot@buildroot.org>; Wed, 27 May 2026 12:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fn96KcpAuIv for <buildroot@buildroot.org>;
 Wed, 27 May 2026 12:03:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 753418149C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 753418149C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 753418149C
 for <buildroot@buildroot.org>; Wed, 27 May 2026 12:03:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1050448576; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 May 2026 12:03:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wSCyR-000000011Gi-0tpN;
 Wed, 27 May 2026 14:02:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: * Neustradamus * <neustradamus@hotmail.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
In-Reply-To: <GV5P280MB2281A925E41A90DC1942788BCB082@GV5P280MB2281.SWEP280.PROD.OUTLOOK.COM>
 (neustradamus@hotmail.com's message of "Wed, 27 May 2026 00:54:53
 +0000")
References: <GV5P280MB2281A925E41A90DC1942788BCB082@GV5P280MB2281.SWEP280.PROD.OUTLOOK.COM>
Date: Wed, 27 May 2026 14:02:59 +0200
Message-ID: <8733zdm558.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EBeurNk7oa/wEXI80yALgcAS8NyV0EYwERzCIfamDvU9bTEDFU5ns+NPVYgVNU3aDflfR24a3yIzfHoV2H1VGkfILiYWwbqvaToQnLWZ9Q2v3dHU80o1LEjhpyEVOuBhZaH0om+MIXEEOJ/vEE6Sk4dHqmEbsYFiaOGXKptWfLX7zrNlBl8K6RMRNSEdTGodn4BJnurO6Y9eOxE++qovrY1An4dxG4XMRGZu0wr3Mz+4hAu62GPrDB92E6n8T40vOdJKrv1tvTQCuDiNgYPviXMVaW6mCjXJtMNBq9W0+sK59R7sl/GwNDnpUbEy+i23LPAMbDcCYLZN75BfT3NvVw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=nzi3b36T5dIPfQqi7wBbDi1D0ctHlCwkExpbCi6wgiQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=EBeurNk7
Subject: Re: [Buildroot] radvd 2.21 with CVE fixes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "*" == * Neustradamus * <neustradamus@hotmail.com> writes:

 > Dear Buildroot team, Peter Korsgaard,
 > Can you update radvd to 2.21 with CVE fixes?
 > - https://github.com/radvd-project/radvd/releases
 > - https://github.com/radvd-project/radvd/tags

Thanks for the heads up. I take it you are referring to:

feat: harden radvdump (CVE-2026-48715)

I'll have a look at bumping it tonight.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
