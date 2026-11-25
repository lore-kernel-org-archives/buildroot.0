Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810B3606A327
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WM0gZvKK
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5833C6088B;
	Wed, 25 Nov 2026 13:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id obbNobMrCC6y; Wed, 25 Nov 2026 13:30:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 77F0E606F0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795613403;
	b=mi1s2r78/6om5amzrqtCUvV0uPbtwOBQFiV1Z1beMrVCbHwFRCv7ZANVN2Fl4iOTNH2w
	 RSbldvuX69yQifUuwsfMusoe1wfC0+v6/9r9ZM65UQznxyzQtu9SQLtPO/PVatKhx6lhN
	 39+IJoi9UVs1t5MNQsllj8JBCaPwJjrfFjx8tzqxwkFiYRAqcqYktn6FW7vXxY6MEzrWo
	 QgJMtWaI6B8VGkVeCquNki3kYfhupZoLH1Xq+oEETY6zalvMScS/8QMj+8TU9OvI3kzsC
	 c8DfGTRJaQXZtSqdFgu9fBWIdYMAuoygdq4JgWEBx90R57XhhX3/Cj44V33UnIjg+cA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795613403;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u8AKU/jZKYJ4KQnpCsih+/+Jt1Gw7skwh/+naN63Y9Y=;
	b=mHF2BETbpURPE+C8IQts7dX63XZJSCATXediE8daALvskwUos56pZMNlvOTHkbU9NHil
	 iG/96BDwb9D+fok7ky7OgHDyQ6Qz70RpPNGvp+crkRS3AUG4DdylYovGJmJQ7kyedDh3Q
	 LkCZp4V//BMdk08385FNYI2Z1K6i8cUwq21sUnPUYj72VsFX+wd/TS+yNql9nhiVl8FXg
	 vY+rEDfRcTsLMVLdREN2MhuJnXqj2RTDgwSHnmQ0P/RIjZDBEDW2jnDsjLO7RUgx3Kxtw
	 5vHOng46ZEPS/nXdi+mmGQPrJdvDySMIZbJvQE4NOKO/0HC0+MDZMmDaF8tTzttZf5g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795613403;
	bh=u8AKU/jZKYJ4KQnpCsih+/+Jt1Gw7skwh/+naN63Y9Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WM0gZvKKfJaFCiXhoS1zMLScM96a0cfSqODr9jZdl98obxGRc0pgk1Jir/RFGlP+5
	 lNM38KFzwbQYwt9Nury2jWcEAfN1QMOB2uhhzHL6vqwlb5v7h9bsOARPKwdNIh9CkD
	 qmSSgEL3oC+NvQySMDAaunODH9gM9Gup3k651E8tu1GpUXUeV8nkM0HWG7cWGAvUX0
	 2AS7z0ISyPxxYFGEbYcxhHOPovCvdalcSejD1MrifPxdt/MW7lNu77wwaeRZPcEZBw
	 hAdfdopCJm5GY96kCfezb8/bTipj1RM6ReAHxJlR8qapPGu4syrEwWE8Zki96toFP9
	 sKTr+YasZNFrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77F0E606F0;
	Wed, 25 Nov 2026 13:30:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B03A22B
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 13:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C44880C8B
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 13:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbqmwL3t2WXw for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 13:30:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A1E1580C6A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1E1580C6A
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 13:30:00 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 39CC02C85245;
 Wed, 25 Nov 2026 14:29:58 +0100 (CET)
Message-ID: <3d6f1b69-e549-4121-8868-2880db5e5049@bubu1.eu>
Date: Wed, 25 Nov 2026 14:29:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
References: <20261125132502.1057833-1-buildroot@bubu1.eu>
Content-Language: en-US
In-Reply-To: <20261125132502.1057833-1-buildroot@bubu1.eu>
Subject: Re: [Buildroot] [2026.08.x] package/python-setuptools: add patch to
 fix CVE-2026-59890
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
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/25/26 14:25, Marcus Hoffmann via buildroot wrote:
> Backport the upstream fix for CVE-2026-59890 (GHSA-h35f-9h28-mq5c)[1], a
> MANIFEST.in exclusion bypass in sdist via Unicode normalization
> collision (NFC/NFD).
> 

The CVE and this fix apply to 2025.02.x as well, so it can/should also 
be applied there when this is applied.

[...]
> Fixes: CVE-2026-59890
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---[...]

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
