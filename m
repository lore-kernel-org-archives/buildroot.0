Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309B3C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC2D540D90;
	Sun, 20 Sep 2026 17:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g7xolRLujQfH; Sun, 20 Sep 2026 17:22:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3D2CF41012
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924933;
	b=UTe0zNxoZB4gAZSPO9Zs1uIrhMwiHLYSf1++w1UdZXsqTbRY2nl5ydcxW5Q3XqHYKqmp
	 V0WbV0h6wWWLgsJG4nqoDpbOb06/hDC1LwrVQRzGmopFgQCPAQVM6pNKROf7h9PYIUKdq
	 DyV7LMaKPdmGcpENmnaWOzCF3vn5Vv6saJ/mJYzhQAZ5N72pWPMRrfFLBC0qZrEbsC90l
	 w3+h+HHtaTw+qHx/Dga/V3ig/PREbVgPzUUr3lubYXigNMhe9e51I6T/aAjlTQypQZzxA
	 uTBp4WSAUIyMYvwN/1oHEWKMC/x0AfIawNxiExYMQebeRlyac+Sks0SiYupXp0Tn3QA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924933;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Injected-Via-Gmane:To:From:Date:Message-ID:References:Mime-Version:
	 User-Agent:Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=LI07C6ZGRUfT4wnQfTTebTmATECkUX+KbyARXmj0PZs=;
	b=a9Ewn+r0V5cA06O3hj6vwCDmoLlHB4Pf+AsJv2luz5vyRo9hyGJwIh/mW5eCKw8MhUsl
	 iv9PzpmB6dmTwQXfXdyWUZ9rAcdGQ/yEJQ1vQQjo2sat28+CGTvp9CLJKVMBEyWzEPkp6
	 T4VcTUJ7i/Ev6g/HZ+Q34TZFPpxZolTldPA8txG2zQTNzZqXg8wXOQen1ORs76QdFro7F
	 libAxwG2cxsL64UYM3G2j1vei2T14iHvUJuSatq46eVA7L/y/3CGpKYZgiIBGSiq6iAhv
	 GrWmCiDIy7lT7ys6uCnAIN7xSkjrZXlDLIDv65r6L8/Mxq42kCg5AbY1/4ByhSP6haA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924933;
	bh=LI07C6ZGRUfT4wnQfTTebTmATECkUX+KbyARXmj0PZs=;
	h=To:From:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=WS12TOWMGNUyv6RP9huKM1mvEFgQK0d1j87nUZhRjmudLrD3c10FFbBe+wwIdXvQu
	 ja2cu9FGrJN1c0SkZLHEAZrMAa7/i+oA/8W3g/jsIsG/7GH1EkAN0XxiZWwvUO2szJ
	 uR5oS6kZ7WgI1Dqzx8t/h/12MLPrW+Dz6UZ4SS3Cvf2el+crNojzKODJSvB2aXw8bO
	 JWmrzn5A6yJa4Ss6v423gJ9tJRIZfqbOH3rQSkHLp81iNfDV66nX+rbjvaPEziADpu
	 fPss1rPs4TOXgHTLtMK6D/018lcvn3mw18OtmzjnVn24i9Fjr4uAapW1Rfdq5gwhHD
	 4ez4asDFS+lSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D2CF41012;
	Sun, 20 Sep 2026 17:22:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6C723FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8A1680DC2
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_akzwAIo0Jt for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:22:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9F20780DC5
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=116.202.254.214
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924930;
 b=Epcq3RVCiwrU55zzdLMH3MNwc1JWDH5A+JatFhuumKWByHmj0BR8mml31kU0JPsRaJlh
 +oeCPhY9ZK9znfOKgaxiY2Y5PvtMipMCtuq6bXJltMSTRRmIYHeNG2r184k2BCubEfqeX
 yMryYGWQf/7S3uwCw2QOKW8MXfuveH2SftvEf+7tM15oFIStiZqaQFW5iUo98H6AC9sek
 6Z79c6tuQjgXP8UMo+fVWVCLBN1zGsGYu67T9IIxrkOquLH6Yy1X0SUZXhYC1VEYknSKF
 1FrLTu3yCoCDrGgrgJ9d30IWm1Jn8YmEIJHM/VSBLPtVI7QmeMAlCZ4PmtHKmjYZyqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924930;
 h=Received-SPF:Received:X-Injected-Via-Gmane:To:From:Subject:Date:
 Message-ID:References:Mime-Version:Content-Type:
 Content-Transfer-Encoding:User-Agent:Cc;
 bh=kwsMugOjYhmi0pWDQTRcyzt2Yzh6wW4COppXkHAzgTU=;
 b=R0sWQ/1HfRX7GrXEgdvB63KhTrp5BK6I7m98BXZoX7DpyAnkT9ME0LEjd6G5q/zRikA1
 Dp8SXkkj9NAHL/njmCVMDdsttp1g3GGiye8m5Edlo+dW8f+X2NKtH4ogIyswfK7CmRJvc
 /CmDZJH3mcXy6yclAeV77eIK1he1UsOO4UyG8KzHnb6M4pg8m0rhhKdB7XwJ6/FJzM6bL
 vUFaaRmv3W4MTmSwTqOpQ+geQAFBeuPg6Pin73tL310AUMjLv8VF1JYyLbGf1xyG5zm4t
 lSl+JSRPqQgEvbdrRJ8z/M0AOwdggnjOSXNbxX+5yGNDFraNTqOXlxD5ej5XtWlLwGg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=fail header.from=kuhls.net; 
 arc=none smtp.remote-ip=116.202.254.214
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F20780DC5
 for <buildroot@busybox.net>; Sun, 20 Sep 2026 17:22:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1x8LEu-0004h3-9t
 for buildroot@busybox.net; Sun, 20 Sep 2026 19:22:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 20 Sep 2026 19:21:05 +0200
Message-ID: <pan$4959d$e4c2092a$98475559$454bcda5@ID-313208.user.individual.net>
References: <20260914210536.3378924-1-bernd@kuhls.net>
 <CAHDQB6NOuBJQFmwXoiO06i32Rv2MP9wZwV2pH4iZs5w6FfsTFw@mail.gmail.com>
 <CAHDQB6P3UM3ZFe-BO=UMHMECM4nHBXZV+joioVdGN-qmus4f-Q__48688.7985420012$1789468987$gmane$org@mail.gmail.com>
 <pan$b66a5$4e726085$5fe4fd53$50418080@ID-313208.user.individual.net>
 <CAHDQB6NaWJ+CjBwp23o-s+OYMwk3hL5MK214ZXN=WL8Wju38iw@mail.gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Cc: buildroot@uclibc.org
Subject: Re: [Buildroot] [PATCH/RFC 1/1] Remove mender packages
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

Am Sun, 20 Sep 2026 16:16:15 +0200 schrieb Adam Duskett:

> I searched  around and couldn't find any indication that mender is
> actively working on OpenSSL 4.x support.

Hi Adam,

Ubuntu has fixes for OpenSSL 4.x which I applied to buildroot:

https://patchwork.buildroot.org/project/buildroot/patch/
20260920170815.240247-42-bernd@kuhls.net/

The mender package as-is builds fine.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
