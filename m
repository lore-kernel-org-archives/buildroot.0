Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90DC606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 08:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QWhkrg6N
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83EA481239;
	Thu, 22 Oct 2026 08:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1yMrQ9V7wt_D; Thu, 22 Oct 2026 08:39:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8763980C0D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792658386;
	b=E9nGpfJwAsT18R25gLIb132GTCJ4ke+kFPrh7eURNJJheVN03YyxlYpqUukZ2vdyy0Dq
	 nPUflr1upbLFKs8aijotlpiyO9/Wuhkj6aHqG5XZF9wtCkJffAqTg39P9L7DkQuexg3gZ
	 nZ6NNynheFAAFJZGthm+s3V57PK8jfqjdqI8+NBDz68uEFkOJSdc8Y8KmvfJSvjOenkGo
	 yoM0IGrWoSTxLrLkHpqGx8fIRMfGGt8IewJDVbo6yZQR0rbbm7eYhC5Jssg+iTFKHOn8L
	 qnpKZZH85MYd0BIW8fzd1OElfMRaHMx7GdnskPz0zl07zS+Dpd9mO+RgrhboIa/735g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792658386;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TPjc5wOVeaU6uNC8HMF7acF9RkyVrC1SUHGdwmNhgqc=;
	b=lt3G3GnIJEV2JnDdXHK8oCAHn5tGsEucloYZRTgpnDDDBK4vuP4Mg5SE+sH+hPmXreSv
	 u22WKuBkapeL+s0xYlDsyUxKOox2Mk5K6ctjraUBhk5Gclid/L89PKPlcFDqI+5siMGbY
	 jtg3IEonmCBEzHZCzWsKotrxtZhwt2g926zNpQyJdAxxtocxg39elVw91sP5Mqm8k6IVY
	 oy7PZhy6LcTNmk7HjngQl9UdljVD8lYIaSll561u4mYj2Nnra69iubijK4Gl43445/dcR
	 F6fEIcpnMSl4H1hJ1n1jnaDj8yNhCHFAcHE9r6YzmXEXG6v7q7CwuL1TUMzn9vVcpuw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792658386;
	bh=TPjc5wOVeaU6uNC8HMF7acF9RkyVrC1SUHGdwmNhgqc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QWhkrg6NIn1XW/BxIw+YJWzK6bI3dFHp6rdonCMriSOWnmKcGdKq8yaJUL1YVeblV
	 W0UjvNXOZP1dxB6HmSctLud/3yvJxpDkB3d2j359QIseAqxBG6DkYIFkogpgmS1BDp
	 R9ZZUAVxlPmCzXkHka4poU2fxBXd1a+v6l+4UADoObeYk2AegAu6u25qcyXMhrgH8T
	 jENWMD37q0eDODOfIuBKUtcz/IJYTzsUF90ydEm2RMXPnnBPyCBns+HGZeyyFC3Lsm
	 pxYe4WRvn6ROjNkhgQkrQhHKJFO1bf9rq82jvZB75qKA4E+a3115aqp8FGbyqFdEfb
	 qgTkAT5O/Ozng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8763980C0D;
	Thu, 22 Oct 2026 08:39:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09E1D235
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4C7F40599
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTWwWhKNmvnl for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 08:39:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1C76240578
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792658384;
 b=ldyr7AREQWz86IsAmtbd1WJijtlmpndoglydLsTKzbgQCjuhJ0MEUdaVFIHNjFo3z4xX
 y05aRb98R8l1DrZOQWNTtbH94VUim2u2KaDwrM9Y5EYjmoq2FM/0nJeNAbzapdfUEXXu4
 206fnxWTRmmTUzMwh0Z/BeRZ/+McdEgWjd7IJpVR3auBIjcDL/1TO0IOkQHJjOh0IduEg
 2t4BLiAiqc41MUnODsuplB9mSsbvWadEfT9iuxddPFPqOim09EeEk+7A+f3PqtlWLvtng
 Y9vS4s5mOM2wfQhHHtbrLjzzc3/dEnacfJsl+vFNwau0pyZ9ICkHIf9KQjfCfU7IDew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792658384;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=djeHSrgbZbXuXbz/9tw3oyoRKWzmwkHvs5z4xPSZS78=;
 b=SIdbdfxFvwKXl56PaLY9do997AoQED55lnpZvwhPZIH/AdWnGFc9xHhDF0nkriNnTR5k
 ERP0g2XLMTbDx+3IE1gxmXBXJmJxGCtdiOQLQvbcw2IcxUzggUwZvzLthaH1ecQ69ZZT3
 /yE5VyifV+tY7x2XiDMOvgv4DTdnFtbnH6enTJBPgZefq5/PlSNH1Hl5z9sRMwTHOmRZm
 /LMWDRf+XBUhiMgtcPJ78hpL417ejwJpBM5sw8r3zPhRI0cJFgRJqxMLNdkekUMj9zT4y
 S8FEaEl5X7lX4gNUKLolr0Uk2oLTGTlq9rhxBEJxLQNhZCgENTUp0ZI0QN4Mtcomh8A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=oFxMsa+l; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C76240578
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:39:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4054F1A12CE
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:39:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 11FCB60360;
 Thu, 22 Oct 2026 08:39:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 285D210328FE8; 
 Thu, 22 Oct 2026 10:39:35 +0200 (CEST)
Date: Thu, 22 Oct 2026 10:39:35 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <atnLwlTp6FBYUHuC@windsurf>
References: <20261022072329.2255438-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022072329.2255438-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/nuttcp: bump to version 8.2.2
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

On Thu, Oct 22, 2026 at 09:23:29AM +0200, Yegor Yefremov via buildroot wrote:
> The change history is available in the header of nuttcp.c.
> 
> Drop 0001-susv3-legacy.patch: it replaced bzero()/bcopy() for uClibc
> configurations without SUSv3 legacy support, but Buildroot's uClibc-ng
> configuration enables UCLIBC_SUSV3_LEGACY, and 8.2.2 uses these
> functions in many more places, so the patch is no longer needed.
> 
> The tarball hash is now locally computed, as the FreeBSD reference
> only covered 6.1.2.
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
