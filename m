Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C889DC4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F7B340644;
	Mon,  7 Nov 2022 22:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F7B340644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mdjpohRvC6De; Mon,  7 Nov 2022 22:08:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4876340629;
	Mon,  7 Nov 2022 22:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4876340629
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 601A81BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4856F8146C
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4856F8146C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TZwKigFrNTMs for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:07:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A561818AC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A561818AC
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:07:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 42A74E0006;
 Mon,  7 Nov 2022 22:07:49 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:07:48 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221107230748.7c1de8e2@windsurf>
In-Reply-To: <20221106230450.970235-1-fontaine.fabrice@gmail.com>
References: <20221106230450.970235-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667858869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UEFJ1tbCNTnZHNZSncofYq5Ex51GD12nIInsBbJXFbc=;
 b=RjgkuwTxjaZif2x/0AIKXw9EAFvyr8CnDeTNvn+rpLZ6xsBNw+l08l6uiXLS7Qsk88iU5v
 gO1hhkQ8QnKZqBu2L4Kw0lpucr460zQ171urhtvRZ97u3pBWOhmP3rXjrVrCqc0AKpGICt
 pZe/leeWkQ1ggWg/NZRoTScBavVJxdxsXbYmyT9Hu3HeElLj05x5g67df+wAAhuCJLY7xO
 +ZAdHXkP5CFZ/VMvEEOObtSbe4q+wiHztqv1F3lM5Mh9wDfXc5Tb0ZfYm6IVO+03bNZxqF
 /fK0FfoPHIgrrQW1iLVQDcXYJw1P8QWkKd6g/OAgTCf5oEoU9rph1UurMr8QJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RjgkuwTx
Subject: Re: [Buildroot] [PATCH 1/1] package/gptfdisk: fix popt static build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  7 Nov 2022 00:04:50 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following static build failure with popt and iconv raised since
> bump to version 1.0.9 in commit 69015ce94ac3ffe7f349ec37868eea0d0ffec90e
> and
> https://sourceforge.net/p/gptfdisk/code/ci/122b58ad82f1a144226d262c87241ee035ed1aff
> (which added an unified Makefile):
> 
> /home/autobuild/autobuild/instance-0/output-1/host/bin/mips64el-buildroot-linux-uclibc-g++ crc32.o support.o guid.o gptpart.o mbrpart.o basicmbr.o mbr.o gpt.o bsd.o parttypes.o attributes.o diskio.o diskio-unix.o sgdisk.o gptcl.o -static -liconv -lpopt  -o sgdisk
> /home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/mips64el-buildroot-linux-uclibc/11.3.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/lib64/../lib64/libpopt.a(poptint.o): in function `strdup_locale_from_utf8':
> poptint.c:(.text+0x113c): undefined reference to `libiconv_open'
> 
> As can be seen above, this build failure is raised because -liconv is
> added before -lpopt so use pkgconfig and SGDISK_LDLIBS
> 
> The addition of -liconv in LDLIBS could probably be removed in a
> follow-up patch for next branch
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c9f2c9e737c2dd1cd4c1a08a5e8a48165179282d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gptfdisk/gptfdisk.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

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
