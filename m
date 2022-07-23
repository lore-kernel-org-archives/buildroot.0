Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3295C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 10:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7174584970;
	Sat, 23 Jul 2022 10:24:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7174584970
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kkSi4GiBz63k; Sat, 23 Jul 2022 10:24:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 719D88496C;
	Sat, 23 Jul 2022 10:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 719D88496C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E01F1BF5E6
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 10:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E87B4423F6
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 10:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E87B4423F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2tZ34RxcxQO for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 10:24:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1F80423CA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1F80423CA
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 10:24:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2B17A1C0004;
 Sat, 23 Jul 2022 10:24:23 +0000 (UTC)
Date: Sat, 23 Jul 2022 12:24:21 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220723122421.23ce2a04@windsurf>
In-Reply-To: <20211231084923.29808-1-ps.report@gmx.net>
References: <20211231084923.29808-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658571863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/m2aVAiPzAe0kcWeI6PhpG1DKnhMexs/q/akYZouRs=;
 b=crJD4C9tekQdv//+XSWI/bgL8DDxAe8NgD3Cdbh6y80Ku4CSUgu/baSCN5E5kE5qOVrtxS
 Q2q2KwXhuoAXlxA/6SNELsiVtqjHMmPcNq4141Qo4TC4BrMZWiLsszwc7uncbJCjokPV+7
 Dv3AlOwVLCeGfgL8x6i/pfC5QABGHezGPE86+uOTPini3HMwBtMO39V8CqZUDPC0rNU42k
 7h7RdIoPjWv7j6fhPKQSWy0Gv3DoEs/NjV4oxusKGqtxqQl9w2c4cf0+h6gdtCh6S7cjhH
 J+3Q030lYJajxG1wx+SKFeNT0yhwiCt16Be/+IvdAPUMUz3yuJMXVgfmf+84TA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=crJD4C9t
Subject: Re: [Buildroot] [PATCH v3] package/ntpsec: new package
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
Cc: "Guillaume W . Bres" <guillaume.bressaix@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

On Fri, 31 Dec 2021 09:49:23 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - set 'CC="$(HOSTCC)"' to avoid cross-compile failure (see [1]):
> 
>   /bin/sh: line 1: .../build/ntpsec-1_2_0/build/host/ntpd/keyword-gen: cannot execute binary file: Exec format error
> 
>   Waf: Leaving directory `.../build/ntpsec-1_2_0/build/host'
>   Build failed
>    -> task in 'ntp_keyword.h' failed with exit status 126 (run with -v to display more information)  
> 
> - set '-std=gnu99"' to avoid compile failure with old compilers
> 
> - explicit set PYTHON_CONFIG
> 
> - add patch 001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch to
>   fix ntptime jfmt5/ofmt5 jfmt6/ofmt6 related compile failure
> 
> - add patch 0002-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch to
>   fix host-compile failure in case target libbsd is detected
> 
> - add SYSV init file (S49ntp)
> 
> - add example ntpd.conf (with legacy option enabled and provide skeleton
>   for NTS configuration)
> 
> - add config option for NTS support
> 
> - depend on python3 (omit python2 to reduce test effort)
> 
> - add ntp user/group and run ntpd as restricted user
> 
> - add libcap dependency (compile time optional but needed for droproot
>   support)
> 
> [1] https://gitlab.com/NTPsec/ntpsec/-/issues/694
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v2 -> v3:
>   - update 0001-ntptime-fix-jfmt5-ofmt5-jfmt6-ofmt6-related-compile-.patch
>   - add 0002-wscript-remove-checks-for-bsd-string.h-fixes-host-co.patch

I've finally applied to master. Changes done:

 - S49ntp was renamed to S49ntpd, because check-package wants the init
   script to be named after the daemon that it starts

 - the LICENSE variable is comma separated, not space-separated

 - the depends on BR2_PACKAGE_PYTHON3 has been replaced by select
   BR2_PACKAGE_PYTHON3, as we now only support python3

Speaking of the need for python on the target, I found it a bit silly,
because the daemon itself is written in C. So I filled an issue
upstream yesterday: https://gitlab.com/NTPsec/ntpsec/-/issues/743, and
they are already working on it, with an initial proposal at
https://gitlab.com/NTPsec/ntpsec/-/merge_requests/1282. It will be
useful to follow this issue and see if we can lift the python3
requirement on the target.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
