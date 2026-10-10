Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F327CCA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDFA2812EE;
	Sat, 10 Oct 2026 12:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nbbVFAPkUjkD; Sat, 10 Oct 2026 12:20:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F0582812F1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634854;
	b=BqkJVMQd1Th5PiNBZFSy516TaUQ9EqBh/ECGrNAPF71k+tEur/2gLSw6zmcdrijeDe+z
	 YzlyB0+hF1o8TLHE490Y7/rM0N1vNUc1x13eAzR6I5MmZ8OEw3JoVZofjq72KP2GujnAa
	 V4/hLr1350vdbgITYqO4gQTy1DtaR8/q/c+jrsE6KRZL/E+jX+jdiPmSGKjg8WYlRreuj
	 tsoiVfxMmsKll3SU49wbuCvz09x50g26GeGR/i9/9Le6sQvRAcLcFrRFIk4oeCVdWoxwv
	 ohXVU2gQUeqhx43VnRGSOE4hKTdRjDSR6dXwKZkoNNOR1QZ3kAFYenY/wI710IYIqvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634854;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=XWliYRJZ/b+YKZQxlkxVfexST9edJbqv547jCMvXuhM=;
	b=KLsnaMGliC2Q3MPNQjd8AY5PoGeIjuqmjccbDFC1gYA2g/+RA+17heLVDyw2qXUvi7oe
	 tiYKyXQENmv9dIbTh/rJ69oNdtZDTYBr73SA6UGd7l/Hj9RqJGMhE7aqei8BisOBmz1Lt
	 CpF060UOEVMP8lPf5NqJtLfu2a5FHS8yKNXorMWKnXm641gtNDOi7BR5X8h4bvG3gvt0T
	 OmiZeDnNWGdRtCbz8Ph/0roc3NaiiELhXyFkoDJcYQYt9wo/ziQxtB5sULMqiLx4SpFd9
	 Mn2nDstpOXPkqitiRYvzAfqfazkyNJ8/8yGuVAQ/bD3maTVFDUqkNaILRerJ9Ykm13Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634854;
	bh=XWliYRJZ/b+YKZQxlkxVfexST9edJbqv547jCMvXuhM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=arFMpCdXffEdkTc9/XeDnv+mpOXLq923+mWc940Z3sDHR9O1eGoe6RWNc/GoX2viz
	 EFaHvWwU4l4eEPoJxyjL5V4S4Bvo+nb+80YcxhJS+lTXrpqbui3lcXfWkrkwgBsxUG
	 v98uutrzCU8oUltosWaZSnmYx3cc5J2zAPS2iRU7eR83QyLdd0dbLWx11sPmTYpDmu
	 Lsdm06rZNurLgXgsKVZfHRTkujGge4qthYU/87Rb1TpQh2CKciVQNiMS6pyxUEYdU8
	 CJ5mDuiefRLWJXxh+tILmz78QT7MJqWwBcoWQXrr1mY2LJC4kgM7Qzg1WhvGvebVjM
	 PtVWB90z5cgqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0582812F1;
	Sat, 10 Oct 2026 12:20:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6909A156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59CF440952
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ckBi040-KWMA for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:20:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7B5D340768
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634852;
 b=bQou45glEyvIXr6oW0p1h5KV0oE5FdcbZtPpjlovCld7dAgkzQaktDFJXeLc8pb2F7/9
 RFWyEiKv40IofkoLJrOARW3qquPUDUrPJKEfcwXz/9dHF4RYUpIjXEVViEhumAhWVKKtq
 071PMf5nIIP1ca45UGBduBznVaNtV6wAEuyLutD9H/IPhRGyX2RvZ5UzWTyyDgAl8QIjR
 Pc9MvMXIqq0rmijw9RQZJZ0/bbxpCqQtaTAnHkegXWCFc2pvw1XLvPqap6+4DRgM0+teq
 Ps5WMx8K+D4y5RXhofQCG+APdhcGQ4gJewx4ivj7ry1dvm4xdUoo5qB7MxD7YzmYLGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634852;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=T0/Bq3+UAxf6fGNgzeW9xQBYnMmDVuQbyrB38Z9YR8I=;
 b=GGWT1RHlfYDawDXcHExGOXgOrv4afpobklkU4F21FiMS8IeJ7cdhFqPOAmY+6qXsKb/o
 e+TdyEY0mRqzpoXwOc6Vnoxoz5ernh5IBnFRNYFMn2g1s+R4ndtNu+vscFrXFVD6kgVCp
 teC42g5ERuzteX2Mm0Ppu9TovWcrWePkc5DRTLR3JnxUcqv2n1O/m6mwQ3tMRiJYYmm84
 RMvwItjMCDuq5hb1KZIkGkzuCI+MTld5YowMBZ0O3Rt5Y+tW77Zyz1tDbb8xlXlN97NB8
 9wFgjl4hFgaD6HGNAf3qQqvrCCslOYp5AkNRheWgxHPC+7rJV56qvzVrlRbK4dGEyiA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="bwLuV/1r"; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B5D340768
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:20:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 32C13B0055E;
 Sat, 10 Oct 2026 14:20:48 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 14:20:48 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 14:20:48 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Christian Kellermann
 <christian.kellermann@solectrix.de>
In-Reply-To: <20261003224447.744966-7-james.hilliard1@gmail.com>
References: <20261003224447.744966-7-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <2657e4ebaafda05b3f04d83f1527f626@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pylibftdi: bump to
 version 0.24.0
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

On 04/10/2026 00:44, James Hilliard wrote:
> Switch to the setuptools build backend.
> 
> Update license hash due to the copyright year and license URL update:
> https://github.com/codedstructure/pylibftdi/commit/88f84ed8ad4aa65dbbc4abeaa67652ccd947a26d
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
