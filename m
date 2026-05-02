Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A38CD13DA
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 12:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08FAE81404;
	Sat,  2 May 2026 12:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYe_dAFVLVQw; Sat,  2 May 2026 12:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C090B81370
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777725012;
	bh=Qe9a6yVtX7WDhR/2EfDhQXP6o1JEfP4/t0GpjowOd/A=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Hk5xwmlz5Stu4Maf5DBqitu8cZOu11493DKkfM44inH1iTiz3t83UI/WQ0YwebmmI
	 INm3fUl8I5og49/tQc3zJieMXkNZWWGtTcYDmcc6fREZMbB7pE26sEtndV4/vNdNZX
	 Cmtg1JpTgBa+TZVeGzfuJ4zO/5ig3g4L0lWhRtTpHE0n8aAjcbiY6Qg04aGRhu0Xnh
	 6nk9PiM4RDCF7zAt4xWVX7KG5FtlSxCmCb+7YgM6UKp3caMK2Oni+E762ETjZCOMFH
	 mElTB8sbzhQ8Az5h132k173kPDHfp9ylQcB1eTN1mhakkNbtfWud7hwtNJSrjusisT
	 k6kPRdFwOF8fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C090B81370;
	Sat,  2 May 2026 12:30:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77C83127
 for <buildroot@buildroot.org>; Sat,  2 May 2026 12:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D77140833
 for <buildroot@buildroot.org>; Sat,  2 May 2026 12:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXiK8ayVETNd for <buildroot@buildroot.org>;
 Sat,  2 May 2026 12:30:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1099240832
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1099240832
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1099240832
 for <buildroot@uclibc.org>; Sat,  2 May 2026 12:30:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wJ9Tz-0009Rr-A9
 for buildroot@uclibc.org; Sat, 02 May 2026 14:30:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 02 May 2026 14:29:17 +0200
Message-ID: <pan$3a545$3dc87416$8e38e4c9$8580d900@ID-313208.user.individual.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
 <20260501123100.1918951-71-bernd@kuhls.net>
 <1f627256623f8f08cb2abe0b384b6db6__14265.3861011908$1777723557$gmane$org@free.fr>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 71/75] package/python-wheel: security bump
 version to 0.47.0
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

Am Sat, 02 May 2026 14:05:14 +0200 schrieb Julien Olivain via buildroot:

> Could you provide more details (or confirm it is not needed), please?
> No need to send a v2, I can fix while applying.

Hi Julien,

you can remove "security" from the subject, thanks!
This is a copy-and-paste error from the previous python-wheel bump, sorry.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
