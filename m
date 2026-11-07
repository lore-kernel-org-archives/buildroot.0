Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD7A606A333
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SIvFRNwz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0579F81129;
	Sat,  7 Nov 2026 10:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGR4LDrBQReX; Sat,  7 Nov 2026 10:13:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2E1C9810E8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794046409;
	b=ahUSLRLTZLtn/tZRj+Yxj8H6E5NNgAggKjXaqse0Eeie9UOfkR9Xf7/0DRxXqjiUObbM
	 39MWQC3VNEmmLkS/pruIeITlpwX12qQo/t2oPHpgKg4ly/CubhCchwYs9JjOEEXBtezPR
	 uU0rGAj7UXA7VKlV2FrLxlhwvaLzbKGaxX9BADgHzdBNunSJfJCi5LmvXNT/9Zvu/gw22
	 7xxt86SyyeWktaJggXIsEd8KQE5ajTde58r7Q7Z0ErC36J4tKHwg35MQ8lFJTp3/bCIC+
	 6bRGYrZ99dISL2lwtKF5JIck6HgdBHTNQ1hxciVegkrmxVCklhtDnekQzwRVbpa70Xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794046409;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=YjV9ybu9aI1k8Quak2DCpw11pY2Xh+x/Ci+drGffPJw=;
	b=ATVpwelWXvhdEfLJtW91ojPvFkr6Zwnfi2kFn7dB3LA5BlZdVT4TuHAFuykxLEmaArLy
	 Mc9BB31wxkItX0+csrv7KHZPonH73u7VCAVZs3MQD85P/bU6bznfXGbR/x7qtYnUbYjjh
	 85+6LKfUfO3+WXvSYEc08fax8vGwbk+QmjjgiLX6ki1yhAyDC1yRKBB1IWyHlXiS9KolP
	 zln5eQ9yqqkBUvM9gdYqZNLrIQ3HcV3pPi36zuWfRaJnDo8vd/4EbDwaTvV00eomww0Pu
	 GtYQKDlhRJOFZgVRdjByr+wiO/d+dON5fNg5Y9FntxMBBjDsulERLURDvFvaSoL3Dew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794046409;
	bh=YjV9ybu9aI1k8Quak2DCpw11pY2Xh+x/Ci+drGffPJw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SIvFRNwzJyYIXWdBDigTLi/VmJMYQMUBVtcGMtWclXwlQsUARXDVE3JDgkvTZM+H5
	 MKR/Bx7CuZcORyfv1LprVG218St7dMykQoUI1TSttLrAEpggvBfU7BUZoh2kc0QUe6
	 RzDltEd5O2xuKkaUKXPi3lEW8OsRAE9VLjujaYLFIY0+nKpkHuLOwQ5z5y4s0d+pc7
	 UvQJhCc86T0OuZUwgxsd7IncfxM5paN26dEsW2eIT9QWWtuwP9l/VjoVNsFsYQV+Ti
	 iXpDLe0ypVgAwPkCBwogOJk4Q2hGZTgA2ncpZXhHcTuMMN7blaMCY7Qu83HBYFtWi1
	 6WubCYWccQtSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E1C9810E8;
	Sat,  7 Nov 2026 10:13:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6F262E5
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8C3B606AA
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8VaCrK2N8NI for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:13:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CF3316069C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF3316069C
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:13:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id D89E8B0057C;
 Sat,  7 Nov 2026 11:13:22 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 11:13:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 11:13:22 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261106211651.2571873-1-james.hilliard1@gmail.com>
References: <20261106211651.2571873-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <8358c6615a287fce02dc1b5d6eef6edd@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/python-telnetlib3: add missing
 wcwidth dependency
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

On 06/11/2026 22:16, James Hilliard wrote:
> Commit 25867d252b92 ("package/python-telnetlib3: bump version to
> 4.0.1") updated telnetlib3 from 2.0.8 without adding the new wcwidth
> runtime dependency.
> 
> The server shell imports wcwidth unconditionally, so importing
> telnetlib3 fails with ModuleNotFoundError when python-wcwidth is
> not selected. Add the missing runtime dependency.
> 
> Fixes: 25867d252b92 ("package/python-telnetlib3: bump version to 
> 4.0.1")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
