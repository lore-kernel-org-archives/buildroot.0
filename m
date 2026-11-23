Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29457606A327
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 10:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XW6T8pES;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=F2oX3McU
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F116880D15;
	Mon, 23 Nov 2026 10:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rVJao2Pnr4k; Mon, 23 Nov 2026 10:15:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 05AC880D3D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795428923;
	b=mHrsKsJrc482K7GH8cukPlUTg+9wNUnp+E5274Ldt1abrxibf2WdstDMqoR39UuehYwh
	 gwUoqEJGp7PrOgz7kO/y4QaIN71jiF5+APzi8qBge1nxV6J8R48tWvgTA04eG14SjnJU1
	 /Gej9ajiU84e1kYm9RC4jpES8vj7+wXG96SfoiKuiWw+KPh8zc3McUpjvmMpFXzqZLc+C
	 NI2OQOSvF92Ks4hZKqQRhnnlNnsbJC4WuF78g+KrewkYGGaRmSl4qfIjrYao9Evbyim3H
	 q6B/6S2PB1b+fRxMCUXtpzLkSGgW1Fc0zFc2SnIj+DqRYDPDCu7kAJydsOVkX1mww3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795428923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sI3dTQN5IpaAmhqsmsefIP2x8mQqZFCpOQPmMmqKm6Y=;
	b=fnM/2h4jbZ+gO4TDYf3MobnBe/yyiSSZVt2lW07ucIrgyVsCe3xI6wqQOwyK3RaVRSrl
	 QN8LIFuyOtknuTVf+Xdy4QDOzjmQW/hACVtU0LkvzkqXLD9KAwehDU8OzCTz6dRGViJo9
	 6wmbGSUIJwwiX5XMeIeggBag57sy2SGAmJI2sutVgy0csKQw78vawsQZ48i7nQdVrcNR5
	 tuUJKeumvKAFFE6k8PYKt0E3vtJmmppIDtwa0TMq3XwbwlQA4y1EMV2dKVRvF5tvf+G8Z
	 36F1NPbULDqruP50a6XGbu5cW59f2gsxataVqGLH085112SiZePmTlcjDV4eA75j2fw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795428923;
	bh=sI3dTQN5IpaAmhqsmsefIP2x8mQqZFCpOQPmMmqKm6Y=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XW6T8pESyVGZPmGDI3aNEi6iHyLzFmh76XXGBiyH5W8tGFarEPyIuGFcSaRE02F1Z
	 eSdySiAs8jt42HBv0SGieUi+oOtKALku51Qsq/Q0nFwS7ecZx4+p6NivZbHW04noVY
	 AsBrU09Y9sCNnXpeJ3PaNJwnIfDGtWtdszfMVqJH56daUhhI2Cxuy/Bbza4gBw/tAN
	 qv92IcvXsPKrfFZygqDNrccg3rV4QRoiwDTTCINzLH1vAlC4Ncp7P2HUV4cR+BwEg/
	 UaU6BVBWZvg2rD1mhoLV8NEd4vsxR5ONv0a/aPpJ8L/1zbgWF9dNFdqFWH+AIXslfL
	 mbvEhJEy/1F9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05AC880D3D;
	Mon, 23 Nov 2026 10:15:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F80C499
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 10:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7177D40098
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 10:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rFCzfXPYuB_O for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 10:15:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 046514005D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=F2oX3McU
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 046514005D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 10:15:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=F2oX3McUQHfFgSMiKHpztgIkM02S78m/csJj90gMLc32G8sjkR6x5D2u5CU7zo5nZYcx2Rsgd8EQ1h+n7n+1nqfQx4aDWlnU+21E57pwl+G0JUdTL0RVZUh4veDTsGpLCKpmF7y7vCi/9wqiqbuVp8+xpt1DF9EyARl08FI6RwgbkzjW9TXSS9LXYjUkJHwdhMTxQNIGx3f0/aoHomrnW6k3nlbvGEU3zNP8589eI1ckGI3jlE83ps93yWN9cC9wsbpvFERQEAB62RkoxIAH+lBxVCOioODa35cMi9thVnUo7BiVJtrIYa02VMmphdnQSCOPMJ0ZCCcLVJFa6WA/DA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=LCWediBPASKTbBusiK1L+CUfF8QVF2F6pI00MpUM4Bw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 549788864; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 23 Nov 2026 10:15:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xVR4r-00000007BaP-3IJH;
 Mon, 23 Nov 2026 11:15:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Francois Dugast <francois.dugast.foss@gmail.com>
In-Reply-To: <20261123091624.1331936-2-fiona.klute@gmx.de> (Fiona Klute's
 message of "Mon, 23 Nov 2026 10:16:24 +0100")
References: <20261123091624.1331936-1-fiona.klute@gmx.de>
 <20261123091624.1331936-2-fiona.klute@gmx.de>
Date: Mon, 23 Nov 2026 11:15:13 +0100
Message-ID: <877bi3n9am.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] board/visionfive2: point at official
 U-Boot documentation
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

>>>>> "Fiona" == Fiona Klute <fiona.klute@gmx.de> writes:

 > The official U-Boot domain is u-boot-project.org, not u-boot.org.
 > Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
