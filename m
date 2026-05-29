Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A02CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 978856163D;
	Fri, 29 May 2026 18:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbzaQpkP5aNX; Fri, 29 May 2026 18:27:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39A6861636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780079221;
	bh=gYROecOVvR3uAMn4Y4CEDn6MrXQjBVkMFWpPxTm4Ow0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=WeDJjGZY60oq855/HXhdihYdoTXEludTcel1cH3hhXn/2QBFxHlXNKZY+mU2X4kc8
	 SL4+GtsICGlALZJQYyrXyTWxke1165h77YqMFlRhdAa1fjEe6HgYWZqLfBFWze4c0g
	 wexNKcEZPe2va5bG1ZBikV6TIiK4rAsB8niyfA4DB76CefmOkAz119jCfB64WHsPpw
	 s6jGyuS6Stehqs46+Zpe/mMPN/9zsLu/PzMan6zXpVov0kYesnizhjLFpSh0ZAk270
	 fQe4qdErK+TiIeXXbYpI6R6jCt8dUPiFGk7MDW+249PPHhAT263Lw2m/1sNod/ZQC4
	 ZJ5yGnC3dREBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39A6861636;
	Fri, 29 May 2026 18:27:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84BE5288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72B338458F
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9z_4Lo6Puvt for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:26:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F75184591
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F75184591
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F75184591
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:26:59 +0000 (UTC)
Received: from [192.168.1.80] (82-65-127-30.subs.proxad.net [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 300702C84123;
 Fri, 29 May 2026 20:26:57 +0200 (CEST)
Message-ID: <7ef93701-4d82-49a1-bf24-9c2b002c3a19@bubu1.eu>
Date: Fri, 29 May 2026 20:26:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20260526201944.379676-1-james.hilliard1@gmail.com>
Content-Language: en-US
In-Reply-To: <20260526201944.379676-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780079217; bh=lt+9TivZrk5E1Ij9zNflmxBqOJ/tzrqMfsWZN02PQLw=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=UqEZdCMXK631uSwQ3MyOrYioxguVX8JNqQ4+16AK92nczuFAxoNeCegJrZYsPoUht
 LhLElbQKu9FsJbfle7rkK6/i9Ma/KTU5nnldZomiSE6LaYQlo6UKtv9Ptvs8hnURZN
 hXpUQvu2ZTb4XumseP70I0Llp8JVFLCX7ijEG6sJbdBEXBqQMU5LSnSZPcTG0qmWiX
 UOK1nXColVMf9z8quzSbmsTBKCy0o+ecLUqOKi8lPKaA8sdxsG1njVn7BIQo7bvENH
 HJCAENUcFClHwy6dgpwYk48Um8acfkMfOHszMlnhGrOMCe3/438EZ1i9GL75mKlY/Q
 ntekE7EvrrJmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=UqEZdCMX
Subject: Re: [Buildroot] [PATCH 1/1] package/python-starlette: bump to
 version 1.1.0
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

On 5/26/26 22:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
Applied to next after adding links to the release notes, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
