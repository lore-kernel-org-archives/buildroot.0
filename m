Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA59CA0EFF
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 06:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AD624009B;
	Sat, 30 Aug 2025 06:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AkrnfyoPnLZw; Sat, 30 Aug 2025 06:51:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B868400AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B868400AA;
	Sat, 30 Aug 2025 06:51:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C399D2
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 06:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E44540094
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 06:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1VfYvPEjfAa for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 06:51:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F1F0400BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F1F0400BB
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F1F0400BB
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 06:51:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9ECFCC90A04;
 Sat, 30 Aug 2025 06:51:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2648C60620;
 Sat, 30 Aug 2025 06:51:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E24DD1C22CC52; 
 Sat, 30 Aug 2025 08:51:15 +0200 (CEST)
Date: Sat, 30 Aug 2025 08:51:12 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <20250830085112.54efc1bf@windsurf>
In-Reply-To: <aLKFW9aM7cTdELxw@waldemar-brodkorb.de>
References: <20250829170522.2436314-1-thomas.petazzoni@bootlin.com>
 <aLIR6yJyANhTHgfj@waldemar-brodkorb.de>
 <20250829235155.721a4774@windsurf>
 <aLKFW9aM7cTdELxw@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756536676; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LntmYhy670Hl8Gts8im7e/F4wQfKLw3QtspN//Pxcp0=;
 b=k2JmV/HgcTc+c0TxFD8EZxoeYoopwOoTTjjLoUmVXtKe97AJN5IuY50eA5devwqWmd4K0F
 dXZiWWItdFyQex0F2Ix7hZFCYgVcU6VcSL08QFWCUbpX0/gt1T5nWy6Ku+gEx/rz6eV8LJ
 NylzLm7jhhmGNoQXUNplBw5UwsfPPermHKGQ7WuUGr1u7gG60FFZawBLuIIVog8vEAAMZr
 ib+/YVxng59ALjWC6q/Xy+JLYGyOhnPS1Y50hV/tuPIQfdIuV0GSHYR08yBnuCROj1Ztaq
 kTzC4mNwnTodNWZQHOa8MK4D2BZMu/BeU6evNJEk4CHlGpba/L9GNBKB1ydxcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=k2JmV/Hg
Subject: Re: [Buildroot] [PATCH] package/asterisk: fix build caused by
 libjwt bump
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

On Sat, 30 Aug 2025 07:00:11 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> That is not true. I tested it. At least a basic test as always:
> buildroot$ git checkout f11b9db0b5f150d73e10a0c25989e2ec6300588e
> buildroot$ make raspberrypi5_defconfig 
> buildroot$ make menuconfig <- choose asterisk
> buildroot$ make
> buildroot$ file output/target/usr/sbin/asterisk
> output/target/usr/sbin/asterisk: ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, stripped
> buildroot$ ./output/host/bin/aarch64-linux-gcc --version
> aarch64-linux-gcc.br_real (Buildroot 2021.11-12449-g1bef613319) 13.3.0
> 
> The reason for the failures might be a newer gcc.

That is very odd because the failure is jwt_free() doesn't exist, and
indeed it doesn't exist in libjwt 3.2.0.

> No, for me it is okay to use the bundled one and remove the separate
> package.

OK.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
