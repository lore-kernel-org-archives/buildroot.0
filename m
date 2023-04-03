Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97582C76196
	for <buildroot@archiver.kernel.org>; Mon,  3 Apr 2023 08:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 447F781E30;
	Mon,  3 Apr 2023 08:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 447F781E30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cnnSeuy_3V35; Mon,  3 Apr 2023 08:54:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B5D281BF4;
	Mon,  3 Apr 2023 08:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B5D281BF4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20BB91BF2E5
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 08:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5E05408EB
 for <buildroot@lists.busybox.net>; Mon,  3 Apr 2023 08:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5E05408EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sd9m1PyXn6cE for <buildroot@lists.busybox.net>;
 Mon,  3 Apr 2023 08:53:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 575E3408D6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 575E3408D6
 for <buildroot@buildroot.org>; Mon,  3 Apr 2023 08:53:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 45B15FF812;
 Mon,  3 Apr 2023 08:53:53 +0000 (UTC)
Date: Mon, 3 Apr 2023 10:53:52 +0200
To: Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <20230403105352.03d8a9e8@windsurf>
In-Reply-To: <c4df1e01-285e-fcfe-cbfb-bc63ebd561e5@gmail.com>
References: <642a6e97.050a0220.1d642.3446SMTPIN_ADDED_MISSING@mx.google.com>
 <c4df1e01-285e-fcfe-cbfb-bc63ebd561e5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1680512033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bIM/x8LQ6FpJ3KOyEdY1LhXXRiZD1zHx4NP2rjPF+3Y=;
 b=AjEvzsCNnTvG2J302IpcjGuMm5VKMXn/lnwLXaOckXXxon/Tq2sxMGaJXtticTBzkpkqEY
 VZnijGmueuD5hvXl449WXaaTqGanht2khatq9drlMWTAMOczy9LV7DZU6wadMlJD95Gfdl
 R/BbWG1DJc16wuPnbmoK3KffznK2VK0XgZQZXw/28XfRg0DfIQJmDVCgzuI9OXRtOwKLlS
 BgstgiRc63kD4aaHv6xSZMFNk/+rEMmHJAGf3Y0ykqrMiDa3KHxtMUjUCDoC22aHh9tAqX
 Vr0F7dmqJCDOaKxXKYtqhTQNEfi8ehFdYk4maJgiNoGVF964Q0LEniP1lpOEig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AjEvzsCN
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2023-04-02
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bagas,

On Mon, 3 Apr 2023 15:03:20 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> >              name              |       CVE        |                             link                            
> > -------------------------------+------------------+--------------------------------------------------------------
> >                            git | CVE-2022-24765   | https://security-tracker.debian.org/tracker/CVE-2022-24765    
> Should have been already fixed by upstream release v2.31.7 (which is
> already in Buildroot).

The NVD information says versions up to 2.35.2 are affected:
https://nvd.nist.gov/vuln/detail/CVE-2022-24765.

If 2.31.x a maintenance branch into which the fix has been backported?

> >                            git | CVE-2022-24975   | https://security-tracker.debian.org/tracker/CVE-2022-24975    
> It is known outstanding issue (maybe docfix upstream is enough)?

This is a pretty silly CVE :-/ Complaining about the doc not making
things clear enough? Sounds odd. I think in the context of Buildroot,
we could ignore it.

> >                            git | CVE-2022-41953   | https://security-tracker.debian.org/tracker/CVE-2022-41953    
> Windows-specific.
> >                            git | CVE-2023-22743   | https://security-tracker.debian.org/tracker/CVE-2023-22743    
> Again, Windows-specific.

For both of these, and probably CVE-2022-24975, you can send a patch
adding those CVEs to GIT_IGNORE_CVES, and bit like this:

# CVE only affects the documentation
GIT_IGNORE_CVES += CVE-2022-24975

# CVEs only affect Windows systems
GIT_IGNORE_CVES += CVE-2022-41953 CVE-2023-22743

Thanks a lot for following-up on this, it's nice to see that some
Buildroot contributors are looking into the CVE details!

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
