Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95463606A31D
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 14:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JRM35Hne
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6988C816F9;
	Sat, 24 Oct 2026 14:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GiREpm5m3C7t; Sat, 24 Oct 2026 14:45:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8EA2C8169A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792853112;
	b=PAz5WdLNWAipqnLk8ew+4rVogBsiKIjKHtzAQXwhthpvL8C/n2W89a+ErwR5X/rFTunl
	 Lu7GjpOqZiWjIn/YvAOssAuit4CK9YxmX0gd8MDXLLz4wyphZTXaiF/l+QPipLWnjsI3j
	 ODmD5i2YunlEYaJ2zCfICOYCzoOepO1PPNTuYMYnujaZu4XYadNeE0/7H0r2gg5YaQnDo
	 YAYKYGEFz7wqW4xcN2E9uva59Gt9NL/Lbu3shLay3Ef2Bm+h5IPf2eRUdLMPL4HJxjUaC
	 +oiHTrSMKm6HwsG4ONGhquTf2ITGU5Pc7UyRJrkZ7NGC6yue3dvPotW8dOq5TFQ2q/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792853112;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=NgL6Q9NE9JnBG0CCJxVy8cjsFAhCVbc3HL57BPtjETE=;
	b=AAw+7bnz+tBSTkqNUz7dHhMtQVDYruKPRtoZKD3Q2UmL7HPCwefUxy2ij/oWhSXJNLOS
	 6vx4fYNmPNDmuaomvMtW7NSVqdfbjcre615oVzJRdkJ3F+aq6X9/RaF7nMwgXfiQMFTBk
	 yxWBnVwm05oI6FohBKlxz/Ng4Rx8S97PYxFwTZu2QrXJTb7g7bKWM/96wzTVIn1q8QPJI
	 iRKSyeotYcEgO325xWcM+ItFdCXP/byOAFcHQ/HfBx1Ba33xl4xsJ7VUz1KDcfZ6KtPdl
	 bJLcxI/HCcS0t1H0xjMBbkw0FcJ1/TbN3jC39yipV+RykjXWG9mow6R5n8ZjIvqt09Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792853112;
	bh=NgL6Q9NE9JnBG0CCJxVy8cjsFAhCVbc3HL57BPtjETE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JRM35HnehitZJ6gXDgH+EipHPZABW64x2Nlt6V56COLiVBC8vE1tP3UJR88NStc/N
	 /Z9143QWk4xAu7ZZjEteeLrfzQ2P+JiHhEROkf07FLX5a3Z2MTA1aaCY4qoxKB7vJB
	 uUm6eaOy/advDSLltMNOLrIb7mB7mvoVMgP4faZwMJY/rJdnxUJlZGdEj0n73GLKjY
	 tXOb8PgqfZLsOLBO3Sj6J3+Ijql36oAPzAJMbATKv1D+6tIWeyFbgMxbe/Wf5UDzh0
	 /F8OfU1y4w6VUEDwlmDIHupFwUQ9z5xW89tOtpvky//jk+Bfx77nNc/XWTU6fpXcKl
	 4cBRfWQl8LiNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EA2C8169A;
	Sat, 24 Oct 2026 14:45:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B249E380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9833D606EB
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYsKZW17b6Di for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 14:45:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9AF90606C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792853109;
 b=HqcztHjLSJWEfhYyTgGRGmkbf4GMuyHzqjKmfFAOf8drSqEDMFD0nXOfXzrh0wMkKKSQ
 UhEP2OQ5ZS9ZX6x9gzQpVNzTKGj4h7o5apRztbcKuBDj0laXx1E+i02ZoLXWmN55e0Sds
 0bcIpWRx92VYOK3vfxX1Kq8Iox75TSI1UqZVSqQ5QMwfcmPJEFmqPXTFU6V4LTXmTSeUG
 l1EXegwbdhmNtHSiHsAblr9IunZ+OrPS388tCr9pMEt6Tfz1w+O2zdGSA0VwrPNdlGVF6
 /HwZiq/9hBKB16nifbrr7YAByMKp/D9RA8plwZGmG1fWNxjOfBo/TvV2xSswB4/GR4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792853109;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=rzwnSPdoEe1MZ6K2QMwOxeybcPCbZdwA0s/weAZdoAM=;
 b=SfRaQFJj8oXivT+QtiuKrELfbnOSVmQqNYcsJFvCdF6BreQKzTUuti2L3J4st/PetEwT
 95aNsQm/d/saAGsEitKtCFMCNgrEt8/jpS1ZdzO0KkveEVa2QVb6lq5jIetgWVM5dbh7z
 rZ/ng09lcRKnZJg2g1+9pfbh279y5AgIlIfE1uIFAjlmBkAf5803hKFYFkvBiwIgEh+nH
 2uErPZjAuF9/JLVT1FLtZiZT9ErtAZnp/ydk75yyjbwSq/pWJmrZmwFKPRNvN3EBU1l9r
 ffoNmuIVB0LsP6hIFMPrrZaWoQzLK1dRKgqlnkrMFCSWR02slmIiu1/Kf/V3H7j3rMg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NOCGnRba; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AF90606C8
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:45:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4A4972003A4;
 Sat, 24 Oct 2026 16:45:06 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 16:45:06 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 16:45:06 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261022073836.2751161-1-thomas.petazzoni@bootlin.com>
References: <20261022073836.2751161-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <28e72097f471cd0b82040a8acd34edcb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] utils/genrandconfig: disable rtla with
 older kernel versions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22/10/2026 09:38, Thomas Petazzoni via buildroot wrote:
> Since commit 5e8705263cf4592d8c02fac71803053e17d4f83b ("linux: add
> first-class support for all upstream linux versions") we are now
> building older kernel versions in the autobuilders. Some linux-tools
> do not exist with such older kernel versions, causing build failures
> in the autobuilders.
> 
> This commit handles the RTLA linux tool, which appeared in 5.19.
> 
> Fixes: 
> https://autobuild.buildroot.net/results/e0a0d415a50b29cb503b800a859c4de9baac1c29/
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
