Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473AFCA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0927F60643;
	Sat, 10 Oct 2026 20:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9Xc8IweHPUL; Sat, 10 Oct 2026 20:25:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 487206061D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791663925;
	b=nkK/Z41S0lG8z+bZv1xYB6Um8+KnD1YLxda7u84YcbOKD9aBDKzCNNv6J9S4eCBOA6oA
	 NDnrON3vEVbapc8zYDEb8zi7z8yhZvqHZf2xzS8FJNBNpArNrzm4YY6cIe92W+gBpF1x/
	 2OLfrdD/+88xBDL/m17JLIDLkCbHpXAY047oQvIF0KHFbvsbe4tdU/erkSlfe9LZ3qSj9
	 wbU87ZqPttpHtX0YUWrSXhTiwkpGIFm/GMo4c4VYedMbm8JtLBT7PcSRL+gT0j1hOp4Dz
	 lGwmkhz3Br/5SrFicrHkgU611GZVQ6/U6mTJikfajVfXU855I9BQa/jfIUWBHr0CY8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791663925;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=S6DZwnua8rBCRcXnjuYZtm6m5yEPRkoJpcyYz/pQtVU=;
	b=o4d5db0VC4YXZKQwpoX9fnGuAN9UuEXl1/jx17eJ6AUx+0ILBk/mXA1cneLroDiAvDUI
	 s/PZ0pi0OEP49B8IltxSIY2ZKmkOm5uQsI1P9RT29rqCIv7dDEtmaeBJpuw4XUgzYkcr1
	 1bi27cz8QoF6x1606IMRwKcBA/cZuarDR0RP3pnaH3V7JO3W45YU9y2xNIW0xXZ0g1tFs
	 axXGqQrEbrQQgYBE7nY7sqSHjI4PljKQ0woY45TEmoJdHpj+C/8+VqC5BqYeiOCywHaL4
	 nGSTEGdCFHVwqin3UywaLDzzm/YdXZQbYW6fyjWSv0HH1PnZ350f/oX7p5rz334AfQQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791663925;
	bh=S6DZwnua8rBCRcXnjuYZtm6m5yEPRkoJpcyYz/pQtVU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iZYOGq7ZR3X8j3/dfy0qaDhUOqpsicSlcL8dtlGQ4ipn5msJ8pGkW4v4fACQ8uI18
	 iS6jKTP0h+6+UH5AoXwXV+0RK5FuJvK6UFgSPzZwXPyUeoKp9HQM9lWTIz3WBPZBDE
	 qdOQyzUh/inc4Zf/fwnQRC/Z+t38eyvk297824H9ByqO792TWe1a0/42bWmPHd3YWq
	 lI/axO3BX12JOAmeqbZhvUxiRHVWdpHT4nMm5Iko8yiaP7GLRwmefcgV2Hk9LIOe1g
	 CiFJFPafRoaIyRqrKL6VkWA1LaNQ0IbBCHRKSOfESfS515D6TuLZ3qBBae/DcrxbXP
	 DX5PCkXazB5Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 487206061D;
	Sat, 10 Oct 2026 20:25:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1400A356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05D256061D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRgzs2-BjzdF for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:25:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 93049605F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791663923;
 b=nIVM/D5Dcvvw32SE4LDv0xSAnhfqT31jT/AYMvOgotXxv/z1VFX4yW6pc78IFhQN9dcg
 rVSmhGfyoDv/8rl8j8ULZ8LrOaUOBxgn30o5E7jTS+QapccsyyMp32uaiD6Hlon/WrWfz
 N3EdAMULAEb4rAMJwZmePEQV+vS1Ror7ZmU+PS5nCUg8kWHpDJxdcVEDyR/rSE3LKaH5+
 nejISWonXZLzNPL9Cl52qWxI8KdjsFJL4Lpin6kC5lHe46htEfcMi451iTvUq7yxgjT0i
 skvGIXTX9WauBdKIjohglaS9sUVlagXUG/tgkYX/9aow+z+XfpdakfBA4CZR6S9duYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791663923;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=sPccZlSRgidGjwOQjYKS1agpzNfUpwWcboxS0Ou3DRg=;
 b=g/5+s60hnbI0xgLJVLKYrG+Hx46v0NlXGcGA8ZxS7E0QLKF0LQkXXlkT907ESFYSREgs
 9ySFZKMNqyqtrSaUGtEeLgVMAj3sIFhHaK4QlrUCjYK3Z1AqCWnrFGJ8fILw51vbOuwpM
 V0/f1GppxkJSjeSPpHXyDx2HfVBRDnNVwooFQhQdob37cs4yu9ETPS17ueWAMmcV//z4S
 MYL0NBFehZQWcYd5p0BaRBfkx+aM/9a2ESNteo7jsKknEa9Oi5KHAeTP0sPnRLb+UW/36
 LxRDEe6AuJT+Mlto5L9ZAHz337NYk6TJQ55MgteBBW5xc6GJvHW1C1AYK7oY7YOcxJA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fIA2IxUa; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93049605F3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:25:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D67D75FFB1;
 Sat, 10 Oct 2026 22:25:18 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 22:25:18 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 22:25:18 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003210833.735937-23-james.hilliard1@gmail.com>
References: <20261003210833.735937-23-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <ca87d67bd6a7c009d3fe5c77ee630cd7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-zeroconf: bump to
 version 0.151.5
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

On 03/10/2026 23:08, James Hilliard wrote:
> Update license hash due to restored historical copyright notices:
> https://github.com/python-zeroconf/python-zeroconf/commit/cb189247ad5c1b0bb1f4d8c562365b6b22c2e85a
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
