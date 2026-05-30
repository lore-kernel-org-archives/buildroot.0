Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C84CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 19:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C70D685367;
	Sat, 30 May 2026 19:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcjQqK3iPtcj; Sat, 30 May 2026 19:59:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3D2385368
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780171194;
	bh=VLNNBVmxwBIRbQORGZrLciuQnm1pXBMFJOahkBSt6QQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mJ8cmbelWtbeipPpbynCKEKvj4X714BFabzHJh68NIZVP98Qit5njCUwLyIgVO2yU
	 /wvUxv3TM25XWD8riXkWZ/MIXIRxzPFxOMZjIci4+h1FxY7HiVFf2mxpKpuGrDEoaZ
	 vYT2SSeUB+Zr1bi046kO6XEdZ4uEgCBJr7WBIveEqassGJ9P5QVcKsvJE8iH3n9fio
	 b5863bOUO/P40EyVgE1eTlGL5xt+szvAlWir6sW6n0C8KcFNCSnOqr9jKp2Jdtmbbl
	 JTSOekAzOtXOqRqfb6GiBfuFrEJc046ks2d7G92CD+C8csMz3s//lSqy4v3KZKJ2+o
	 YZQrbaM5s/hBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3D2385368;
	Sat, 30 May 2026 19:59:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 68136F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 19:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E1456F5AE
 for <buildroot@buildroot.org>; Sat, 30 May 2026 19:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJFrJJdlR-T3 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 19:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6DBF461737
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DBF461737
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DBF461737
 for <buildroot@buildroot.org>; Sat, 30 May 2026 19:59:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 200F71A3752;
 Sat, 30 May 2026 19:59:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E14BC6073B;
 Sat, 30 May 2026 19:59:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4D79110888CC7; 
 Sat, 30 May 2026 21:59:45 +0200 (CEST)
Date: Sat, 30 May 2026 21:59:44 +0200
To: Jack Wearden <jack@jackwearden.co.uk>
Cc: buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>, 
 Sen Hastings <sen@hastings.org>
Message-ID: <ahsi1KXsC1EYhWTd@windsurf>
References: <20260321192827.95724-1-jack@jackwearden.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260321192827.95724-1-jack@jackwearden.co.uk>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780171188; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=RW8Zo2TzRlSOQbtAJ8Ry+HuENz/IqNkDC/fd4hvTl1g=;
 b=MvKD6rm0/og7UXtZgvU1+NiJq/bvIqOujiUOq0bhm2HRIf9pDqFMAzcshBoRPiYFuoB/HQ
 8MN3T5CGLaNcT1fZLkdwlBzqycoxGEvYTK7BhI7V+c6iJLjpgPZiB8MQ7gRTxgh1BbQ2Zv
 HBaINOVuH1mcaI+9/2L+2arBD7JqK3T8IFU1qSM2Q16DyDAo0X/rhHnKGju5QpXuoj6JTw
 jVLYGOa3l2YqjoUxlW1ygb/jKmwd0HF+eEF5sVdw1szOCos81AeAm2P7R7LT0YPTDDu+nd
 MBE2A2t9A+VOci+qwxWY9MzLNz3vfbzrfd90l6I7s2Sj8QP80C6lJN8axHNRiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=MvKD6rm0
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: add buildroot support
 for systemd-boot aarch64 target
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

On Sat, Mar 21, 2026 at 07:28:27PM +0000, Jack Wearden via buildroot wrote:
> This adds support for compiling the systemd-boot efi application down
> to aarch64 in buildroot. This is supported already by the software
> and requires only a change in Config.in to allow buildroot to benefit.
> 
> Signed-off-by: Jack Wearden <jack@jackwearden.co.uk>

Sorry for the delay in reviewing your patch. I have now applied it to
our next branch, after doing minor tweaks in the commit title, and
also re-ordering the addition of aarch64 in Config.in to preserve
alphabetic ordering.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
