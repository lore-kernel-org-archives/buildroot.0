Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE70C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B7F7431BA;
	Wed,  1 Nov 2023 16:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B7F7431BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hDVAJ2b_o1S9; Wed,  1 Nov 2023 16:25:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 573D6431BD;
	Wed,  1 Nov 2023 16:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 573D6431BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5F941BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82E9481EB8
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82E9481EB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JDJde4cayanA for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:25:01 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67B92818CA
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67B92818CA
Received: by mail.gandi.net (Postfix) with ESMTPSA id B42D360002;
 Wed,  1 Nov 2023 16:24:59 +0000 (UTC)
Date: Wed, 1 Nov 2023 17:24:58 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231101172458.7adea9d2@windsurf>
In-Reply-To: <20231029220214.32159-1-fontaine.fabrice@gmail.com>
References: <20231029220214.32159-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698855900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVrX8lf8QIULodfVqKC3RGX8oPNy+qP44Tf8uYzL0Y4=;
 b=iG/+wnoLJK/qGYfZ5i9rn2SO3M3LN8g4+HedH6dnTpON8AHdGheIb9gygYRXRIkVmAuFYJ
 z49up7PVPEyEW0C95EE1+i9Xibx/uX7IUzvNOgX7KhQKeW9ld2uaOQgZl3xaSuGZbDlo3n
 f+qzNIDiEKPlSqzZNGubAYYXEcPx0h9d9R/YAXp2Addp1JYPYE3TnYzVcMyLqFeeAG/aus
 O9QQi536ym78Ua4GGdhzPcCXagCFY83MfkyRgK3Kc4SSKW8EOFW2GnpnYYJpPKJJCMJJTX
 iCSvcfoymVHUYfC9bIV+Eb7+wqkiSPPNXcdXtUdHCcDKIc4UoXdNyrxPMuWnqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iG/+wnoL
Subject: Re: [Buildroot] [PATCH 1/1] package/uftrace: bump to version 0.14
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 29 Oct 2023 23:02:14 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add Upstream link to patch (even if it was rejected)
> 
> https://github.com/namhyung/uftrace/blob/v0.14/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                                             | 1 -
>  ...01-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch | 1 +
>  package/uftrace/uftrace.hash                                    | 2 +-
>  package/uftrace/uftrace.mk                                      | 2 +-
>  4 files changed, 3 insertions(+), 3 deletions(-)

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
