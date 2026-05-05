Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0053CD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 20:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AAFE60B4A;
	Tue,  5 May 2026 20:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5V8y9laCPhj; Tue,  5 May 2026 20:30:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 943FE60B3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778013029;
	bh=pHmdymelMsV4w3q3M4L5tF3YFt3VPBCCvluuf7GmYAU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B3CrTI3InMYF2olld30UV7iOk01+QsJZYZGFMtxw4yKCgWDCo8R/boCpJZCDHkNT/
	 /3CFXs6FEtiHXqZHb6YmdFOK9YXTqzdWJZhacUgGXAzrOZL7cmbmp9nVTsET7Q7sZN
	 zlpYli9BQ74rtzVZHWB/z6dP9/z8ckP4OfdFbNQDFQhQS/eijETmYFKcQQt+yzMVFN
	 uz+UAN8gA9nHklLww2kkfA4l37jo5sbrkEIJV1VbmlbEhs7b4YLUmwSM5Uur2k9PuX
	 coeIp8oRlxpWu9b3h5M/l+jv1kEIg/2piETrywd6CqqMAFe6KtrBNw5GHPhNKCWq/8
	 xvz9ek0NUg/9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 943FE60B3C;
	Tue,  5 May 2026 20:30:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21FA52A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 20:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 080614095E
 for <buildroot@buildroot.org>; Tue,  5 May 2026 20:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taLce-uW-h_f for <buildroot@buildroot.org>;
 Tue,  5 May 2026 20:30:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CFD740955
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CFD740955
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CFD740955
 for <buildroot@buildroot.org>; Tue,  5 May 2026 20:30:27 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id CFDB52C88D23;
 Tue, 05 May 2026 22:30:24 +0200 (CEST)
Message-ID: <2cacc081-e363-4085-a6c1-6abea5a9bc6d@bubu1.eu>
Date: Tue, 5 May 2026 22:30:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: =?UTF-8?Q?Andr=C3=A9_Zwing?= <nerv@dawncrow.de>
References: <20260505191625.1031165-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <20260505191625.1031165-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1778013025; bh=JERyilEKPnClAnF3bLuKWdF17OvDJdT905nnu6Bfyfw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ofkAeXn3R5h4504HCOlQ8YqG9xozQloA8FCBNVw87Wprpr/eMuZI1h3oJ6/zFLOzq
 n46x8iMJWp2XxaEbwOXJDXGpO48KF87QAt/8IZtBEov24Xe6QaNOuFmNUBOF8OxqS7
 BkXYukkj4vFVIg0jjzqEkW/UkIyHdP7UvRuFKZdN6xraobhtmynZz79+PjKCcZF4Id
 K30pewBnwBx4jIJiGUzc3RCyZw/3PcE0pqu/7a43+M71VLrmD+VNwHeV6JR94QOLmL
 qt4oDclAIc7gRLj3NIBOLGeeiVuR54AoHJE4+WOzxNHAnINHCnrgw+l2RfAeZHrO8V
 MDHGIf/xdtB6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=ofkAeXn3
Subject: Re: [Buildroot] [PATCH] package/p7zip: bump to version v17.06
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

On 5/5/26 21:16, Giulio Benetti wrote:
> What's Changed:
>    - Fix CVE-2021-3520 affected components Lz4 1.9.3 in p7zip17 (#239)
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
Hi Giulio,
this should have been marked as a security bump. Applied to master with 
that changed, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
