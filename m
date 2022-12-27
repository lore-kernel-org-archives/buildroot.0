Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BD6C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE8BA40462;
	Tue, 27 Dec 2022 20:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE8BA40462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5l9um1La_39b; Tue, 27 Dec 2022 20:45:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F88940472;
	Tue, 27 Dec 2022 20:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F88940472
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E48A41BF37A
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC84B8140F
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC84B8140F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3r_p7ugy0kb0 for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:45:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B697F80F50
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B697F80F50
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:45:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 10880240008;
 Tue, 27 Dec 2022 20:45:38 +0000 (UTC)
Date: Tue, 27 Dec 2022 21:45:38 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221227214538.56ca7609@windsurf>
In-Reply-To: <a04f80a248fb1452841a424e850a694419e3a6dd.1671873478.git.yann.morin.1998@free.fr>
References: <cover.1671873478.git.yann.morin.1998@free.fr>
 <a04f80a248fb1452841a424e850a694419e3a6dd.1671873478.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672173939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4VkjglUwNDwN97mu6zakoXEF86tXGZKUuH04+4Rc+E=;
 b=OhNmrD2+dSFDD+20Ib3YEg/1QnAkcjh/mhlO6y9SATO8VOgiugvaSIepkssXMnncneHRaw
 5ldpirk5ksHMk0gh/mJeiL0QJv1MlNvzGbKYK9cPiSKHiRt5nqdMiZ8cDZMCj1UEeHRAeN
 rPhiRzX6Vl8l7j3ScQObEb8ciQlwbEo8CBdWpA2mcKlJuJX3NUEruvd3MADMkdtf8Zod9i
 Pa0KD8f39j2S855JZV4GQcGtYfCzGh6RbG3Aey83lKgQgobCOz8qndMrb9lC633bnCACM+
 djrdlQXlIl9Jt0AisN+bNdYQ5P/HPcg6YKAfUfaIR+PAL7uRsUbAfjJfn3JwBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OhNmrD2+
Subject: Re: [Buildroot] [PATCH 2/3] support/tests: allow top-level parallel
 builds
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

On Sat, 24 Dec 2022 10:18:12 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Running tests with top-level parallel builds can speed up running some
> tests, expecially those that have a lot of packages like the systemd
> init tests.
> 
> Trigger TLPB when the configuration enables per-package directories.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I certainly support the idea of running some tests with TLPB. However,
this implementation makes a confusion between two different settings:

- The existing BRConfigTest.jlevel, which is set by run-tests -j, and
  used to define BR2_JLEVEL in the Buildroot configuration of each test
  case. This determines the number of parallel jobs used to build each
  independent package.

- Your new work, which uses "make -j" to do TLPB... but relies on the
  same above value, even though it's a completely different setting.

Is this expected?

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
