Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A49606A328
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 19:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CAhMj9SL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C5B78156F;
	Wed,  4 Nov 2026 19:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLItIdQAMwzG; Wed,  4 Nov 2026 19:57:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 03D1D81426
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793822266;
	b=NEV4AXwQuCCaVyok9ZbDuZ2NPWEe57hpJEZs+/8Y7nd21LJqRxUQLbh/bOJqnQhqmVjs
	 lNtqXMGc793eEQ2oO6CtcZTa7bBL3jlfLQLHysk9I5yEkZGZpFCNi8hZ2Y2bk5nZw69vd
	 O28PUeADA48vmeisfE5r2mWAyvzKCNEZspTHhbpllTWA8MBDDzIBp6YkCDtQcq03yf1Dj
	 FKdiDHjGDOSlYWBqL7uT6mqr1A0pipM1tL2D8dGE+8qxzMEQV7jNvwrYcXRiOxFb5mp8y
	 O7BLiVzpbbDYtQSy3TvZRCuomNYusn6jHE6JMLG3EaUV5F6E2W0vb42ezaW1ZApKnmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793822266;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ES6HNiZq/3xZ+kRcUFy5r/uZ5D3qMS1bjDipbhfpmCw=;
	b=GX/ezGCuOdC5BGnpfCmPKznSDbA2gbfH7jB7fXgk33DB4X1fOUfn5FarFHPoun3Ov5ML
	 g59MVlnhImvADuQXLMX9fR34paiA6ylFZ+GDoq0itX6M3Zaw9gXloX8gIeR98S95OLtMb
	 0K2eQD7P5WE1LhQJ7871BT60Ry3wFgassguUbHVSaAz72z4f35NMETsChBqXByhtsAGMM
	 Xc2jXRiNDC6k4hQJOMVFdK5l9ugVEy9qOJo9bFOvmCc3XnnWQJCxCThzNAgs1pXer+Rk0
	 RfUw9khOBF5OIY75KHQR15OteGANHWWDy6fo3XvtxjNa68fH9IeL5VZqwA+QI+SQqbg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793822266;
	bh=ES6HNiZq/3xZ+kRcUFy5r/uZ5D3qMS1bjDipbhfpmCw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CAhMj9SLjEd1hCR3R8uTxdXgcOyvV0Kg14rV3VRg3bItKWHkHY50qfhnH+jYptNM4
	 75I+PWY3+dsOt3AWDuB87FrnBXLqRZhOp+U0GQHmG4kWxNJl3j0qfblR9val/KOs3D
	 30FXCsF3QbejXNkRJ96iv+4k2xVbzOuMKQ89S3o6M8oTiA3RHZlC3rE+1FaJycnfld
	 atiKPpxUY9Ot5k2FX1AIObjIOFJzkog0KDlw0PJLF/p74UnPKYLd051IDZUoADCF0J
	 g+fqY912RuuEjZM2Bhpbo7/Hk+KIGYxoIompSt1mxCiBElSfSmnDtJsAXqqDUQTF6J
	 GqjyydD2s5Meg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03D1D81426;
	Wed,  4 Nov 2026 19:57:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39D4B9C4
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D2E54093C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zH37IEB5QkgV for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 19:57:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C466340945
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C466340945
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:57:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2BF664E41408
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 19:57:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DE60560770;
 Wed,  4 Nov 2026 19:57:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0196110329248; Wed,  4 Nov 2026 20:57:31 +0100 (CET)
Date: Wed, 4 Nov 2026 20:57:30 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <auuOCbZkwELEQBXg@windsurf>
References: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/9] website/lts: align page style with the
 rest of the website
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

On Thu, Oct 29, 2026 at 03:43:52PM +0100, Angelo Compagnucci wrote:
> The LTS page used its own visual style (pixel and serif fonts, grid
> backgrounds, offset shadows) which looked out of place compared to the
> other pages of the website.
> 
> Rework it to use the website style:
> - use the #headerwrap blue header from the main page, keeping a big
>   title
> - use Bootstrap primary panels for the sections, as done in the
>   support and sponsors pages
> - replace the big numbers with round badges and use the website
>   fonts for the item titles
> - use the website blue, font and panel shadow in the charts, widen
>   the labels column of the weekly chart and allow the charts to
>   scroll horizontally on small screens instead of overlapping
> - add a contact button to the sponsor section
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Thanks a lot, entire series applied! It's really to see those
improvements to the website, much appreciated!

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
