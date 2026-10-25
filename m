Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC37D606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Hg7Edoe7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B22676061D;
	Sun, 25 Oct 2026 21:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPlqk_qyws9e; Sun, 25 Oct 2026 21:34:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C6FF26060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792964080;
	b=ravNfapIPw00fkeCHajDmLd+OZTM5sJ17NjtEeNb/C98UrLnc5g7s+DkxPxY0QPdWaOw
	 LlbKVxK1EX2aIXUpAQRX/nQzSr/xmawjOU9rZo9OGbCgDJzNbeimbSS+CWeottkqWtVNu
	 SEQnKXyi1+58/C1GZJN+3e5epgSNs7pr/+E9pwsKlHNec72kySH5IIr7xqTQVuqpKpQI5
	 GiaprHrSdi6Ev8SkGkyNBPyU3JcQWbxvdAW/2dR/Tw6anOPHRUcBKL+ZNv1P49TSZyGcE
	 8QFPzjaRkpTLDcLbB38kEfPSlqDeAh/pX74VlLV7bMkPxZ19R5bwnAdPYkfEMqSjF5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792964080;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9/Pzj6M7eTwQ6wOcoW4sLxAmhfXfHgSSOJkrqBQFTu4=;
	b=AqJ3AjG4hwk3VL4eC9FLgqgbp+wXlT6ZITao5dG0CP0dTExU6eHY1tYa8hzTrHMHFbkD
	 9XTHfBeg7HeVxwkbNU/SdPAvq73US/lQ07S5hFHg5mPCXYxnyYVS9cPMcj1Pp/vGdQjDG
	 kcPJSll4ItUfOCmnRg0WUOLJazJYzIFvBkN7h73cfSPGN7C8KfIrtd5efnu3dLMR7jYM7
	 5vE6c8fSntssdnJnDFd6gxHVoRaZldaW7jNbVUUcP2zk4Qf1qjnIrWiv2Uo/W6VcV7cKk
	 6ubni+Jd1mR10mhzKF19yQRYcQdGZabl8P34+1nwhxpeRgGoVCa9NlsFrF6v/0NyQ+Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792964080;
	bh=9/Pzj6M7eTwQ6wOcoW4sLxAmhfXfHgSSOJkrqBQFTu4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hg7Edoe7xP9wvhWTJs1yP0RMZpmIbTa1N3ZgZrtVSEyebunCrfujxj7h6+uzXkPaN
	 i5PNZeZvbGkWdXImOTdOqR7jVyrT/wHaru7GkYT/p3zlbHINlW/IKV/pfqlB2Vm/WY
	 +csR269KawyrL6d/U1GaE5UunI9IJ5oRC85FiNKiroYAdKTOPhe+LpalVzn4+C+YGS
	 Uv7ljXqyX2LdxnTOWaVoENCiQ5kIu1Un4dUrdiwFkGNB3o8Ox7CP5E6q3lITbu/IqN
	 EG/1TyWSXExaXOzc7e46wVF4RuQNi4C0NBOyzPJkx+1blfjKHLBxyO+4isk3CTEqch
	 Hy4tXk64+T+5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6FF26060B;
	Sun, 25 Oct 2026 21:34:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E6B54D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 203B36060B
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jdbkAgsrp6Ey for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:34:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C6AC760607
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792964078;
 b=FP0LeRHcbyxjaZ3z0WlmhND6uZQzDaYNTNpGjK+5nRZ1BpYDu/S4Q1oc9u80DbNjiz9Y
 QfPWSSX9X0AaFFOwRB7btmGmiX6oYC4EqFhxLR7eoDFy9if6jHYD+ExI5HuuqrXhQ3eDM
 x7pjtOig75mBN8Uek+jURrQqKEWFCL2CTdzQAvCP75PYXvDgEUTewl3YQkNZzXbR0d7Lq
 xSI+DVJD+adQzAqYA9Vdh+tt2//HqBaViPh8JE5fFsqBFpGutz8obDa3xlYhkuOoiG1gI
 YLhTQ273SHajQQ0Y4Q+lZFCttWwu745YqduqXavFFSMRdIrbVIm4t5G/IO+rJczUj0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792964078;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Wk5dghaXzrKFNEYAAtJkKHjKQGrCLs+06vngcKb5MBA=;
 b=MlfoAvJSSJhvyRFCPRPBC56rTNvYANkY58VhNfWotEKSwW+0u2hlpWe22W/m3E7C0p5+
 5/40HHvl+KmGP+qKHmnWE4ySqMuY6HeZ4iuj3RZBhTxyiZ8GpCLO7PdKV/mmzwOUjoCB8
 nl+pN4bYC1MU2e+O6XdKaAYPaO16dOiMTPQH3RLXsbOfKHlIOQ0nRTfnwAwm5tAEUBi6I
 XXUZlMutgNms/lCwoqggepXVxrZTF/Ghfcu5MRS3Ul7rJnmPP8xZ3ntb3gtgO/qNSjH65
 ZYn1qdtC3G9TDU93cFVBgqBbUULpHpy3gQn5x6fa1P95c0XWpsbP0Md90IDpUPHcEDw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=koHJYacm; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6AC760607
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:34:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7EF4E4E41308;
 Sun, 25 Oct 2026 21:34:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3E33260740;
 Sun, 25 Oct 2026 21:34:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 62CFD1032902C; Sun, 25 Oct 2026 22:34:31 +0100 (CET)
Date: Sun, 25 Oct 2026 22:34:30 +0100
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Stefan Hager <stefan.hager@ginzinger.com>, 
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Francis Laniel <flaniel@linux.microsoft.com>, 
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, 
 Robert Rose <robertroyrose@gmail.com>
Message-ID: <at513MzmD8WlDjN1@windsurf>
References: <20261014195542.257729-2-buildroot@heine.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014195542.257729-2-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3] package/libabseil-cpp: require wchar
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 14, 2026 at 09:55:40PM +0200, Michael Nosthoff via buildroot wrote:
> absl::StrFormat() unconditionally includes <cwchar>. So a toolchain
> with wchar support is required.
> 
> This was introduced to abseil in [0] and landed in buildroot with the
> bump to 20240722.0.
> 
> [0] https://github.com/abseil/abseil-cpp/commit/5dc2cc1a6a992e09d9cf930cdce7984640e2b7e0
> 
> Fixes:
> https://autobuild.buildroot.org/results/948/948463b01ce52456179b06ae17d4ace9a823f92b//
> 
> Fixes: 0d40b47866 ("package/libabseil-cpp: bump to version 20240722.0")
> Assisted-by: Github Copilot:GPT-6 Luna
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 

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
