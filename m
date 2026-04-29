Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FD9FF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 12:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14EBA6157E;
	Wed, 29 Apr 2026 12:48:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQDTHyV0KB6H; Wed, 29 Apr 2026 12:48:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC14615E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777466889;
	bh=NVFs2LrZmv95VZ/lI/UJwPBb2U/5sg3z0hGdTy1BAgo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MD1Sy8DKYucGrfGF1YTI+AcNEJpJRrhV+igjT75aU8unQlapAtkE8ajnezmO4LvO6
	 Lk68p5fzqA9KscBquaMWYF0y2Cn+Gsf6jtozxhXlRWSpNfPfS1uQeB0i3EBcu9CUHP
	 Yx0UCbjCrX7ILC1kwulxxCma8QInc7kJjPrkDs2fl/77aX5+1nT5BBjLpMRAJ42dyo
	 PAJD04/7xsh8k3dWOvznEB1KM355kYhToPe2jCLzZOt2zqO5nb+bXQbof1oYmYDuQ+
	 iQrL38wxftbFp0sxK1Opd6hqFqsFaXgfqmmyotOdHUH6Na6PdKH0TYyHKeFsJHgIWe
	 C4Ey4aV/p7cvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FC14615E0;
	Wed, 29 Apr 2026 12:48:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7996D23D
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 12:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A859615E0
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 12:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uuu5YLHA7UlO for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 12:48:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A1C96157E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A1C96157E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A1C96157E
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 12:48:06 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 896A12C80C2A;
 Wed, 29 Apr 2026 14:48:03 +0200 (CEST)
Message-ID: <6da5581e-2794-45d5-8879-3e399354e1a8@bubu1.eu>
Date: Wed, 29 Apr 2026 14:48:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20260129161012.1610562-1-raphael.pavlidis@gmail.com>
 <20260129161012.1610562-2-raphael.pavlidis@gmail.com>
Content-Language: en-US
In-Reply-To: <20260129161012.1610562-2-raphael.pavlidis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777466883; bh=ES3H2Wxdpk8CMwP2QvjuxkQHkj61CO/eD/+27EA6XDo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=DzbtUED+S8RIG3H9uBELvqvtpBuWA44tZuyUmeL4x8U2bop4Pi+VrYFUx6BlDxFCB
 K+WNxhb2pmx25zSQF1t1SDF5NQqC47zR2ju5xqDQjz/LaOd6S28aNL0crwoJiRqOai
 MUDVhhOsz4ZXmFMyDt/fSpgWZIzUlQnEoGy2FfYTIbwNulcnEGjRvcLVB6swrot5lv
 MHy8KoGr7RDV+Hdv1uKUlkfKCya0x5jFkLRfuJgMnuOAqqQlonPdnalMlVYNtXnR1C
 YCZ1y69AlvYYlIy0ryGhhYsy67cDPXRfYCM3GeroVbYi21k+YSDgMI0ZFxWmUB+CvW
 QRxbtF/whCkRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=DzbtUED+
Subject: Re: [Buildroot] [PATCH v1 2/3] package/linux-pam: security bump to
 version 1.7.2
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

Hi Raphael,

On 1/29/26 17:10, Raphael Pavlidis wrote:
> The build system was changed from autotools to meson.
> 
> Changelog:
> https://github.com/linux-pam/linux-pam/releases/tag/v1.7.0
> https://github.com/linux-pam/linux-pam/releases/tag/v1.7.1
> https://github.com/linux-pam/linux-pam/releases/tag/v1.7.2
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---
Applied to master after adding a note to the vulnerability fixed in this 
bump 
(https://github.com/linux-pam/linux-pam/security/advisories/GHSA-f9p8-gjr4-j9gx 
/ CVE-2025-6020).

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
