Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25877C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E23F4085A;
	Mon, 13 May 2024 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYBXcMb2AQIF; Mon, 13 May 2024 21:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29CBB40863
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29CBB40863;
	Mon, 13 May 2024 21:00:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 633E21BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EC6940863
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6OqWTLSrCjf for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9EAA74085A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EAA74085A
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EAA74085A
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:00:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7D9CC0007;
 Mon, 13 May 2024 21:00:26 +0000 (UTC)
Date: Mon, 13 May 2024 23:00:26 +0200
To: Michel Alex <Alex.Michel@wiedemann-group.com>
Message-ID: <20240513230026.7ec663d3@windsurf>
In-Reply-To: <AS1P250MB0608AE15BA5CBF4C19C12B0AA9E22@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB0608AE15BA5CBF4C19C12B0AA9E22@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715634026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZjNw7VIx+4zr9tEgTXpXexbHV0HGewKhByKg+vQ1Fc=;
 b=BX1APLFE/7UYIUMjBsEPkMxZwwOzcsqNpje+w3xDzmy5utU5KBNUE7dnFgei4XJXyPVVn/
 9XSjLLp5uKAaBwtaYca94P+sgT/8hPoyKJUh5SlDRaQHYe3bJubryo5VOEeKiPozk6Gl86
 wiRZw22Q+KCXMvlI7BJD7mCvKKMu+hu856EfIlCgEwJTMtg61Ee+GftceIIG5aJ6LVNEWi
 CnGm19QUaDynCjCA8jnRc0Te7c9txa+27HY5xOjNVTqGQYM0rQ3b/fW0SiTzuOnXif5sQZ
 8WLbObb3yEPUmW+5/CN8/ty2krpISTopLyDfzVA0hFCOl8zGrKFL9HGgvyPOJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BX1APLFE
Subject: Re: [Buildroot] [PATCH v5 1/1] package/libzenoh-c: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alex,

On Mon, 13 May 2024 12:30:49 +0000
Michel Alex <Alex.Michel@wiedemann-group.com> wrote:

> This package provides a C binding based on the main
> Zenoh implementation written in Rust.
> Because this lib does not provide any binaries or examples,
> and the cargo infra does not provide any possibility to
> disable the --bins option in cargo install step, we
> have to override the INSTALL_STAGING_CMDS and the
> INSTALL_TARGET_CMDS macros to prevent failing of the
> buildroot installation step.

I have moved this explanation as a comment inside the .mk file, next to
the install step, and I have applied your patch to our master branch.
Thanks a lot, and sorry for the time it took to get your patch
integrated!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
