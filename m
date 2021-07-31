Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F212C432BE
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:13:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F66160F94
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F66160F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42E09404C3;
	Sat, 31 Jul 2021 08:13:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIEjsoWTCYnq; Sat, 31 Jul 2021 08:13:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9546D404B5;
	Sat, 31 Jul 2021 08:13:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B33AA1BF836
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A18BE40277
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:13:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NOiIvelisBWD for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 08:13:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 492F64026D
 for <buildroot@uclibc.org>; Sat, 31 Jul 2021 08:13:29 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 44664E0003;
 Sat, 31 Jul 2021 08:13:25 +0000 (UTC)
Date: Sat, 31 Jul 2021 10:13:24 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210731101324.54518fbb@windsurf>
In-Reply-To: <CAPi7W80D-vTy8Hg7R-aLekkW=F5CopjwkSqjwjzrhh__-4ZunA@mail.gmail.com>
References: <20210730091005.7c91f3b7@windsurf>
 <CAPi7W80D-vTy8Hg7R-aLekkW=F5CopjwkSqjwjzrhh__-4ZunA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] refpolicy build failures
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
Cc: "buildroot@uclibc.org" <buildroot@uclibc.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Fabrice,

On Sat, 31 Jul 2021 10:05:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> I fixed minidlna, fetchmail and exim.

Thanks for your work, I merged your patches fixing these issues.

> The other build failures are all related to packages that can
> optionally share content through apache/httpd (e.g. collectd, cvs,
> git, nut, etc.).
> They're raised when apache is not enabled because their file contexts
> unconditionally use apache/httpd parameters.
> I opened an issue to know how to properly fix those issues:
> https://github.com/SELinuxProject/refpolicy/issues/400.

Should we revert those changes in Buildroot for the time being? Or
unconditionally add the apache/httpd SELinux modules in collectd, cvs,
git, nut ? This is effectively what the refpolicy requires right now.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
