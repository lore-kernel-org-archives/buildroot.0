Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1F9606A31B
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eJczQfTl
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1483681200;
	Thu, 22 Oct 2026 15:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzTBmWxNT7pc; Thu, 22 Oct 2026 15:32:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B5408811F3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792683147;
	b=BvmkSD5gbpNuvbgoXs5Ms0DRFsQQaqGfJMLO3P1i1uibiMshizSq+rRdQ/uIiU0muX7X
	 67wbcD2eA4VYM14CPQ6qLOHbVbgQwX2+E0/1+4BucJxDGE1s/vCyBn2vIQmVzcLYoeSwj
	 JV1Tz1+ueeLloDgqttf1BDg5SMsYLmmlhZYvvAbzPU46BtibFemlxroSeceQS5bgALeMK
	 Q1/xikyGRurOFyeSdBxiXpHowfDB3vHUsVeeIqEcvi45cPSRF00r8kCGprIJtzICwMowl
	 +SXcJLhyqMxHxZcDjsDTe/cAhl3L2GJk++nVblkvXh18+7+aaAwtACREcbJHb8qM5vw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792683147;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1fTFXmkL1OYeoS7kYVjjDKKixNMcCJV1mIBuemCyM2w=;
	b=NMhSqvsbMecSKMHE0f0ZNfl/gl6hcSAiCKkZnmQgsvGv8Zf9jd3DRL0lHIcxb4IvFuwe
	 MhSFX1LZbh6aKqLLEwOyLpnv8NlKK4STMqv5mgufqCwlVhTbYZwxm35aTtX89wLkL3CWj
	 pEp2GVfkzIzXsq3r0G9rYLQM8+Qp14V/jaxSNedvfXayhHHT6kIQ27DvEC1T7w3AODV0M
	 WX2kDl0C7oKbKX7BC/nzSbXXNBhzfBnlXHNXBmSc66sHUtNPYwotquHsid4Q9VZiBDcUi
	 j0G8F7HhgeGYIoNqSH2yO0ekJ2Eg74gJ0ei2jEq0DEIj1N6RkkJeqFsvaU3lzFKAJCg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792683147;
	bh=1fTFXmkL1OYeoS7kYVjjDKKixNMcCJV1mIBuemCyM2w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eJczQfTlP4OkBHtCQ335NJQ92Wo4+iDSxgX/oQiyYv5lNgqxTrq9EX2jT3K5yvLVF
	 zySnXHMv1FqjdpeAefxWuxNqZ6RqwBfBrZUd/pc2pOwBa+lT0Zy1lGTBNMZ0o7SULd
	 Q1pDwRN9jlE6YWbR0CO8OOFfVP5Om+rAj+Gpd946a2ooDM3SZhn/cc80v7YQMk+D2I
	 PqlrIWfyX/nTyiOdZtHFFxH31g0gDnG3j2k5A7pCMX9N7y9vDIUC9DCYw45e/U4N5D
	 3BwGih+9PReCUij6daKNihK32D8ZwOtwTfZ7SFQ+IYJ8ATUvA0AIeEjqvZO3Tbr/g5
	 qgyP+UEDnvG+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5408811F3;
	Thu, 22 Oct 2026 15:32:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D923D3A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB1004094E
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XNLblta4wH0U for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:32:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1691A4083D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792683143;
 b=HeIoev6uIFfC/hP/RpHndGv+Msc2S5nHTsRCtAbSs5fOl7ZJB9IgAIOeUybzRJBgaWgY
 nens68qav8GzkvPb2VLL4UYWYq9vNCtr1vscw7u9Cd6p9I94PUDYjUnZengJ17hnGrR08
 RbVSkYNoPbhw8bHTHmkTbZiSkwkrNJZuX2GJtyV4vxg+TXflgsmkIx95vTifdHOYkJUvy
 594HfhM9ECQZTLfD2JbcPW2S/NGddrollduJxoznEoFBjS8yykXVww8h/2woDaUK4NJ3Q
 8fSLrHPSXq/eFnmz1eTsnqNAju46SKISvD9g/UhYWsM1cFwM/u3G9rFkTpXgmYGHWOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792683143;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=4clskMe0LiuwR484ljEb08nqsPBHencuSr5ERZ5tbDM=;
 b=IAkqnPoY9OLgHXV0zRSmELurD2nGr8RaqsBf8kGxOXKCddbEzMUkc1dhP5ud3TBtMil9
 ZPdH5ZeYy1PAqHvqHBE4gO643kazoUB8c4cPXsysbacC1eZA51FhnZOlnqgEbI+305k8w
 u5A9Rozsvg5fulUFd1yDAlp26nLBet6Xwu2TEtkZJoyMWequC1+92o3LmscMSFOmsI+Wv
 zAdABiTOBkJ7gU+cz7l8HDTl3WZ36B50IwJWLQESz2vYm80TDjut34REs9Nu9BV/tA+JI
 SpKdReTA3jDP7IMTLpCsDfP36teTbV8vP9GxBJEep7/ewQcbwe7TBQsWmAVFl4OY/tQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=n0b6DM94; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1691A4083D
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:32:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6B0964E412A1;
 Thu, 22 Oct 2026 15:32:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 29BE860360;
 Thu, 22 Oct 2026 15:32:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5601D10328E83; 
 Thu, 22 Oct 2026 17:32:13 +0200 (CEST)
Date: Thu, 22 Oct 2026 17:32:12 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <atosMGtvgeKhEChh@windsurf>
References: <20260404100127.75303-1-chakrabortyshubham66@gmail.com>
 <20260408062831.8587-1-chakrabortyshubham66@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260408062831.8587-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/eigen: bump to version 5.0.1
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

On Wed, Apr 08, 2026 at 11:58:31AM +0530, Shubham Chakraborty wrote:
> Update Eigen from 3.4.0 to 5.0.1.
> 
> Remove the downstream CMake patch because the BLAS, LAPACK and
> CMake package toggles are now provided upstream in 5.0.1.
> 
> Refresh the source and license hashes to match the new release and
> update the package license metadata to reflect the current upstream
> licensing files.
> 
> Add a gcc >= 5 dependency in Config.in because Eigen 5.x requires
> C++14 support.

Actually a dependency on gcc >= 6.x was needed. Eigen "built" fine
with gcc 5, but eigen being a header-only library, it doesn't build
anything. However, gtkiostream would definitely not build with gcc 5.x
using the updated eigen. So I increased the dependency to be gcc >= 6
and applied.

> 
> Update the project homepage to the current upstream GitLab URL.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> -----------

This should have been just 3 dashes, i.e "---" in order to be
understood by Git as "what follows isn't part of the commit message".

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
