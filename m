Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48536C25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 21:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07B314099E;
	Fri, 24 May 2024 21:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XuN03PH4kTKd; Fri, 24 May 2024 21:15:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C81FA409AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C81FA409AA;
	Fri, 24 May 2024 21:15:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C9671CFE15
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 21:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2996040447
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 21:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRDnmTbT_P-k for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 21:15:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE1DC4018A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE1DC4018A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE1DC4018A
 for <buildroot@buildroot.org>; Fri, 24 May 2024 21:15:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79B481BF204;
 Fri, 24 May 2024 21:15:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sAcFj-00Gi74-2B;
 Fri, 24 May 2024 23:15:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20240522194610.2553161-1-giulio.benetti@benettiengineering.com>
Date: Fri, 24 May 2024 23:15:03 +0200
In-Reply-To: <20240522194610.2553161-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 22 May 2024 21:46:10 +0200")
Message-ID: <877cfikj3c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] configs/amarula_vyasa_rk3288_defconfig:
 bump to Linux version 6.1.91
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Build fails with gcc 13 with:
 > drivers/ata/libahci.c: In function 'ahci_led_store':
 > ././include/linux/compiler_types.h:357:45: error: call to
 > '__compiletime_assert_302' declared with attribute error: BUILD_BUG_ON failed:
 > sizeof(_s) > sizeof(long)
 >   357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)

 > As explained in Linux commit[0] that fixes the build, sizeof() of enum
 > like '(1<<31)' translate to a 64-bit type, but we expect a 32-bit type.
 > So commit[0] makes sure the data type to be 32-bits wide by using BIT()
 > macro.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596548

 > [0]:
 > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=97e28deab8bfe70d5687650f94484f8f9101e566

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > ---
 > V1-> V2:
 > * improve commit log as requested by Romain Naour

Committed, thanks.

Could you also send a patch adding download hashes for the defconfig
(see utils/add-custom-hashes)?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
