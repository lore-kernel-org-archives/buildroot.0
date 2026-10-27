Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CBD606A323
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sEfvccbg
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 339E0606A8;
	Tue, 27 Oct 2026 19:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPmRJGS-Jhxg; Tue, 27 Oct 2026 19:54:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B2F4660687
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793130875;
	b=G7yL7K0Al+jzyjK2N69ovnsnLILKTK8iYsph9Wrh62QXNm13ppSlNwr5dLTuE3CGNE6y
	 O17w6D8paX/jRZOU5+4d27J9q9YBVmT9Od4Mbh58xGKqLOF71pILI5aTpO3zNZzHQJ4aa
	 iHt2xKCR30WnfnxlK/Xxw7V6FhuZGQo02tDxCEJmQlOMIouXWpm8N9UQYua4plUVOnmRQ
	 sc4s4ZY0zYtzbpetX/thr95bRxKHpBMxDFZ43ZKHrWaRP8AaY8ya0N38kju5CjtFT5DMu
	 QTMh8PXB20sfkKD3crNNTttjVzd+fHy3rEpq0eAzx+sIymWvfnmmExrxbQ/LTKFOxJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793130875;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EvRayWK4HgnRv6F+707CQA/uQaUGH5IyBdq/1DlZHPY=;
	b=ZvZIfyDJTIpTEg7cONhP2WqeR77vv3NfLdcl2kao1WvKL2QxFA0ctRAIQyiRqqXBnzTE
	 gBt5g8OluyBiliqL8i+K82TrK4pgeE0ayo6N3JhIAQt/c0vU3Tcb62nkBHpJPDcwL7qqW
	 JYyklWJjtvvl0pzU/YBtFInPISi/OyPJuZGB+XQU6y4b2TRr6fD0RlGWyAqgmWwTjFyr2
	 S5cO0973twivdqt/3lAV3CsI20ucfqA3RJnpi+Vi44zgvnYexfEzGLm2rVsLPoDOkSXGN
	 Yno/lplZTRGj+jGr/mPKxL0zT9z6Z35u92wfkAf5B0fiK/mueA2+bZDD0k9U4CcYfrg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793130875;
	bh=EvRayWK4HgnRv6F+707CQA/uQaUGH5IyBdq/1DlZHPY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sEfvccbgzGus1U7aWcAuPFdCx/wScKOuFYEGMfeSANbRstcwx7NqN6upA4kg36A3L
	 x6eBkAKHy3SeTGkQbRSs0Zl6p3Q3BuMCktGbPct4S/3ib78hXUzLZ+x0zk9KR76fcT
	 IbJs750l1qM+J7G18/d6pU3zFOti+ZSnLjM6Kbs9CJx4XLYHHBT6OvC//WaLTvgO68
	 Oo6qli8tOjUXP3vPL8dkSk5hRsiY+Gv6tvoOYmoFX8Yxd1ifUJh1MIAMGTo5DgDJ9a
	 PtRKWih1kM1xFjiedHk0eW8m0l3mVlrMDtKp1t+rXOTKV+BFCt65iSvGuMFDbHDQVI
	 rwrOlb5zB0F6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2F4660687;
	Tue, 27 Oct 2026 19:54:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EE90529
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84DC040112
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XD7dWhcYXB-3 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:54:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 428F44006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793130873;
 b=TSwTm2Qu0IQb/BUA/fQ3t+lmth8Wx2b1BnJXfusLe6RJ83rhcOEKgqFlXg/BztmSGh5p
 glGEcVYD6xz8kIF8sgK5VeumuFz1teoLDHuaOmIYCo1E7Cx02741AMnlHnxChm4oG/SsO
 YsohjLAiDqJzqvTHf1kXGVc4aEzX4Wz8ZanUdhrshx2FBpg957UKO2+FQx+x5Kvfx9BgQ
 0PfYddx18ceFftyc99FN2p30dWlE8/jI8xnelR8AeK7SK1VVqhzQSy1X4E275XxXINZ9c
 tXwBjSQeMvnAbgs5lzffGBDXRwcqMIun/zo7pV8eAcw8b3mdF9WScMsHr0JbPxer5oA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793130873;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=fVGn/07pJEbQCl9YpwobZpxNRXOF9etoO3WPoeer3JI=;
 b=mzxzcOo7SRZpcGN14g6fZlAFY6xq4iDwU0lkKCtcYshJrX7FAvM3VXVgW/EoAt0RKBKu
 /0KWjcgdcVPwXLpD+3qb9YB+vcos+chWpD9cO28MdGew1djEm69HspHHKrAT4tZ9tF+7E
 +OFkVENs36RaNMc09agyFwvTzy4c9wl+CuF3Pf/13ByiG+TGdgCeLYOyRly5P1Ejaurk3
 j8s1ZH8HQB2UP6KxeCCIYsg9wDSCpst4y1iqB1Ny1itr4o72SVuVgCO9gkWrwhJUnukiA
 dPmBE+k25N1+BWZR27OpSeYbuoPQPciivC63rj4Wp5yggntxwfzL7VXjkSoSG/SvfHw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Uw5D8QD0; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 428F44006F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:54:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 933DC4E41336;
 Tue, 27 Oct 2026 19:54:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 60280603BD;
 Tue, 27 Oct 2026 19:54:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 39AFB10328A20; Tue, 27 Oct 2026 20:54:22 +0100 (CET)
Date: Tue, 27 Oct 2026 20:54:21 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auEBajzSyztbp452@windsurf>
References: <20261027164013.1602502-1-adam.duskett@amarulasolutions.com>
 <20261027164013.1602502-3-adam.duskett@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027164013.1602502-3-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 03/14] package/mender-artifact: bump
 version to 4.4.2
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

On Tue, Oct 27, 2026 at 05:40:00PM +0100, Adam Duskett wrote:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

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
