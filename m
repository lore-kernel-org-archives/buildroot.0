Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C89CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE3B26150F;
	Fri, 29 May 2026 16:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgCw9NOsTO4U; Fri, 29 May 2026 16:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEF9D614FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780071526;
	bh=XGE4iZ18utBWVsp928CRvMY7hK8e+G7R1Ka3ohsgUz0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f1Sx/XAETB5F3KnjCFuoZO0bqqgfVZlX22+7usmp1E6z1tpbV9HT24hVcSRpFrIwy
	 RIK/q66JILDxacOUHEbu8Fp6HEB9krOFtbcivFyNrLJM6c8rEL/8RDDCHIYGCI/EI2
	 vXF3+vo43uNAN65N+YUVXNqPKh5LmoD+pEyVKWy2Oet/BCItDPtsdwP+uflTkA63BC
	 7B+yWu7X5u/+AvirLRo8KHn1mq/B0WasFoflwUPfd0OXhW/gPMdq503lkSlpKa8Xno
	 dwQr9gVQA0l97JHQuSHJYfm83B1YHbUisBaSNTArY/pT83QYD+mxnVCnUgk+BKR67G
	 WtOn5udjPj6gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEF9D614FB;
	Fri, 29 May 2026 16:18:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4328F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E03868424D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3i4bk0jFylvL for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:18:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1EEBB84230
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EEBB84230
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EEBB84230
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:18:42 +0000 (UTC)
Received: from [192.168.1.80] (82-65-127-30.subs.proxad.net [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A3E092C89119;
 Fri, 29 May 2026 18:18:40 +0200 (CEST)
Message-ID: <ac182c40-36ce-4850-9427-51c75b4cb0a6@bubu1.eu>
Date: Fri, 29 May 2026 18:18:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
References: <20260526194737.333647-1-james.hilliard1@gmail.com>
Content-Language: en-US
In-Reply-To: <20260526194737.333647-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780071520; bh=ivWEycNQ4nFFbAYt0KNwJ3UY0finco2dgLwaVoo/2O4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Yos13lQjncOSdbS7exB0C8PKXmXr+/EHRwT6Rabi7hkQ5mg/beFuwzrXmbK2AJy9I
 iTXzda5HzTslzp6JZSGwwje9RZEAK9rS5R3CEphcamXfmX4johscPdXMyDCV07P71T
 vUBEveG63zPD14/p0gX+sicaHudGzFWBRxY5zNcMEW8zWwp4hOLICjayP4ICm2bS0+
 ix4jOI4k7X4AiZzBtQNeNZDL4HAodZy+fyTAbo02Kjt6Ir9rQJqwxwBFniCbEDrQHZ
 QZQ1PklG2Y4eVH6SPvnzMoo3ARwl0K5CgKynHKLuOD/d+QGYRj2g/tA6T7JbkI1Oyn
 mAXyvCaVrkw1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Yos13lQj
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to
 version 5.0.14
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

On 5/26/26 21:47, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
Added a link to the changelog on github, commited to next with that 
changed, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
