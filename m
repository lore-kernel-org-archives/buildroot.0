Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D371CD3423
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 08:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5727D61352;
	Mon,  4 May 2026 08:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QRCaVCOA6tps; Mon,  4 May 2026 08:31:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB5A1612BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777883479;
	bh=yJ87Xz6ZaPLfZ1ugDYU114vyX5Kak3TuBkyhRAV1eAQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=oLOdPhB+IJG3TnBXG/dcDDToC9C6VDOH30TYDwrhJMBZf+IJTWnQUj9/VArp9kz+k
	 9Gs9RtsKfekpb4oqWjtGqk4N6RSL03W9r7DSf5G0CCKaL3cUoCM7Mo54Aj6N7kpfbk
	 BUYiNTyoD/WfxpF5UKuLuB7vlEDQ3PL1doPTuO2+szgz6tLrrgtEpRlScIHXuGCHE/
	 kt765zOJGKPctR3MDv4q8KX7N+qiFElbdGBS67/hqCxRlD9p46H4ZwRXXxfp+hn+tB
	 TdKo1SigU2zzDZNsmLS4oXVwjnuPVU6fSCGEPAs2cC4pDIiLWhxZ+ep1G67UB87e8n
	 6Cztn7JncRzzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB5A1612BA;
	Mon,  4 May 2026 08:31:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3631A25D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 08:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B51584476
 for <buildroot@buildroot.org>; Mon,  4 May 2026 08:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzuZVLLrFNQ3 for <buildroot@buildroot.org>;
 Mon,  4 May 2026 08:31:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A4C783EBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A4C783EBF
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A4C783EBF
 for <buildroot@buildroot.org>; Mon,  4 May 2026 08:31:16 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C56C72C833E6;
 Mon, 04 May 2026 10:31:13 +0200 (CEST)
Message-ID: <9906c459-eb22-47f9-a690-6c0ab4b32b24@bubu1.eu>
Date: Mon, 4 May 2026 10:31:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
References: <20260429170808.1144652-1-chakrabortyshubham66@gmail.com>
 <20260430054033.8599-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
In-Reply-To: <20260430054033.8599-1-chakrabortyshubham66@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777883473; bh=ER3PIbB/ApaZQ9bzcfABovnEF+cnjgKcIgA2GCYj05M=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=aUnt8zdyI0fW0TNsxOsDUq2GyYriFwr6dpFuPJiHj5SuqZFdpuek/D5r9jINV4MoC
 wowQgkeqzjUt3HcTInYRU2gkHicqZtCjwlfEcimGt1Pu9M6SFUvGwtwFQD5tNmVGVR
 Zp2TD2mMJmXoGengB9SHS8IG+meYU2g9aYKVDOZ+eKOfbXgOcleJ5/ub9nForMWduk
 qmqdCvIMQAz2lMcJSFLgzOiL6HCBA9M/Tt5UesCFlH7QX06b0W02DawqvEJHh4W3pg
 eSEReHSez57p4mgn+Ny7OnZT3cANRe5oSWMmnyybVlK5ql/6xskI1N2i1QB9INEDyB
 g+BXU1dkeB9BQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=aUnt8zdy
Subject: Re: [Buildroot] [PATCH v2] package/nginx: security bump to version
 1.28.3
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

Hi Shubham,

On 4/30/26 07:40, Shubham Chakraborty wrote:
> Fixes the following security issues:
> - CVE-2026-27654: Buffer overflow in ngx_http_dav_module when using the
>    alias directive with WebDAV COPY or MOVE requests.
> - CVE-2026-27784 & CVE-2026-32647: Buffer overflows in ngx_http_mp4_module
>    when processing specially crafted MP4 files.
> - CVE-2026-27651: NULL pointer dereference in the mail proxy module
>    during CRAM-MD5 or APOP authentication retries.
> - CVE-2026-28753: DNS PTR record manipulation in auth_http or SMTP proxy.
> - CVE-2026-28755: OCSP certificate check bypass in the stream module.
> 
> For a full list of changes, see:
> https://nginx.org/en/CHANGES-1.28
> 
> ---
> v1 -> v2:
>    - Bump to 1.28.3 (stable) instead of 1.29.7 (mainline) as requested
>      by Marcus Hoffmann.
>    - Highlight security fixes in the commit message.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
Your sign-off needs to be above the first --- line which separates the 
commit message from additional patch commentary.

I moved it up while applying.

Marcus

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
