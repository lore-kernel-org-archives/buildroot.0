Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1C9F44871
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 13:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F96F410E8;
	Fri, 10 Apr 2026 13:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXn9Sqm87SMT; Fri, 10 Apr 2026 13:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5571D40713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775829282;
	bh=W1LSnC/AM+qhkDvwekI/0auqs4YIKW3mNStoH/6fGEY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=irnqhkK8DaHYEIK7z5HT3dxU5G5SBZDs0L2A2ApI1OvASFub26Allu7Wuqowo3ddl
	 z1/xLxee68c8Yh0tvYvahDIbpcU3UlyD4b3eTs4e6Jx6i5xXmKrzfLQDEMeb3mC7Vi
	 KHeQj19cfj9oVPzzAAzmot7DoV0c0kB5vDQzcbIrJsPXDrF+noILNuTuQc6QXF7Rg1
	 ffpI0ouMBAGPdt4+dTLeBqAZJJOtFiTYAT3oFQTl1DZYoJI0uBE4TMAIVLZ0ZwewT6
	 tYMrdc21K4loCeQCtC3s2E0Re3U2Z3Ei3eUxg+ZdlIw3Nt+evcecrYB2Md5/OBkyei
	 AqGI3HFlA7fXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5571D40713;
	Fri, 10 Apr 2026 13:54:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B08C11F6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 13:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AD4D82FA9
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 13:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4--YUuq7uuzy for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 13:54:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A066182F4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A066182F4F
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A066182F4F
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 13:54:39 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C3B522C84735;
 Fri, 10 Apr 2026 15:54:36 +0200 (CEST)
Message-ID: <e4ee930e-02d7-4008-9c97-3c50319c561b@bubu1.eu>
Date: Fri, 10 Apr 2026 15:54:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260403085152.511498-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
In-Reply-To: <20260403085152.511498-1-chakrabortyshubham66@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1775829277; bh=4XHopJnsutTOjkkRfr6EWxo4qtYQktcKVr5VutYqZMA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=S9sFg4XGkGl9lU+KTWbCH5PB8wOtO3YLCCmf/7JKcRz7O3yFY6jmO2jxkmISXzFkd
 LDgfvFEgEYJFfcRnTdYJlROUJyiCJJhvK9C7w470Rjz9bbSV86KduilYQfcK4P0lAf
 M/R+zAVKlTS1DKR270pM5l9pywj/spz3HDR3esS93NkiTgNJreS8kxeG2KNZWZCSX5
 LjF0MdAkLKKD6A5Qy02Q0DIDd9pKeKp22K/mKue9xpBG1LoCr95ram3rAW4ZGme/m8
 SN7JKKvGwt0EkJhACxkKsNBCs/pNvsyqd091mldrTVLxzZWxe7IIMy3YSUy3VSM6st
 hDAbxWqmzr8QA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=S9sFg4XG
Subject: Re: [Buildroot] [PATCH] package/python3: fix build in static-only
 configurations
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

On 4/3/26 10:51, Shubham Chakraborty wrote:
> When BR2_STATIC_LIBS=y is enabled, python3 does not produce shared
> libraries (.so files). The target installation hook
> PYTHON3_ENSURE_LIBPYTHON_STRIPPED fails because it tries to chmod
> non-existent .so files.

The target python3 package actually requres dynamic libraries to be 
enabled since: 
https://gitlab.com/buildroot.org/buildroot/-/commit/54915af7c75851318385affd037c7718e10f2665

It's not clear from that commit what was broken, but apparently the 
build was broken for static only configurations.

If this is no longer the case, or if this was the only problem, these 
changes also need to be undone.

Ideally we'd also add a runtime test for a static-only python build.

> 
> Wrap the chmod command in a conditional check to ensure it only runs if
> the shared libraries are actually present.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---

[...]

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
