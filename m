Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6E6CFD376
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 09:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D99C184535;
	Fri, 28 Nov 2025 09:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BuiIFJkv_dEV; Fri, 28 Nov 2025 09:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E901384537
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E901384537;
	Fri, 28 Nov 2025 09:21:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA7F41A9
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 09:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8924084537
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 09:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lIIPqH9YvukX for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 09:21:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A9BC84535
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A9BC84535
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A9BC84535
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 09:21:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7F77BC16A37;
 Fri, 28 Nov 2025 09:21:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 65F6960706;
 Fri, 28 Nov 2025 09:21:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 51281103C8F61; Fri, 28 Nov 2025 10:21:46 +0100 (CET)
Date: Fri, 28 Nov 2025 10:21:46 +0100
To: Markus Mayer <mmayer@broadcom.com>
Cc: Julien Olivain <ju.o@free.fr>, Buildroot List <buildroot@buildroot.org>,
 Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20251128102146.2afd777b@windsurf>
In-Reply-To: <CAGt4E5vMkqsHt2sUUqLWERZyRvQXyp1Z90E4wx8yPRP6CEiWgg@mail.gmail.com>
References: <20251123133431.1499202-1-thomas.petazzoni@bootlin.com>
 <fe64d9aca519af339d5d30054c162d0e@free.fr>
 <CAGt4E5vMkqsHt2sUUqLWERZyRvQXyp1Z90E4wx8yPRP6CEiWgg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764321709; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Ban0lwO+Gail1rkLfdCzN1wMj41n4MU+GtJ+7YTZkfk=;
 b=m2LdJ70TSubSLbwr+OOdUBDFmbeqoa6grqa+keuB/D99mudmNTXyU0cXmbr9fWFyHBspcb
 NRgcN/Z6pNJEU98C8b6kk+Gq2SvyAvGCfMTHjOFC81spOM+woAQz7gPvBKU3uTnmR/ZUid
 q+gNjI9u08vr5z2Xzf57Pfsjj+6rp8DlJxS4EYmSDkEDsFxmX0V70RpXi5iuNXc3rZmG2Q
 RpD2BDao8q5R4ZA6ecWGWuNKPMECQ5k+tNoEMUb2QZQoE95KREEKncMPTZ9mTf+FaehWlb
 RLFeRy2IWJ2ojGJm/KBGpN6mrDly509EaoPbpqcLyH+pi2ngMO4n96zG7ccm/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=m2LdJ70T
Subject: Re: [Buildroot] [PATCH] package/e2fsprogs: fix build with headers
 >= 5.10 and < 5.12
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Markus,

On Thu, 27 Nov 2025 11:53:36 -0800
Markus Mayer <mmayer@broadcom.com> wrote:

> I submitted a different patch for this to Ted T'so a week ago, on
> November 21, to be exact. Unfortunately, there doesn't seem to be a
> mailing list for e2fsprogs, so there is no way of quoting said email.
> Unfortunately, I haven't heard back from Ted as of yet.
> 
> I think the easiest way of showing my patch set here at this point in
> time is by providing a Github link.
> 
> https://github.com/tytso/e2fsprogs/compare/master...mmayer:e2fsprogs:kern-compat-master
> 
> This page should show the entirety of the diff, combining the two
> commits in that tree (manual changes and derived autoconf changes).
> The important changes are in the first commit (configure.ac and
> kern_compat.h)[1].
> 
> The big difference between your patch and my patch is that my patch
> doesn't disable functionality when the build environment is too old.
> Instead, it provides the missing definitions of the data structures,
> so the binaries can still be built with full functionality compiled
> in. So, while your patch strips functionality out of e2fsprogs based
> on the build environment, mine does not.

I don't really have a strong preference between the two solutions.

In your solution, what happens if the kernel is actually too old to
support the fsverity ioctl() ? Does e2fsprogs gracefully handles the
situation? That's a bit the problem with building code with "newer"
kernel headers than the running kernel: how is user-space going to be
have when the kernel features exposed in the kernel headers are
actually not implemented by the kernel.

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
