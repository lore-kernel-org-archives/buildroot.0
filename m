Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE43CAC5A0
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 08:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9094F83F0E;
	Sat, 20 Sep 2025 08:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gn9UAo9DU4Oe; Sat, 20 Sep 2025 08:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C20AD83ECA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C20AD83ECA;
	Sat, 20 Sep 2025 08:45:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D251EE7
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 08:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8BEA83ECA
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 08:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dv_f6qSxJdV for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 08:45:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 53BEC83E53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53BEC83E53
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53BEC83E53
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 08:45:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 01F101A0F27;
 Sat, 20 Sep 2025 08:45:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BC7E560630;
 Sat, 20 Sep 2025 08:45:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DE639102F18C4; 
 Sat, 20 Sep 2025 10:45:41 +0200 (CEST)
Date: Sat, 20 Sep 2025 10:45:40 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org, Antoine Tenart
 <atenart@kernel.org>, Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20250920104540.70c271d7@windsurf>
In-Reply-To: <aM5EvEkrOXv30D78@waldemar-brodkorb.de>
References: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
 <20250909120822.1069595-2-thomas.petazzoni@bootlin.com>
 <14e1befe002ce593820b4bc1dd63d04e@free.fr>
 <20250915080605.579fa2e0@windsurf>
 <aM2kFrdPdzNWbXhj@waldemar-brodkorb.de>
 <20250919210040.6f247422@windsurf>
 <aM5EvEkrOXv30D78@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1758357950; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2oxHOde/iFckBOdqALppQhbPpmfqUWZl12ngIGMgqqc=;
 b=GNnNCiLdU7AmbNRngVxXq+oweyVdH9ox7xnlHaY+GkCTFIPCr8w1NGV76FbmP73IGKiD01
 4YKgAaC6VTbD0h39ICtBWjp3Z+i2DvYoK6d9tY+7pD2u9bYr0QTl8M92pRBcsD84Zr7JBn
 n/wgXpVvTuohHAuDTlsW3RviQR98zwamjo9wK4FdbojtwVq4i1Ksrx/ubo0VeOh5Fsx7g7
 aj8xbpuKCZ1M3z/b6LmtfTZt1cxUwEsNqUba3XcvsJMcPzNT8zpKIVy0kA66gNK03bLq67
 6BNirXw8nlMT+fmVr0z9yEdwQK1GFHsVxgFhVCUnN+uNxQJbwKRw+TQiXC4O+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GNnNCiLd
Subject: Re: [Buildroot] [PATCH 01/11] package/libselinux: fix build issues
 caused by 3.8.1 bump
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

On Sat, 20 Sep 2025 08:07:56 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> > Defining FILE_OFFSET_BITS=64 all the time works fine with everything
> > but uClibc-ng, so I'm tempted to think that something else is wrong in
> > uClibc-ng, but I'm not 100% sure.  
> 
> __INO_T_MATCHES_INO64_T is a internal macro in glibc.
> As uClibc-ng tries to be compatible to glibc we can add this macro.
> 
> What do you think about following patch, attached to this email?

I guess it does fix the build, but I have no idea whether this is the
right fix. Probably it is if glibc defines those magic macros under the
same WORDSIZE == 64 condition, but I clearly don't pretend to fully
grasp what's going on.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
