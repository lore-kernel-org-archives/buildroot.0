Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABA0606A33E
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 16:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CLKsim9x
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D0C580AD5;
	Fri, 20 Nov 2026 16:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbLjHi4rZ5Ij; Fri, 20 Nov 2026 16:08:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8506D80842
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795190890;
	b=n/vPUZjD+9/HKDTNUpB8T1lfF9pfEMriJLezxUc12gZgfI+u2ELnR7erfeJJQFAbiNNi
	 wxEFFGWj60onuo/Qzy7ey89ZlNYnWua2kpMrLRVo66+kUnOWUNtclKcMHvGHFz4bQaFYN
	 aNRrDWPFdBi6e9KWXAkSSF/HmeMRQdYIejurhGDOxQHA467BTy+3ocYQLkY1twU8Szsfn
	 gev6YTxzyb02JqWSMO+jh6hdS6PuqIFTzvXfY8mhsKc30v5f9Q/gw+nsZPzweWuhJl8H7
	 39rqzHyBHrvPHM7S/AzMuT9j06dqOgD/rE4UeBG/FslJ/N2HKxhnxIbuaqgpK7MzNlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795190890;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ixJaycZXqsLwXl0UdbOX+Tf2+RTt7pA9BtKgFNpk82M=;
	b=BeAXkitj7c+4v3picxd7XEHKLIxcbSaw7x8QRMxZFQSbPMDElFDojM76B2RpB3d1c8kF
	 I7szXXJ6JfcbAwMb9FcXxGf4BDsvSZhuZ9/Lwf4fIk181TSx8SWWrFjUiEAv2AS25fw2g
	 mWb+xZ8dVHjyMFZFU/CQIzRmsMpwuz/Qb4Y9GSsukw8cG+bu1Lc17edocfEcW9K/LV2o+
	 Lc1BwBQC1Afk8hvZsS726f1oevSzG4pxjqbI5gW+BJ6a5W4mqPjsSKe6JHjP3wIP3foh4
	 MmjsFfp0VFtoRDwFVkI4eFaMKqi7Qa5ZjFOMWo/LGWvMK9c2+rh/qYF3IQH4Jj43KGw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795190890;
	bh=ixJaycZXqsLwXl0UdbOX+Tf2+RTt7pA9BtKgFNpk82M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CLKsim9xsVdsZvhTFbdjX5pM7M4HwRVhn3UxF8lPwmgpt7RgXYvj4Dt2VdB0x9p/l
	 14EyTmbPgPRoRrgWL9U5f8pQaMmi+BwqZIFmaoGib7FhoKDOUz3vH5cAedKg8EvP2y
	 HF9bn87ncSPjvV0KWTwh8cyvo9vLtfTc+x1XJ6BwlZrFnxa2TZahhOq6OsByYZxQht
	 pKVXPX/IBQYwhlvOmouWdJCjGOAXfZOoQ83hJO4xhred07PKw+oyw9QBOh5/YmCqXi
	 5gVK/EPaUhfJ3+RxOWrp0B7nYS/yxGA6U0E1J67pQkf6x7QoujmbXusQL/el0ELC+5
	 3crSWQNmOuqWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8506D80842;
	Fri, 20 Nov 2026 16:08:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A493C1E7
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 16:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AB1260B8C
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 16:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZIaB2KOsZuR for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 16:08:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 86D8D6061D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86D8D6061D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 16:08:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3C29E780333;
 Fri, 20 Nov 2026 17:08:05 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Fri, 20 Nov 2026 17:08:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 17:08:05 +0100
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20261120063346.283686-1-fido_max@inbox.ru>
References: <20261120063346.283686-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.21
Message-ID: <4b0bc67a0b84edd63fcaede7c73627c0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/postgis: bump version to 3.7.0
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/11/2026 07:33, Maxim Kochetkov via buildroot wrote:
> Changelog:
> https://github.com/postgis/postgis/blob/3.7.0/NEWS
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to next. For info, I fixed the LICENSE.txt hash. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/01cbbbfa418408e06c171e78221c054049360246

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
