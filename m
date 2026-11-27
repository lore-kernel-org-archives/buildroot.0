Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF4B606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 01:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lKjm61oZ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8188D40661;
	Fri, 27 Nov 2026 01:06:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjj1vVfG8V8M; Fri, 27 Nov 2026 01:06:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B919540879
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795741561;
	b=KODQRmHwa6CrDco3a/Xoij4lF7nuFDhm9tnz59VDH9fGYjxGe0mop0etUKwks0pQiDRy
	 A7V305ccTuSdmEKnxv8dW6vaO9yHtkCvNubS/tuqcEpWuYRckYQpv0qUlAQvIN/vNPJ7N
	 3TZWpxxT0XuwtEX32KdGejM82Kq/VdOPm9nLBzX+QZms29YypjSBM1iKb+aXVuTBY29s2
	 kYb23Ez30Rtw44yVtdMwxVR1gQ2VM4BvckMD09/E8GgS/PUVKI+80V5dgtcM/uw+eZC1S
	 RYuQ3c7I9+LlWVBWIvixzNGEtzUQYlxDmhqfmCZFDWunZ2f0S9iiF6k/r8w4yCe2yYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795741561;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=/licojdXPrMo+6OVQC7w9lqN3/h/WeXfwT/8e6xdy7Y=;
	b=Ao1NvOasmG2tgzCTPoCFqd0SC7bPOaK+K4kuV433X6XqvDrKGf8SVmZmPqnrFDALcwWQ
	 53yjrFPTU5z7dKhjAtWA3N7MDaBbXgx7P8DLl4Wy/4EX1sfdq9oWgZCtWm6BQD4/H9uN4
	 7/omoK+iMPIfXFz/vzBTWIviyeeISIyKvHACLsRwDldbPmYi2WSJnEfwgpKi1EbuY3wuS
	 M9YE8RxRmbyFE0SK6iuL0vWaVZ8AJh8X+FeXG6th6j5hmuwdWx6TK8duQnx1xVl33ATEh
	 bsNXRzflUegLHSe2N5QZrCCCOy1k+00gpFyozBmMrvRmqnBmAbpQVdp4UPbtez3HmRQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795741561;
	bh=/licojdXPrMo+6OVQC7w9lqN3/h/WeXfwT/8e6xdy7Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lKjm61oZ2vrszj2e/4Mc4+SSObr8sCbF7fQc8a/ZO8tGPMFcpIWEjDdRg81Oq85MQ
	 1zhJ+/Rj2wXYKxwjlpLEmtKlgP+Fg+wivweHWy3OeISSwJOAfL0qLOJmSyFa/zbRVv
	 gasm4dG2Mmbbq9PwKn4lFwxBqNmjHs0EMUrz7YOJTW5veHkEfgXDwIJm4GSM9Ux+v8
	 uiBxlLQlS4M+laUH/KPiE69Gfkyp/EEC8ZoyaRTiCqCuo2U6gKVB1vz5OKUwLohiXN
	 cd2WYXImCc5cSRpYA+FXK6rnm47/l8LMGRP3nzbiEACdvXEbncCWWwvQcNH9kqiunS
	 2Q8+97zII+WZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B919540879;
	Fri, 27 Nov 2026 01:06:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C042260
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 01:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E0004010C
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 01:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDZYuNJMf4kM for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 01:05:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 87205400D5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87205400D5
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 01:05:58 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 229B42C849E2;
 Fri, 27 Nov 2026 02:05:56 +0100 (CET)
Message-ID: <f12eb7c4-ffba-451f-9c01-d508dc19243c@bubu1.eu>
Date: Fri, 27 Nov 2026 02:05:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261126192435.1826415-1-fiona.klute@gmx.de>
 <20261126192435.1826415-4-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20261126192435.1826415-4-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 03/10] fs/cpio: set NM_VERSION for Dracut if
 network-manager is enabled
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

On 11/26/26 20:24, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> NM_VERSION is documented [1] as an environment variable to use with
> --sysroot. The network-manager module uses it to determine the path
> for NM plugin libraries.
> 
> [1] https://dracut-ng.github.io/dracut/man/dracut.8.html#_environment
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> ---
Patch 01-03 applied to master, thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
