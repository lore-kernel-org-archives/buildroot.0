Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910DAC47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 201C640A66;
	Tue,  2 Jan 2024 22:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 201C640A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXdOodl7J4re; Tue,  2 Jan 2024 22:21:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D07B40A7B;
	Tue,  2 Jan 2024 22:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D07B40A7B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 963611BF276
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36D9840A75
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36D9840A75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6FefFz_01DtU for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:20:08 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93ACB404C2
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93ACB404C2
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB285FF803;
 Tue,  2 Jan 2024 22:20:06 +0000 (UTC)
Date: Tue, 2 Jan 2024 23:20:06 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102232006.2a66c6c5@windsurf>
In-Reply-To: <20240102204208.1662781-1-fontaine.fabrice@gmail.com>
References: <20240102204208.1662781-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704234007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WbXpRJ6iH1winnYm3t/yLtFEeRKku6V/MIuWVKfkCYs=;
 b=gvmwiao/CRVB0hLN7h/1mx4Zkjww+pHPc+4QkkEXHUit+7GoJ9+gYQRMQYtg7sZ6jxCG3H
 kTjaXJM++shPL4lGwGISV561AZuS+RX/erQgFoCUb7ZVNd6ZJtpYc8Y6KZ2GFpAdnZRqQH
 p15E8R1DqqyAm3mIWIr33jm4EuHlPlPERYasYct+2QKSsk2RoOweeLYc+fnKT4lV/4dm8X
 MnfLyJ8Jl5IAbIB2fNRmyoxzeZl6ESotXAYxJQ1x1ulgfXWYqN2TCQJJhfTvWUWnH4KFyY
 yuDj4V51UreMwfD+u5YxBEoGdPY47wqf1e1ZU1QgVeC4/aSZdU+onbM54w2E/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gvmwiao/
Subject: Re: [Buildroot] [PATCH 1/1] package/libsigsegv: fix musl build with
 powerpc
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  2 Jan 2024 21:42:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following musl build failure with powerpc raised since bump to
> version 2.14 in commit c6addf4606c3a41cdad5c6ac4c6508b298b6e92a:
> 
> In file included from fault.h:36,
>                  from handler-unix.c:77,
>                  from handler.c:19:
> handler-unix.c: In function 'sigsegv_handler':
> fault-linux-powerpc.h:35:73: error: 'mcontext_t' has no member named 'uc_regs'; did you mean 'gregs'?
>    35 | #  define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
>       |                                                                         ^~~~~~~
> handler-unix.c:157:43: note: in expansion of macro 'SIGSEGV_FAULT_STACKPOINTER'
>   157 |           uintptr_t old_sp = (uintptr_t) (SIGSEGV_FAULT_STACKPOINTER);
>       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/77b600071f07605be3ec28e2da46d6938e240087
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-Linux-PowerPC-32-bit-with-musl-libc.patch | 114 ++++++++++++++++++
>  package/libsigsegv/0002-add-musl.m4.patch     |  47 ++++++++
>  package/libsigsegv/libsigsegv.mk              |   2 +
>  3 files changed, 163 insertions(+)
>  create mode 100644 package/libsigsegv/0001-Add-support-for-Linux-PowerPC-32-bit-with-musl-libc.patch
>  create mode 100644 package/libsigsegv/0002-add-musl.m4.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
