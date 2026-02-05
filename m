Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD8BECD9A6
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 21:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CF8F84284;
	Thu,  5 Feb 2026 21:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AID8sNtutRwZ; Thu,  5 Feb 2026 21:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 970EE84285
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770325543;
	bh=kCuOCZSyMuOtTYUYq1KDs2ZtMaCHz+MDPExXpAHlfLs=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ahGk4P9wzmm7shcxfCXMB5ZqrL1S5JAdv9z47oWr3H7tg39UTM3ktq3k2bUNhSE41
	 8P6vXDkTU01oA2miFroh93f3qes0unc2DEblmSckPweB/9qPeRULMKsAbCFvYYVI9J
	 H+/WociOB6dv0mR3W7W6dXNl9VqfW5tg1JIXhAQ4U9QsZJLOJBe7YZjVe6UfDK/8U9
	 0NINzaXl67VkGy1+q6wisTXsYSZfbs/u6Z736R5e0oyK1JwpE1hx10iZroXZ76qmq2
	 5iBPOIm7g086mL7OBCOOX0jrF8bl8uW/ICzaaF/oB1s3nAgyfBUT5+BO1lYbAe1EGJ
	 djedP22dmIaew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 970EE84285;
	Thu,  5 Feb 2026 21:05:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B3FD470
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F158C41261
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:05:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NU4pF4glh34 for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 21:05:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E0564411DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0564411DE
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0564411DE
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:05:40 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id AAB1D2C8330D;
 Thu, 05 Feb 2026 22:05:38 +0100 (CET)
Message-ID: <33eeab6d-29de-442c-b10f-996485b2e65b@bubu1.eu>
Date: Thu, 5 Feb 2026 22:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <aYNnDVerq-_9JZDn@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <aYNnDVerq-_9JZDn@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770325538; bh=I/il51AMty9FN0HiTnxX7hZ9qgEaEQXYrl9bbBaK1nI=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=hnVMmxkvEJ5V+BVMPLOJ9gn8tKP8fwnDhYDImVJENb4Tb2qAr7ATUFCbdIn69qe/5
 HhPV1nOgCl54H+qf11339VlHTGytWwFVzsXLi8xkrN3VQrgmolPdG+XCV+5v5y8q/J
 UurweNfTuD1be+XFgafsKMNYOEQoDfZXKvBcwGG6IhJy4xF0wtYUxVN9PnMC6Higlf
 k30E8AZr13Lvck0d3RX7kV5tYSAAAewX+zxVzIcEUNyac8KnW4+rD2C3dwnd9YTdqh
 iJAb1qmmoGifGVR+1f9fSH9+tN5Mqcd7DoPB8yJtzRUvx7iq7nPPf8fKVnK34OebWD
 HdHqC5PZcKOUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=hnVMmxkv
Subject: Re: [Buildroot] [PATCH v3 1/2] package/strongswan: update to 6.0.4
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

On 2/4/26 16:34, Waldemar Brodkorb wrote:
> See here for Changes:
> https://github.com/strongswan/strongswan/releases/tag/6.0.4
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:
>    - remove patch 0001 and CVE ignore
> v2->v3:
>   - another split of patches requested by Markus H.
> ---
Applied to master after adding the removal of the prviously added patch 
and the IGNORE_CVES line, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
