Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5346EB26F5
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 18:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A748083B60;
	Tue, 10 Feb 2026 18:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtP4xt3qIp0r; Tue, 10 Feb 2026 18:08:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E66B5822B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770746939;
	bh=mfHGnYYQjugGPcYI1OBDyzS/IEH7oaTbqeHqKVR2kJ8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Arl7dlhNmfFIB2hYwBGmdBVktGQ070GEtxl5G91X/D5Q2sx8ZyoO5YLXNLR/c82n2
	 Fg+p5l6Pj8qeyKBOZxT1LsP+aRzDCcwKHs5nLbMp9FXyQOm4oOXS1ZxqQa73g/XXpK
	 bMS//tRkdLd/76JWWwh+2lHJ07A48ti3ywx1eSIC2ajmfGiryepXL0ZOysaNsGb4ny
	 1MUX7AdY3mYVnCnM9gFrfGTA9UUsAvTDicp2D4C85ARFTF0TG6YUd4ICjjlcH5AqKk
	 Irw411OutEJBFglDmVwxWLZGKUBP4C7Vng5SQYEIiaEId9NJ7YCsnqncC6TctGjhCG
	 I13LfSjJn43cA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E66B5822B1;
	Tue, 10 Feb 2026 18:08:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9F7123D
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 18:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C21660C17
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 18:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nl5Rpq_hmtqh for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 18:08:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA59060907
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA59060907
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA59060907
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 18:08:56 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id EFED82C801B0;
 Tue, 10 Feb 2026 19:08:53 +0100 (CET)
Message-ID: <feff37c3-c836-4626-8d6c-1650005eae1d@bubu1.eu>
Date: Tue, 10 Feb 2026 19:09:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Dimitrios Siganos <dimitris@siganos.org>
References: <20260209203212.3837393-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260209203212.3837393-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770746934; bh=k1kETTEasNV+flXAA0/b1kwzMp8JuZpYBysgBHgA1IQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=rjGPNIuveYOBscvwnrrMLNQWGAGZvh4leoSNrFDnRtPSUMpt70weLyMcTXsnfEXxo
 qeMu4YDBigJFPj3kCgjnJgjKIlliSZHOI/2zwOGU9zOVYaFZl9iUJHIucJzaEVfwkZ
 lSJo288UUxsnzgAICCwet3s2SkZGQ8CrQqk6kOq/wg+ebN6a8zxlh60VGYQhHTaurp
 cjp+T2JHA03mU+fEV3RoyqDKQ5nr9L/zz7dm9maSo8IMrXI5soOh5Df2ofDj8cur65
 XOqzHL9czwvBPDeIHuBM3JJAXM1U5bjSiDLlAgGXUjshHH03R52l4GqFUv2zKhYhpm
 3CIX7HsWtVDtw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=rjGPNIuv
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless-regdb: bump version to
 2026.02.04
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

On 2/9/26 21:32, Bernd Kuhls wrote:
> https://lists.infradead.org/pipermail/wireless-regdb/2026-February/001830.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---

Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
