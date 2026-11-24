Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4DE606A322
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZfHM9fwX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1676D60817;
	Tue, 24 Nov 2026 11:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbU0qCNpWvaY; Tue, 24 Nov 2026 11:15:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4F21660802
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795518918;
	b=eJNpOXVv/QM0SLCReZV49YBhqOZcXV0hN5fNx+175D48BoVs/FC6Ist2n1WPFL9PMZQs
	 e/NCaZccyByHHt+I45WNfhV6QMoUBi6faeajw5K++Z9Q57zsjzQLQri1GCo9Z9JhIMqMZ
	 GA2fLTsBnO0VjiGXTMjLtX4ZNEX1qwe2ZBLdmMrIbUkrORjQqcrxSL7xdxZk3bx12Fn5H
	 152tPUuFaoiMSrwzATicPt0fF/qMDpHVfVk/wyorckCRycwJKtCv1WVnQb+N/4EUkGJvO
	 8aogcynwGPVdKkLLdB7ZqMrSShHR6hZiOQZyBhT+qzZFIvbZx+n3JoCNzfO1SARCCbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795518918;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=NfwiafW2DZd6xsudEY/hQhzyK8IJOnU3aYONtRKUSBc=;
	b=dZugCUlWTCsGrJewAzL4M9EGqaMvMs9QtXPW4IloQg4wFgBBmdpkp+4QlniDKiCBesag
	 i2jN5hn35sjplegrEV95muXpArsZ7/EtsszNnfe9ir16XRSEsQFAQVJxVj8Ly6RzOSTLh
	 Pea+Cpq1UNY01V9HTktUiUtL1fRQQxIzfrEbnKTW5nPybFgSI6jwxufxXZ2XlSw2nez1a
	 fZ0GkkkkYmTDFVSo+kHwgR0JQG3Y9FXqpZ0Hjvd4qX1qo8Bhr/7dSzl50dCwHuFzAhYUp
	 B8sRNetyNUwO7jEO43zgqzg2FoZrcH4sDZDBvyXMuVVL8KINkO3AhhW0v1GItSybMDg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795518918;
	bh=NfwiafW2DZd6xsudEY/hQhzyK8IJOnU3aYONtRKUSBc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZfHM9fwXVtV9/Ah9eqOpUQjmuor3v17XVBxCTe7N1Zx2uket5Icb5q8KtPEyaRJfu
	 C9ZcSBCo4BBm8CiEFkaeA/REiaX8ZwExu7hDR1wUc8eYr5mQZht5J0Fgi7jzyBZgRM
	 OKxCfShAgTRg3zsN8gGa69F/CeBInHaFbCnufXYWBv7XJNZTI+elsZy+LBjDn4oDVF
	 2A766TWd3xhHR3PyY8MpU0+GnfeZU6RYtp91jLHARQAq70WMva+7ryxA9ZiOJpAnrK
	 HbAlfrApf8iyPewev20ZagGQ1Gnh8cQMSS1ozYV8b9ej/20bwygnO8wQ3aVwGhAXP/
	 hmisyTZLFZ2Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F21660802;
	Tue, 24 Nov 2026 11:15:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 470C23A8
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BC8680D6E
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XjrYeFFSIP4h for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 11:15:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6AA9C80CBF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AA9C80CBF
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:15:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D500519F59C;
 Tue, 24 Nov 2026 12:15:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Tue, 24 Nov 2026 12:15:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 12:15:09 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, Tan En De <ende.tan@starfivetech.com>
In-Reply-To: <20261124090911.2368475-1-angelo.compagnucci@gmail.com>
References: <20261124090911.2368475-1-angelo.compagnucci@gmail.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <47e89d64727a82bd5fd9e36de07fc2b1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libkcapi: security bump to version
 1.5.1
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 10:09, Angelo Compagnucci wrote:
> Fixes the following security issues:
> 
> - CVE-2026-71225: add safety measure to prevent IV reuse
> - CVE-2026-71226: fix memory corruption
> - CVE-2026-71227: fix potential for an infinite loop
> 
> License changes:
> 
> - COPYING: hash changed due to copyright year update.
> 
> Release notes:
> https://github.com/smuellerDD/libkcapi/releases/tag/v1.5.1
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
