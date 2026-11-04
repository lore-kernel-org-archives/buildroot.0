Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB08D606C5A3
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=InsA6bG2
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C226960820;
	Wed,  4 Nov 2026 21:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0VjlHyJwdR7; Wed,  4 Nov 2026 21:26:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B632C607B4
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793827580;
	b=YcxZqXZjsGOcZ99RDRjJ9bgufOvz3ieKo80MMRuuoLBYKeUAgS2wq5IcI0Q/MGLtgMhK
	 xEWH0WBd1FXtwoqobI9ndfKCB1iuP11PHBnow+7FPfbxhHPPs4ib5LesfEyDT7O7ehEeT
	 mZqAsg2LyZeG3gxCm0plzChWCbmjMsGaAuYztIsgQUEL/Zid+9Gwkw42znpjbXVij/LR1
	 YUlWEu+QohaKBLVz0ZQlZ0iZrqONy/7HaA0PFycA3/piNhfwrKUuv4pRpmsEHQ2mDMRya
	 uj4YS2HS5blTR8Aj3psg7C/u4P7O5kGUoSxItOFRBN4Boo4e+ZAqOZi2tkIf9xwLWSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793827580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lmy8qjNC0Qold+2FI+dNx/jIa9NpHsCfizO/kgjzVw4=;
	b=ev6kiSUZT2F2RVEvunRolEAnTjdUe4uryi9LSbopS82/7fbKRhekCUCoRaht8izRdSOS
	 jMGYcGFwAZdRPxOMSu76EwWGHbh7Y2nYPg/wfsrtiEuEwLZaaKhy+rdd62jmwdXlHVqD2
	 G21o7OPy7Rfkn8/bfKBF4OtSuRSzPgheGUtRHzYHEYACEayXSlJgC4TN+ICsOxg5aLBCY
	 ifvs6AhtbTteztcDDP42/VEC6LGNMF8lBYAo4uQYA/UcDNokfkVxNy6e3zrcSPP60Svxq
	 AP+2VlxatSddIiQJt4kQ6Z4LWwQeUjZCj8NJZqJNRoETaoiOnpw40vXRIE80GwuvGDQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793827580;
	bh=lmy8qjNC0Qold+2FI+dNx/jIa9NpHsCfizO/kgjzVw4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=InsA6bG28nBU0rZo0aoqb2Lf3TCgK0Vqyo9lt+ZuAz2ZH/vqRfSRbYDr2TR+nBIcC
	 J7DVYEF9TdNgOpU43JYFYpoYbxDY6zBBZ9Q938I9oHZX5y33wDCUkbVuaMz8p3zDZF
	 1HYvNbcQQiX+2ZptVtOu68+hiLuInUinYmYHY23BcGRUrC89BInHW+zN034cyKrlR/
	 GgZd57gWnXKMAQ15GL2XBYvKWlRs5yJZ87T/HdjBT50xgschQhtZ02DqjV3NK3ge5w
	 lCgfpnMnpdPM+OFK0tlqMNa+Kjvlq74w/d3Vl/tjd19aeP51oQr/1Gl2uAdLI+L8Qz
	 BPSgkj/8gIY+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B632C607B4;
	Wed,  4 Nov 2026 21:26:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD943362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3145812D9
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eynI8uLvHhOI for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:26:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D914381271
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D914381271
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:26:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9368C4E4070D
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:26:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 662105FAEB;
 Wed,  4 Nov 2026 21:26:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A873310329206; Wed,  4 Nov 2026 22:26:15 +0100 (CET)
Date: Wed, 4 Nov 2026 22:26:15 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <auui8m0LjUoUHMN4@windsurf>
References: <20261103135953.1452569-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261103135953.1452569-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/imlib2: bump to version 1.12.7
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

On Tue, Nov 03, 2026 at 02:59:53PM +0100, Yegor Yefremov via buildroot wrote:
> Changes since 1.12.5 include input validation fixes in several loaders
> (APNG, ICO, ID3, j2k, y4m), a limit on decompressed temporary output,
> 16-bit PNM support and bicubic scaling via the bundled uscaler, which
> is enabled by default and needs no extra dependency:
> 
> https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.6/
> https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.12.7/
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

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
