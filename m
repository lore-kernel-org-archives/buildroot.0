Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4A9E73158
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 12:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 641D683BA3;
	Mon,  2 Feb 2026 12:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YfQ6Fq9rXkkJ; Mon,  2 Feb 2026 12:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 255D58390F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770034464;
	bh=Jyv3X7M5Ov8TJE15J84zCI324KGpZgDTFs5n71blHxA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k4L+VfWPiNeFXh4oRPouvuZCzhVZQr8mcHa5Xto9dh3FjiZ2TRKR6A4RERWYVTBkq
	 IOAEj6j3KPdBJZb2KNnjuaS3pUy/MSCz8H6sdQv0aUAsJPx9nRUgpQdj9QxCmGijpe
	 eOZ0qZ4BN0GsHFER18UKu03EJsVebY7KBb9H3sw6ACX0qIyIWrlixYykV3R1P7z1ZV
	 qFOTLtBquW6xBUQ0ZTe8DusDDFtshlDMkr5FOe4gRl0tLP7v3gljFA/J2VErFs3vFr
	 vshqPd5muYJUbNnlMs5WKbuRFzqqDJg7LZSIRBPN+91hFBc6hcG3GtrHMVIbULXn6y
	 K83V+CS6cWdbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 255D58390F;
	Mon,  2 Feb 2026 12:14:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FF4E1E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 12:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 823B640A64
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 12:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kF40gRqh4mz4 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 12:14:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 900FF407CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 900FF407CC
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 900FF407CC
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 12:14:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A40FA1A2B8A
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 12:14:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 78AD460767;
 Mon,  2 Feb 2026 12:14:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8BA1E119A8888; Mon,  2 Feb 2026 13:14:17 +0100 (CET)
Date: Mon, 2 Feb 2026 13:14:16 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, 
	Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Message-ID: <aYCU_V8-rC0xqcIY@windsurf>
References: <20251206111321.559370-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251206111321.559370-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770034458; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=nmK4yIwKVHr92COtJ+Hvvm7TWH7WtfZZuC/LzhE0BA0=;
 b=JFn6Ke1HX5WioK5E1UKTDrAAh51BwbV1XjmS6XkLfNQfqEO2PWmdtT9/awZS/iR5CCOPwq
 /0E+z7nSbL6GZh9WhaHWllTWjFWezJsIH3g4JPWrTOI+LTtF1EwapsDPa4zbYTyzalcDf+
 ldTE7PNam7DCsj5zzsWOhV8GG53FFw7arTx2lh9XAMB1aCYXEAbcauXH2eKfheVz911uoh
 XznTc/lqTHOG9XTDW3x51IBWr4Tu9tg+rFJXmpZ/rm+BdTrsXKhZY31/ashRgiqJp9HB8H
 QEzZDQZZz/zB5XAs0eltziZ6eV/PuNasVKXXnx68Ho+0jFBLY+inoQ8j2Pixhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=JFn6Ke1H
Subject: Re: [Buildroot] [PATCH 1/1] package/shapelib: fix build with
 gcc-15.x
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

Hello,

On Sat, Dec 06, 2025 at 12:13:21PM +0100, Bernd Kuhls wrote:
> No autobuilder errors recorded yet.

Since then, there has been one autobuilder failure, so I updated the
commit message, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
