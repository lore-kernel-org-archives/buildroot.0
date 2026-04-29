Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA37DFF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 13:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D1284225E;
	Wed, 29 Apr 2026 13:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_r7x0pypSqV; Wed, 29 Apr 2026 13:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EC9542262
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777467660;
	bh=h18GQxofZdVZS2hOxGkrlybYDxfvMI7/fYwefhOlN58=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mX9ttie4H+Yl7LMdsv8iSJm+In/Kd6/aPa71IEh5vkDf9MOAjCiCRJ605MBAOkJXv
	 xtds2wzaPQxodY8g0czbTvWBnRTRHIiroK1b4fEu0nkT2ubg5jA+LjY6muDUadSK4Y
	 ubtbsEbufYFRYHuKdVuh4a8NslF9bd1Fwov3BtOcinCpcz+m36wN6x5kgX/OJhVVTp
	 gj43qN7xD3i/tr1QZVt+bdLwIH5qDuZrK5fFC2N66bAHppnYSNTjv0rLKbj6s3hzdj
	 R8K8niIzMfgdi/X1lDkLcQ1d7U7T1MR/XECEm/eZtFI/CXPmULe6rnWXeUyd01kdMP
	 3a9HDnH3G1etQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EC9542262;
	Wed, 29 Apr 2026 13:01:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AD881B8
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 13:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B91C615ED
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 13:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6c8joixnIMHE for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 13:00:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E7AEE61593
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7AEE61593
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7AEE61593
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 13:00:55 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C20792C80C2A;
 Wed, 29 Apr 2026 15:00:53 +0200 (CEST)
Message-ID: <aa35a68e-ebd1-4c3d-be45-f84fbf42f1f2@bubu1.eu>
Date: Wed, 29 Apr 2026 15:00:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20260129161012.1610562-1-raphael.pavlidis@gmail.com>
 <20260129161012.1610562-3-raphael.pavlidis@gmail.com>
Content-Language: en-US
In-Reply-To: <20260129161012.1610562-3-raphael.pavlidis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777467653; bh=Lt5ZPoQXczMRC3anYUrNCZNOHi8btVelE6a5pQuN1Cs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Yi5tQHzDIZdOOQRbp9wsOCbp87TnX4r3rM5APdYv6RLtloXS6usK39wwDn3zVeMIn
 M8xxFrTHYO0asqAyg1gQA2TnEH8v3qkXNVZgHPBtopJfvKWR9OF2ymcTsdtYTSPOsq
 uw4z7B2qcAILn3GkR6O1iQMbJtK2HjEY5ECLonR6irm9tcJYK4zAW3g2MAaVXZQjOA
 XqNUB95EaRBm8kkqXxSUSZO+SyXi4AtrAFWkpQG1xHInhcTUCkz+u3NcgYouOZuzel
 S9KKurqfbVNRI0aQDzx/pqsd7iefe6EahYlew9bW724KTeTcBd4n9MC2fKT3v9y6fO
 Mc/AAR14KxR4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Yi5tQHzD
Subject: Re: [Buildroot] [PATCH v1 3/3] package/linux-pam: install files
 into /usr/lib/pam.d
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
> The /etc directory is reserved for host-specific, system-wide
> configuration maintained by the local administrator. Buildroot packages
> should avoid placing files in /etc and instead install them under /usr
> whenever possible.
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---

Applied to master, thanks.

It would be really good to have a runtime test[1] for pam, as otherwise 
these kind of changes always seem kind of risky to apply. Do you think 
you could maybe contribute one?

Best,
Marcus

[1] 
https://nightly.buildroot.org/manual.html#_using_the_runtime_tests_framework
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
