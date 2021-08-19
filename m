Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379F9C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:52:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC44160200
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 20:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC44160200
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC59D605E9;
	Thu, 19 Aug 2021 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JrXkDIlQQ9OK; Thu, 19 Aug 2021 20:52:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC89160775;
	Thu, 19 Aug 2021 20:52:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36CF01BF297
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 269EA81A34
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 20:52:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EfPVpk9ywyBG for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 20:52:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4032481A39
 for <buildroot@busybox.net>; Thu, 19 Aug 2021 20:52:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 30F4A200003;
 Thu, 19 Aug 2021 20:52:09 +0000 (UTC)
Date: Thu, 19 Aug 2021 22:52:07 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20210819225207.2586aca5@windsurf>
In-Reply-To: <20210817142420.32435-1-mf@go-sys.de>
References: <20210817142420.32435-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gdb: bump version 10.x to 10.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Tue, 17 Aug 2021 16:24:20 +0200
Michael Fischer <mf@go-sys.de> wrote:

> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  ...1-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 0
>  ...2-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 0
>  package/gdb/{10.1 => 10.2}/0003-use-asm-sgidefs.h.patch         | 0
>  .../gdb/{10.1 => 10.2}/0004-gdbserver-fix-build-for-m68k.patch  | 0
>  .../0005-nat-fork-inferior-include-linux-ptrace.h.patch         | 0
>  package/gdb/Config.in.host                                      | 2 +-
>  package/gdb/gdb.hash                                            | 2 +-
>  7 files changed, 2 insertions(+), 2 deletions(-)
>  rename package/gdb/{10.1 => 10.2}/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch (100%)
>  rename package/gdb/{10.1 => 10.2}/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch (100%)
>  rename package/gdb/{10.1 => 10.2}/0003-use-asm-sgidefs.h.patch (100%)
>  rename package/gdb/{10.1 => 10.2}/0004-gdbserver-fix-build-for-m68k.patch (100%)
>  rename package/gdb/{10.1 => 10.2}/0005-nat-fork-inferior-include-linux-ptrace.h.patch (100%)

Even though this is a version bump, it's a minor version bump for a
very important package, so I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
