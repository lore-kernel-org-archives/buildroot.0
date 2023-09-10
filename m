Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD52EE57CD
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 13:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72E034093B;
	Sun, 10 Sep 2023 13:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72E034093B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdRQKaKCLdl7; Sun, 10 Sep 2023 13:49:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9003D4093E;
	Sun, 10 Sep 2023 13:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9003D4093E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75C131BF32A
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 13:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC8760B8E
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 13:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FC8760B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4mI57Qj3Oufr for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 13:48:57 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34493607F5
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 13:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34493607F5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21BB5FF802;
 Sun, 10 Sep 2023 13:48:53 +0000 (UTC)
Date: Sun, 10 Sep 2023 15:48:53 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230910154853.4f73203f@windsurf>
In-Reply-To: <7730963f2459b65138c0a4a07dec898c@free.fr>
References: <20230909104707.491203-1-ju.o@free.fr>
 <20230909170809.4d0fb384@windsurf>
 <1214dd8573105f0075de5019938a5d37@free.fr>
 <20230910140024.74a2e625@windsurf>
 <7730963f2459b65138c0a4a07dec898c@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694353734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TYho9j2ClARc/EIRMIGmxvOAg7OtvZ02tokz3tu0Fws=;
 b=UZb3GEBliHPHPUk2RnNsduotRgudqkxZwaaeTNLHYF+aHYfrE++UVW5dABPoz9C3XgdffI
 8WbOpcqXZiofNyj/bUzqfQnXRTrfdjS5goJ6nhudmx98pJ3FBiXfa39+PfJMgeRsYgd2k6
 uZR0z077F7oU4RZxy4JhEXkn5TjuUuD+K7CrMxxCHuwzpbKedd17/C253iEmwfPXBGx7uH
 jrb0ezptveavm5BOpaPAn+DaWxTWr6nnuCMbzoeJH7tfAdOxhzGq9o5QJP7XGXH8sffu5f
 CgK5kxBz2oxMHEC9Hg5xwMTdhhKPl0vNq7KPtkUf1hM/JSBHMo2iWRnGWm5wmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UZb3GEBl
Subject: Re: [Buildroot] [PATCH 1/1] package/zynaddsubfx: fix uclibc compile
 error
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 10 Sep 2023 15:10:28 +0200
Julien Olivain <ju.o@free.fr> wrote:

> In the meantime, this patch needs a v2. Do you want me to:
> 
> 1. just change the commit log, while keeping the current upstream 
> patches
>     with <stdint.h>, or
> 
> 2. redo also the upstream patches to have <cstdint> consistently
>     everywhere in the code?

Keep the upstream patches as-is, so option (1).

Thanks for the additional research!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
