Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D98C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 20:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E83C827B5;
	Wed, 27 Jul 2022 20:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E83C827B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jizcW_FHF1bt; Wed, 27 Jul 2022 20:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28E3F82496;
	Wed, 27 Jul 2022 20:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28E3F82496
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1D801BF39A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 20:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A1F0826E5
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 20:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A1F0826E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQOPs4e_8X7a for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 20:31:04 +0000 (UTC)
X-Greylist: delayed 00:05:20 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 976FF81296
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 976FF81296
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 20:31:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E668E3200935;
 Wed, 27 Jul 2022 16:25:39 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
 by compute3.internal (MEProxy); Wed, 27 Jul 2022 16:25:40 -0400
X-ME-Sender: <xms:Q5_hYplHfO1XcFBdoj02Rf7JY23yw1UQ_IUXxX3nh1KIlvpNoyyuAA>
 <xme:Q5_hYk0OQL2ZGXB3H5wocL1aClh5SBOcQbJCxuIB5ZA2MVihsCbYM1FaHTobhSXcX
 r9wggq_NVCeGBb2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduvddgudehtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdff
 rghnihhlohcuuegrrhhgvghnfdcuoehmrghilhesuggsrhhgnhdrtghhqeenucggtffrrg
 htthgvrhhnpedtuedtieevleehgeduvdeugfejheeugedufeekjefhieekgfdvhfeiteek
 udffffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrghilhesuggsrhhgnhdrtghh
X-ME-Proxy: <xmx:Q5_hYvqcew2dThAiZTIQNpWf7rrxAGfwubJd741gDKCHUHcH-9eqCA>
 <xmx:Q5_hYpneBZRlQHS8y29X0GGkdvNQNIe7yDEdbM-9sAm0kb0TRmF_8Q>
 <xmx:Q5_hYn0BzWs7FBjHqJsKZRK4Cs9Bvs-UCOD6vn-3oyh5ilUnZbVxKQ>
 <xmx:Q5_hYlDhNdANVjUbGrL6CeWmiGr_t5dwjXW8TC9O2bYJR7G_teZRvg>
Feedback-ID: i1d444086:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EC78231A0063; Wed, 27 Jul 2022 16:25:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-757-gc3ad9c75d3-fm-20220722.001-gc3ad9c75
Mime-Version: 1.0
Message-Id: <1494d3a9-0b16-45fe-99f4-9b8d0bd28aad@www.fastmail.com>
In-Reply-To: <20220727114938.2d337033@windsurf>
References: <20220117001814.2645cd1b@c3po> <20220727114938.2d337033@windsurf>
Date: Wed, 27 Jul 2022 22:25:06 +0200
From: "Danilo Bargen" <mail@dbrgn.ch>
To: Buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dbrgn.ch; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1658953539; x=1659039939; bh=MYXcOj/mCV
 mw4ORFtFYabBxnWmR+Ut6GvMsDESS2Kdk=; b=dV5sXA7+SXb1Mb4PjwL98+qttu
 66JCKpiuGh6z23gISKLWmQwzRy3WhS3toOWEML/fXOFgB6mWpDh9WGzLSjjpaLRq
 0EGGCmbHlPbRe+2N4t7j4cJ9HKffdTF4C6cclybeTpNNQ3h895QJhERUIUorM2ei
 9fMb4Nuhu5UbG628remJBSlyDehsdSEmMbVQdWf8J3xGAXr1TnCvxk7T4t485qdb
 c2KACFPbCod9bmoTLpQeidaDi36l44TGJypD30C4igAA7YtMngHgSJmtO6CURsbO
 vm5iGuTq7q2L5EKX+W+t5v3EU18+AVdqEjzN4Asrl5XwjVOMsKprUsxutl1w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1658953539; x=1659039939; bh=MYXcOj/mCVmw4ORFtFYabBxnWmR+
 Ut6GvMsDESS2Kdk=; b=SeXhLPIZw1uZ8Sw0i71sv4DlkRgPRuFICD+XVg6xkGQo
 dKwBNVujGfdJ7gxEAUfLscL4eLZb7FQSELTZ6jMREVvDUysa8nH3/3lHzz4VUXou
 X2MQjgwbEzuH8lBIUF/9KjAcoRXRgrZ2HKx+8oVjMo++z/GrRsu5wFgw/XtmCunK
 rhwK9Sy0pMArCe0Y0Z+YLAYZLxWWdKT9h3QxUHBUtzfbXCOAGIRICX7vLvRJML4i
 yrqSubc0BwFtuYPlDTPr0Carcqrhbhb21h51nA+PZ+pCdwGyJItIfDSx9LYHmRy8
 JOFB6MLkTijSUbCVsZk1OTnnpuCLTUqjNO0zKEJY4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=dbrgn.ch header.i=@dbrgn.ch
 header.a=rsa-sha256 header.s=fm1 header.b=dV5sXA7+; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=SeXhLPIZ
Subject: Re: [Buildroot] [PATCH 1/1] package/tealdeer: new package
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain and Thomas

Romain Naour wrote:
> Is this package really useful for a Buildroot based system?
> It's more something for developers.
> Also, Buildroot try to not build and install man pages when possible.
>
> Can you share with us why you need this tool on your target system?

For a purely embedded headless system, the package is not really useful, but on a system where administrators actively log in (e.g. a system accessible via SSH, with some administration tools preinstalled) it may be useful as a local command-line based reference documentation for commonly used tools and commands.

I looked at the list of existing packages, and it includes packages like htop which are primarily used for system administration, so I figured tealdeer might be welcome as well. On the other hand, if you decide that man pages are excluded from a target system, then I'd understand if you'd reject the package.

One could argue though that tealdeer does not ship any tldr pages when installing. All tldr pages are fetched and cached at runtime, unlike man pages, where including them for all packages would bloat the target image.

Thomas Petazzoni wrote:
> Indentation and alphabetic ordering was not correct here, so I fixed
> that.

Thank you, I missed that in my original patch!

> That being said, Arnout was in favor of merging your patch as it was
> simple enough, so we did apply it.

Thanks!
Danilo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
