Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC35C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7844F60D4D;
	Sat,  4 Nov 2023 21:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7844F60D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sUJuP-GXu0gZ; Sat,  4 Nov 2023 21:30:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2CAF60BAF;
	Sat,  4 Nov 2023 21:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2CAF60BAF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 814DB1BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D26181EA0
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:30:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D26181EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G784SFdcEl4H for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:30:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A96781E93
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A96781E93
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41B721BF206;
 Sat,  4 Nov 2023 21:30:23 +0000 (UTC)
Date: Sat, 4 Nov 2023 22:30:22 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231104223022.5741ef0e@windsurf>
In-Reply-To: <20231001130459.840149-1-fontaine.fabrice@gmail.com>
References: <20231001130459.840149-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699133423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=48MooJa1Y5T1E4/IMtnpVNmvSXF7SsP8QWEFx4FDikQ=;
 b=Yfl44FTYQSayL+W0CK0EfJLP5DgYt0JyV6kZgpnNxHINcztf4KMy5UVxuydF0mtKNYx+C5
 oOsVmUnNhjCKER8mdmhWva/1fAvXELLo5Y6ZfcWBCbuyxzIDsuWeVdMEHjhpflscoiU3vp
 ZaES9/wOe12bQm2BerumEHRGW/Tvey5QaZAOI0k/lmUBikq7sq3ELSXOcrk5Fz4OWpq1dA
 lBcGszrvYpvPVr/vKCKExnzxlaRQOi6MPPQO0DeuU6qSYXwkBwN8bLhUNu3Rm75mpZaG3I
 SiAHl3Yrlmq8DCHxmbYmk3UGJzdJf+O7XSSTHIullbYJO3MBKXo5RMY/VTw/mw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yfl44FTY
Subject: Re: [Buildroot] [PATCH 1/1] package/memcached: fix uclibc-ng build
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

On Sun,  1 Oct 2023 15:04:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following uclibc-ng build failure raised since bump to version
> 1.6.21 in commit 6ce55ab0ed3b7125cd11ecfe8c18aaf156b5f060 and
> https://github.com/memcached/memcached/commit/875371a75cbf1f92350de2d1fa0fae4a35ed572b:
> 
> /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: memcached-thread.o: in function `thread_setname':
> thread.c:(.text+0xea2): undefined reference to `pthread_setname_np'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e856d381f5ec7d2727f21c8bd46dacb456984416
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks, applied!

> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: unsent yet (waiting feedback on first patch)

I think you should submit without waiting for feedback on your first
patch, it's a separate topic/issue.

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
