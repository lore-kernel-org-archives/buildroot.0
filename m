Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E321CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9E7B60650;
	Sat, 10 Oct 2026 08:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1q-JYeM8A1a; Sat, 10 Oct 2026 08:09:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1D1D46061E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791619757;
	b=lq+H6txq4OYszCsL/4+A7mXkE9KjyP9cXdzul66wvMpCkpBIMNv69PXYNTg9Zf94nBKt
	 2BasFmxQPHRLtTQSrs8rhsjFMg24dQna9z1m6VY6y6K+UqFmZbn0NCYAOMSnNi43qiz7V
	 /1w1fBHiVEom0IVbTGOe9xCGsq45HZbQeP5e27e+nlnJoZh0WcctoeQMvSfuGYT31lHxn
	 kltOl8XXSFSV0cHYd5rxLzoXwkNXT5DUPZRdr0Q2iV3TwTthdEpb7Er73VSqvgzjeCtsX
	 PRHtwtHqVVVKES8gIM26Miz1HFLnYtsywLvLoAiqzNhu0lZ7nFgcI00m8auLg0ZGnwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791619757;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Djv+xxBynJB94zJTcnVuawtGumWEYR5oJ3p28wadEzQ=;
	b=av2ehmigs6v7Yi3zzBOKxhk6ZvLCZ5Va+PPsmPfO5LG9KiG8e7eEzuKR/MIMeKvoV3UA
	 Ky9fJkpXm72qrYuu/1eCXoefoWjrhEKQMLLdTSJq4UAKG3DiVstSGQYOeVV7cISzfh4Xk
	 8qVh9bbYnYcEbIRim+lvcWGJQWIJ8++c4tQifCtg6t+1pVNrbAjPSnhhdde5kE/e/QKZ8
	 BmN6oFzX6QjCy9osOtQ0anlyU3URvRcymeLO6tBXr2nhOUxFTgVWJFBfkLZqTik6jEA/Z
	 y/jy80axRbg1sBKLXjxl1GnSjKfk6uboPY5ya20PmNvyv6NsN1iu91sQa14B0/K/Olw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791619757;
	bh=Djv+xxBynJB94zJTcnVuawtGumWEYR5oJ3p28wadEzQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DSkcXn8bzqe9rrnYRZWD+buikjl4kJSOHMJM6X1TPVgQL9SShOFZY/r8wUPJCnKya
	 VuyakYUqOyDWCjUGSiMAvX/3VIwIRaBq25iWKQiKtW8tqp6ByvhkGNubc6UwVolhLt
	 64uOlPFkGqcQAmfKqAgKix6IxHgYuWZx1flae88XcxCDcRO5SSliwYy89GdC9jHuNe
	 cH/OscYeXKIAiEVdtZdpXjlt2gGnm5mQMGPMhCME4vxPhp50LZiQb+lO22mxRaTksq
	 c5/Y7mVaI3NeGj0zGVrzIzTVMLIBkBGv7NN5NDSbCaE65CUr8zUm7u6Jo8u0DLDIXo
	 i2sBRIiyU5pdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D1D46061E;
	Sat, 10 Oct 2026 08:09:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B370A9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 991F76061E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_r2ehTf2z_d for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:09:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8EDF36061A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791619754;
 b=KNsEpXG8OvWeKHzMthFFc6w/XoLOCfn2Uah/hxxBcKEINF6LajSsSb5HJpg3NkBYaYey
 /Tgj8gqDxqyc6uRRkluP09ZZS/KYVm4o9NqWg0TEd1z02US0JPKHWmulzSLxietBLI65V
 DscDowC4jCIL45wLPds1qpN6dOKhYg6YcosgpnP5aIYPpZ8Mdlv+casXkAmrSeDkbIgS1
 f3hyQcg69TQufIOP9P+XIRI/3VisNTn3F87j6IhWUmlCdBj6FsstgTSZBj9SeLgHJ2VCR
 qpZVhi/NGE501tAOzCIapEtxSaGHAM/5yWPmag0dylHoQSXKeVjKL4UcFrGYbPFtowA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791619754;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=zmojgH5SHQcYxLF2isAvuoPsqJeDSfhMwQaLiAFOPpc=;
 b=sgtixyC9nI6kI+Q1DQqfN5MNeeDMBY6YnHlhvkjxDorexb2ZUxKKeiiGtKWJ1zwc4s3p
 dWyCoK1i0igZxOuafjnLxJ7n974usVRlRGNgLF1ohEA7ss02N7Dd0GRaE3dV81sgbsRGu
 XMwkakXEPVF4e9qixMtmVCFY5M5ML8dgpj0ufwnC00HOjhEwogmnGvTbzk7CgIZ2pr7iD
 fUJZvRghffg+b1z/p+psJD81jZqlzGh/XzOAlyC+C18IM0QsSwzonbkAOy4Ovk8C1CLM9
 x95RT9/A8cat9dK2S9ygtgco34fd6o0PTsALggKPvfLJPzX7r5VjAj5vWZi2SuPr/lQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GDjbjNhV; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EDF36061A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:09:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 382615FFBA;
 Sat, 10 Oct 2026 10:09:10 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 10:09:10 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 10:09:10 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003233333.754602-1-james.hilliard1@gmail.com>
References: <20261003233333.754602-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <91334089142351f225f150290f3c6a40@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/python-engineio: bump to
 version 4.14.0
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

On 04/10/2026 01:33, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
