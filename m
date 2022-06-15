Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A33BC43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 11:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05C4981277;
	Wed, 15 Jun 2022 11:58:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-gBXuYAaf6n; Wed, 15 Jun 2022 11:58:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 406348125B;
	Wed, 15 Jun 2022 11:58:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F1B61BF580
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 11:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E1A86061B
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 11:58:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l7E6DPABZGJo for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 11:58:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDD036060A
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 11:58:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id E5C2F1820C3; Wed, 15 Jun 2022 13:58:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1655294309; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to;
 bh=lAzDHoWo0b5yJhjCPCXFXuwBDCa9hOqAAuhtlsbqR4o=;
 b=N0xiC5U7aFyE7Jt5tdQs8NLGaOdmjSXKgeLLqPMisJfr5NhrNO5SBpceUosnVTGnYNrKuN
 y9gNnvbyfM2jKh4ciBaRKNYMzbFT5XS2vHlUiDztXetQ/f3oOh0JZFdxAlwgH/JkDDLdJO
 l8sEl9jGdPzE7+vOxvj2A6dEO6ETMjo=
In-Reply-To: <20220615104152.GD12610@falbala.internal.home.lespocky.de>
Date: Wed, 15 Jun 2022 13:58:28 +0200
To: "Alexander Dahl" <post@lespocky.de>
MIME-Version: 1.0
Message-ID: <daac4-62a9c980-3-3fb25580@101195661>
User-Agent: SOGoMail 5.6.0
X-Last-TLS-Session-Version: None
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/catch2=3A_new_package?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alex,

On Wednesday, June 15, 2022 12:41 CEST, Alexander Dahl <post@lespocky.de> wrote:

> Hello Michael,
> 
> On Wed, Jun 08, 2022 at 10:16:02AM +0200, Michael Nosthoff via buildroot wrote:
> > +
> > +comment "gtest needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
> > +	depends on BR2_USE_MMU
> > +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> > +		!BR2_INSTALL_LIBSTDCPP || \
> > +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> 
> That comment wording doesn't seem right.  Did you mean "catch2"
> instead of "gtest" here?
> 
 whoopsi, classical copy&paste error. I'll send a v2.

Regards,
Michael

> Greets
> Alex
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
