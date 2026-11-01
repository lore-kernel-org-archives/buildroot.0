Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B284B606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bcEnuXbI
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F79B40357;
	Sun,  1 Nov 2026 17:10:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jAAWdhmFHiZU; Sun,  1 Nov 2026 17:10:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D8BAC405CE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553022;
	b=RMV9yQ1uGgzj+6apBlLAHq162RlJB5cUtQkfJ5m/OwsSSgqfS5Yd7Nhq1Qsx9vGTOCbe
	 Er5+iVxI8MJcViW7ZJ3I6ailS/EQG0y8XB3UdBgCVnT1tP9s/w/C10PkSk58Ujez96D75
	 AH8QuXjMEjrnPXRD5+rrniFyp5BP3Ixxt/yoB1npN/l9v+6o+lyF2Kvkvwp/djKZqjyWc
	 D4i72BmABCvJv30T/Gkfdk8fYvSzcfpjZa6H+cJz7Ojx6kkRGZPsgSMUYTnUps2rHP1tP
	 SBYVnYpetu17IknyUcQGKj1Qex7NqfNUB6ykTmDoa1sHRCe/LVBA0HLf3SyUaCeFTzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553022;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=G8t5nuDtgQTWUJxR9XlNj5EJGTReBtKT1B/mQpea8azuaAi6BUqb9Z0CV2GGRffe/yF7
	 U0LsH5VDb2QLGVAryt75uIoPYT7poQiLRbiHY3+1QQ6ObozUtY+NHZkLJMDR/lIWzd+xu
	 lrBCgG9c9d7MZ4sn4I9+0VsHYoLy6IVhuvEk1VujiC5Qotmh19dr+Xm60NaQVSy+bMKqb
	 WYfA0fnQYOGpkZJU/cebs6eko1zQ4XrJImuNZGSonnyLKtiyKi3BNcf6BFprg/H3xyx6H
	 eiBkePGYXyiW3f3NgFPLP6nYs3l8TE9EcIiJjSGme2oHNlIR2ZOi3HG7NaV8M6kiH1g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553021;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bcEnuXbIKFlfE4znAG8tSl6SnqNfEaGRAeFzl+PKUAvVkPPGN5S4r4LMLq+Uzebvz
	 nTHqqTCg4k571D194MBiKdhr21b+Mud6im4rWiJ7mh9PgMmr1XXeCrDkdsH31jC9t3
	 AmP6fAjGF5KNrQv8RwdJygJ0Ajo5BfVDHuANoVSlua8vmgfhAA+LvSlWhGQFg7tPhv
	 RGw+Sz1Ze/VwuBl3K5Ym23t+Y6HenRsRfinoU6nYwNo//Q77GRrHzKKnPxdySeYCyU
	 yH7SjHBny5tALPTsPeZsPba1T+XmwpGoyT3VgIHV0vrfYWJe/OeTmL8Bx+NcA3BBdO
	 oFrgFj7zGdUCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8BAC405CE;
	Sun,  1 Nov 2026 17:10:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB13F2AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C11FF40076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8c9OqS2_ZNll for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:10:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 317E14004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553020;
 b=apoYXUR3tonZtCSXsMU/HJEPoccy0yvYwE7QzKj7N8+oP7ZRhhAFGiWers97KsbSB7Bo
 Fz8LZsbGN4zuMBOkage6gbryG6oOP335HVbP6KXHmUrra3k4eadPZrD5aL+XoaBMCAeQW
 mF13Q8iZVY9NhTf1ACNOGv0joQODsacW/XHjgBW8iEJNct6v9EMasj/UMAQZ4UVx79QFw
 Fy1bNJ2Mad7c2MFCW3JKMaINDuUTxQixkjYwYnvZrEFUwIo/n3OvAPnSVpY3JIIk6NhcA
 Z5z7lbUx1XSCjHXpxq5b8lzogwl1qz1N7b3F06vVqXmY8aIHNu8r4GT4JuAV/K/wVZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553020;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=b/a+uPQHM+BIkFcYjs9qrl8M8MBqgiOhJR5/roI/ydWb7+GjuB32Bfn2ThPhLQAocI/5
 Jg03x7mT/qHbN0rgjXafN24LHMLnMuaUemDGrjCT9J16P6fuVZcaaYq4cijSzOux16e+6
 fmekc/c/83WR5sk2D3rFNZuIVJdCdSy8f48txaZEkeDosdKdGzJn2cxH76OPZmXVWU3Pl
 /ahTl1unxLRwqGWS3m1hYYA9Xye2tTeqw2nFhsU18M3HCSGmf+OEWBxdQh6Pe8dm9rY2K
 CjiuTYI5h1Lb68uUs6RSDS7wQfsw6F/aZP2MAXuRIedrTFfgDNwY8M+EOXga5BMYXEw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=t4Wez65h; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 317E14004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:10:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4762D2003D0;
 Sun,  1 Nov 2026 18:10:17 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:10:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:10:17 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031172019.2683287-11-james.hilliard1@gmail.com>
References: <20261031172019.2683287-11-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <15fd23b566d573d1d53877624d4dc656@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-jsonmodels: bump to version
 2.9.0
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

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
