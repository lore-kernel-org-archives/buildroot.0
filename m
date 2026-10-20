Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D8360A261A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mmJERcRi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=dC/xoyvA
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 355DE80C1A;
	Tue, 20 Oct 2026 10:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50F57I_yey5Z; Tue, 20 Oct 2026 10:18:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7772380C43
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792491529;
	b=QMTSu5GaxV7zrVI2z0jJaR5Pmc5jYdxsuM3KwlPCdx6adL4LJ63gprZdbeuiq0pM3Pwo
	 Z4mztIsUzkjYJgVLP7JGIvoLwY9Ve2PaEg55g7Zetl/ugve+6Qytaxgdin/LCkUd5S14M
	 KRYP5cxQOSuSJoaTSlM/CrPEwSKOYKP9r2EXeX+kojeiBwgLBOAMBZzdESBjopbUZutr5
	 56aLz8dCV8Pzpg+dARHF4DF4Ve34wgQdT9nReLXd7O6EX1TsEfUoy4odF6mw6rxvKPCXX
	 +/fUJTuaNl2Zc1JRfHAZdHLANRwLgivGLcDd7iSIctiGrvcCxuT2kNxSgdsd13wTlzg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792491529;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GhbN3PsBo21LZK/xcWp1eGvL8xhE4uyhLmClA4MA628=;
	b=OIJVHCkC8upi17kiGZdPDE+4cC9Ui/61j2N4hqhhM5uPHPukmcOdL5Gg7/FwnVCBB8tg
	 ZjHC0/JUjxEhhkBgkhDQCQaOdeb8lRYlE1LmXYV0jRY90eWBRU95kV5ZnCfvRXHuxd2nJ
	 FvlqD4n3kpxsKZkpnypi5lV98i9nnmJELUrY0fur/HQgN3+kRCRFbroXSdVyB81ljlAcx
	 5xRxNIIic1IJgmq2asmCeIGpECghXbYYupWc6XCGZwMgrmIuw5sgGATg/KMyvhKZl2g16
	 e7YFm7wISuJgH+f18BKpZ9/ozx6v2Hep905ampg5xRcX8Y+mmM5kwhH4n5/JR7x3Q6A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792491529;
	bh=GhbN3PsBo21LZK/xcWp1eGvL8xhE4uyhLmClA4MA628=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mmJERcRirMSqiDr0gZ/FaHoRHnUk3rPLk87js2Aq4V9J8qJIQtXyZkBrKcjIfQ8mc
	 5IquFuKZuSfesFzqz+DcRR3VBlYOduPHibuz1KskrIImmFOIlW/TpSkBpANtR1Vnkg
	 qL8V0Kk8XLllJh5SPeNjAdlHQpmI/ENXQHUKIFfbOdHI/HcXzh5pcLH6+zpGZKTKpf
	 T9X4bPKd6lpoNb9OsbvEcZiMRMSDgipIK4HyFFNTAkvsrGGwlVBdAezzvZrjDTereZ
	 feQiPbHvsYEoYvD643YK2VGR8Mfa4C8l3UJkJxDW4MolGJpvEo++z1mG27+0fQJVzb
	 qZ6H5HbwH/spw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7772380C43;
	Tue, 20 Oct 2026 10:18:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 897B31AB
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FC764016F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ym53RB1L1t5 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:18:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 21B41400FC
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792491526;
 b=OlDoGrqfWHYQ2CVJPCexr2rpLBncSipI9xo/fxRSB295Lk9M0UsGhe5rjZ/O4sIleZyu
 T8k4v5z0VFc5DIxeYL8jRu8S+J07ajZqk0jfw2eExbioWKTQre1LjeQYvUdJIM3h/I+rZ
 QCMllYJMcZGyxPN0Ge6sMW1qhTgWliRjSjG1nDjUmHdqHWMeLPZhYnAK0cboa0xOkkuU1
 IfV8NLdiBGbXAEWFOY5mgx9Fuc3z1lbHI+bct2+7FCuzVKCLe7OxjP/9I0M/baDOauZgV
 kodM4zKUQ5vGbjFELjeGZpZHPG10XUj4Sb9nzvm1/ryYTf4xKpnRZCM74AwNT9thDIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792491526;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=cpJu9+TXAZNTspTh76chkWDBMPz8jt9kGN9iA2dMGKQ=;
 b=KIxSuzENOwh8FNqF9qh2Qs1nLOaW67MaZi/qBADhm0uIdZ4wQRLBH7RVtUEBzKmyPYHC
 TbaPx/19vEoBcpayMCm6qm3P2c3H1B6As/DVvbk3W+pamVmpKNCzYsZW5JD26+m2Vq1uc
 9U00msiD7J+CP/t2Fl6Qwk2rnsq2Y1oku2GZg10QapiGrh80YkH2w/Ln2sz7z4xNnEzAu
 xfGq9CxRbrVuw8PCnMnTediBxRbDBvxQhUARNJuvmKSeN2EQN3Qp5hAVBe92HHYxoKIAL
 bXe0ShqtMAa8+NNt93vu9vKNLGj5+Hj2SA/MqhdtqHIOfdAw0x19SeweWgmClozMVvw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b="dC/xoyvA"; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=dC/xoyvA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21B41400FC
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:18:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=dC/xoyvAbVS9y0D7FF1hTK7+VYP1IrJrzt3UWMDIEUqCiz0ShfseS9Nkkfq3s8hEBY+FyaZ7jHAcNSfc48vL1oWsmmL8wJjm5cJXFRMAAdAr02yMOLWUxTj4FKUmY495vqk63G0LACdPDO1Gt6+Q2rMRROPvlJwCy0kxOzs+K5CsSGtjPLTB48yfxGBvfL7AD83TkARSjPtIMgHUyGzIGiB78Wzya9+6p3eV/uhjwrsqLpuU4F8RiInXuAM2o32J9aygXxFvGAOOAAcfX2zXrDc8ZgVwgErDoh57rXpJD0zyb+A4miVrR2B4m0nBKTfynFNJlYWEtXmAR9iC+WYcXA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=6D0c6NctYOi+fI/LJ3XHLC273Wbn5UoGjUXPAmefypM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 439020868; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 10:18:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xJ6va-000000081dW-1hM1;
 Tue, 20 Oct 2026 12:18:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  Lothar Felten <lothar.felten@gmail.com>
In-Reply-To: <20261014073743.3673307-2-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Wed, 14 Oct 2026 09:37:43 +0200")
References: <20261014073743.3673307-1-dario.binacchi@amarulasolutions.com>
 <20261014073743.3673307-2-dario.binacchi@amarulasolutions.com>
Date: Tue, 20 Oct 2026 12:18:42 +0200
Message-ID: <87ik2wd69p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] configs/beaglebone: bump Linux to
 6.18.56 and U-Boot to 2026.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > The patch bumps the Linux kernel to version 6.18.56 and U-Boot to
 > version 2026.10.

 > Tested on beaglebone black.

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
