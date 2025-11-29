Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB92CFD2F6
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 21:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25AB760776;
	Sat, 29 Nov 2025 21:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWZULtH-kU4f; Sat, 29 Nov 2025 21:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F28E6077D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F28E6077D;
	Sat, 29 Nov 2025 21:17:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A80C6273
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 21:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A7B740B66
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 21:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtSUOg8LgGIF for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 21:17:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 921FF40A86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 921FF40A86
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 921FF40A86
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 21:17:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 160644E4197B;
 Sat, 29 Nov 2025 21:17:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DD24260706;
 Sat, 29 Nov 2025 21:17:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1C3C3119106D4; Sat, 29 Nov 2025 22:17:14 +0100 (CET)
Date: Sat, 29 Nov 2025 22:17:13 +0100
To: Markus Mayer <mmayer@broadcom.com>
Cc: Julien Olivain <ju.o@free.fr>, Buildroot List <buildroot@buildroot.org>,
 Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20251129221713.364a5085@windsurf>
In-Reply-To: <CAGt4E5tGGkOAtDYysD2DcusQZNhfb6CV5mtJPPNn_oWwr+M04g@mail.gmail.com>
References: <20251123133431.1499202-1-thomas.petazzoni@bootlin.com>
 <fe64d9aca519af339d5d30054c162d0e@free.fr>
 <CAGt4E5vMkqsHt2sUUqLWERZyRvQXyp1Z90E4wx8yPRP6CEiWgg@mail.gmail.com>
 <20251128102146.2afd777b@windsurf>
 <CAGt4E5tGGkOAtDYysD2DcusQZNhfb6CV5mtJPPNn_oWwr+M04g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764451036; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=y0SP+sz4Vaq9nUsa0XMAgvXXwynwCmby1y8etbtmHfs=;
 b=OE4f5+buvEX/hkcAVCoXyJwtXr+EDRHjSW6KcscEuLbqeVqa36fwqUY6gJt1EXCwYlJ2wp
 /HX/+sT1SrRGATxCICzZzGHDKbDrwUQoLX9XAibWDSHIZ+kmiwCpDLurMWf2ydROoUk9Hl
 ocNaXEGm0bg8qLU7M3GXhmmVxxy0b7/mLcxgk0OGyvZLmBZC/f8mEJ+8PiKqHduJvjbkXA
 vddshz/CMKpdyW6I372W3zgYimnoZFtY1i0iAUSvlhjJR796MV7aKbaiqy6JjC6NtHNf9s
 frkpeP93OwdGM6X+4+WK3o7avbvEx7GA8iBMPkWQW1nSpm8Bz3cMqL5uXlqMQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=OE4f5+bu
Subject: Re: [Buildroot] [PATCH] package/e2fsprogs: fix build with headers
 >= 5.10 and < 5.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 28 Nov 2025 13:16:24 -0800
Markus Mayer <mmayer@broadcom.com> wrote:

> According to [1] and [2], e2fsprogs does the right thing and will
> propagate the "not supported" error. I'll see if I can set up a test
> case that will trigger this function call, so I can verify the actual
> behaviour.

Sounds good to me, you don't need to do a formal test to verify the
actual behavior.

How do we proceed? You send a follow-up patch that improves mine? I've
anyway had no feedback from upstream.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
