Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED86D74947
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 22:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD33B808A1;
	Tue, 29 Oct 2024 22:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1i2Mn3L1PlEO; Tue, 29 Oct 2024 22:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1037808BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1037808BE;
	Tue, 29 Oct 2024 22:14:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D3556494E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 22:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4918404BE
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 22:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ggcYV_FSvg7 for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 22:14:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C37A403ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C37A403ED
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C37A403ED
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 22:14:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 3A7E31814B9; Tue, 29 Oct 2024 23:14:45 +0100 (CET)
In-Reply-To: <20241029223109.414a2a54@windsurf>
References: <20241029204526.904130-2-buildroot@heine.tech>
 <20241029223109.414a2a54@windsurf>
Date: Tue, 29 Oct 2024 23:14:44 +0100
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Message-ID: <5a798-67215e80-1-8be02c0@119911138>
User-Agent: SOGoMail 5.11.0
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1730240085; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PRiL8dsZFQ1zycu3K2EhSGqfrGxMm2QsuE43b/u1aQ8=;
 b=J4Sx8zrfCW99ymNRYD8+ZbCKk4EMXVToObzXYYbnpCZ9Tu+tH4SVSZj9QoaUiUllSmGBYE
 iIjJlk+Ov2a0eF97r93x329BggWsJpf1uPjZxMMOFF5SFR/8sqEXgEWnlsvwk2QsGAdxu1
 qglarhRUISWKAQrzpGiLkMu3CkX0wgk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=J4Sx8zrf
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/boost=3A_update_downlo?=
 =?utf-8?q?ad_url?=
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Tuesday, October 29, 2024 22:31 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Michael,
> 
> On Tue, 29 Oct 2024 21:45:25 +0100
> Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:
> 
> > boost moved it's package hosting from jfrog to their own url
> > sponsored by the C+++Alliance.
> > 
> > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> > ---
> >  package/boost/boost.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Thanks for the patch. Is this fixing a build issue (apparently not)? If
> not, do you have a link/reference about this change of official
> location?

Besides changing all download links there isn't any information about this change on boost.org or boost.io
What I found was this announcement on the Mailinglist: https://lists.boost.org/Archives/boost/2024/05/256914.php

So the important information there is: "JFrog links will continue to function until December 2024."

Maybe I should've included this in the commit message...

Regards,
Michael

> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
