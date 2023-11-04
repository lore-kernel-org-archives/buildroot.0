Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75090C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 13:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C442C81F2A;
	Sat,  4 Nov 2023 13:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C442C81F2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ni4ckmRbrSAQ; Sat,  4 Nov 2023 13:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1257281F0C;
	Sat,  4 Nov 2023 13:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1257281F0C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26F1C1BF30C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B822B60F32
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 13:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B822B60F32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RsJ3wBGWtGz9 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 13:35:32 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61D2760F31
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 13:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61D2760F31
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20F85240004;
 Sat,  4 Nov 2023 13:35:28 +0000 (UTC)
Date: Sat, 4 Nov 2023 14:35:27 +0100
To: Maciej Grela <enki@fsck.pl>
Message-ID: <20231104143527.075bd95d@windsurf>
In-Reply-To: <20231030132841.3052429-1-enki@fsck.pl>
References: <18b80c0ce62.cb399136547843.6065948676717076989@fsck.pl>
 <20231030132841.3052429-1-enki@fsck.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699104929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3xzWM35QrUk5Wuug4t09uIgiDAm62EK9O9xWQxtzaKI=;
 b=YJOlTZwpeSQ+fhvCK8XVC0CGnKg8CvdHjEnoQyJLkItED+cEZ5fUfcj+k72iBsyHWVnWqt
 w47Z4JI7GBljs5TyYLoBANTgg50HbpGyHfIMzf5paBzQN6K4xZzPSqvcNPsCL6g5hcuyu+
 TS3Cy4UvZ00vQ506GJnKF8rOil5RDDTBov4MH63fPzNySTGybRjLH+52oCsRFWRLqllxsd
 VVesHrEQDSIW2VaiwRYJmpV+u0dkfK4SOLmhk2KWrJ6x7zpYTzVKFIwsFkM6Jf/y5quZND
 zq1DPcf3pMfFvmdO9YfGNrmQe8Oh5hY6JZYRWz6cuaX6PN9tZw7BR0rMrXgAdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YJOlTZwp
Subject: Re: [Buildroot] [PATCH v3 1/1] package/spirv-tools: fix build issue
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 30 Oct 2023 14:28:40 +0100
Maciej Grela <enki@fsck.pl> wrote:

> spirv-tools requires a toolchain w/ shared libs, add flag dependency and comment.
> 
> Fixes: http://autobuild.buildroot.net/results/53b3cf124d6c299398e620120465eca396ddcdff

This first build issue is a configuration with
BR2_SHARED_STATIC_LIBS=y, so this patch definitely cannot fix it.

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
