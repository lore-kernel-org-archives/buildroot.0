Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355BCC83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 21:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E26784182F;
	Wed, 30 Aug 2023 21:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E26784182F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dV5dvmU8wYAj; Wed, 30 Aug 2023 21:58:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18FCC4186A;
	Wed, 30 Aug 2023 21:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18FCC4186A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8A621BF405
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91E71812FC
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91E71812FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q755bIgTTz-p for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 21:58:35 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89323812E5
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 21:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89323812E5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58E2F20003;
 Wed, 30 Aug 2023 21:58:32 +0000 (UTC)
Date: Wed, 30 Aug 2023 23:58:31 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230830235831.53b3e903@windsurf>
In-Reply-To: <20230829222230.1884427-1-christian@aperture.us>
References: <20230829222230.1884427-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693432712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGSs4MYRvAhB+OQg1xS5tF9dwqWTAj7KKefxtmZYE50=;
 b=AbmaBJ6BPBhLrMhEiRCtvaXGCQPmLYkPrGGkORuxyuEsWybk8rRXrlT5ViK9zhYKSWLgJI
 /Yifx0jAwpMss2O/FAdb6RK9EqeDMxtvPprGr3DQcjdio/Go88VxH94uyaz337KFJHgsXs
 aD/7hJOcFIVY0qqDpWQ1qujfTkYxQnQ19LpTUthQJnsxKgyUjvXcaSBVK3nFNmkBR9cCLp
 /V/Lmd4tkOTv3n1Tr6xcErVmzWyg3bkM8oNuPy4d/uk2U4iIZ0f5Tx639YJA1yAXmQ7iQ5
 jQMncay16G/W3OUrz50HMFDjkyDI0sVKPDdfoYE6qVO8iL+WNsU5fCxh+k8UtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AbmaBJ6B
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.21.0
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 29 Aug 2023 15:22:30 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Go 1.21.0 is a major release of Go.
> 
> https://go.dev/doc/devel/release#go1.21.0
> 
> Set GOTOOLCHAIN=local to disable the new toolchain download feature. This
> feature, introduced in Go 1.21.x, will automatically download pre-built compiler
> binaries from Google for the toolchain version specified in go.mod. We do not
> want this in Buildroot as we build from source instead: set GOTOOLCHAIN=local to
> disable the feature and use the locally built toolchain.
> 
> https://go.dev/doc/toolchain
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/go/go.hash | 2 +-
>  package/go/go.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
