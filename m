Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C029AC02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 19:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B4D0811ED;
	Mon, 20 Jan 2025 19:50:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5rYXliGW4ZQ; Mon, 20 Jan 2025 19:50:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A794811FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A794811FA;
	Mon, 20 Jan 2025 19:50:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4644A69
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11A8E40694
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mNmuymt5V5Gr for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 19:49:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 405954068B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 405954068B
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 405954068B
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 19:49:58 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 521C92C80189;
 Mon, 20 Jan 2025 20:49:56 +0100 (CET)
Message-ID: <f525a811-88e0-4ead-ab29-96d004f58921@bubu1.eu>
Date: Mon, 20 Jan 2025 20:49:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
References: <20250114113212.1791033-1-fiona.klute@gmx.de>
 <20250114113212.1791033-2-fiona.klute@gmx.de>
 <456ee4aa-9ca2-41f5-b535-eef3e9350b5c@bubu1.eu>
 <8e55a83c-6fcb-43a8-9eb9-1fee6df8a366@gmx.de>
Content-Language: en-US
In-Reply-To: <8e55a83c-6fcb-43a8-9eb9-1fee6df8a366@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1737402596; bh=od1OF0qQoi2YczIGFcviI3ZeV2m2l2pzxAgmW0snhHA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=XEYqyfN8E69dT7XVV8EhX3CZCQiZYWfdDtOi07G9p1NE6+vsSYkHrpmtEN7Yt8eDA
 VTsfUzhMK754Iql+Og8DzeeBu/aalsiWduq14hc8u1s/lOi1XRVNjZIYuA6N5PwNl+
 jEw50IiLRlrBU4wDI04UqKTNJvEBseDffx8raAEFCDyr5/Mbeu1VS80F7fxMLwEFOj
 dSFWjqe5+ZQETx+oQey+W2l17oOAyqgkMroKP7vDEkjMwFGJ8jFNj+p9R9J3fZ5XJl
 RiFQLGbj8Ily6S8QrQntzC1ioEvaib1Azf7rv7I4WzcCJdS4GfGjPSm/l0QknkgN3b
 bSuca/KsQAkyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=XEYqyfN8
Subject: Re: [Buildroot] [PATCH v8 1/6] package/json-glib: bump to version
 1.10.6
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

Hi Fiona,

On 20.01.25 20:36, Fiona Klute wrote:
> Hi Marcus!
> 
[...]
> 
> You're right, and the content isn't the same behind the symlink either
> (LGPL-2.1 for both, but different formatting). I'm confused why the
> build system didn't give me an error, my config has
> BR2_DOWNLOAD_FORCE_CHECK_HASHES=y set.

This is afaik only checked when you run `make legal-info`.

Marcus

> 
> Anyway, I'm going to fix that, double-check the other packages, and send
> an updated series.
> 
> And thank you for testing! :-)
> 
> Best regards,
> Fiona
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
