Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F981606A31E
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 21:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AZVMcQcn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B61C80CEA;
	Mon, 26 Oct 2026 21:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97T3VdDNNKiV; Mon, 26 Oct 2026 21:32:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6DA0080CBA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793050379;
	b=Tndgg4hnXkfZx9IxoAxR3AsS3dtE3Cn95e75qvzKUobJdhzceST9h4BfxOPjOlSm1iX3
	 t1ZRkEzfIiOZqwH5mns5eh7vh9Lv6wPJ4SYIt9ofi89TWdGa/K9PYsMzAqrIdTEMv5EB9
	 GavfY/Eghn6Sp9nVZujeKxFLP8P9p2DRHrlmDgwltyTLCyXwPtHneYTRMnOIr2+x+SMha
	 IZA0D1hWqBe6K6tUjeRGpgi08UE9gST/ey380SsizeyMN2Cr/Cy2Xo+woLTNezWfATax+
	 rDjk9LyxLMPF4ffGSF50DEPACRvbmZLfpRKDXHP+PLIsgQfRMTTG3JneQrzOXSbboGA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793050379;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Oh1JkvEE3nAgleDOP5Pk9p+WdCvwxuUOZgPMLmUHGl0=;
	b=e9NTrewmCzgYjn9gZSQ+WqJvS+Q2UbwkiRLFsjuN45wA3BSpEobIoocr+M1lzCHG4cRL
	 lwbAesspbFdWa/nNqcPLjfHuQWlVanpUiLxu2FXrJ/Vo5a6GRLF8vrtqJj16v65SX2fT8
	 InqlnPUYCMWmDuKT2R3b9+GJM6NaAuewECw2qfePBDvSIRpNrcumV7i3FG2VwC1DjuZrq
	 PxwQIOZeKx1hQkg5Ky1nHpiqnkcvaZrn5fEHRIhHR19M+Q5Y/v+SIpsJ6ybFgzgvgN69L
	 Ak4kIn6AkoovLZ8kDN6My6hoyJR7GUEBNA2i+CpGhcLents3ncml1cEBJuAfx8wvSKQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793050379;
	bh=Oh1JkvEE3nAgleDOP5Pk9p+WdCvwxuUOZgPMLmUHGl0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AZVMcQcn1oRLKw8DrS41s43E+Mn36SshJtg/cac63M64mCnyPD0csAyKV1CXjTdaE
	 RY7+zF4C8YzTvcpzDxrVm0WK92lnKDazyaurRxpkvA/+5jCPhb0JgL7r98AbH8376m
	 8ezgYtgCvhVcrX+GOn4dIqSOzuSiBrWq+w2Url0kETkPLSGJUBRHoUxTVss+1tCk/x
	 SclJOImBSqPpo6VvGKNvsJW+b6YCiEkaRyR+BNJ9QDEP7EhQqN71uWeAtJuLMIrhek
	 CFWOB97SvuLKlNlqylrY14Sq6j68iyO30gKLeoeRuQErF/Ptowsn01EzzEn+q16IUd
	 NTuxzwNP5+yyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DA0080CBA;
	Mon, 26 Oct 2026 21:32:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4BA63421
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A559D80CBA
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qucTdbZCFG6 for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 21:32:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2486080C34
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793050377;
 b=ec53IH80vCzQba9BrbR2if/L4TTFhsCtfKvE9IuHZYuM3rGd5xxLdquZyEdJmw35JeJX
 kEnyBuQAA91NmzQWkIqyFxzAjr6NWmhPr+GO20ne8hwo3FjuUbDvBxgy6gGMUtzu4IthM
 CpsQPu+ShpygN5DRfa1kMASIeTSpXSrn/pw2YWWYzg53qpeHktUe6OAcgG47ePxg7VJzn
 QyW1ELZerbwWindWyMbgnDftjyQGF+24QDJ6ftG02v+DNVN6j/LzoluVolRUQzRxLj9aL
 GKuTHlQdWz72MfFCoXsGPyjRNStCvKprd0Cf2cY+go11NWVX3qUVEUCEAaRol1LpjcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793050377;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=1QVOws/Tq3wNMMsKz0G4oVr5exUe5dqEf9cc567GBYk=;
 b=PeT+erhLKaeWESNqqo4QNhurCBSWJK6SjL+EBr/tphfPgyEaEd5ZBaTKPyU5/WBnTzc0
 1g065HUiaBrPIvmeA6S5FvG8eadFOIDy7ycSEzjkpQX32iEP/hrGH7dDJKJpkQcT/fHJt
 hE5ZcA+uI8XP3AK8Sn4rFZEg6KLJMNINIYZaG0Ny0uolhNIsxAbUGZtaxRJSiqV3YxWL5
 LKhy86Ke5HQ8GJmqcEQMlm+MWz8ZG0PQtlfc3EjM80RZPSwjMImP1KAcbSQZjql1pfI5I
 lueFJaZx2uN3u9jPs2pheE8L1d+5e4rktIhEqqmgEj//X0qBB4mMHdG7SMTU+Z24npQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=b3cHu1jj; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2486080C34
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:32:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 574144E41324;
 Mon, 26 Oct 2026 21:32:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 02D3960740;
 Mon, 26 Oct 2026 21:32:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8730E1032904F; Mon, 26 Oct 2026 22:32:46 +0100 (CET)
Date: Mon, 26 Oct 2026 22:32:45 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, 
 Sergio Prado <sergio.prado@e-labworks.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, 
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 James Knight <james.knight@collins.com>, 
 Mario Rugiero <mrugiero@gmail.com>, Adrian Perez de Castro <aperez@igalia.com>,
 Simon Dawson <spdawson@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <at_GrlIr-inzbct8@windsurf>
References: <20261025230338.2972595-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025230338.2972595-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/1] package/fontconfig: bump version to
 2.18.3
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 12:03:38AM +0100, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/fontconfig/2026-May/007334.html
> https://lists.freedesktop.org/archives/fontconfig/2026-June/007345.html
> https://lists.freedesktop.org/archives/fontconfig/2026-July/007371.html
> https://lists.freedesktop.org/archives/fontconfig/2026-August/007385.html
> 
> Due to upstream commit
> https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/7643efb77552076b035d3eb506ca836ed4764ca5
> added in version 2.18.0 fontconfig now uses locale_t which adds a
> dependency to BR2_ENABLE_LOCALE and wchar that needs to be propagated
> to its reverse dependencies.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks but I think we're not there yet, I still see:

package/swaybg/Config.in:1: BR2_PACKAGE_SWAYBG selects BR2_PACKAGE_CAIRO, but does not depend on BR2_USE_WCHAR
package/fcft/Config.in:1: BR2_PACKAGE_FCFT selects BR2_PACKAGE_FONTCONFIG, but does not depend on BR2_USE_WCHAR

Could you check these? Note: I didn't check these myself, so make sure
these are not false positives.

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
