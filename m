Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7072AC001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25745813A3;
	Sun,  6 Aug 2023 14:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25745813A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Le_MnK1xYi9; Sun,  6 Aug 2023 14:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5816380BF6;
	Sun,  6 Aug 2023 14:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5816380BF6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20E6B1BF947
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7F4F40278
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7F4F40278
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0zQ-QFZ3T4Vl for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:41:59 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 972EF40496
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 972EF40496
Received: by mail.gandi.net (Postfix) with ESMTPSA id B82391C0002;
 Sun,  6 Aug 2023 14:41:56 +0000 (UTC)
Date: Sun, 6 Aug 2023 16:41:55 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20230806164155.056a7cd5@windsurf>
In-Reply-To: <20230802214950.1817381-1-thomas.petazzoni@bootlin.com>
References: <20230802214950.1817381-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691332917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZX8hBTqdut4y1gHiX82H/QvW3TwB3eijEdDxlQ/YYs=;
 b=KlZUbraJ8wd9nfo7t70+FcRjmnayScJXmh//x6AgKcXKlRI4u23d+uulsqsS+fpXPLkr+B
 ZH6VCdn1XH7q4bNnXmjGsrWcZ42/qpKkv3UkxkT2Znf1erdXyT0kdfyEjxh6K0TqIqUAp+
 iQw98zfyo5x7HExV+bI03g7Uxgh5H6nnehAt5ZSF7G8JVh6JaH7KZ8qRSIAnJe2+BlRu9K
 p0Cqt4nXp2Mr3lnZYacaI2A3cQTqQJJymvnVsDjCPborxUeWcADSylDvK7PJj59/YxRmPI
 wGuotjp6VjuHCkva4I2jEbRybmZVflFToaTOzeM+MwZmQf70sqbjZaPH1Akygg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KlZUbraJ
Subject: Re: [Buildroot] [PATCH v2 1/3] package/gdb: add support for GDB 13.2
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  2 Aug 2023 23:49:46 +0200
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> Sadly, the stack of patches remain exactly the same, none of the
> changes have been upstreamed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .checkpackageignore                           |  9 +++
>  ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 ++++++++++++++++
>  ...-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 +++++++++++++
>  package/gdb/13.2/0003-use-asm-sgidefs.h.patch | 40 ++++++++++++
>  .../0004-gdbserver-fix-build-for-m68k.patch   | 63 +++++++++++++++++++
>  ...fork-inferior-include-linux-ptrace.h.patch | 53 ++++++++++++++++
>  ...getrandom-compile-for-uclibc-v1.0.35.patch | 39 ++++++++++++
>  .../13.2/0007-fix-musl-build-on-riscv.patch   | 60 ++++++++++++++++++
>  ...-gdbserver-Makefile.in-fix-NLS-build.patch | 38 +++++++++++
>  .../0009-gdb-Fix-native-build-on-xtensa.patch | 57 +++++++++++++++++
>  package/gdb/Config.in.host                    |  4 ++
>  package/gdb/gdb.hash                          |  1 +
>  12 files changed, 462 insertions(+)
>  create mode 100644 package/gdb/13.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
>  create mode 100644 package/gdb/13.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
>  create mode 100644 package/gdb/13.2/0003-use-asm-sgidefs.h.patch
>  create mode 100644 package/gdb/13.2/0004-gdbserver-fix-build-for-m68k.patch
>  create mode 100644 package/gdb/13.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
>  create mode 100644 package/gdb/13.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
>  create mode 100644 package/gdb/13.2/0007-fix-musl-build-on-riscv.patch
>  create mode 100644 package/gdb/13.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
>  create mode 100644 package/gdb/13.2/0009-gdb-Fix-native-build-on-xtensa.patch

Series applied to next. Hopefully I didn't screw up too much.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
