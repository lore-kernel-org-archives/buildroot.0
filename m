Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59927C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F046B4ECE3;
	Mon, 20 Feb 2023 22:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F046B4ECE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YN5rhaRcaC3B; Mon, 20 Feb 2023 22:40:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF49A4F1FD;
	Mon, 20 Feb 2023 22:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF49A4F1FD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27EFC1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E883281911
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E883281911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7Ksa7fWqo9T for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:55:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A11F380B55
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A11F380B55
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:55:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 315081C0002;
 Mon, 20 Feb 2023 20:55:32 +0000 (UTC)
Date: Mon, 20 Feb 2023 21:55:31 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220215531.7b3a1783@windsurf>
In-Reply-To: <20230219172440.519540-1-fontaine.fabrice@gmail.com>
References: <20230219172440.519540-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676926532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k01++IUFOpOo81ccWH3YHQ66JWVFZV8dqGlq3n/w0LA=;
 b=iXUcL73HgridyEbkTYeDl12jfHFcTykoRe4G+rAsefBIn53UhuYJD8fyuUFSvHDTp7PV4F
 JIPDxO2fsLhbgZYuxeDn2QlDvGXf9AhiavA2D2pt8IANk2qIy68A+caSNqiSxRV+zssXe/
 nNSJMNWLa13OvZnxZJuOzCRb9QBkK/aKaCwEGmFY/4jonlOyoiINKiOuirocjj538H6NcN
 Y8u6Om84tDoxL6LjGsuLXPsanp0vLgzn77ezsxCQLqozdtSB+mPeeWbNWSNHJGsT0jB/RV
 Ffvt/iBUWePpKQYjKod2fzM5l18+PGfzFiVbLIPgk2AyBLLy3xlwtHNxh06C9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iXUcL73H
Subject: Re: [Buildroot] [PATCH v3,
 1/1] package/libmodsecurity: needs dynamic library with libcurl,
 libssh2 and mbedtls
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
Cc: Frank Vanbever <frank.vanbever@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sun, 19 Feb 2023 18:24:40 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 9fc652a373034118535397fdd4042ab9f8fd7adf was incomplete as
> mbedtls can be pulled in libcurl through libssh2 resulting in the
> following build failure:
> 
> /home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/powerpc64le-buildroot-linux-musl/11.3.0/../../../../powerpc64le-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-4/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/lib//libmbedcrypto.a(md5.c.o): in function `mbedtls_md5_init':
> md5.c:(.text+0x0): multiple definition of `mbedtls_md5_init'; ../../src/.libs/libmodsecurity.a(libmbedtls_la-md5.o):md5.c:(.text+0x0): first defined here
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4c235e46188f23d1a48297f4e5942cec7b25959a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3:
>  - Fix syntax
> Changes v1 -> v2:
>  - Update nginx-modsecurity

Isn't that a bit madness? If libmodsecurity has its copy of parts of
mbedtls, but didn't take care of renaming the symbols, then ultimately
what we should conclude is that using libmodsecurity in a statically
linked configuration is not supported.

So I would advocate for simplifying the whole thing and just make
libmodsecurity and its reverse dependencies depends on !BR2_STATIC_LIBS
and be done with it.

What do you think?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
