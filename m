Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39195606A33E
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=c5alp9oI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1828B816FA;
	Fri, 20 Nov 2026 16:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uPB7VqLAGvC; Fri, 20 Nov 2026 16:05:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 20931816F5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795190724;
	b=s52UbAdECASKm/s+KAlV20zV4SPwrnYsitOH2OKQj3Enzme7z6NznckutmWi73fJq/5t
	 uPDcCynlo0P5FRTUcng88fV90UNQ5q7YApQB0YdP7Pgy5xnSmlUzHdig1GuaeCcsMLryv
	 NY0nKhjBhvHG0q3vC9hOjatT0gjK0oTvTuPHcW9P+FfzvAnXIKsvxwk98FUfffd+Uh/XB
	 78N3Z+1Hj4Mu+LRkFrqOSOSJyEnwXfcYBtkzKqt49iHXloB6Q8eU/owcAIB8Sg26ue+ik
	 1+1YZdWywlDpaGYavk6yopci31/FWGatubpPU6XVP/FBUyYTaah1CZKxK1+H3K/bRtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795190724;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=9wea9rkqd/QoXssb8B8TWUXlWQoqrKAoVuSK2Ft2I60=;
	b=Os2C32L+SgsDTsPScn4QNXDbZLN+ojoS4HZnMn73+YhSF32Xg8ScFvrleitF4zIS7FEC
	 9jH8rfb7hNOYCOvQ41WyGGuO8Q185berLmFoz0htKdCy4yYiDsJXS0inELu+b+fLxcpx3
	 9S36Eur0et2iPWimgubl0DwonvtqtgRuSIUNuHQaDKSXZKNNySVbuL7eaUcio/UqL0lOO
	 KvoNx1D79B6jXWc+H0Ig7bnvyLIO5X3iHDpIcRztK/NJ7j4p7+wYriGaiipLCn1wdCyS6
	 vSpyjkLAuOu+9bg5D0WYfMnjhejFTaMybNc4isGzKFpOLH0KeuZXbl4UzuDwYAOC98w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795190724;
	bh=9wea9rkqd/QoXssb8B8TWUXlWQoqrKAoVuSK2Ft2I60=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c5alp9oIRYqWHynS7u9Du6lVd9p1d4N3fMAHQSp2/f8QV/VHuKj6E40gq5ARzK4YZ
	 KJdKiKYm0FFwChFLKroAOo5T7o/9kSvRnTodIxG5lA17IY1+ZsHIO2NRzliS9V4fqN
	 zvgIXzFkZlMR1vMlaUL3S7pPb/mpH88V0Sl35hfdr3J9cHO4ilfFpCc9CYovAUL4Pw
	 h9+npfFzKYfk/58V6pCIvXN9ComaGvufVu/+D376a/gbSfv34E5foEUxuIWiX0tXs1
	 QT6ECD7yO1Vc2jX1tU5vLMjCEtVpnIepmRzfkVS0cnvr2XaIMPccjlmkxbCGSSNzos
	 XTkIQnULDzjEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20931816F5;
	Fri, 20 Nov 2026 16:05:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AFB515D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 16:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0138740098
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 16:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulIln1l234YI for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 16:05:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B515840050
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B515840050
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 16:05:19 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A0E7F2C84ECE;
 Fri, 20 Nov 2026 17:05:17 +0100 (CET)
Message-ID: <4857b932-c948-4644-9d0b-1cb0eb169423@bubu1.eu>
Date: Fri, 20 Nov 2026 17:05:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Peter Seiderer <ps.report@gmx.net>
References: <20261120095044.535382-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20261120095044.535382-1-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH v2 1/1] support/testing: test_usbip: fix
 with eudev 3.2.15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/20/26 10:50, Fiona Klute wrote:
> Since the update to eudev 3.2.15 the QEMU USB keyboard and mouse both
> show up as "QEMU Tablet" in lsusb output due to hwdb changes [1],
> causing the test to fail because it expects to find exactly one
> keyboard by name initially.
> 
> Make the test identify the device by its ID (vendor:product) instead
> so hwdb changed make no difference. The unused USB mouse shares the
> same ID, remove it so there is only one device with that ID.
> 
> [1] https://github.com/eudev-project/eudev/commit/27542cfe3c5f0f9e71d9e3be1f9430d00d7c8551
> 
> Fixes: f6c2c6a086ae1a5857f99514324ebf4038dab31a ("package/eudev: bump version to 3.2.15")
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
I added a brief explanation of why the device name changed to Tablet in 
the commit message.

With that applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
