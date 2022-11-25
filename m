Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50766C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 22:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD85940650;
	Fri, 25 Nov 2022 22:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD85940650
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r40nmgt_vKls; Fri, 25 Nov 2022 22:06:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F089D401ED;
	Fri, 25 Nov 2022 22:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F089D401ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8594D1BF3D0
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 22:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 455C741DF7
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 22:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 455C741DF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ato_DvVMBVzF for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 22:06:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0A5B41DF6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0A5B41DF6
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 22:06:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5ABFAE0005;
 Fri, 25 Nov 2022 22:06:36 +0000 (UTC)
Date: Fri, 25 Nov 2022 23:06:35 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221125230635.4f07d7db@windsurf>
In-Reply-To: <20221125140907.3796987-1-peter@korsgaard.com>
References: <20221125140907.3796987-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669413996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaz4RQhwzzRNmqoGzRAB67EWOzb+Yv9AwmSJGB/HBNI=;
 b=Wt9Uy8c4BQpvp3JrQdxrSEV9lyazOH8zNyZujO5qFJjR5OB2UrFv4cdPZ4BjaK5vLWcPzQ
 q0IOnAr9QwcKAkGAxOk6484WW2/VN62NXX4k3pTKhDau4VSQlF1AXWRfupP2BIRl5iiu0I
 Ih4gT8hlnybGSJ6O2CTdlA91Ho+VW46aVA1bWb/9iRFvhyO+COciuM1Wdy5NoMfrh5Khbr
 nUIjWj5x60MdyrjjVjOgMmnGHSn2+VOiNKUfVUk6pgjD6j8fjP6tGmwAmEY4XvxlcthvXr
 JfsEPHulQGs+4JkAV1asQpYZ1IN4pPF/xcYmIThKSGf2oULeY6eZu9hjNIV3xA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wt9Uy8c4
Subject: Re: [Buildroot] [PATCH] package/netsnmp: security bump to version
 5.9.3
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

On Fri, 25 Nov 2022 15:09:06 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> - CVE-2022-24805 A buffer overflow in the handling of the INDEX of
>   NET-SNMP-VACM-MIB can cause an out-of-bounds memory access.
> 
> - CVE-2022-24809 A malformed OID in a GET-NEXT to the nsVacmAccessTable can
>   cause a NULL pointer dereference.
> 
> - CVE-2022-24806 Improper Input Validation when SETing malformed OIDs in
>   master agent and subagent simultaneously
> 
> - CVE-2022-24807 A malformed OID in a SET request to
>   SNMP-VIEW-BASED-ACM-MIB::vacmAccessTable can cause an out-of-bounds memory
>   access.
> 
> - CVE-2022-24808 A malformed OID in a SET request to
>   NET-SNMP-AGENT-MIB::nsLogTable can cause a NULL pointer dereference
> 
> - CVE-2022-24810 A malformed OID in a SET to the nsVacmAccessTable
>   can cause a NULL pointer dereference.
> 
> Drop openssl linking patches as they are merged upstream / upstream changed
> to use pkg-config for openssl since:
> 
> https://github.com/net-snmp/net-snmp/commit/8c3a094fbe9ebe38ed762488082d52c6d4e04ddb
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
> ./utils/test-pkg -c test.pkg -p netsnmp -a
>                              arm-aarch64 [ 1/44]: OK
>                    bootlin-aarch64-glibc [ 2/44]: OK
>                bootlin-arcle-hs38-uclibc [ 3/44]: OK
>                     bootlin-armv5-uclibc [ 4/44]: OK
>                      bootlin-armv7-glibc [ 5/44]: OK
>                    bootlin-armv7m-uclibc [ 6/44]: SKIPPED
>                       bootlin-armv7-musl [ 7/44]: OK
>                 bootlin-m68k-5208-uclibc [ 8/44]: SKIPPED
>                bootlin-m68k-68040-uclibc [ 9/44]: OK
>              bootlin-microblazeel-uclibc [10/44]: OK
>                 bootlin-mipsel32r6-glibc [11/44]: OK
>                    bootlin-mipsel-uclibc [12/44]: OK
>                      bootlin-nios2-glibc [13/44]: OK
>                  bootlin-openrisc-uclibc [14/44]: OK
>         bootlin-powerpc64le-power8-glibc [15/44]: OK
>            bootlin-powerpc-e500mc-uclibc [16/44]: OK
>                    bootlin-riscv32-glibc [17/44]: OK
>                    bootlin-riscv64-glibc [18/44]: OK
>                     bootlin-riscv64-musl [19/44]: OK
>                       bootlin-sh4-uclibc [20/44]: OK
>                    bootlin-sparc64-glibc [21/44]: OK
>                     bootlin-sparc-uclibc [22/44]: OK
>                     bootlin-x86-64-glibc [23/44]: OK
>                      bootlin-x86-64-musl [24/44]: OK
>                    bootlin-x86-64-uclibc [25/44]: OK
>                    bootlin-xtensa-uclibc [26/44]: OK
>                             br-arm-basic [27/44]: OK
>                     br-arm-full-nothread [28/44]: OK
>                       br-arm-full-static [29/44]: OK
>                    br-i386-pentium4-full [30/44]: OK
>                 br-i386-pentium-mmx-musl [31/44]: OK
>                       br-mips64-n64-full [32/44]: OK
>                  br-mips64r6-el-hf-glibc [33/44]: OK
>                br-powerpc-603e-basic-cpp [34/44]: OK
>                br-powerpc64-power7-glibc [35/44]: OK
>                        linaro-aarch64-be [36/44]: OK
>                           linaro-aarch64 [37/44]: OK
>                               linaro-arm [38/44]: OK
>                      sourcery-arm-armv4t [39/44]: OK
>                             sourcery-arm [40/44]: OK
>                      sourcery-arm-thumb2 [41/44]: OK
>                          sourcery-mips64 [42/44]: OK
>                            sourcery-mips [43/44]: OK
>                           sourcery-nios2 [44/44]: OK
> 44 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

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
