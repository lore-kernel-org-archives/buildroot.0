Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFF5606A332
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hM1k5EdO
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C76DD80A66;
	Tue, 27 Oct 2026 16:14:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjPwM3e-ni-O; Tue, 27 Oct 2026 16:14:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ED713809CA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793117644;
	b=K6abx2jcsG07y5n0wnaEpp543LSNU2ypWrzdfZMzcmfWPDNFqv4EDSO7ObckTIBYrnvG
	 X5K2q3DcY7UpDbjdw8LFIfhvBH6KQlniVoX4nsgS/GHtnztOBNC6SD+WLNxnJFTNDbucj
	 Kgo9D8/mo8IdNwfS+SdNkQP8mKoJOyknT2PCp6sru91urKhz+JgpvJDvMwQL9U5m+IY7N
	 zmb5dQlZ2xSOXHajOi/cUqta3Q/YrG+jWc4WiTiUQmt0cySD2Mo7YEzXPA15L3n20j528
	 nGxoTUaL0B77Flc5NS1SCY/INoQBMQTfG2TyEXezZuRi430l3Jq4SRUJv7T9qNikp0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793117644;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IByIwchcXfmpJNRh1WqTMBG3q4vXGl8a1gWPGqJwX78=;
	b=ozZFDLI+KkCuomRQb+t3xiSO6E0cQerLDLaNQaXiDh2d7zm6hmd+u2N3CG4/tFlK0+Sg
	 5DgnN65akky4hAGWRsGjgUSqYV6NTBPmmM/KrpDKM4CjPkUvBIFLADJxlOCNFkqOBmoWv
	 8s7ywyBmeYpGd9oMlFYMF5/rVVrRzwPrHeJ6SqPAVFbfRgDyCzdqM8e4Yr2v9linyqkbt
	 CPOtHRI0XxLk9n8CWdln497bvbz9Q6NQCTaUCu/ubZVP+BLM1xbglU0zOqzZxche2DCnC
	 Uje7QWj8Gh6T1pA/mptZbTiRRq4YNt9AFjnRFOya3sZC/5FX83ol+4tXXGxOLs2HJuA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793117644;
	bh=IByIwchcXfmpJNRh1WqTMBG3q4vXGl8a1gWPGqJwX78=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hM1k5EdObal+J/WWAwn9hPUqHoiZ9B3v9672RjMg7bYuMpnDElXyT6Esityb/lvt4
	 wD15/pBRawynbDwbZ/nkRVb+gyGu7GU/I22lz4GzF2RYySlfw1K6GVhvwjklMLupv8
	 ev+yZbnbuGy9fIxo2ATj0DWGiaaDLI6fo2muFfs3YZWu6HVyPDzhAJVPdOSR1XeNnN
	 Bv67AAyev1OZOleiP9myXFwVggb1wac1gS4FNNJbrEY4Ba5ql+nSq1XdsQ0h1kR4u6
	 BdxgJaMyad1Kbjfk+rObL5chDR/XBYCv5u4hAfA3v5LmfV35WFARxky44Uukfsftdk
	 niTPDhdjTOPVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED713809CA;
	Tue, 27 Oct 2026 16:14:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8526D4BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7729A400E9
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LjU-c5R4quIk for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:14:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D88DB40184
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793117641;
 b=s2GHe7env92/DUz5kDz49v8SiWqdFZP5nznD4ISpY0paV4QlTzJ3HRoRJw4q8P7EOG8C
 shs6evKsUAnJVdvnQS2iaaVwhedxOXHFQlZSZrjd7hwsBJZYCzTwAc5ndTaAPQvtrLik2
 Nw6t1+LxIrB+3OgVm+gnCzbS6ufVuySK+zlZg6Rea3ugFpLlbSVun+I7fC0iqmbSyfPMr
 PBMZ7dZ+3YcsuKJXBg/Z2eLPX5dvWkEhjVjXLc9C1LfTO6GSyaXssiUKFsh2dkP6bidnD
 Hx5DvUTga3zMZl6heChiGdT0U9h6gmh8dLWzBnFGMCDfSaKoglGahkmU92EYA+UncLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793117641;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=lBUKUWJ6BEXkPTGMuXAitr+xDDYC0JfvCdbgIgN/CVo=;
 b=RzPiSBvjiSNRnSzdUcIcwiCZS1NJHqMA26AEMX4c26uQn7LPbedCTEmJs86dQaTn2lEo
 uscc9AX2VaehXIYFimd0k82OaAbFWscYRIhE6BfPnKCH48LNUV3hPU8IHNdMpWQ6Z8YWs
 hl9KqFETttVYt4aRogb2N6BoNz6tBNtZDYD8f8BK4Lunjqa9sgFhzMYqNvqNg3G0zmium
 ualE5AyNqKgZe0lXRCFLGMq3TxPCxbUQQ9X8VTNBsFV9f+V7gUxl0rKZm2d6eaYtOIoo9
 QlwO5K5YhUhd3fmsA+DR5wOsAcBpJdBPCHjgnwt8wQBuFCiexFoirSo7ZjgbtaTNmAQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=z2ceVLRG; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D88DB40184
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:14:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2DEE1C79AB6
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:14:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 93E1D603BD;
 Tue, 27 Oct 2026 16:13:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D394F10328FB2; Tue, 27 Oct 2026 17:13:52 +0100 (CET)
Date: Tue, 27 Oct 2026 17:13:51 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <auDNuzu2BoIkIVmA@windsurf>
References: <20261027160326.1690238-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027160326.1690238-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/drogon: needs a toolchain with
 wchar support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 05:03:26PM +0100, Dario Binacchi wrote:
> The trantor library bundled in drogon uses std::codecvt_utf8<wchar_t>
> to convert strings between UTF-8 and std::wstring. Toolchains without
> wide character support, such as uClibc without WCHAR, have a libstdc++
> that lacks it, so any executable linked against trantor fails to link,
> starting with the drogon examples.
> 
> ld: ../trantor/libtrantor.so.1.5.29: undefined reference to `std::codecvt_utf8<wchar_t, 1114111ul, (std::codecvt_mode)0>::codecvt_utf8(unsigned int)'
> 
> These conversions are part of the public API of trantor and drogon, so
> they cannot be disabled. Add a dependency on BR2_USE_WCHAR, together
> with the matching comment.
> 
> This issue has been present since the package was added, so it also
> affects the 2026.08.x branch.
> 
> Fixes:
> https://autobuild.buildroot.org/results/6b893fea68e25fd928daabff5cf034de76062ac1
> 
> Fixes: d38b4915e9437c5492836914c0a0fff12b4f1031 ("package/drogon: new package")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
