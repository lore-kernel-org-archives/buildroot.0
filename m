Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E80FECD9A3
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 20:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F124141556;
	Thu,  5 Feb 2026 20:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IE64rOj0rUpI; Thu,  5 Feb 2026 20:59:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38BE041261
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770325197;
	bh=C8YvUTME9IGmQkT+3wySvBEyjq3zitYfzc/k5lHhQ2c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qWhnqIN3YXSFvhjYXjXZtQRH2wkC4XcxtLI561KJ5VmEGqf6kdzDuyEJzFFYZTeS7
	 ZPjPFfNnN5qQi9KoYMa4c33/2iLf6U3CkZjGzaTrT8RDFwzpfeplv1o0gLrpaBgwpl
	 zgzZqVIA/2Eqp2jpQ+zIBV8KIli9OhwyQMLkTcV5XqWSm0pLTfcaJ58WrdJLB/Zwhs
	 Lt576uzDXZSwhj8jduZ8DeKip4R/V5VarX7WATRTEQdpEXenmQm4lsRI+1mPUk3wh3
	 rUTBbddnPmRYZ9ag1NfumXKDXslAtFshNkP9nOlx+7TTmo/37KHvBOW5ApBLZa0L+D
	 4gexs70zaIxkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38BE041261;
	Thu,  5 Feb 2026 20:59:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26738470
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 20:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B2BB4056C
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 20:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxogfbaUl56r for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 20:59:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3C7F40175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3C7F40175
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3C7F40175
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 20:59:54 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 7BDCF2C8330D;
 Thu, 05 Feb 2026 21:59:52 +0100 (CET)
Message-ID: <5b9b1e25-679d-40aa-8a17-d8a126dee2bb@bubu1.eu>
Date: Thu, 5 Feb 2026 21:59:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
References: <20260205190410.523140-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260205190410.523140-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770325192; bh=/Qsmsy6AnUDrMhq0oc3i96uDOKdUz1Sf1s9OJtL+3a8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=GiJAx4cyN3iHUrMkbUw4qY/DXerEE//PFzPXfgNoFLGNySdPcGnQwbsdVEmJIEVuQ
 veHr0iln9FMJvFZHkHpuLrTLn6yHez8yzjK7uxl2FFchZN+abwuF7IovKGki5YgQ6G
 2+d4rfVhLITiIlcWPfTuwLOz4EkZxOTyT87zse72Hd36Xbs9tQseIEV0n9GxvkCuYs
 zfj2Cm0by2jfeOcl//2RB6HCnInv+qQtP0DI7diwDjY3KwFrIDrv6qerT3iU8C6XpD
 lMlloLizgxtUYM7qLnO60WIsmb0+Ie6w2yAxhwKYi/NXboO3WBnWgDksvy4o6NgI9p
 aYgvgO91wKkTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=GiJAx4cy
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: fix patch header
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

On 2/5/26 20:04, Thomas Perale via buildroot wrote:
> Commit [1] introduced a patch to fix CVE-2025-62291. Since [2] the
> security patches neeed to reference the vulnerability with the `CVE: `
> trailer in the patch header.
> 
> [1] b009935e27 package/strongswan: add patch to fix CVE-2025-62291
> [2] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---

Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
