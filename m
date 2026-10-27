Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B005C606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 08:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QBnh5pGb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A71F80CF2;
	Tue, 27 Oct 2026 08:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xMWA751eeEO1; Tue, 27 Oct 2026 08:20:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9788280CD8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793089258;
	b=lon/Pqa/NaVpP4RBbHjqeHO1urqTpvLrtCc75wHeBM+lgO87H7J6He0ZscNFwYlh7Lt5
	 DMYXJhbdk7Tc5tYia5hZpfgK3xTXPXj2kassPSJAoAqzBFv81Y9DHS87ojcKrlxQj9JYM
	 CiGSUxRRwjx5X3UJjwEXg0fiu6bTNK5xubrH9WMDRaahvv2OGWIyVI9qgQ1RZE5j5+urr
	 /GfUG2/c5NY9syczqc3n6CBfZjoxegdV5wsUE0/M1p3seTsLd29lmQXYDQ806qY4JpUjo
	 6kPULiTrFw4BCO6rMp7+/3txJtPjmcTvFd4wOBBCbqLGLXFdk3ntHRwS6i9xaqPZqng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793089258;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rRz1uRw1uoaGG4luz+KYhPLXvrvHgX71OGUnAsGEIgE=;
	b=Zx0ck7WEpEvCtkPNuhPyFfUWbRnBC/lIyI2A6lsz0mGL6dBuY0OXEjsbq1wNTNGJqjd/
	 p1etPcs/UwtEcdgT+Rz1astEYO7H5Wstdtar0dA9YzvPqMKMa0nCezWTfEe6V7Y3+CPyr
	 Jl85Lqa17XmVmQm1jqa5YjwmtEeuAqnPH2WttZ/kEdrk01TlCpFShP74yKNXZigSFhVM0
	 BU+HlPODLnBQfuqL5IyA0wmBoN1Om/SoBYnDTJ+1Jvqa+9YRv3iquyPQLLYvfgFZ/YbDB
	 ecoMJV6tLR8WWaq5h2xXCl9tmBxK52VqjdTK+XHLCvX+bV9qeijLV65g5uoeD+vz74g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793089258;
	bh=rRz1uRw1uoaGG4luz+KYhPLXvrvHgX71OGUnAsGEIgE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QBnh5pGbQByy/7RTEXbSThbTI0XsxJIzRqakO8H09Mn03SdZXF2D1LX7DU7C5xfbA
	 RUPjQXjzk16fjc2ATOW9YRLiNHU5YT6G7TEoFiQkJU1idzEMLwwAfMcRy58sdgPp+k
	 3faMgU4vO4Svr7mv1O+dKAOw7ix2S19rFJgQrXJlsbx+wN99eXtIIWUUukm7zRkXDT
	 N+up9XfkB4D+7nYcuBmYmAFMn/Kh1VHm1gPEsVLjG9suxGbMzXUGQv6mSFCq8s+dbo
	 vhuPhphs3OqwCQbBYkauxVGaZda1pZRgZosi6dMH6tg/7m0WscjYhzUlxMgODA2nkl
	 cV8Zr+Z6As5Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9788280CD8;
	Tue, 27 Oct 2026 08:20:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06A67120
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E32F480C12
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2pBzD-tRcYO for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 08:20:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5EC2B80CD8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793089255;
 b=HHOOzYiCB+JgUHouDRJ52MUqYftJcmrcdeuKOJc2E/rvO+t5yPG45UO4GL64Q1l2GMo/
 xSDq8397WEbLQLkD0kctx43xRksI6rb2FZqO4aiNIzbVSOwiICSeejfY1vbqLSyOhSFWL
 cVaV5nlR2a/cjAb2O6f8hKxaziAbiKJAdHfhj+RaWtQMbTaCraC2RY9BVUwH711mGM1bW
 3V9v+/V69NWwe30/UYyzkNXFLljTk5O+rmXwvOcJrhlRrItYlMNtPParJuI+/86AwoE5p
 /o56ZlFO9tSqCtsNNo98x6GJO5zpOuCT4egygddjpExQ/Aja9T2QIGZ5t8GOLSLU2PA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793089255;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=rhDqOAHkdVwCrLSK7SnZjUxQSGsEQGR77hbxHSP6JHY=;
 b=pm7O38NB1EpE5zQExq/3A9YmlARmoLJKHPkDbgWWGOB2USfugsmVIoRmU0mMlOYyUEPY
 6OQOefFA9izEJsw0ebLIiqLeehmoPM8/2AC0dyqnH95+XF7WzG0qIg/TbLhHf56JHhH1B
 hCpZejaGYGsmdgcldwE0Q/laCQhp7xnp8pEi0ecjDmp4Aob5ohkDXj3aK+9baI7XR0kHw
 Sk1l17HOtS5WnDFus9sUv7e/0anH1jWGlR3TKlR8N4IFtl2jECQDuHvDt7WmvfkXS+Bf4
 dpZfLRtBZULaLpzyglCEZ7OODihOWVvj5c3ctz4qbUnQerlQ79quOebq+vn75iTuZ9g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=pF+xUS8V; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EC2B80CD8
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:20:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 90993C79AAE
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:21:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1F62B603BD;
 Tue, 27 Oct 2026 08:20:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0629010329081; Tue, 27 Oct 2026 09:20:50 +0100 (CET)
Date: Tue, 27 Oct 2026 09:20:50 +0100
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Andreas Ziegler <br025@umbiko.net>, buildroot@buildroot.org
Message-ID: <auBewZx3hr2_dgX1@windsurf>
References: <20261024220915.2813680-1-alexander.sverdlin@gmail.com>
 <at5oC97YlhN98HHS@windsurf>
 <e34f4a3f8aaee192923e3ecdde4a287a1cfaabda.camel@gmail.com>
 <45a821b584840d1cabe6df1dfe083fb8@umbiko.net>
 <a4b6456aaf3f6454e8969b16a443dac45aae70f3.camel@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4b6456aaf3f6454e8969b16a443dac45aae70f3.camel@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] boot/syslinux: Bump to 6.04-pre2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 06:57:44AM +0100, Alexander Sverdlin wrote:

> If Thomas makes his mind about the existence of the original syslinux
> package at all ;-)

Considering we have interest, it is pretty clear that we should keep
syslinux, so please go ahead with submitting new iterations :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
