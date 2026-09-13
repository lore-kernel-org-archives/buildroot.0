Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6E2C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 20:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB0AE4058E;
	Sun, 13 Sep 2026 20:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KR1nqSeMX0Ad; Sun, 13 Sep 2026 20:01:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CF4FA405A4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789329694;
	b=jLRQDRsyWQ6VsrkrXOw1dcfJpxhn2YIhur+tO5iBXImVjxiwlD+YrX4DuACteDqIVhYr
	 /7BJcr3lnaZZVRuEWi/nFAAMP9CcWJIa2y+1KuaDSQmOW3qgyax1ZkT8+Zc/TnbBWgVDr
	 eS2dalY1uiyli8W1BQbUZXXXwFCskqfG7YewtGKWPwoq6JOL3ra55UF4Exqzdxye4V3x6
	 fgTJiCgyRkUL1ag2FlxlFLFUQdsBPQ8CtEw++OhSnuGjkIgqMpnk1Oidgedybwf+w3YEA
	 8FBlFoQpmVQuN6rvnWWGZ5Q5Z8OlK91BRRvAWfA55ZB+ZvmWNgD5TNhaNNKvZEWJxbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789329694;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=OnCf2hPznlwS7t31BA1pHwt266elDzLjvwssuafTKe8=;
	b=GwmGNr4xAgyEMaXkrJVNk6rdHIr3533whIjXdehL+OoMM5akxsq1oLfRMf0QQsex9tx9
	 pufcBN4AgKoBsFzjozvvXG8kmok/mwyvsR+zfRNs9p7CmK4VPXe8kVJ1fytox3d7eTZos
	 X6+41TZfFFgsVC06QCaRgB8lcDdpqB+a5JvDrB/FksnehHIb0qnDFeYKH4w6369IECxyQ
	 3EbtZLHjO/SxN3R7Stw1iSL6jemwoc0XaB6YRxbDFxJ94PuM4mFvN+s8Hh9Dn3ItzByEk
	 jCKQhs9umLPr2iiBsyRzCt0vpSN46Hr6If5Cpt6pdIYz40Rzbs8iR+fuvatou1//ZAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789329694;
	bh=OnCf2hPznlwS7t31BA1pHwt266elDzLjvwssuafTKe8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TuJ6AjUvRdJdNAY7giz/xdD5cnvsmzFJPKKoi3Ch/ilTq0hOFXQWySB9gpKe2XWMi
	 1yCe5011uZbkLByXajJvl9nh09Q52Iytpb2k7D3t23w/goRieuCILtDtdlNveZdZ30
	 PMqnZ7WvSQSoaRdmH8nmvYfeG9XSfFj4i1M8MUGnmmUGHkPu49PbkbQiu1Q1xtQBD8
	 aTjtfKh1bs84ooGOKxe/cBoAIfo5aM6XMF00fnCdbcu+LkDlcXJS4GOzkJPxonM05y
	 L44wX6CbDfz8BcxVDMUp0y3RMqT2k1PYECUL0XbU03ZG7z79kLqViT0AmTI3OOVwPR
	 BSfQ4OnQtiJYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF4FA405A4;
	Sun, 13 Sep 2026 20:01:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 299C824D
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EC054058E
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SfcvnrAT9k-1 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 20:01:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4E7CA4058B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789329692;
 b=oGWseGnsJMztOrgYwWgW9/TQM8Pm0dkGMRChx6oac+XRhBWcyVNJWQGLifZMcQ1fjucb
 rYPOWfhm9ssajrTVzPB3yYvVgz7nrDPcWUnoI5vtOe8xjI8UY7ZpFPRCkbRD7PYe+ZR5z
 UTZuuKbFP3Nt+4B7wye9iTq6XMkPBAnJho609Ud1Pfv4A1g9vmrIdWQVtpcyVbLGgWpWX
 M0NBwR3O0Ait9CtMJrhG4HUr5xzr8wBw+5JY62j0Gw/MEocNEe5ivlk5kRPFwLJiWzXsO
 EiVy2rxcHOEQMx0Svjjej+c2/C6/6eb8cmNADxKP4SIe4ipYtyPkC9lHOurJfmhpY4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789329692;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=QTZ2ngS4lQfLUgMU7AYWLeLcNsIgLwjTPuocwCqo6TM=;
 b=klp4L4GqN2xOi8XDpwlEK79jR2ZhLDEw8YIC4AuCFf5PTYm8aRGqJitK1oXBcu6YWSBw
 MCRJnxNGz37To4dxu/6F4jiqzv/cEvSyHtUu5fGWJU4R6rFf+C0F28E5g3iijanj9/80v
 KcAjhi0mKnZEiTX5+aA7RqISCG6rxt7Ga9/2EfSv3alxalhASOs6ZSdRANFOTd+sTTZnp
 X4XC8jJnFuLe7DuJ4UbpHJcIYcYTkklU4EfsvmRSOEi64Pg5DIXyV83buGGSSHEGgO6ID
 5bR9jkcPv/bLdH706ynS9orbuIioLzenxKUhoZ6rolZsotk8MtAcvNwgn8Z3uHEqMuw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TM5fXu4A; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E7CA4058B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 20:01:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2740660129;
 Sun, 13 Sep 2026 22:01:27 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 22:01:27 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 22:01:27 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260913194733.1725979-1-thomas.petazzoni@bootlin.com>
References: <20260913194733.1725979-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <2689da3416d9c0d004b25468d257c5f3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/clamav: add missing
 BR2_TOOLCHAIN_HAS_SYNC_4 dependency
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

On 13/09/2026 21:47, Thomas Petazzoni via buildroot wrote:
> In commit 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa ("package/clamav:
> bump version to 1.0.1"), select BR2_PACKAGE_JSON_C was added to
> BR2_PACKAGE_CLAMAV without propagating the BR2_TOOLCHAIN_HAS_SYNC_4
> dependency from BR2_PACKAGE_JSON_C.
> 
> Since at the same time a dependency on
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS was added to clamav and
> Rust is not supported on the few architectures that don't have 4-byte
> sync intrinsics, this has basically no effect, but ensure a correct
> propagation of dependencies.
> 
> Fixes: 203725a46bc6b61ed7e4fdb3d76f62327d3e47fa ("package/clamav: bump 
> version to 1.0.1")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
