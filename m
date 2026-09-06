Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FE6C79F9E
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 19:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C18CC6063E;
	Sun,  6 Sep 2026 19:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D4KvFWwJt9aJ; Sun,  6 Sep 2026 19:40:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0035B60608
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788723650;
	b=IgMlntZrBd2YNYPK+HpaxHBoFiN2HKoXtIur6FU7TG1IFhnb9Sdb80nS9ravIHSdAAyR
	 vy/z5yoWte+MzFwUlP69GlYBqH5b8O4BrLU87AanvMvg2O9He2Sgtfm9PyDrl2ZoNtzEO
	 bRAGPm2acP1pY6fVcHtzjbd/8elpHC93TaFbQOZ45h/0j+bRa967sW8NEVp2QwuYCnRB1
	 iqY+2xKeAW1b54cilGubfE+H0E7NUr0oqPNa6A8Nrkx9nom+RmTHOtk1x/5Hg1DRmo/2D
	 HQcLol0pSem5boI7h0yOmfDvtjyO6B5Hn1SaDkJfVL0NoGwseetXkJjCVXoSlvzYnpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788723650;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=aF/3mK+RX0aXpgeXuGqmkxvzN+HILeJDP8zapNko3WQ=;
	b=N1I7v/OSqjqsmTvpF3r6knRzIzbl0abjnHoogJ2Ee38621xNmAopoeO0erYL/K0zjOR/
	 DBgK8I3+BA8M7PYJUrPbNaoq96TGylJ3nWzWbwALJSrtU/hYQJcZKONuWq6nsSql7M7ii
	 wWaomv9VwvzLa33plfOtXCIx5/jRY4BcOvx42JT+2N5DZ3wq7biQDTEOnRyDMbzjlZ2Jb
	 GbAxgWRz3dgg7QH0k/vZXa33phGCWrBPCIhuq6v30jpsyVskxrWzd3rH+RvBOP1365dgJ
	 fNrPlmjAw8Nli+wd1S0wbA050+WafTIIgO6TL4Dj5yrOmcvH+EtaXSyF8Kk/F6vQv9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788723650;
	bh=aF/3mK+RX0aXpgeXuGqmkxvzN+HILeJDP8zapNko3WQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CtjtCNFM+JTjX36Ln62AR1MdnV1p4cNbRCsRNHkHtj/Xs+PORU3lGD/OgQ4YXTpPd
	 yB5ybP1t+2UBdUgECFnCdMDSYcMlz+fd8q17efUxqQIhe3R74zwBCbMJIxh+NIgR0U
	 CFa/8HyApRQlZ8fYUkCiWsK868YwXVB0tbevUhkaTypU7F3VwttJRqX+rthYoIbU9i
	 MgWuuQsuO7iPmTcnHDiH269E+ieBoOpU36e7/NgL/i90AtNeRaT35CxgMp+Ybla8KU
	 FCXDgt8i8lmZpGzC64JQziACXxeJdW8y/hT4bX1FSqRibiuEdZhicHzBWFTdACYEP+
	 DSpfR2wd5zD3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0035B60608;
	Sun,  6 Sep 2026 19:40:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AB4E72C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80EA74008E
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LXXZWzLawGi3 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 19:40:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2053540079
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788723647;
 b=M+WawR50qlH+c4VE2srQqDh0H+L6uS3K09E5T46zhueFS6Zk6y+3g/O+mVtgXDTi5xm8
 xu13scPDKKcnoqXi8TK5n0Yfyf2bCmy/xi6699p3NkctHFSMBQIyJwSo1M8/gd/VTWS6n
 ScRlD/s/Sxa+Viq0zLoPUbyT3WDV9nBICTYl4xgiWknUQVjD/dH5vQUN1NK/EfnuMWJYg
 86AEtJ8MiYA55VeYVuYus+GZoyLEOwgs9rBZz6jSf9d7nzUTS0GGAOl3xTwMPmaczBVwE
 f4w1rrr+JVWmG1LqrLpbCbbwUQdhj3Mdkb/BPyn2oc5z+DPsLqL6ahJXtMhrrRycBZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788723647;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=vtN1BwyF1goeQaauqhN62qRRNcMOlVcHT6Vpy+dvz+0=;
 b=N6RW4XHrieJOC08lhv1CCTeQVFM0EtMZbTv5aR08MNBHop4t+V/tQKFLwgl+Oc2LfWb8
 XoWBMM5YZ8obdBB6lOIvtuXAL8vm/tCbB8HrZ+HmSLdq1u+55MOAYLDZwhVDirPEE5ZW7
 v6EHpG2jdRuxgQjQceHv4lxoz6m1ezFFrWBj3T5cOOV79gdtZgJJwDwpklpng43kw8aqF
 7dOPsGNczLmEbI+qzLbaIE5RXQNA3woTpudkWvyWFL70q3plw7C4qbydthJM0fhlmvZyM
 kLbmwak+4S/CekMEEtiEfF6Lrej/K3OfUDYK2/p9C72YTPPOFOuGcAfp747rW+6woVA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sT4BKid7; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2053540079
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 19:40:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2F11DB0056A;
 Sun,  6 Sep 2026 21:40:42 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 21:40:42 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 21:40:42 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260904164840.187804-1-bernd@kuhls.net>
References: <20260904164840.187804-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <dcb28383c40619bde1ba3f7649b313cc@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libcap-ng: bump version to 0.9.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/09/2026 18:48, Bernd Kuhls wrote:
> https://github.com/stevegrubb/libcap-ng/blob/v0.9.5/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
