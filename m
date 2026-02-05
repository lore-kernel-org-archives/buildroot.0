Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5043ECD997
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 20:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C5F740DB3;
	Thu,  5 Feb 2026 20:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjT7gJe6Lkit; Thu,  5 Feb 2026 20:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 882F240DB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770323053;
	bh=oHsA4UnX5C6SkHeXoYlFethE2d9de3LzBESMaxUobzI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lR2JHEYLdWkvowFlsQjBzYeTJVD0SH9/700S9duWL7Tc5N0PfA6aexd7TBQ+ILwk4
	 EAKXeLF4+RfURHqmNUVANtiS0IxQTabmWkhSyqpDLw2apXTta/vbbOLzHeVurORKF2
	 JKJV4a3bqNqfPFFB1W0J3GlsGJL0XGIEKGBChyXYJYzqVDSLa95jxuzkYLf2q5//mj
	 yxSRlg2DS1liPogX8MHEVrK5rxzs/PyUWR+iltFMpu5x76GRIkI5iW+tsFknR/SrIp
	 WhKr1SFwsAxMyBhk560K6qeLV3vJRTocZdG4XTMg22CXrxz4x1dw4FAy/XOmEhG5ff
	 uoLaYvgV2XsAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 882F240DB9;
	Thu,  5 Feb 2026 20:24:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2536470
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 20:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9253660B4C
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 20:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BT9u6704FOqM for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 20:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B2FD86080E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2FD86080E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2FD86080E
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 20:24:09 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 62C1E2C83319;
 Thu, 05 Feb 2026 21:24:06 +0100 (CET)
Message-ID: <836e2619-f573-489d-a886-5aca35c3b76f@bubu1.eu>
Date: Thu, 5 Feb 2026 21:24:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
References: <20260205190410.523140-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260205190410.523140-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770323046; bh=xdUrviqsJHE1a+WDIf3LMWU3xyf1eVKNmTBRm3qumcg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=csFEZoou/xLsSg7V0xcvIar8w9u/6WFkmgZv9pa+iU0WLVjVbz26hgqZePzodVI4E
 vCcpUh6p07vaYQSxW3ee3dmd+0nMWUH60nc1xwPFSRBlmw5q7TRTu1Ren0Yxm3J9kj
 GpBChjxnhcQyVprzoPeP46lQzezEumCKGtEf9n52UN7Xyjha1plcZ3TobIdr6KAM40
 oCdAfZP2zf1sb6RdwI8xVf3/CBsznZmpLeosA2YsbEXuWgbraZKpavAXBwldbcQdOU
 riJCg2VKWW11XOKcLGDfvldceY1kqIW/4E4HGn7gTJDDYjLXHpVRLn5RGvs+q2hJlD
 BGl9gTPoGMrIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=csFEZoou
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: fix patch header
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

Hi Thomas,

On 2/5/26 20:04, Thomas Perale via buildroot wrote:
> Commit [1] introduced a patch to fix CVE-2025-62291. Since [2] the
> security patches neeed to reference the vulnerability with the `CVE: `
> trailer in the patch header.

Good to know! I was confused for a bit why this didn't make it into the 
deployed nightly manual yet... but i think that's because the nightly 
manual redirects to the stable manual currently?

At least https://nightly.buildroot.org/manual.html doesn't have this 
information yet.

> 
> [1] b009935e27 package/strongswan: add patch to fix CVE-2025-62291
> [2] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   package/strongswan/0001-eap_mschapv2_failure_request_len.patch | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
> index 8442cc7816..7442c123c4 100644
> --- a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
> +++ b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
> @@ -21,7 +21,7 @@ Ubuntu), the compiler will use __memcpy_chk(), which prevents that buffer
>   overflow and causes the daemon to get aborted immediately instead.
>   
>   Fixes: f98cdf7a4765 ("adding plugin for EAP-MS-CHAPv2")
> -Fixes: CVE-2025-62291
> +CVE: CVE-2025-62291

The Fixes: line is actually from the patch as taken from upstream [1], I 
wonder if we'd want to keep that intact and put our own metadata below 
it? But that would also look a bit weird I guess. Thoughts?

[1] 
https://download.strongswan.org/security/CVE-2025-62291/strongswan-4.4.0-6.0.2_eap_mschapv2_failure_request_len.patch

>   Upstream: https://github.com/strongswan/strongswan/commit/c687ada6a6f68913651e355fd09f906893096b32
>   Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>   ---

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
