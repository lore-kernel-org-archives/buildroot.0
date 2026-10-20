Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D69606A326
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NZCseI5Z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=Yw1jcLia
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BB79810EC;
	Tue, 20 Oct 2026 10:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dS3D_X2_jFAY; Tue, 20 Oct 2026 10:21:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B269A810AE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792491669;
	b=tfXCteKUeB6Gt2cBVMHmyDC4cOu2XyMNcNIYmZa2BOha+11zJtSMgCwZwY+Wdmqh22SD
	 7Zms0rhHEGkSbTZkzjK4qoxridS7DKDMBgRhBkg6WBeiyklYgyYfjG/R+A3QnqVhTJV+X
	 KxGwdI7m5UaoV/mnFu5Jw/1wU6a1r+xbA1XJzbrlya4u7YEXpfBR4K7ap7kIm6pln1qdy
	 YTytPEHIYfqcZ7rSxTccppKZlRJN0wPsahdKPfv5THHP2RZODI9+mELF5pPjicl+Xca2Z
	 SP5jqGF3xV1yXI9hNU7KSrDVz1Cx0SJHmduLGObgJP59tWtJVVex2STRWwaR4nmUSaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792491669;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IRzc/GVY4xZzdQ9pwcPiXsiSXP7HTL8W/bt//E8N2fU=;
	b=pUKZe1j/rVR3s6OVZro95yvgQFU5hO6N404rUQZch781/M35hia1VoWLr1DRxSs/KafQ
	 8GOqii2DxMv22vyOzvGityNMSDnlaHEvpjzHn5WBDyi6/b9VC2lAmuJgFJjvhfeFqW4Ny
	 wjOr0bPePj69lD92Nv4YZ+p63QAX6LVg8aYah5kpmpxg5p2aPYMRR/lPOHv0EWUuuNF+l
	 BbqvOSfTcjDgb0UFgk9S3B0iItAWFqi3gjmsqiX6oLlOucOrC+v9yubhwWP+KrxKpS/mp
	 6ny84Pt1JFsg2UJZCLWE9RrnffwlF4ZdCFXMtWrA0GownMo6tC+MFJ5LUwhacVOJ8lg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792491669;
	bh=IRzc/GVY4xZzdQ9pwcPiXsiSXP7HTL8W/bt//E8N2fU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NZCseI5Zhtr5PsIdfK72PbP57Kiy7c4hiUHaR5fqO9TLs9k8dvX+d2AWG2ZPzCw3Y
	 pVh5WxhX1IJ1k4o1mKUeyM2GEXKpmELal8yIRZJAI7jaVh8BtHhQ+7kK/x6f4KXLqU
	 W/wiEYgZeipr+WtJXQnxg7sEn2RwUYyDm4xyoQ4/c0RabWprsGASuh0d6ekpiCAH9+
	 3efw5oBrPsKdDrzP2JnMPBKtjQJHzVaN/oxOFPT8wqzCzzxxLYHkwuP7DBUvGk2++8
	 hxPh1ITc66uWMUGvzHaQnrRF3BRh+04VAjDqeD858jUOEUZpt9TwO2APRnksqdh/yW
	 k+sVQgH2LNIJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B269A810AE;
	Tue, 20 Oct 2026 10:21:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6279B1AB
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F66A40741
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2unLd6bIzK9 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:21:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E170740750
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792491666;
 b=RnwMQunUZJj9ZlZGXLfcGnl9JHb6XAlgge6trSJphOojcnSi4qhDs4jXraldjWgBOO4U
 gquZME191CZZIVVUQ2z9+ib495oyn5zJ8f88+ssrWI50BD/XwlAujZROXbJkrjfBMikik
 JoHxo6O3Ldr0HEthQbx5m5Hkokiwv/w5HuqaH56PnVIwuNDL0bp1qt4h6b6nuwtgnlzyL
 1iYlnFmedmzzIIUCVtQoMrVxlgf0bgKTaXe6bLFYDbDa1EiHyQMNulrAiRBEf06mNoNNa
 LJc0EAkyjXYpsAiEu/b2er5Mosmy9uf6FC7Ipb0gBHxbaCeVa+AwPJ4tifXC00t3stw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792491666;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=CCDnBgn/Bt4O6q7wiOquIwuQnjwKxT/necnmWHwUk4A=;
 b=UsLUHwVfBD3ULDXEz8NgVG630XhaZdz48s6ZXqueSqKQL9hkBkF9yvPg25ITP7nUej2z
 uWaFv8sie/swoY/oICA1Zjg4oSYdYeTmNDi5GFa3/47AOVEyG3fnYMcmmBSS8d9G/sdN0
 T2oW2cIT08nS5JnnnqdnvKh9VAIBMnfPNlskqBtd70StG/3HapspudCbE0mKCqHGTdwq/
 wtaxrCnDXhgCilCYlUCqX75f8QYxokwsOsnGJuLzSdW/ojRRtmE89XMpEeZPCkHskM841
 vKLAhFVwCGKdxmdNL8RVxSWm/+PnljpP/2P+Y11RjM8iXumLIov3Pu9BM7MZ2i4mREw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=Yw1jcLia; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Yw1jcLia
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E170740750
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Yw1jcLiad4CwRAnf4VKkX60F58brqZSqFQrrjvR3QP1lTt1dKnQ9u8zOE/xIW/Wv0SzKXoWrqAtyHGn1Ofvd9IXBD0JVRfHDwGMs1XI9bJuvelmZlxiHEfFkDdpHzsHhChJyrh3XOPx0z8+MDy4IOAmGr+YZnoKP8vXhHzISh63sdfyQ2xDvjDmanp08RLMs96TsokCa2OqMpL0MEQz+67cqoH8H7uQsaAq36dF4nJli3nbzyNCHcsZ5lX+2jXnh9toSxys+EtagpYqt3dM0Xr90vEaXLcLJ97vL9z/ZgYNzWX8W51v1GHt3mxrCnA66Kge9mI2TLAh6Lg2CjBLSvA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=xGRtcEef40FwRswGGyTUJ7j0V1aYuai7HxjobeZAW0Y=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1409760909; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 10:21:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xJ6xq-000000081kF-1ym4;
 Tue, 20 Oct 2026 12:21:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Gary Bisson <bisson.gary@gmail.com>,  Refik Tuzakli
 <tuzakli.refik@gmail.com>
In-Reply-To: <20261019072335.575107-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 19 Oct 2026 09:23:33 +0200")
References: <20261019072335.575107-1-peter@korsgaard.com>
 <20261019072335.575107-2-peter@korsgaard.com>
Date: Tue, 20 Oct 2026 12:21:02 +0200
Message-ID: <877bjcd65t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/freescale-imx/firmware-ele-imx:
 bump to version 2.0.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > To match the NXP BSP version LF6.18.37_2.1.0.
 > License hashes changed because the LA_OPT_NXP_Software_License changed from
 > "v63 May 2025" to "v64.2 May 2026".

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
