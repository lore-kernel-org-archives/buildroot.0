Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DBBCA9EC3
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4165608BF;
	Sat, 10 Oct 2026 12:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzYiHMr_T0Lp; Sat, 10 Oct 2026 12:53:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1D1866063F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791636784;
	b=IBAqj4eGwz97dbDp6S4B11+UfyCD4jfUk7IYkpBaImAS02pNJyg51pGi8+ivrvR2czVz
	 KFeN+hejglRp8mZ2aecQO6zOLSpl/swBTO+ZTRJ+LQjokXf+UO6/U6rMOLEGEQY+hBc4n
	 XIo8b8GchXHC18h3CgPXYP1mO1DN6/ay77Xq6e+H2EYsFGAvsvTeZ8s7YuuXEdsYwuMmD
	 643l6LJuVQPPa4DDgD73j3yW4KvbmwC/6YnzMv2rvKNB246ojivGdbAsWGNAk2460DWNI
	 bwZVQyJ0w1QBF473uY1LWghmb13BtRj33jKnpjOR62KPqzex4mO5ASugKdbXFbxuG4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791636784;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=5HE7mj0ryyOVXiAeTGhROR+tzVnHquIy7wuQ7Vc9wG0=;
	b=kQFTJNkgjBE5hOF3eQ7uFN5C7wpsHmBhSX6z4DzQ+U24Yx4CH8ZihR0L6Qptju/3pJAk
	 Iwf7kyfdHoEEgSOwESEwh/QStShsG1jDbs2Yy2nzR5RhlFSkhwuh2jlHvzhpN57ei5ckS
	 skZhliQIv351JJNoF/ip7EsAJFXVyy6942k9/TBmZFc/Sluf64wGjJ0YZbwXy29mgcDT4
	 Qi/4ghTj1Fica7AzaaNKbExXvqTwsvsQWyYEV+wRAKApapyL8lu36wQOK3c3jKnmETWQM
	 aNA9A2bQ4YBsH1sXGwP64pvcoyLOiyqDFsmgUtSkCgTdL8d79QqOziOodFML6hxxUPQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791636784;
	bh=5HE7mj0ryyOVXiAeTGhROR+tzVnHquIy7wuQ7Vc9wG0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qRlXrtstpW4ccgQuFalIyhA1IB+wytQtXse2Qj9fI7pGsEYcjypbrNrw+vHTtyDFf
	 Y0Wu42xiDqTrVisdKgMKZioStLeI1NnLNEayevukRDmtSm7F+HsYU6i5SUtOtyP1Nv
	 DywcbBmEJmkc/sR6KkMdJyGFDHm9mgfJQNfYF9C8co57R6mdzY4IK+mA0zFvqDPhHs
	 yx0JRgG6qBi6kKzuWqCE+9HM8f1kW3mDvCgzCZ5PO/OyxqanPgJ+L0+EWh4Anwasdn
	 dNUPXC/1nRLaKg444zCJ/lAGKEP89+eJnQWg+J2AVFZPT/CpUnNDRORQZzuo5b/CuV
	 PuwA00kjORvAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D1866063F;
	Sat, 10 Oct 2026 12:53:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D66CC317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C84336063F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xdiur1ogTf0 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:53:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E64A760618
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791636782;
 b=r3C5XNRQsApvh3vjMYobf1kjg6wHAVVTf61LmTK2sw8+KKYOH30Mb13LQHl/U0QTEgCw
 f0tbp/XvivuxX+GoI4OESW3MZfW78TP6xL4+dzDUdxI/PnMCJTaZMMM8m3xp4b14V0k7J
 hXi3nmpx/w8VmGo3y27ULQ2axq2a4V8fxFE9LmpTZTlPKUH0pdqIIMVp2S4jIs2plmUIF
 Pecr6bu6K6BnewsvRGF6VgiOxyIWJwXgUoNywh62zWbGat0QceuSXT5fyj+3JqkV//oro
 AOZvbOy4H9ZahictS0hodQgbpkDHZsOLhrAmR6y6o8T0fKI9qNrvvCmfRJ5+SAmAHLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791636782;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=JP9J+/pc8EZs+OW7ge7IOqNtHWBs5SbjJ/uSM10Qkos=;
 b=JB6yRCpGjuofzVeILL6y0FdWIOMvZHsc1CwuWawTpNpU7Vfn+alPuxy86SAMxN1BIVxq
 N665gOoT/FekA9HRa1mkDL5450xFDP2cf4kPTjdWJodjQ6pL6TEAH+AWpTCoIj1D8f8wv
 LiTRkc6wSbXtkKGcqIzOVzV7BM4oKSgyjkJPK9Z/YxVQfC1M48sJWNcJdMqFa+N1wBEPQ
 PPMqzT5UUe1XaAGuhnuTUkv6rodDc7UnMpsO370Vm9BTAbSbYXZZ7+0uQEgpqF00ztGE+
 NNmXjvx2PEvVloZHaFHSJuaRXGva85pdUv+yrehLVmWCG8VqKMrljuujaluC0BAr+ug==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lBhactWE; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E64A760618
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:53:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D8B165FFB7;
 Sat, 10 Oct 2026 14:52:58 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 14:52:58 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 14:52:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261010093247.3650651-1-bernd@kuhls.net>
References: <20261010093247.3650651-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <3e42e541e50e1a9f23570f9f5f19ad23@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.54.0
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

On 10/10/2026 11:32, Bernd Kuhls wrote:
> https://sqlite.org/releaselog/3_54_0.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
