Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A55F99C9A
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 22:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46D6C82254;
	Sat, 18 Apr 2026 22:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHqc96oUIWYg; Sat, 18 Apr 2026 22:04:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED26D82242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776549855;
	bh=lQQH0r4ZL36jRWkM2KTfguQ3rciLGszIw42zGs9Mc98=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ZZ6sxyJcM1gxTrFDsAbCvpvf8sYDzGxatnxuIonJdC293x6gISyxljJzyOKRsWh4g
	 RrhEY23wJbzYNjIWg8ZAOOKq1JMxXdNz6lsZxPHHTU6tD5jtSdtPJXA9jylvorCXw4
	 4OjD+yDehaHbAFlUDfgtEl12NlkN3PgJO1hreISKMAqxjvCfnI+gbkWZyqWleGiBL2
	 jJmUkR/DxQIJT3fFoEAHWjNjyXYH8q2aUAcZ+sk08ATmgbyKaE/+WAtO1HVHLkYv2/
	 NLHbz4S6eDrl5/DYijGA9bonDfibRzW42cylh87w0n/qiA1dhkSu3NjKO+tcwLV96/
	 SLoQ1d/+8z4SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED26D82242;
	Sat, 18 Apr 2026 22:04:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62E1935B
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 22:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47B8082242
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 22:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id el6HLrwfkprZ for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 22:04:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5D8A482241
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D8A482241
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D8A482241
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 22:04:12 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id CD5432C88D19;
 Sun, 19 Apr 2026 00:04:09 +0200 (CEST)
Message-ID: <6b7e32f4-81be-499e-8ab3-55b0e12bf9c3@bubu1.eu>
Date: Sun, 19 Apr 2026 00:04:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20260418144531.706692-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260418144531.706692-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776549849; bh=4OD3fHgg5SiPizf5+/Lr7HdKrzCpopcvGX1arA7bvkc=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=h2ag6C6q/SK45FQf5J73/ldF/gnisUoJwRhXQHrQ34O5L8eTgWQ4NfoLQKYqbpar3
 RSzOGkEJuu1CCRLt/Al9j9D6Q6j3z3OdzLXl2vCGzqzbo78FsBMzBYYnzHBu9/vEaR
 /Jc3ubynPuwY35h0R5ynLTXa5Qzl+UuaT0tYrAPXSimtkd570YmrvhuwBgACSa3JDB
 7q7UWcLy9cbkQyJLVfJlXfQ2HYePr9H2J8BiFm0OZRcyyiLDSocKqHPLiFkH7wUJTR
 WrCYGY+c3FIIpau5NeEOM03LG7Vse8UW+LFSPtXYXTPgPiNyqD1ftdC7SlDkkWKBhN
 AMkkv9v8+rHcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=h2ag6C6q
Subject: Re: [Buildroot] [PATCH 1/1] package/libjxl: security bump to
 version 0.11.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On 4/18/26 16:45, Julien Olivain via buildroot wrote:
> For release notes since v0.11.1, see:
> https://github.com/libjxl/libjxl/releases/tag/v0.11.2
> 
> Fixes:
> https://www.cve.org/cverecord?id=CVE-2025-12474
> https://www.cve.org/cverecord?id=CVE-2026-1837
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---

Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
