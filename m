Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BF1C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1745E4151B;
	Thu,  9 May 2024 14:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jx_JIXsuaOiR; Thu,  9 May 2024 14:11:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C76D741556
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C76D741556;
	Thu,  9 May 2024 14:11:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DBC61BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46909402E4
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4uszzs2TRL4L for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:11:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 135A4400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 135A4400F5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 135A4400F5
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:11:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE4701BF204;
 Thu,  9 May 2024 14:10:58 +0000 (UTC)
Date: Thu, 9 May 2024 16:10:57 +0200
To: Nayab Sayed via buildroot <buildroot@buildroot.org>
Message-ID: <20240509161057.600876ff@windsurf>
In-Reply-To: <20240509-optee-bumps-v1-0-fa2a6e1096a6@microchip.com>
References: <20240509-optee-bumps-v1-0-fa2a6e1096a6@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715263859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CuZe8sg+WtzmO0vQXKbey0vIzrvXEPbx0FfSPfr640E=;
 b=JkfjkqttJYzGydoQXSvMst7J2PhMQVKrrdWZcIZFwXAwx2BU3y/DhePo3qy9Z+95O86JdI
 EVEE292MYMLN4BtdIbSLMXH6w+8G8gKaDxf3VbWu5nNOl1uyfzGIw0rkq9I+fsQHjVf58j
 6izsTCSvOeze4Ly5jPOohFooD6eiBXbdY/1rplfKGyUE4zlsnufJJiBdPgpgZZgC+o1wLP
 Z+dFf9pyXsDOd1OJMkpM8fzCGtkei8w6zLdewEIHkiQaKq0Q7NrkBIR2TH9OcYGFlcGPno
 vfNYHYwgSqcMp3V4qg+feMkSR42w1v4sfodO3xvIaqogBf3RsURD6aGBgv2XZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jkfjkqtt
Subject: Re: [Buildroot] [PATCH 0/3] Bump optee-{client, test,
 examples} packages to 4.2.0
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
Cc: Nayab Sayed <nayabbasha.sayed@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 9 May 2024 11:58:55 +0530
Nayab Sayed via buildroot <buildroot@buildroot.org> wrote:

> Nayab Sayed (3):
>       package/optee-examples: bump to version 4.2.0
>       package/optee-test: bump to version 4.2.0
>       package/optee-client: bump to version 4.2.0

Thanks, all applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
