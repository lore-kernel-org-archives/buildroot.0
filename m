Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E0B606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=arih8QKJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D00094064E;
	Mon, 26 Oct 2026 20:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 613r2-NXP7JM; Mon, 26 Oct 2026 20:24:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C31F6404DE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793046270;
	b=PfYma43IMZAe2IavILhMXCTVmMrMfifVHEjJ0b1Iz8ZNQGTc2h5F+2wmXL3pWcJTrY4R
	 4mnnTHsSmTQlhhOm9ffclLk9/dxRc1xVOt27tKqW7H8gFBnizua8/CNumo/ZFPbuCkLsN
	 ZK5Y+bbezgQ8EbeCIt/J6WkYk34udaO2U8GFBzNB7/2nhOwRQs+V56b0acJ5jYbCbVvra
	 dloaBzrolt7Q+w2ifJqj/7cRMcry/WH9Z3UlDoTU6PKgNJhrCpvyatsHYbv0CZk11Jdtz
	 U0pB1PxoicLkTcwjt0cE6ArKBxFUtaId+9Gb5GpRZIJdrjx8ipZQPjvw6POLAy5p1DQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793046270;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=5bo/NOrtBh7W94XtuBzsNBQAcygSNwXMm1ldsHPD89c=;
	b=bzONiZL+RYkJElFGXCwivVXQVhpXukKcU8kaUyFf8l8cNMMbSekUi08xeA75bazcJJHO
	 R5lr/q+ZLu3IPET3yCpNzY+7i4PRipR+yO/B8RzO3Hgy29iY04UJh0u+iYCc/tqNvEYbb
	 aaIv2t6vTQDre5G9SEx5CwLmbkVl+BcTktzMoNns3rb4FlqTYkjt30dH39V+S88/ErlyD
	 Htckpl2L8CnGi4fCyVrtzHeMVtiIjfBPGJ9S4YPb0feHxcFIADvnXN8N8M4C+8owtfuxS
	 2g3rUm7t4RPlp9evV+Znx+HzQdO2Havp55CkjcnARzloCuZZrDTPwXsHxer2LzaSIEg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793046270;
	bh=5bo/NOrtBh7W94XtuBzsNBQAcygSNwXMm1ldsHPD89c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=arih8QKJmqikfxw9ZltruRGr/Y7pKBnJsYM7nGDhCMsR+ilVt2ykAOt2pymc3UWjP
	 nVmEsE7prb4mgvbzFYT5Hhxqf3ZBpXhUMW5IgcUbHuP6bA8hNk1LI6M9TDgzPm3vOr
	 DFiqMsLT2k+BDOlCiutLgPkiRfnxUUUuvKUGNhocGmMJfXQa1ynlBexhXG4O0TBiR8
	 orep/Hy2sy7cR6OT9qA9raES9OEd1MzaqlNGLUXCa0TSCX5GNXEfck6sEsIk9gcyLE
	 +ZJq2evEnp+50tdIA5/c2GGh/936tKagXmVcV5UeulUJ/ZbZnhae83w7TX9y37R5NR
	 oZRqEVgb4oKAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C31F6404DE;
	Mon, 26 Oct 2026 20:24:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ED762F5
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C94740112
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKTwTQvSAzeL for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 20:24:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 17DCF400D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793046268;
 b=WDp7+o1Rv2faJVvCz6dtSTCZk0eLqZGIOumNX7rHXsA//OXKdjRU1wW5dR0ESQOrjzaR
 venif2IV1R09JILca87T7iiAdjIXaI2cfcTFPd6j/k9otayjOqliGxBjyc6CJWbBRySFk
 H884DbScJKsRIZMAK07/8Wb9Z7zKTJY71THmTpLmp3rr/Hn++EeVt9XMsWDpYxr4laOzR
 p2ufjIwYFKBNb2nZMOoW1sFdgcDsdKXeTCPoGEEwyXAfUNLNkxk+jVfdMfIqstu9wnhx0
 4h2IyYMy8S9Z7cOJDumOq4QfMiKAQiD92xuUqg3gAGcauQJj0GGHZyTSOM8jJaxQxmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793046268;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=yLkVqxK8qknPClW3vitHoUI3SuG8YoZ5J8i2ZU7uyh4=;
 b=pPKst/HPy1NwHuPn3f6tNl7I0thMF+E5ckp8RvCTBxdsHqxu7lpIC+AEJrRNPbDKbwK+
 zLRqCsITF/u0wTb1CFoKyuZh/FxtGttUatRLFZRj+SpKKa5egzJdEdBRF+KbMWZLp3wIV
 wwyDPrfZLeqfNIAOqcFFkkkc4AouMrdcU1lfC+ZtSGWQmtIfTkyRA/CVjp6/2zdiKJRwB
 9ugaR/rvjcwt5UGq4d43MVgQU/ldYfYvFVPmwGVcqN/8R4fS4ilDC+Ss7dzdNRHJb3atc
 RrJFTfR0X8vTz0NuQD8hxLOfmpx502y7CE0/bW3ffz9CbUgurJL9a3DU3CBkKL9Pd9Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FwVnGLUh; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17DCF400D2
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:24:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9F4705FF88;
 Mon, 26 Oct 2026 21:24:24 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Mon, 26 Oct 2026 21:24:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 26 Oct 2026 21:24:24 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261026111911.756778-1-yegorslists@googlemail.com>
References: <20261026111911.756778-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <299f90fa00e5ef57bc9e833a202efdbc@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/sdparm: bump to version 1.12
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

On 26/10/2026 12:19, Yegor Yefremov wrote:
> Changes since 1.10 include new SCSI mode and VPD pages (e.g. Command
> duration limits, Zoned block device control, SCSI Feature Sets), new
> --out_mask and --examine options, and experimental NVMe support for
> the write cache enable (WCE) setting.
> 
> ChangeLog:
> http://sg.danny.cz/sg/p/sdparm.ChangeLog
> 
> The upstream site doesn't provide signatures. The tarball's sha512 was
> checked against the one used by Arch Linux.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
