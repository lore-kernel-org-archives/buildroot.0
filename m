Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76B5F4485A
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 13:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A145410D8;
	Fri, 10 Apr 2026 13:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZ8uKZXdB9Fl; Fri, 10 Apr 2026 13:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90E16410E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775827458;
	bh=GAZDWKr3ul9/bo9/cqk+2qmwUFeFvyv5pNxPK7EtJvg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DUUIfCYKFV+QEWlJWIn3fLgkJ6B+d5ybBev9UqJTI5POCfksGBuRXoEi5EbSe3id2
	 hHF1hndP17QN00uietSqieP7RDRa9tVbExWEZVAkaTTAvobG4w1ki1LE+XEMvI+JjN
	 hZN9gDw+AUi++UgGvXk+6wZ+gat2g4VVrH2l18AhvAaVpqRGJJRwjrjtcwTDkLyeO+
	 d28oBb33XrXYkcEpjZ+dEvZhWJpFQf97aXheXyIzYxa+vOvhLFIqasZkQGk/Jax9e5
	 wIxmo7w3k5YnKN/P5pFdckpQEcscugX6v0Dx492+DGIGTAcuvLEymdbJJS1+/h9/wU
	 y5q7rVKJVGZ4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90E16410E8;
	Fri, 10 Apr 2026 13:24:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4135B237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 13:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2771D410E8
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 13:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qat0oIFwMYj9 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 13:24:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B10E410D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B10E410D8
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B10E410D8
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 13:24:15 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 4DF2F2C84735;
 Fri, 10 Apr 2026 15:24:12 +0200 (CEST)
Message-ID: <613bcc5d-e429-4607-be78-9256ce11c9c0@bubu1.eu>
Date: Fri, 10 Apr 2026 15:24:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
Cc: Boerge Struempfel <boerge.struempfel@gmail.com>
References: <20260408074029.4005543-2-buildroot@heine.tech>
Content-Language: en-US
In-Reply-To: <20260408074029.4005543-2-buildroot@heine.tech>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1775827452; bh=XOCSt/QVv+mydnfr0vuQujDSE2jY3A6xPEr1XagxrXA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=EvToayJ86SK2Fe7nidWN64uFnZMuF9IcKPMtX6+IH6XNccfI3jPYXUiAA08TFHg35
 0FsmIfgWm8Dw2Zssw2Ek0RjkwPJugIzT7DgefMxXFsBS8Cd5aWee3yLobflVIFD2YU
 u582K6Sbiq7X/e83JPLTqsirRuNOWp3p8TUU7N4h3LqQJ0cYxdPLF2MqtgIeJB8BiI
 nJDEQZa4dxsxSqHPPl7A1RgHilXcTOOs6VY9xYShuSCYhHGC4dB5qH7MtafdKr+AIv
 5B0wcEcUgYKJiqT6POsWa0KdywlZIXPEI5OQBESQdeS9voFXNMFRCxo3+EHhwO+zki
 v+X2/bOwLWnHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=EvToayJ8
Subject: Re: [Buildroot] [PATCH v2] package/libgpiod2: bump to version 2.2.3
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

On 4/8/26 09:40, Michael Nosthoff via buildroot wrote:
> Changelog:
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2.3
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
