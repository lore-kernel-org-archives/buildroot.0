Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7993AC71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 13:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12DA0801EA;
	Tue, 29 Aug 2023 13:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12DA0801EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JPKYuKL0b9mp; Tue, 29 Aug 2023 13:01:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00EC081F52;
	Tue, 29 Aug 2023 13:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00EC081F52
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A8071BF46A
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51B3340347
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51B3340347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U1JfCsAMi0oT for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 13:01:23 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C944A40925
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 13:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C944A40925
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id BA7BFCAA09
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 12:55:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23B7840004;
 Tue, 29 Aug 2023 12:53:51 +0000 (UTC)
Date: Tue, 29 Aug 2023 14:53:51 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230829145351.06ae6205@windsurf>
In-Reply-To: <ZOy9diJAMsHJaqH6@waldemar-brodkorb.de>
References: <ZOy9diJAMsHJaqH6@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693313632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hDj54iTp3HtlumybRulIIK5JLl36RHR2xZTIH4rx5oQ=;
 b=RXWEKG2bxa+OblKPgzTi1gCAqBMl1d5RY4fXgM5ONs1CRijUWtqxeH95AG12GmmFGkSKr5
 qjqD9s+BNkcyTbvGlCUvVLBCA5htknmlJGVHJfkaoeiyOL50lWAflDA5bFF/vbP79EHeom
 C4yiKgCzKyY8lKuRs+Zsk140FOWU+PpLrGB5hiC6Um5oa8COfkEIWpJ23cyWE6Fy8T9Kg/
 OIV4ZqODyDWghlmcFuo0yyJA3Gy1Lb7hkTcKFByUchd6UjaVsO7JdDBVGLP0IHH53tHVEA
 nVRiOYYjtX0Z6G7QVMHp4d2PVbo44qkNbEJ7gFHn2zOcZrNpNmEZZfGE+Qwyhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RXWEKG2b
Subject: Re: [Buildroot] [PATCH/next] package/mutt: bump version to 2.2.11
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 28 Aug 2023 17:29:58 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See http://mutt.org/ for any news.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/mutt/mutt.hash | 2 +-
>  package/mutt/mutt.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
