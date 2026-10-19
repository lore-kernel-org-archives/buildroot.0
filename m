Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA94A606A329
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 20:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H5YWYuOZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80CE560714;
	Mon, 19 Oct 2026 20:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ly6h6fxC0k-j; Mon, 19 Oct 2026 20:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 17545606CC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792440430;
	b=R2KZ2EdaH//IFeEeL4UxAXt8YN1WO8m5PQz42x3Al9RnAfN4ZCiOLBXL208MFrW4WdFc
	 TSYwWsOZMCS/DT7DFjwmd5Vx8CqhloJK3czl4r0dp9IlYXcaoixc8Zgo64mvAxn73Hs8I
	 NcFAW0XefHHxRZDyMthZu/hBMfA00/Q+BOfgJFsqiUIffrjAk+U3XXJseXajOfQNhtfV8
	 zp7Jj43TGS1TVYBGqPrmWdwcKERQQdCf/D4u5MiZSn3BAH6b1eSHgxaY6PlohzHbyuueN
	 rxoKkfsuo+Bd+3w/7SNbAX8LCXfjTw4j3fKsxWk8f9/ZCjDRcdzz7UukE0LSx4++4SA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792440430;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0H2cYkZqd0ieLaZ1VUeyzYwQEFbYb+A/j9X62n9hecs=;
	b=C4p7xztxkL1NBhAuklOd5+RWhz9bOp6xOO/2PWapKQizqWWMi3+Gdi0e5RnS6nYA+rpF
	 Iwl90bWzG3BKB7l/YcCFFeT/x3jb61Sd9yrYYbHbssQIh3f7x9/JX3mL9WDrmgvb79xXc
	 Dnqy4MXN7nBMSJisu6s76+uPKdj8NT6DIf5VXxG0kRMdaQCLMgbNxdz9mW5ovsHnLxqhy
	 UDZN655c9uukxKVavC/P07ToZcvEtGs04TMaffrcUYXkaD+UZQc8cf+ftIE9CS+zUr5xK
	 EpfL4WB5boOdCkSTV5ZAOhTZxyaqlIx4IgZvzTfXrGHik4opNZLEJethUX2eHod4fpQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792440430;
	bh=0H2cYkZqd0ieLaZ1VUeyzYwQEFbYb+A/j9X62n9hecs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H5YWYuOZ72QE0P4QuPuK8AnOlgycaWwVkG1NelTOGh0Oh9fhQkJbLy4CuDstiXRnA
	 lsV81hMOjEBn+4+d5wBqvcjXOU3DJhVstDe57Wo2OgVO28YVIMYgI4nqUiG6ait32R
	 R3u/b9cgMDGBLzgh0DJPU7DQE7mhKNA/RWqtXei5fe1yAmLigi8NvhBiye8GLZISOe
	 wLZf3Qj8M7eSLt+GXtfb3lUAlVNvGAKwd82XFAM5AND//7wH2TghuOnt/RB941upnh
	 tN4f3SxhdSDHPu8KLGvgePrk8pzRUYFzb/u6gdH192BSesxIumPfy+lY6E7fbU9B/g
	 qLi085IiTTFFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17545606CC;
	Mon, 19 Oct 2026 20:07:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DF39279
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FA61401D5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X3N6JfjjDfCL for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 20:07:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 80DC84008C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792440427;
 b=R5b91xiCBkuh6Ta0GUQ041sBchq8B/MaVWuCqFcA87LeN6oWzrYeEX5O4PVcsCCbMmoN
 iywmpVVBV2+Yd9TGJZIHzIWXv1L864UQk5JQeNs5UMhTXYdUbKPDWs31rL982vB+gpZZs
 HwrDV8x+2NNP/T53JIi16irLGbmgANLfWazP6Ke490DPWQFGHMPxWm7XnLi6jMRpXR9Gr
 LHSsEh6P9zlmUDXHyqTKQs5fIXtJSFgujd8WvCfbOx9mK5DCej2JwOqTpmVQNNI5mFH9G
 NmuZiNNBgvYnjbV7BmBzBJzeZPOCht8ggpaIzqnpSoJ8xxterOFwmJgD4cugvO6M9ow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792440427;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=5DoK0d1AQ+kb69OHgQg7GDx2Su3RaUketUnrOnYLEiE=;
 b=dzcGPiI0LEvViUZlR8Zik1x6Q6QfK3sDYScojFXj56Xne2+7MmX/7FSAlSMnt6GDbE3S
 +6GE9t+rN+DDVOfTqBwOPocOd269JN5o0vfm+MV84ovN8Gh9p1gYUHHL943YlHJrLJJjL
 x+4WE7ZbiQH3Y7G4Du7aPapR+bU8hRTfVn4ifRFCbCUyzf3EkdfqJo1abGm9enKMtna7p
 DW9Z69G5mRcKWrjDpzn1poP0/u6iiGP6A0U0w4kIm3k8LUSktlbE1BzNIjATNrjEtFF3B
 8T/HJOuMlR5noCAIHHzY279GF5VJzsxtqPzbVO6RMLcBQcO5EvlQhxEvJiHqwXdezaQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="Giey/Xn1"; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80DC84008C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:07:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 18939C5CD5C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 20:08:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CFAE760582;
 Mon, 19 Oct 2026 20:07:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 437B210328D91; 
 Mon, 19 Oct 2026 22:06:57 +0200 (CEST)
Date: Mon, 19 Oct 2026 22:06:56 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <atZ4WWGyUafRfoq6@windsurf>
References: <20261004212047.1047271-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261004212047.1047271-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/3] package/python-uv-build: new host
 package
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

On Sun, Oct 04, 2026 at 03:20:44PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks!

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
