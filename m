Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25519C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B998560BB1;
	Sat,  4 Nov 2023 20:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B998560BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yZ431b0IgH8v; Sat,  4 Nov 2023 20:59:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AE5D60B8F;
	Sat,  4 Nov 2023 20:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AE5D60B8F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 458F41BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1543F60B8F
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1543F60B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kesQOekMinlp for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:59:53 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02ACE60B8C
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02ACE60B8C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22D4920002;
 Sat,  4 Nov 2023 20:59:51 +0000 (UTC)
Date: Sat, 4 Nov 2023 21:59:50 +0100
To: Saeed Kazemi <kazemi.ms@gmail.com>
Message-ID: <20231104215950.6d22aa4d@windsurf>
In-Reply-To: <20231002173628.2812917-1-kazemi.ms@gmail.com>
References: <20231002173628.2812917-1-kazemi.ms@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699131591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sd/ZV9qNYdRqkMzd3lQc/yCAb3qikdjCL5z6TTKQvNc=;
 b=bA4XKCFMFL7BY4n4Ch9JDiJjSuJkoK1N2qoscUS2VE4Gy+EUvmpETQFBi4mHG0u3iME1+4
 qglGbitp1UqwJCMwxuS/wKdfzRrSW5czP/jbC+BabNFHaiEz8IgjgPsROkzfvGX9Z6XHWH
 wu1wcFCyNF+r1Kdh286TBRXU5VOKVWxBu5M8v+WlCVAUYDbT8/+VV2OI74e9S8e4W2EmSF
 Z2nAsJLq8yolwldiuzHWuwfjh4DrexiOjL6HxMJSbPWO56/va2WuUZ3KHAELRAhM/qXZVT
 IHZL7NE3YpmuysKCCLvjiubs3UJSTDub8EWIh2OPiwz7smGSnbiOGfM+C6XNqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bA4XKCFM
Subject: Re: [Buildroot] [PATCH 1/1] package/eza: new package
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

On Mon,  2 Oct 2023 19:36:28 +0200
Saeed Kazemi <kazemi.ms@gmail.com> wrote:

> eza is a modern, maintained replacement for ls, built on exa.
> 
> https://github.com/eza-community/eza.git
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
> ---
>  DEVELOPERS            |  3 +++
>  package/Config.in     |  1 +
>  package/eza/Config.in |  8 ++++++++
>  package/eza/eza.hash  |  3 +++
>  package/eza/eza.mk    | 12 ++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/eza/Config.in
>  create mode 100644 package/eza/eza.hash
>  create mode 100644 package/eza/eza.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
