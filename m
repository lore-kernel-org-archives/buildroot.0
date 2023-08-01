Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723F2C04A6A
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A18D600C5;
	Tue,  1 Aug 2023 21:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A18D600C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oq_oPc12Ojeu; Tue,  1 Aug 2023 21:15:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB18E61179;
	Tue,  1 Aug 2023 21:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB18E61179
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23C0E1BF408
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E622940374
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E622940374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A9D3OkAkIX9k for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:15:36 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4F4F404CF
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:15:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4F4F404CF
Received: by mail.gandi.net (Postfix) with ESMTPSA id D908840006;
 Tue,  1 Aug 2023 21:15:32 +0000 (UTC)
Date: Tue, 1 Aug 2023 23:15:31 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230801231531.59a92e96@windsurf>
In-Reply-To: <20230801132113.357748-1-romain.naour@gmail.com>
References: <20230801132113.357748-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690924533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DeRckcWVs+RZPILaZMIxthgsFL2g42b05IajuTnNrEY=;
 b=Z0IACy32hLFC71LqKrYbBxYvYInjOwnEKYlqdjFnXukZlIQlEw8iX6IxkkKJ/aa49REm9x
 eCHRp1JS/6vfEiGCZ9zEbT/yO3od6B9m8o6UZeMWeovYckjp/nfd1ZporNrtIsQ3M0TfHq
 OPB+XrixIahKtw3S5DLZi/3ifEli8NFvjJ6Ar1wmuJAxn+fv7MhMcBFljN6Ab1TTu/fqiK
 rrME8t4blGp5n8tYu2TkBdCMgsUe2mxTpUz2TZVCsTsWo3nxoNqE6pC5tWGlWDOD94Sm3u
 X3bns9vzitJI3riDHlF6pKdDglm6EA4ORi6CTYhts5tFYQOtkimbiLvuxcjfZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z0IACy32
Subject: Re: [Buildroot] [PATCH] support/testing: TestNoTimezone: fix the
 test case for Glibc
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

On Tue,  1 Aug 2023 15:21:13 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> We have changed to a Glibc based toolchain recently [1] but the
> behavior of TZ handling is not the same between libc implementation
> when no Zone Database is installed.
> 
> musl and uClibc-ng return "UTC" when the data file of the requested
> time zone is missing or when TZ is not set.
> 
>  # TZ=America/Los_Angeles date +%Z
>  UTC
> 
>  # TZ= date +%Z
>  UTC
> 
> Glibc return all or part of TZ content or "Universal" if TZ is empty.
> 
>  # TZ=America/Los_Angeles date +%Z
>  America
> 
>  # TZ= date +%Z
>  Universal
> 
> As demonstrated by TestAllTimezone, Glibc return "PDT" when the
> America/Los_Angeles time zone data file is installed:
> 
>  # TZ=America/Los_Angeles date +%Z
>  PDT
> 
> Since the Glibc behavior seems weird (not a bug [2]) when TZ is
> set but the time zone data file is missing, update our test
> to check against a string defined in the Glibc code [3].
> 
> [1] f89f52168fcb667a3e8e43f6f44d5b1ca3961a8c
> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=30710
> [3] https://sourceware.org/git/?p=glibc.git;a=blob;f=time/tzset.c;h=78c18f8147415c92dc6eb735be672fa7e0b8f76e;hb=47b76f6d1d3a5ad13e585dbcc616aaea62b8bb20#l380
> 
> Ref:
> https://www.gnu.org/software/libc/manual/html_node/TZ-Variable.html
> 
> Fixe:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561117
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  support/testing/tests/core/test_timezone.py | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

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
