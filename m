Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFD3606A335
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rfktHrFJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63CDF407BA;
	Sat,  7 Nov 2026 11:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JhcbnGOetIoB; Sat,  7 Nov 2026 11:13:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A19524078D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794050001;
	b=mXIqV034bCppm5VJeNPG0ao48/hOgAfCY2EnDS6G7/xdfjfdkPOY9Ro0wN2TmAivpV/g
	 CdyeyhpwgAFv0v6cE9pYBOYWoevqqiwLiZiNuIxWn7MHZ2XspIHCGkIx6QCPsfDSMbg+3
	 ttucdpd2Yh4RqgEb5eM0CpWis+PsBTI0AFni0ih0jS29Dw2URnldVGrQ7LY/MOhPYo7rv
	 OmL5m4lTd1MigCYwJHLyxx/e2y8zTGAYXuXNTdzS/+N+B6zIpjzvpPNztatP31bIODSKH
	 6dIQnZhgeTwD1ePxSh7LiH1C/q3jpo3BxIAPPWLheY7eVAWKubiqorn99N1YmepEmaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794050001;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=dp6dzLDeU0L9PPtZkClplE+eLujTn5M0ij07cR3MikI=;
	b=J1xsKXeSCIm8vMCGSpo4ANvsS0anOUvAChgf8KOXvChckQyWc+aKb+HLOPfx1jZfY/WB
	 jD6hVYU8EPPlQJKHZqCKXHTAt1Xe1DvDB3dWyR1x+nwXOj0oasNI8YkoCf+c1KbQqWvj+
	 zBVSgLO9bq047it46M07LP6BhtCYB6DItG90wrNsyg3++viRMOHR1jKOn5vLJRBaihnTO
	 e74qYPHI9ZQoEpWGIczPGjkXTKLAsRp1zBsvn4On1n2W8KjcUte+t9nyV797wfYrr4Qhe
	 w6V9Mx4vZECzWlgo5VIzTyTmEuTGKGvmNzRJ8MtTYM3ofAaTEEDPOK7P0h4o3QAPoiQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794050001;
	bh=dp6dzLDeU0L9PPtZkClplE+eLujTn5M0ij07cR3MikI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rfktHrFJt1bXMdl5nyUpbd+b5dbc5OtT1mSm3LgkAAqBAeAjTypWckLMe18ksWQd8
	 FwKGDQ5uQZb9lPBV5afJG9LzkjSbzu/TnriaDXwNQedwlLqhFX44wiNRjiEE0BoQV5
	 iM0LWfRsbqA1uBQS7N1uNNQtkcQZVXVVc1grTtDCi/0Ae/aZIYIMVy3O7o295Z+asE
	 zrUzvGpqEF/dxC8m7rthli8HAdjFZOuEVM6xbosuzmA5fm1zNutHbsXRNPresn/sjo
	 vksiHGjB+InQsYQYElTgeB07W9HBtEylK1PPjmF+2Kg7NJDqdyqSE9Mt3JhabDaPBF
	 MzLd8uxq5BWPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A19524078D;
	Sat,  7 Nov 2026 11:13:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E750732A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD3A9605E0
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPshzlcUhzki for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 11:13:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C87D0605C9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C87D0605C9
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:13:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 18DF5780371;
 Sat,  7 Nov 2026 12:13:15 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 12:13:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 12:13:15 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261107082106.27343-1-bernd@kuhls.net>
References: <20261107082106.27343-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <21b2aab2ae78755c944df8c86dce8708@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: bump version to 2.4.70
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

On 07/11/2026 09:21, Bernd Kuhls wrote:
> https://downloads.apache.org/httpd/CHANGES_2.4.70
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
