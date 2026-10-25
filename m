Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E9E606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 10:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LXmmujbT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDF4981693;
	Sun, 25 Oct 2026 10:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAZJ1f2vd638; Sun, 25 Oct 2026 10:06:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 03F3B81687
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792922786;
	b=rasLfMDSm62AfTnWXy89ntADYiTE8/chVXqKhzCrmFa0sgVbrEW4/aE0Y4wGAYOlHUGO
	 mi65KeDveFbxmmqsFoaXblERwK1O2S4zkatC6kLjxOr4fbW8ZJ4LumRzOhogwc9gO3Ks7
	 TjMECQd49FuZHGYPU4argpfS1xA5uNeQZDpCF1XjxBegXRSqYCnf9TVvW9Ckh5Shvv6bg
	 Ly7bb9yexoRf6v/z/bXlGoujvR567Lg6Z8KAvIf9SuCGqst4mosY2LNki0dIASevlTWmV
	 wU7l1H/r2yruzSw9Oc13343QBjMY2DX+/jfiyl2whWpTsLDAj031l285//zNP1jLiCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792922786;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=iGZq2rrWrzvX0x/YxGrRC/S2r5qAJzA7AcUkKhQGmAE=;
	b=UHMFQtoXcQ9f7JJPGFQ0nPYsZDWw1vQshf+bNaTTShVxY3OmyhCc0h1641lkfiifVo+s
	 U8HKxbVlRiwmWkr3fwpJ8WKGFRlHye67nZaTdbtX4r93hPZ86VWdEV4G2H8Aq82rGf6+7
	 6RMQKPmS5Aa8txzvj7eDrT99NKKilm4AJBT5wBLz4z+PtNp9B+FCkxUK6Es5UGZq7mOJx
	 tqJsF44eykM8zxhUnNXSyuw3KoyFZ/0Xch2CJum+xRE4qHXSNmvE4wyXmbamgrF11LeTo
	 1Oe85zV3llv8Lt40UbFhQJtF1dWRQwfnJ57TersRaX5HhL+/HCw6TEbzrsVXwau/uwA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792922786;
	bh=iGZq2rrWrzvX0x/YxGrRC/S2r5qAJzA7AcUkKhQGmAE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LXmmujbT3qW1+ONsH1fcQ9w+tKu23dyl+layZC+lq54tUS5wBsgAVM3o2c1FI0nju
	 XbRPJMgKdU15IE7uoimDRBy2hzsNxh94rG/PElpsEqHcvuQEeByickx8jqYdAVA3YH
	 rtCi8Ql+yyNb0MVfc075G2JGv4zMrYFVS7f1WrskJwPlsAvyF28rUGcyFRqyr9XXSk
	 iNQw+K9cYYXvMrZ9LQ0eLemwQ0QNbfGAXsmWeYRjlBy/bNUADzDTqz6RnURSNGmb6Q
	 86p/M6F/R9EpUSvBVOe6gGa9YL+BlaY9FUqrXV2peOjmA/c0v3o558UuQ12Kb77x8U
	 WZuUQZHW15CqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03F3B81687;
	Sun, 25 Oct 2026 10:06:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BACE6A32
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC37A81687
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2R7NbbZzRIv for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 10:06:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D633681499
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792922784;
 b=s7bbsTc3HjgIWtWjl1cr4OhB9HlYXbqTNioA3iq7kTS0ea3yHJubHwesj4FJsyAMCaII
 6mEAH0pnilMqmNli5c39sAoLtJJWTkmObvOeKlPFyrNNQD8mpX/9iYQo/R1LxY8kaH8m3
 jH+wqRSnt1y5m6i6BOgCUqCd0SFfDNY8t0WhiVG7RWgbk/w3f5+90dSpBU2FYzJ8gAeVm
 G1aWvgb5C9ROgGb8sLeghl7xmBAVBPANIMuSrCWae8P+Wtg2v+/VIYPnriNVWX31yCcku
 nKy9QG/VBgnMzsU94mdJSYPz/XpU/1LMvon3xrma3BzFomhTCNMEc0cTv7wOO6DBuBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792922784;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=jXF7rPMEqzpIXta+l/JtfoWBkxyxqKY/3X8VaW3Dohk=;
 b=ns1nN17pcw6fn6oqxVtooG6dTNohW5X5h78126TJEQ4LK3wNrPQVW00N0UAatnYJCmdj
 5PMUXpkTBOWmJL8+zwMmJVJXL1HjUJx3067kmUygWGWW3lRygfIratZ8+jC9clLZDtc8G
 QVxg6ku3m9dwXE1DovEThRW6EzI5ettUF4D2+Yy+R8h+pQ2NPbTIDIwLUo1TK64vXnVLk
 vEfdQHMKx2nv8zALlSAgnKmgXECkYU7ojrAJ1vmjUqhwyF0IaRMRLXYGqc2KeHGbx9Zz4
 K4C1C0OSTV0AhHHWZz8a14eBJ9uqR6NUclZgvQnLmsiASKaT9CfmbzDilWQYjU6vK3g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fvb0lIQC; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D633681499
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 10:06:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1C3E35FFAA;
 Sun, 25 Oct 2026 11:06:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 11:06:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 11:06:20 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261024182913.1957467-9-james.hilliard1@gmail.com>
References: <20261024182913.1957467-9-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <30093a8e7153ee8e8cd6b2c50d993964@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-grpcio-reflection: bump to
 version 1.84.1
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

On 24/10/2026 20:29, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

For info, I marked the commit as a security bump. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/309c48bb224d8d403590fd1cc64c6ed927602872

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
