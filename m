Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A69C982CC
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 09:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06C2260852;
	Sat, 19 Sep 2026 09:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mc67plSPF-0u; Sat, 19 Sep 2026 09:22:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 31DEB6066B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789809771;
	b=PQNzFYUiYjpTBqdZKexpNaKHVOKDtvqkj0c8VoKmbkhuGh985RoHCFiYlijrB/3ZC6r0
	 T340FM2TTd7M0L2gMTlqjllqr8GWlW75N47cUv2A2IFfjl4Xb/Li61+vsS89M4BPAFtBi
	 EmlULXU89foHQpZjdqhw6X0BC4F8hCC/cM5cvsqEzPLs3wPq1BjDXAWbsSHx+iPv8VdCo
	 JPKG/iB+BBbKvfHAJnXFMs0J3IVnm+Ca23L83NjwmEEUtanbLMANLUr4tR41hYjFgq0eD
	 WFiYvCpmQRFW14Y6DkF6oWUcMyVzQy2Zx/F8XMYekHhXKXvT9/PzYyAAKy1HZMKHelg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789809771;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=yg1xmtncFr1KR3yi8BuQfw10DSXbKUHwOBIQ6Fp7kNk=;
	b=Bg4AprMih/SiJxdn21P6DlLkcZ34buAze1XUYFULmu/tUYF+4v9JRXvqGyujELyDqPrx
	 N0RkHkC6RRdKwpP5dcdhclmA1Iu6dguTaG1XT2MRvEgmiXS6X7yCSaSD4Kz/GrXtc22if
	 b5FuGP4NnoG2rmFlPnHDCULYQ7DPNB4KyDbqQCL5/1QX3oYQ6kWwjxvJGppCZC/P8VYHC
	 q3DHlZ87ziVrhsm33CHCfuBG2/SaJIhQf5+cL9Z11K2JofuFD3K+j7UyPN56dfQmS4vUV
	 fF9Vi5+frBp1+eSVdIzj6esSxBC5UQCdlBehEUXcCulKoUlV8hpS7EPECqs1m1qYWww==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789809771;
	bh=yg1xmtncFr1KR3yi8BuQfw10DSXbKUHwOBIQ6Fp7kNk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZdhrSMKyxK0vwNivbbjEsVotW8cmHuUXb4ljrmkxR7N1BmcCuSZ3xTo8X6Uwjqlaj
	 AcWoMVXIUzEk+mJVuEHOTCSe9tdp2E+R9epZ0/RCcKLd86x+alO7jq/S+uAUxVUb8F
	 YBOtfLzeznXov67MxNUuHguC2pYggREtwwt5tS15CKY86zxDx0GSKjVDXN7M8Dxqfc
	 xb0cHp5ct2jM78OIPehleInvblwGQo4HZiJ2pN0KyT40sk87LjaF3PEIad3eadgFh6
	 oTRBGUPkEaPtCETArRhXB4399TNntPsl8egYIrLcYTybvJ42aOgrw3PSG3iEv363sn
	 dul/0PRNRPQ0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31DEB6066B;
	Sat, 19 Sep 2026 09:22:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94A3C422
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83204606C9
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzLbZw72oaPC for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 09:22:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 97B6C606AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789809768;
 b=e/YCnZrRbzzmeIDsnPv4Oh6aOIPH6ZUrJWf5u0X8EkEDK81t3KAIYr2X4eYuu7YuGmvs
 u6SFIgXuhtPKmTmO0U5LxF5ATYDZCqy8bLQaNoJZ1KKe/lLdG1Bm/YBZRwNNWzm5sgkSs
 xPMm7zb1aWwsCyP3heiRhoHR6wjDWsytn1LX0cmvYVwPdn8w5HJPb/VV3EDbJ5yS/O4JH
 c38kSdf4/0GBCRem1xjrxzo2xuLGZ/4orgmFHa2PXnHi7d0u+e6TIL3mi+dO62V0yXotW
 xIvqrD61zooUu5srjyz9n+MLS4MDgLWPZV+qXDhwQKVirW1eiJQn2PFYgGMZ6pLG5YA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789809768;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=8FcUliJtHYYDSIuXLpitdb3gYKxzDbiFokVtWJ0NYgI=;
 b=UCuSbPGqWG/IFnDmX6qLvgP9Nq74kIKMqC+c+tVFcu+ru//FH9rmVRI0YNqWJ5p/ekpK
 lAQ7nl091A0Tdsi2utI6kxBpmTl3T6L5Ulj/Al34xZ1+aubwmQJV5ym3Alw9PiOz7wp/e
 tBumplT3KR4SNpyjMLDtJE8OrcwiKLFmzzI3fh5w0JUGgj6MvA5gNer7hH7wiisLcvs63
 gwxlseN41SJTwLHavROYYbUm17vyYonynfkXMSxi7jcL780a9KkroqP2aKAFmM3mKSQrx
 IvnP3L9qlVAEtr0KF/z34Lym0/9q2TnAWLtOnkL/Fa0f+VNep4Jq8R0iFgbKg7LnLEA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=raPtf5LB; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97B6C606AE
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:22:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 397C85FFBA;
 Sat, 19 Sep 2026 11:22:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Sep 2026 11:22:45 +0200
MIME-Version: 1.0
Date: Sat, 19 Sep 2026 11:22:45 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260916191708.1093637-1-bernd@kuhls.net>
References: <20260916191708.1093637-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <371db3c5e2162a75a21ebb206d91c908@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/apr-util: bump to version 1.6.5
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

On 16/09/2026 21:17, Bernd Kuhls wrote:
> https://archive.apache.org/dist/apr/Announcement-aprutil-1.x.html
> https://archive.apache.org/dist/apr/CHANGES-APR-UTIL-1.6
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
