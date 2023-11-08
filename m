Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BE3C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 21:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47C3F81F8E;
	Wed,  8 Nov 2023 21:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47C3F81F8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8UOA4Xw5P_F4; Wed,  8 Nov 2023 21:42:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAAE381F0F;
	Wed,  8 Nov 2023 21:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAAE381F0F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3AF71BF4DD
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54FB8416C4
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54FB8416C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iHE8gdw3Re_P for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 21:42:05 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65CBB41695
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 21:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65CBB41695
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CDECE0003;
 Wed,  8 Nov 2023 21:42:03 +0000 (UTC)
Date: Wed, 8 Nov 2023 22:42:02 +0100
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20231108224202.5c2709a7@windsurf>
In-Reply-To: <20230901192719.102415-1-dalang@gmx.at>
References: <20230901192719.102415-1-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699479723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i9SdOTje7WgG7ELMALSNuAlxttFlrQuOetxu/JV8eoc=;
 b=J+IV7dZEneAmgciXokanOVahzanuYY+KXeO1qeBooPtEaVfPlGkdKXU17iqfNHiJxCgDMC
 HIA0FqjIZnzKExX678CL1o8mRyEK57AeNM7aKGHo6Iad70/DqzIKLRafA8gJkMrf+NzpIK
 wCYo1X4570wc7RGk7lcdiLFCi1s9ZPZJOmXCspimg/lmeeYd9sMfDSI+NMs/O5l9tXyadv
 UeogXiVdDnabOuUkD46YuLLiYoSvexCANfxO3WGz3xEsfzqzT/B0dN/FvkwuJF9rSggDVI
 PLUZgAShaXrq7eQFS06KjS1Xdr0dzdtoN7c7H5KF4VU8X/qDmdaex6b6RA/AXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=J+IV7dZE
Subject: Re: [Buildroot] [PATCH v4 1/6] support/scripts/pkg-stats: ignore
 more makefiles that aren't packages
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
Cc: Sen Hastings <sen@phobosdpl.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  1 Sep 2023 21:27:09 +0200
Daniel Lang <dalang@gmx.at> wrote:

> Some packages are grouped and have a general makefile that defines
> reusable variables. These makefiles have no relevant information for
> pkg-stats and should be excluded.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
> v3 -> v4:
> - Added more packages to ignore list, not just llvm-project
> ---
>  support/scripts/pkg-stats | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

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
