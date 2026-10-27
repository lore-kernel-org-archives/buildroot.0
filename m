Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC6606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H8sP91a5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8CE9605F7;
	Tue, 27 Oct 2026 19:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwbD-Mzz9_tK; Tue, 27 Oct 2026 19:47:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1969E6069C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793130435;
	b=XPBRbgil4F/ZYBT9Fpl7c9G7VRiwDTP3he91E485fkTgCU3uUBu+eXy/jScQ2Gqnr7AP
	 YnracQdwfsCEUKfMLGdIel94ucUx/YEVbi87eOm120nsj77vPZLa5vApG6kpg53HXs3Nd
	 leQoMLx8cIYjDLD+ATIZHxz3g0KD2fobO/gD0AwnSvQhDRGyKyFIMt1kY6L2TzWOr8C18
	 3CpQzsM6BfZfFzZa6CaD4HvKndD9kOt32sCFsmU7hCqBRYYjd+V7GkeptO2+SzUnE/m1l
	 6kf7JO+CWgS3q0ji2mu30EhePBlPd8Xr/r0di9tmhZSOjVqaC6KeLSYQnKRQuA7DxeQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793130435;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5Cepo3aftYZvNb3Ch0m7I/0zGGniNfJoSuFbvJVt28E=;
	b=swstxlErFvelkxGW7cu+/Mf2M1u0p/wn6M2VtKoBYqcZ+2b4n/w3OdeKl3iXTwuzG275
	 pPOBUJdvQMyJeZDa6ZseyZ/smVLnnGmx6v5iaREpSbIiFHWNrzkE00bwG2u4TdnbJIZAJ
	 V9xrfxMqgS7KcGERYOkR0FpAd/W8yJuC4PrA4aMzIXMwH3nRtCXwPLCzi3T9aYhmRYM0V
	 OO52CzPuO6Nqu9PniZyaQdEk571MuTk7F6yX6X9k2qX8w6JKloDZyK1A0TiRDAQ7vJuOb
	 SC01sp5+q4OLWQ+GG6LmbwlH/9i9E1fkYIyWcdnFir9onx/MKAH1eaAxP4gW8+IDnJA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793130435;
	bh=5Cepo3aftYZvNb3Ch0m7I/0zGGniNfJoSuFbvJVt28E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H8sP91a5p13FMDtq9qmNXy5ikb67fpkAIfbqmQvgvNeBhihA27iO+T4P7M6vzwylE
	 KWbuKLp3mg8VLSD3KbXvanhDuYd3jRD7RcimBWJy6/IE4QCEOTyNc8SRDkF8tTud1+
	 pFWFkz4DUlABHTXhgMU50cLr3Wq1OTIRZ4f2g367mL89NK9g3FWwlEBgqu/cIEWKZq
	 ImZXTefyjLKh4Q5W/D+8pYCsNWa7eD9/ehInW6BCQdnv7WY4pBEDQDvwEqBlsYZa4C
	 q05IDSB5yDxVinphTWNkw1GpnuTHERZKozlzo9Om3I8BekfsdJ/idAJb62x+Mj6My+
	 qJucWX9HVdr9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1969E6069C;
	Tue, 27 Oct 2026 19:47:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37568529
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 291FA80F41
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mALLZ6ax8K-f for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:47:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A3FC980E4C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793130433;
 b=qMiGv+eNvrQNJJwhU37RDKnZHrvaQbGr6sD5uF6asjk7kaAYSd5aY9DkSxJHqbtacPlP
 1e+9ePDaptbhpagphkSWaQ6gqATH4clNzC1TPPQtl7k2gtMRdB6MtF9QdafJvVAJRFfzF
 uEBsEePtogRRwRm7VCZb0R1YJjvsy4PgpjkDsYo8XPa5jjeIbtEjRO4Kgb/YGXDIs/9mB
 unwJaxO8WdYWq80F4n0C+TFKJpI9kjzCmmWgMUdzuxtkE2CUxA/Lwzj0i20f9yFGNtKgT
 gFhDNXVgubSwtNsaRUg6dR5BVZcwbmJwwZT6dj4k2Py9NS3Y7dt8eNUtxdLKWtkImkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793130433;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=ZeHYeD2pQj8DTQJDpeRff/RPhELUky4ESnF1dNGu1h0=;
 b=OSjKa1iLXk+Xg2HrF9kiOnxxwMg1l8b/vroGNaMLPo8H/DFaWPwYa9Eevbm9xOzSIl5t
 8qd/warijafPFgaBwKgHeyVCOG9jCL2SCvK9XWxVBAcmk6ksXADzkmhpjDfv3Yoa5EZ9T
 ReQUuUpcOmakrPI37LF3DWQKdOjoKPsP+w7VABemSgWdVfOjQFE/jEhh9LwBzlzOawAYM
 sKjtdRBdBi/EQkvvC9udY0KrqXuusSrK8pTzZDipJbKaG0QF4jEhsOmCkVlsz+gVOT7hC
 qg8j66uqpD2OoesJGUuHve3PKFsfOnCr4+WNrOIERf5BDTk73J3YehhPhuibrKmNFrg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="O/QQML/d"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3FC980E4C
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:47:11 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a2072b9832so8738095e9.1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793130430; x=1793735230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZeHYeD2pQj8DTQJDpeRff/RPhELUky4ESnF1dNGu1h0=;
 b=kDK5JWJUZfaJfi0WJ47iVFGdMSVNFfW4kVFQLL1t2y08g19mWFFOmJ9iZZ6AAvSmQ4
 lWrBJbT/8Eao11y/Y8KNC7G4U9vT6xkEmhq2LGJfVMZfJKbQlaJNXeLIq1Yzl0Xj+sR7
 LKxqgcWhBrmc2F4pXWBRJ4TvRwtcpabrIKMa9tKCNQzbmQLIS85fJJpgoivjJuFFET6O
 IKUgyuHXPpkwnkRbyEJonPH9E2GvVwH8ipJIlWNtTXtBVQQEep4jZQify5kDbBLHpZez
 IgKvX11sTRs5n9djs4bf9rs3tmTX5iY6QOyyXgDb4UBaDrS7cVCR7VMh6PoxKasnDHlD
 jX/w==
