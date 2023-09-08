Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95319EEB56E
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 21:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4386E415FD;
	Fri,  8 Sep 2023 21:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4386E415FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgNM-Nhmt1Wi; Fri,  8 Sep 2023 21:00:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4097E418AC;
	Fri,  8 Sep 2023 21:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4097E418AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E1E11BF277
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6706C82E5F
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6706C82E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lqIX5M_j6czS for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:59:58 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5711F82E19
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5711F82E19
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45C9240004;
 Fri,  8 Sep 2023 20:59:56 +0000 (UTC)
Date: Fri, 8 Sep 2023 22:59:55 +0200
To: nvd@nist.gov
Message-ID: <20230908225955.176edc80@windsurf>
In-Reply-To: <20230902193434.4865dbd4@windsurf>
References: <20230902193434.4865dbd4@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694206796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=64vI6j09mPHAXTv8wrxxZ7z+QGdirUVTPo6CfcOeh5Y=;
 b=fAnEtXwevY4WHF4eRFGaelOU1TYiQOsw8D+428GfZJaLXq2LKKbb4ymTj3X9OC6F+klyAM
 BkZVZ0Nocko3OHxuqGEYd+2lYHg+CuOT9xMjbeah6XU42bd1pPN0bQUlN4l28qhyTfSJcy
 WCKRvJMtSzsJWKUepw5Pwub8AjIfbKLsrreNolvy3734OReExN6Ed1THESBs26b9V+oyUY
 SS0MzpJ9wYlAuQgkzPo+3PaywQgEy0BrRSIS0DpC2DVEB9U5BrLHTLztZf/wYFSXn9BTaL
 DQ86U7c58F802QdZIpDGC7b7AXISCAdHiBHAOH43WWGP2Kywaoe5oDNGqsyA3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fAnEtXwe
Subject: Re: [Buildroot] CVE-2021-4034 version range fix
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

Hello NVD maintainers,

Gentle ping on the below bug report. Thanks!

Thomas Petazzoni

On Sat, 2 Sep 2023 19:34:34 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Dear NVD maintainers,
> 
> CVE-2021-4034 is marked in the NVD database as affecting all versions
> of the polkit project due to the following "Configuration 1":
> 
>   cpe:2.3:a:polkit_project:polkit:*:*:*:*:*:*:*:*
> 
> However, as indicated in
> https://nvd.nist.gov/vuln/detail/CVE-2021-4034, this issue has been
> fixed in the upstream polkit project as of commit
> https://gitlab.freedesktop.org/polkit/polkit/-/commit/a2bf5c9c83b6ae46cbd5c779d3055bff81ded683.
> 
> In turn, this commit is integrated in polkit since version 121:
> 
> polkit$ git tag --contains a2bf5c9c83b6ae46cbd5c779d3055bff81ded683
> 121
> 122
> 123
> 
> So, the "Configuration 1" should be fixed to indicate that only
> versions < 121 are affected. Could this be addressed in your NVD
> database?
> 
> Best regards,
> 
> Thomas Petazzoni



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
