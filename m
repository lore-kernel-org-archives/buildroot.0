Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66B1606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 17:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bUCa8lGY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D20D405D2;
	Sat,  7 Nov 2026 17:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tm0s0IUoAsKu; Sat,  7 Nov 2026 17:16:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C6E624054F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794071786;
	b=YqmpL9KUn/jfNOZSUdOM/11UP0MvZKP35n42GJUvf+PD40fPh5BQqZCzwDydYs/t4TI2
	 1UUNzQ3B22+DwEFWa+bNf9lMVxT06uMtpvSdZeYsi7SLdcEG6FglN/O/P4tOYBBpfPCzE
	 VLb687Ir6dqhJfazNo1NgdTj4CiWJ0ZcUjLqTUtTMwE6SnCFvBavBa+eVJ0h9fdxjCjEi
	 9zEQ0hUQYrvPlsrRHfMwzCMYO0fCL/sj321ZqrgTnqV6akBZUYT6GBIXvlzYft6s8KGIA
	 5s8/a7ixsJs/RqGoQtVDTf0iEhh+XDHtVwnnhhuw9RUWbsDGPPNjJ0NxXDAZEEI3dwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794071786;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=oqa+clLmDIrm64ofLTEirF1xn/FTLOH3SkCAACKFmBM=;
	b=ZBQixD7hTR16RLqu9181KgRc0X61v0lF/K34MTuZpBL2fwHI1Vzbe0ShZh3MgL3Uoynj
	 tHlCGaHJ+Do0xz8SxPSsFifRvlDqnc4dWTXjdTsKbkuFO2wQ7l7+3tZaVDUXVUS/SEGtb
	 /YXPFNjIdEOI/hBc+M2p1zcnANU2Gz5sP3qteGO+iM4ZE+nQLjVws9iv1Ha/s66XxlSWS
	 41qN2vrebzuJsuxKyoschK0V1Y4Nm6+o+SeyGjWNqP1OuHrOwAJsvOiBj+2FJxk7dc0vU
	 RkVuQ4wkOO2ZE7byL4F9QH4m1gNRrNP6ltaWbd0b3WDIAdXwGb5av2Cmo121A7zD6EQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794071786;
	bh=oqa+clLmDIrm64ofLTEirF1xn/FTLOH3SkCAACKFmBM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bUCa8lGYuFKSneo6FYxWfjx6WUD7j48tKzanjH2kMFs93pW5CSKr0OYhGti0zSf80
	 S4FC1Jvn1oQC9inZUgCkplfV1twr3Y1QmzTsDriaAq7kebippYPk9XxzGFUK1FxpRn
	 IGVmKfARbCJImspUdVbqiaRB2wIaM2dDQxiAqNAuIS5bfkCaA8T/FUynA3Np0yDdTt
	 qQCeI9Ie06k0ENFNWT6YSAdbq/8CfR0+QeM+HQiHwfa7doeUNwyvCLQ6mGWKQEE0zu
	 Ywmdwv5LoKDkAVmxXyVZH5j2A+TCt1uPT0jnvfQiTiEtjmYqc0cE0ivSLogYTTC23b
	 3PG5lfJawQvZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6E624054F;
	Sat,  7 Nov 2026 17:16:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CB5E32A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 723B54054F
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dN4b80hYBWq for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 17:16:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 56C724052D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56C724052D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 17:16:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id CF52F5FFAA;
 Sat,  7 Nov 2026 18:16:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 18:16:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 18:16:20 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261103141717.385038-1-giulio.benetti@benettiengineering.com>
References: <20261103141717.385038-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <d9bdbf398a33dad18778820f0dc8145a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v3 1/2] package/swugenerator: bump to
 version 0.9
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

On 03/11/2026 15:17, Giulio Benetti wrote:
> Starting from release 0.7 swugenerator depends on python3 lzma so 
> select
> BR2_PACKAGE_HOST_PYTHON3
> and
> BR2_PACKAGE_HOST_PYTHON3_XZ
> in its Config.in.host
> 
> For release notes, see:
> https://github.com/sbabic/swugenerator/releases/tag/0.7
> https://github.com/sbabic/swugenerator/releases/tag/0.8
> https://github.com/sbabic/swugenerator/releases/tag/0.9
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
