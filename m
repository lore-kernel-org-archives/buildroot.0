Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DFDC41535
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 08:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B112E617B3;
	Fri, 22 Dec 2023 08:19:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B112E617B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wuR53Hq4Hxc2; Fri, 22 Dec 2023 08:19:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A13961033;
	Fri, 22 Dec 2023 08:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A13961033
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFD9C1BF2F7
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 08:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B31B83DB4
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 08:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B31B83DB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEqcSeiZT9dT for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 08:19:48 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1ABE983A62
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 08:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ABE983A62
Received: by mail.gandi.net (Postfix) with ESMTPSA id 952C3E0009;
 Fri, 22 Dec 2023 08:19:44 +0000 (UTC)
Date: Fri, 22 Dec 2023 09:19:43 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231222091943.10f60c34@windsurf>
In-Reply-To: <CAHDQB6MUTQT4ebnxowo_7+DFVjA5wRY1O6hA_pK6N2d-cR-cRw@mail.gmail.com>
References: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
 <20231221093159.6f50cc83@windsurf>
 <CAHDQB6MUTQT4ebnxowo_7+DFVjA5wRY1O6hA_pK6N2d-cR-cRw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703233184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+sq65WNKpryYnMOFIkDgC1EeE3Hju8A+wdsQv9oqX48=;
 b=XvcQdkDuCvII4R/ctwPOVglf0DbxKw7IG+qT2eeWloDROtlKsyYtlGDwWgwYujW90BJxlB
 yToZ9O94n9AzKcAIQ4bEbBbFNI+1l4s58HSHvneJtm4a2iR9oP3djeXib7gvhAoEGbXsi1
 DwE2e9pAdbovI4RZBN1eu7oXN67fgTmQ2nQFEfh+mfj/ZYN3U+30mQcMPat350FXFgYU1R
 uAQWJlueAnclpxgwtqg0P289Se903rHMfS9FVQl+oJIYuCmO8CyDbwqWSJ9OG9hZZUudKu
 sbheDS4EqWNzWrTKm65LdC4r5t6Jb83jN4cVpQR71m2XR7EJ7EtL5AOgm3qSLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XvcQdkDu
Subject: Re: [Buildroot] [PATCH v3 01/10] package/wlroots: add hwdata and
 hwdata_pnp_ids as a dependency
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

Hello Adam,

On Thu, 21 Dec 2023 07:43:37 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> > > hwdata = dependency('hwdata', required: false, native: true)
> > > if hwdata.found()
> > >       hwdata_dir = hwdata.get_variable(pkgconfig: 'pkgdatadir')
> > >       pnp_ids = files(hwdata_dir / 'pnp.ids')
> > > else
> > >       pnp_ids = files('/usr/share/hwdata/pnp.ids')
> > > endif  
> >
> > But does that mean they are actually used, unconditionally, by wlroots?
> > Yes, this sets a path in meson, and then? Yes, they *might* be used,
> > but how mandatory are those pnp.ids?
> >  
> The build fails without hwdata and the pnp ids.

Then please mention this in the commit log, with the error message.
This sort of detail should really be part of all your commit messages.
Each time you write a commit message, you should ask yourself "what
will the person reviewing this patch, who hasn't looked into the issue
I'm trying to solve, would need to know to understand the issue and be
convinced that my patch is the correct fix".

Also, if there is a build failure, is the build failure visible in our
autobuilders? If yes, please add a reference. If not, please say so in
the commit log. According to
http://autobuild.buildroot.net/?reason=wlroots% it seems like we didn't
catch this error. Why? Does it happen only under very specific
circumstances?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