X-Forwarded-Encrypted: i=1;
 AKwUvBz9gf2beonPImVmC8xbOGBBv0SsID65U1DXkUKEQXb4mqTjFFfXzlrepL7yNjp0GwcKPwbuNdMsNy8=@buildroot.org
X-Gm-Message-State: AFq9FYJ8f9q5FcB5IrYiTK8hHTnX3DU9rt/ikJSjpW3Fr54XFw88Fnvc
 csgsyS8RDpIENcyWaY5a7+kd9fPBcihN3fNTE8F7Qq3tpFg77FFU8ahlySAWIE29jTY=
X-Gm-Gg: AYBFou3XLwzOy1DMje/bJt65/eMkIv3W3VSfyUhd2ByqGnwpjbjHbZxjzywSL1Pw37/
 qSLQspEfMJ4h7jMtXBDR2BzPgdHhBcc7ehQRZtKJkPJw1UQlOmeLt/gUCEFJ9JLJoF3h6hzuGUU
 I5YbRGvTJPkEwsQ89Qvf3HAjOgi8MDsy4jSn++3rWz2EzyYzQzHU8HZ2Jz+12E9sicvEOSjbE0+
 KAyGgfg9EVcdIqwJL8ggH0P8xh+tRsFDo4oZQ7a61wmjbOG6LeKS4yslkSXg/w6iEWwwx9OnDxy
 1/3qhWcc+dN8iaWxy7SkFrhvG5q505VtrHgU4FGDzkcpVJju8ttZcx4ufW9K4SZbHgn7Z4FSdnw
 wsFPVJEPTnNRcJ5HlbwCX0YJoDS4pharusgafQnKoZ3QG1Fd0ZfVXEZk2M6KfsA04RXj6txtr8f
 hImCIZsxErw2cu+XTJWCKodT65QFvAblczkQukkeM+NuKVeVPMEeUJGtYCEXyyGckskoDRCP0QP
 TKS5XkaE02kHgZXSEx5d0/QRAvhFOE3luHktacTJO/vPoCa
X-Received: by 2002:a05:600c:4e01:b0:4a1:efbe:529c with SMTP id
 5b1f17b1804b1-4a7c16c4554mr80334635e9.12.1793130429939; 
 Tue, 27 Oct 2026 12:47:09 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd4be6sm22493358f8f.37.2026.10.27.12.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 12:47:09 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 27 Oct 2026 20:47:08 +0100
Message-ID: <20261027194708.322272-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <auD6AVoh10Byfa_E@windsurf>
References: <auD6AVoh10Byfa_E@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/drogon: add CPE information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> On Tue, Oct 27, 2026 at 06:38:53PM +0100, Thomas Perale wrote:
> 
> > Also need to include the following
> > 
> > DROGON_CPE_ID_VERSION = $(subst v,,$(DROGON_VERSION))
> 
> Makes sense, but...
> 
> > 
> > To strip out the 'v' prefix. As seen in [1], the prefix isn't used.
> > 
> > After applying those changes I ran
> > 
> > ```
> > make drogon-show-info | utils/generate-cyclonedx | support/scripts/cve-check --include-resolved
> > ```
> > 
> > Which correctly output:
> 
> ... I'm already getting the two CVEs with just my patch, i.e with
> tweaking DROGON_CPE_ID_VERSION. Any reason for that?
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Ha yes, I remember this issue from the time I worked on fixing the cve.py logic
in [1]. There are some weird things happening with the `--include-resolved`
option and `distutils.version.LooseVersion` throwing error. iirc with
`--include-resolved` currenlty they are correctly marked as resolved but in an
hypothetical case where the vulnerability would be exploitable the comparison
between "vX.Y.Z" and "X.Y.Z" would be marked as resolved as well.

I can further go into the detail of where this logic error happen but I don't
think it's necessary.

The fixed version present in [1] doesn't include this logic error. If you give
it a try it won't work with the "v" prefix.
I still need to send those changes to the list but there was some minor things
I wanted to refactor before sending.
The fixed `cve-check` in [1] is the version I use to generate the report for
`security.buildroot.org`.

Best regards,
PERALE Thomas

[1] https://gitlab.com/essensium-mind/buildroot/-/commits/fix-cve-check
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
