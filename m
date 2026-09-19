Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34C5C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 19:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21B2F40CD2;
	Sat, 19 Sep 2026 19:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkDEn9FFRVnC; Sat, 19 Sep 2026 19:28:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 27D8140800
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789846095;
	b=fMTcQRZk4neIF4iGwttkaYtWpgAOOwhl06WbtnfwVmMGbXttgamZTNh4h74hAFQfhE6s
	 gPgTikeLco9LUgLBFwH4gXL1UIz442H9s+sya/fFDn8Q6aSoa/Qto3VZHkLGeAegThZ8V
	 3Z2f1nOmdnLOJ7QwRWjtJnKI9b4vkjfNh9ZBQmog2FAfkZSQfASdJjifds8PvCAAlu9NT
	 iJ2RuBL6Uer/AlyMYRJwMCBANKyfmQoNf7Tza+WaJjaVHcKHKdk//Y/xbl7dyA+5UAAyP
	 32BAwNVf/vnw6YveE0UPx4ALEAWdVQ6Bw+U7pnYV1nuTZK16h9tGsxHxMnkvgWnVgsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789846095;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=gcBKLWQbUomC+D72Aj3WizBKoRpMp4m5TikuuZ7geyk=;
	b=Wt8DFrvhc8TWVRErYLSnXb1hfd3am7thk/gKRIuUR+YqkEOTKw1wR+dHDjsrfxjASIQ8
	 K9+vUyVII8DOPYeMmrrEEvx6kiAFvlw84wu0E9LRufD9wxJxnSys0cbx7wD4PFCT7LFDx
	 haWzv5GIiErJ0j/w7YuM6d+s72vjf/mdAXbykLQ6VPZlvFbad75oeqz4XpDzoQwlnQT8v
	 QpMy4LfjNvCW2m5xUHUxNcVMJjla5zJ/xGgCWAGn26ooHVjs7Q80eckJ5YAziNt2uIEgd
	 9uQ5nJXNr/mt/PvrUJ43ICefc/rX5hCc/Klx2L6csG/0Molm2crXeqa8XkE3HvCbe7A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789846095;
	bh=gcBKLWQbUomC+D72Aj3WizBKoRpMp4m5TikuuZ7geyk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JMVGCA9ifzUIYSMkzn4zdIF+u+YWMXMKAlGtRwNCGP84Elu5s+YOC8j9O6rj+k9mS
	 Pv4+2EEDmin9fsbOEV5NaVlX74H1fkjBwIqG0mPOyKMaMi8sGYwXyfq4IzAZztMjBi
	 o3Eghfe68dYeZCnmCalXMfLDSQCv8w5usO4JiYURSt3VFgVI69RZPuWG0SRb+ScELg
	 rDPZLF6rxOq3soPDwcN/2NsZo+m83DI129ckLtrfZ+sHzXX9boVCVglwCl8uADFXF3
	 4Ds78uN/ddUpKDtD9p8SrTSDSYHpyMdp/PXE0OCtlK+4yNFgp/gjI+RixyvP5vbZof
	 yrfS1zndkxOPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27D8140800;
	Sat, 19 Sep 2026 19:28:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8BEA37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 19:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C7C540179
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 19:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xq9Nddp4ZOsB for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 19:28:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D97F94017C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789846092;
 b=iMNsYie11MhOIsaDDttd018+mY+E7vK1N1lc6AAIBPbzwCSVMXAfCnHt0ZuwylF2mTS/
 sR2NtRL7QOUPV4MvkUxnn8eNm2cEauKq2qw3q3WCkLZJwAsT8pktLDDAKw+cg05wQ40Yb
 s8PK9IkfjO3CZkWHRcM6mh+mE9zVrn8A4novRHyadDnM950sXhzijCMZE1Z/LrJ3Y6ogH
 SWAqqfm3bOhBx7Uby2O18PpKNvGaeTYTlI2qG+xKCpJZM8Q8m4UuZklN6wUD9IrlW2a/k
 ROLSV305OJl29ql9GKLJgvp2ZyNjNZfd7i4JoE54XlGYTmNDjfwEbhSTJxow6P8Q7IA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789846092;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=9x8sD50+4A8o+T2IePciuoBtKVJGYO8fuK2VkOMmsTA=;
 b=m5KViqloFLZLD8Gb8FvPFFGdBPVmyUkk+WwMX1R8nqSsT5sOwOEVrUQzZCfQH1TjUCEp
 ucpEMdx3rcfoWGosmblS8wdcsfw8Y5C9ad9E3VY6uK5r5SGfkyLg/ONTOUNkcfDvAmv9s
 RzioaTJI+EcjXEMV6Fu4x7IA6PGgoYuOvIJciSXInlKoFU+McRjFshoSepi9IDsWqFbtK
 R6Mgv8/YYYbkTqpoAwVKgYPUMEZHi3RIwv6xgC/3XtX0oeZzetDlEAHdLqkU9hDDdbOKr
 O36/37Qd3aqkigRyyqM1gbjhrNTTlaDbdd/Aiz2n63F2UxhEvYLzFdEOQ1BLZho7k3Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CQvCAaa5; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D97F94017C
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 19:28:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E9288780371;
 Sat, 19 Sep 2026 21:28:06 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Sep 2026 21:28:06 +0200
MIME-Version: 1.0
Date: Sat, 19 Sep 2026 21:28:06 +0200
To: Antoine Gennart <antoine.gennart@quimesis.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260917093849.2095768-1-antoine.gennart@quimesis.be>
References: <20260917093849.2095768-1-antoine.gennart@quimesis.be>
User-Agent: Webmail Free/1.6.19
Message-ID: <591b5ea9972d75779b018397faa957c1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/nxp-mwifiex: bump version to
 lf-6.18.20_2.0.0
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

Hi Antoine,

On 17/09/2026 11:38, Antoine Gennart wrote:
> From: agennart <antoine.gennart@quimesis.be>
> 
> The previous version fails to build with Linux 6.13 and newer because
> mlinux/moal_main.h includes the removed net/lib80211.h header.
> 
> The header was removed by Linux commit 02f220b52670 ("wifi:
> ipw2x00/lib80211: move remaining lib80211 into libipw").
> 
> The new NXP release skips this obsolete header for kernels newer
> than 6.12.12 and includes the corresponding Linux 6.13 cfg80211 API
> compatibility fixes.
> 
> Signed-off-by: Antoine Gennart <antoine.gennart@quimesis.be>

I applied this series after fixing few things:
- I fixed _VERSION to use a tag, rather than a branch
   (upstream is a bit confusing on that aspect)
- I also fixed a license hash.

See:
https://gitlab.com/buildroot.org/buildroot/-/commit/0e27b1d8a47c1c9b36e7c5761299495f9a7e8c19
https://gitlab.com/buildroot.org/buildroot/-/commit/c23815ad18883fd47d0065a55e2048dce51ffd03

I missed the past reviews because you did not added the versions
on your multiple submissions, neither included the changes between
those. Please read:
https://nightly.buildroot.org/manual.html#submitting-patches

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
