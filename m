Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83212C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33A8B40242;
	Thu, 29 Dec 2022 09:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33A8B40242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wL5ztCD4W4W1; Thu, 29 Dec 2022 09:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 273E2401EA;
	Thu, 29 Dec 2022 09:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 273E2401EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C2A31BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 447F740102
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 447F740102
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 20i_GyiVbr0S for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:34:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C408400DD
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C408400DD
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:34:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 537E2C0006;
 Thu, 29 Dec 2022 09:34:54 +0000 (UTC)
Date: Thu, 29 Dec 2022 10:34:53 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221229103453.4cb88cce@windsurf>
In-Reply-To: <20221229091735.216076-1-fontaine.fabrice@gmail.com>
References: <20221229091735.216076-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672306494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/XRywt9RDaoAs43DkdrslsK/XQ4p4eYUrd8h9sztRY=;
 b=UmxafmH4vOOdPa+SCTs0GWFEikboSYVnpNKAzzSAWNF+i82LvAz046TEqvKanNuSnBPCEX
 mlq9hK6GOU+iPUy0bWE0aMpRckCORyxxjh+eobkI9onUzHZ2faRStbVV5aKxxhvqxBzIOV
 /Za0T1IfvbTCCOOnvxOsf6nVC4ALeh5Ih0FDO2KlqtnMgjkvsXJKfuQQ+4iwZ6FCvWpdDC
 ftdQXwd+rgMb9Ap/BwXJEEt+HTMc5vF+JCh8lj4rHj9xQacitdk2cvlvV+Mv1SexCi3tGs
 vb5yGQLnq48VLYL7UwffTNEBLRsGrIE8wtkIv+TyTDjCShaD3MAwVzCWhQGznQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UmxafmH4
Subject: Re: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.4.16
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

On Thu, 29 Dec 2022 10:17:35 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2022-3190: Infinite loop in the F5 Ethernet Trailer protocol
> dissector in Wireshark 3.6.0 to 3.6.7 and 3.4.0 to 3.4.15 allows denial
> of service via packet injection or crafted capture file
> 
> https://www.wireshark.org/security/wnpa-sec-2022-06.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wireshark/wireshark.hash | 6 +++---
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
