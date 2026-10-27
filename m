Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DA6606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 17:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DS6M35wQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25701407D6;
	Tue, 27 Oct 2026 17:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8tG3XS-a1-0; Tue, 27 Oct 2026 17:22:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CA528407C1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793121767;
	b=hSbrAqBeH/5TVZ/o8wxzqzQERT4BVIHB3Gn2S1SerSFXVbWDpkdbe+mw9iHH4jsnU+/c
	 KfIZqMb8rnewLX0USHbT1c/j/yd6lTaOcz7jU5QKmcbwBw4rtIaGgRQolZ1ulLWJpj4tl
	 FqO1+fU7bmpmRMSf/YTjKUTw+tCq0QOAT5vjyE2hI/Dxk5yLr7oEwrKDNvj+Sb5HROE2X
	 gPtsBS34ZzzF4uBpkv0nj5A2KMtlPmm3RI6kvXrpqn9IlXXypc9UJbZC54tF8tlCHLD/w
	 tEJZSDqrV30y72o0Erlk1RnUXm0rhYH7VLe4rt71ZZ3UXSPrT32SSJ7M2mk5nmir/mw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793121767;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/fXJjQ4DEbCJbqW0CqwM8EtDd/qsJmlINldxDQ35Ld0=;
	b=GXHfwxOtLcgIQus6zOCVyKDxEhvKz2ciCvTO8BU7GjdjTmx8XHlnUvz77S24ygwsKwq6
	 dOHf0ISOdXOhu9+qExGhn9vpGy+3S8EFDXEiRmIogTB82vf5RSgml1uZWHSIe6iKKedzs
	 JYUQ3izXaaLUTmIpALy+D+PXruQrd6A2Pb2r6b9IIMlQu97XTNM5tgopp8CcTHfssDPGt
	 Co3r2mB9IJlC9NqdLQOjNZRXfCA0N5s4s2WFXtJmbc88ey7HFJENkWzpNI1HL/Lw54QkY
	 h12mkjeMazlnY9bXVuMBJ+sC5mrx0MtZUQTjJAWGBOOoLlJohP18pc9zm4nMsaU9aDg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793121767;
	bh=/fXJjQ4DEbCJbqW0CqwM8EtDd/qsJmlINldxDQ35Ld0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DS6M35wQy5/fHkh6cdov/pBWCZF4Be+70Y8Oda85U0EkZpcaVbgxpQVTlnWGWVGhi
	 ldJs2xk1aJwpnVlSiUPCLzEV0YyMKr48wUa28AaSe+Dc0pb39w0uFOT62RrGzZ/r/l
	 FkYLfNlonBD5KohMVFUCylcDCVv44hAwHmbo83Oo778Up9C6SVFsvTm2hTzEr9aYLx
	 p345uAzGmobZan5Ha+7+9UF0Ksa8GvibL4NU/7OxlJVK3NF7naQlL/NnrVvXZSvZSj
	 Dvb0SFIaI64HiMq03kKl7kXfmlRZ8fXmX6uz/XBgEOlhRCfgV9RYW/v/kL2TGp+4iv
	 t4SLMPS56iVzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA528407C1;
	Tue, 27 Oct 2026 17:22:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7832E4BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A0B860699
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I03p3_Dilkmb for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 17:22:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1CBAB6068F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793121765;
 b=O900CvKW7ymPL4o7rNwZgHv2ZoKW0rKh5xOi8JUKtnhM96QWal7IqlT9Mn+PbTM7Jyrz
 XlRsR3geqEPVy62jdWynVi0NgnC0Lt8bwt6dXYfip6eUaUStuSddl11WpTrh9KZm0N97+
 zwQpFgOW00lEI6JPDCSz4pApUMZ2lGzvTWzItesVAzrRTbkBIMr9tZ1Q9AH2s1pqOIiuc
 2LQgdJYsf9+L+v4G/P3WE/zkF7ycQP+Q/HGXRp8D/GSXP5dDMHoMy8UdsRd4Wbi6TeDDp
 h/z/54DmTk6BbpZPA1ne8CzxeaE+WObphUmtPnqBzLXGqUVVYG9yYsAOIAFUDir1O6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793121765;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=8im2ACjM+W1JCKsIHt6V8TdElQXrktKfcxXhrgkoJP4=;
 b=p4W4XIffjm3v61Yb46B0QuTNZEk5ruLKn+p0j1gq5Tn6bCYMyE5t2hc4WpkwU9NJ7Fem
 BignxG6gvHam+aIrTAfOiBSrb+c7rs/xXLyYu73dxzUxvOyMGn3y7aS755EyS43g9hXyE
 BNeg+vWylgxI+1BZNvJ68wHp2x4GMtbGevvPNs/SdV0niLkTZkAL9IwtxXTmUDRuDJfOQ
 0rm/KIImSVbcPrF/v+bsmmgR90wjcey4bCqf4o+JY1CIGCIpKQeK3CXW3LQbjlBNUFUZt
 5E/rK5sv2PdUpFhsToAJAld1Ln1o6ObMo3nTQkmMHH70OPrcAI+jdThnAifOVvEqsPg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Vlsg7aPD; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CBAB6068F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:22:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BC2641A1366
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:22:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9120C603BD;
 Tue, 27 Oct 2026 17:22:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CD9D610328D57; Tue, 27 Oct 2026 18:22:34 +0100 (CET)
Date: Tue, 27 Oct 2026 18:22:33 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
Message-ID: <auDd1axP1bPiv1os@windsurf>
References: <20261027151809.1110228-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027151809.1110228-1-dario.binacchi@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/drogon: fix CVE-2023-26137 and
 CVE-2023-26138
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

On Tue, Oct 27, 2026 at 04:18:09PM +0100, Dario Binacchi wrote:
> All drogon releases, including 1.9.14, are affected by two CRLF
> injection vulnerabilities, which upstream has fixed but not released
> yet.
> 
> - CVE-2023-26137: HTTP response splitting when untrusted input is used
>   to build header values in addHeader() and addCookie().
>   https://www.cve.org/CVERecord?id=CVE-2023-26137
> - CVE-2023-26138: CRLF injection when untrusted input is used to set
>   request headers in addHeader().
>   https://www.cve.org/CVERecord?id=CVE-2023-26138
> 
> Backport the upstream fix, which rejects CR and LF characters in header
> and cookie values, both in responses and in requests sent by
> HttpClient.
> 
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
