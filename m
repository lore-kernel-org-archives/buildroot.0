Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EC6606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ObV/kUuc
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF1C280CBF;
	Sun,  1 Nov 2026 16:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WHpxlW157UK7; Sun,  1 Nov 2026 16:57:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7918880DBA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552247;
	b=f+MQZ9N7Uqxxkh1xQHNCrQv0asuPA7WpsHnlvH4schICzZMTONF4C/I/VrHxsbVwZkRa
	 uVwBjcDN+4erUznJ0+DiCU9v/lOyFptEJheTVuQ7Fl7vKhT/Ew3Wn1xcpk2fwHSzeUpww
	 CsFLXYf7J2TpeqEELiB8G/chxMkxmvZ2iDC1EqCkVGQQS9DCvF9g+JNjIU3zUhZ7Ws8vu
	 8OQeDmJN/KPOa9vUBhTjkcaVKN6TorvSMg+U7Wpu8lrZ4ZHx/ag8vkvh08hixjIkKIirK
	 zBUHz9kG8muqTOqt7WdTZISqcGDEJFSFwByXFfgd5KFXM9noMQjdk3sameAG2D60HqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552247;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1LJ+y74/Z3ndDt15FSFkAkhepNWo1AC8IENQ5uHIJMM=;
	b=rNVO4lWoDtTtZQWjXf4d3d/3U7D76bVNHumZx8DjDFYmwUaUBYRpIObIifLe4h92s6MJ
	 PRqojjmSBYnx320rtOUScy44JFvmuF8ZIAKcmNSZW5JWb/g6V92zQlqSc8tG9hd2i16rv
	 QaEk4foa6Rzi68DL2rPBShM2pbjR/GfgYqIaZnvpqwtUL3GxeHh/B+QIucGiA9aQnliiq
	 ajzZtTo0QtFxvPWgLzjX7aDq29Oe+ueB67L1evG4PCX/DZmIFT4bbCtsfVUIjGAUU0C3g
	 P6RJEj9YedtvjdzQrbBTZwRv8CIYkfVZU4z5G513jLnJTPUp4EjtfFiV2tfz12IO+Iw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552247;
	bh=1LJ+y74/Z3ndDt15FSFkAkhepNWo1AC8IENQ5uHIJMM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ObV/kUucau84pWDgRgcnhwscY/MvM5ImCvlPQexUnUFCNtR9A22irfq2MHivpYt4+
	 fsvRr6dvbg8w+6uZOXu4cl1w9DkWGn5zXFEB/BvH+cip5Vf6KghviH72NFqjGQr09p
	 eIrmt1yIOvMHWxX+mqTZSfyHi0HSDlruDTyn5+t5tX5T/syl4ByOm/zThpvtNi8spK
	 yRzkwqCCbaLqyv3I7ZpHT0RxPqwWHKb9F56qIXU6ckro9ZLj+qA/KN5cWfSwfxsJMd
	 Alw9hMCljYyyqOBHIc+QcnRJO14dVq6EDA3ALhluR2SDZWvno1Y2PyMEkKg0h5ihIH
	 r7ap2I8CfPKdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7918880DBA;
	Sun,  1 Nov 2026 16:57:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 138552AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0528540098
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oaWpycrR6MgC for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:57:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 95C9940076
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552244;
 b=jtZrCQ3zcCM44oxYdViT816LWOCJ7Ajpb/WQZp3ePI4+jF8QEwqTrCmZf8Sft/UBUNu/
 rdEBAFaj6ZxFCPpcnpFyBp7Qpn087L8ZM93Z9uskdgu+AQYEOeBBFq5z6tRgcQ7Upgp7T
 FirFM/lKaC+de46nGGGFQc7XO5tuqZdXlkLGssz9elkuWkq9BqFSHWrL22cLN65rgjXvp
 /6Y3PYNVJgXiyQqhVzfLiAcfeVovzfoWeKJwMfQlJvhSQ3BwJeVYsI455b8v8ZNHDQHX1
 p96YoROKDV4ikSg3FxAOjHD9KaFbqof7ofsbP85V70+/VF0K13n640UemZLaGf67Icw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552244;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=IroKjQUhPe/OdNvc9aDy4ecE8945dt4B07hQLQdR/cM=;
 b=ipCy6NlBuh+RfZjz0z9rXP6OukbAt0FFkfaeltDcM/u86FGMadk9jgsaAFeFCm7651YR
 AFx/FZuokpquNdHCIThDS7vBdZTJkNhxWm6No/WvMv6g10LGRcIRNl7JN0Yabl35r+woM
 J3T1JuQHfQU2xTkMPkzXq4w2aFu6NeyionEC2/H+kC5v89x1DnJE7o8SY2AWOUDJSv1UY
 3XfcH6IM1Onl1RISOvmaEnOyDTnOYYLDJKcUw1y24bd2Vv2wFcW13yaOah1g2ZbpHzbOq
 j4yHfKDn046eFx59hvJ6pAU+WKMeYoOP99oRhkmXOYwnslRYXRnkYugV/MDwfs3BcKw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=2OI6EQar; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95C9940076
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 006B24E41378
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:57:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id ACD6760750;
 Sun,  1 Nov 2026 16:57:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8CB131032912A; Sun,  1 Nov 2026 17:57:19 +0100 (CET)
Date: Sun, 1 Nov 2026 17:57:18 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <audvamscSipBOdkq@windsurf>
References: <20261101104535.1696412-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261101104535.1696412-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/6] package/freeswitch: fix build with
 ffmpeg 8.x
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

On Sun, Nov 01, 2026 at 11:45:29AM +0100, Bernd Kuhls wrote:
> Replaced patch 0002 with new upstream commit.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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
