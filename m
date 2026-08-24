Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCDCC5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 17:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7143E405F6;
	Mon, 24 Aug 2026 17:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJDjTV4D8QHh; Mon, 24 Aug 2026 17:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787591771;
	bh=muhFUI0jgE3sDPOZuTURVvijSa3xEhMMu0RoiNiGgzc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YaCQe4Y3gDSQjmEX+ToZRlcOyhm+7dIYupQToidMbyNX9eemMBaBQZIasm2waOieR
	 cY38Vyt/jaqokz/3lHQSFH4LPFLnSySJkLQLVJE46xAUncltRQnIBcLuBcB5GgcQWB
	 CyV/cfKbNesmP2yHIVJnhg7gDm5l3OA7YxMgoYHeYyv6TRDsEt2vjvh1urAHgyUM5S
	 jDWF5EjCsX64h3ynrfMvB3wz0ud4kBwsOEiPhxXipDgm16kIQ0nA/aU2onrXBV8DnQ
	 i9pmWPUGuZ2GCksAcxhPpTzyPw7Q1B0PVQQDPRA5uy3tOKeov2ZgZN3UJo5QH4gBQd
	 00Vayg0MDIXyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB5BC405E0;
	Mon, 24 Aug 2026 17:16:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A754386
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 17:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50A204005C
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 17:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPEjhmgwsuVk for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 17:16:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4530B40029
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 17:16:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BBE954E41393
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 17:16:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8AE1C5FFC1;
 Mon, 24 Aug 2026 17:16:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C681211C799E5; 
 Mon, 24 Aug 2026 19:16:04 +0200 (CEST)
Date: Mon, 24 Aug 2026 19:15:58 +0200
To: Adam Ford <aford173@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aox73MQnOLsOq-tt@windsurf>
References: <20260716133001.2147463-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260716133001.2147463-1-aford173@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/libxml-parser-perl: add
 host-libxcrypt dependency
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

On Thu, Jul 16, 2026 at 08:30:01AM -0500, Adam Ford wrote:
> host-libxml-parser-perl compiles XS modules against the system perl
> headers, which #include <crypt.h>. On build hosts without libcrypt-dev
> installed, the build fails:
> 
>     .../CORE/reentr.h:126:16: fatal error: crypt.h: No such file or directory
> 
> Declaring host-libxcrypt ensures crypt.h is present in the per-package
> host sysroot before the build.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Sorry for the delay in getting back to you. Could you provide some
details on the environment/distribution where crypt.h is not available
on the host? I've tried but on Fedora or Ubuntu, as soon as
glibc-devel (or equivalent) is installed, it pulls in
libxcrypt-devel. On Archlinux, /usr/include/crypt.h is also present.

Thanks for the additional information that you'll provide on this
topic!

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
