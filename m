Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417C0C47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED4A56F4DE;
	Thu,  4 Jan 2024 21:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED4A56F4DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cf4yChqM0uLu; Thu,  4 Jan 2024 21:32:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5002C6F4CE;
	Thu,  4 Jan 2024 21:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5002C6F4CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F20401BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C96C343825
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:31:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C96C343825
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qmiq0S82zbo5 for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:31:07 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A7FA400D6
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A7FA400D6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AA88E0002;
 Thu,  4 Jan 2024 21:31:04 +0000 (UTC)
Date: Thu, 4 Jan 2024 22:31:03 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240104223103.0be9d2b7@windsurf>
In-Reply-To: <20240103192200.908186-1-fontaine.fabrice@gmail.com>
References: <20240103192200.908186-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704403864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EuhpV0tL+4mzZQ8jKB3j/ANGffiU+8wJYVAQ6VlwHa8=;
 b=B8amY4x2Kqe/vqRSiitcaJa0hv4dbwJ1X5YQ4dM05y9LCUyAn2SQu2BvYDZb+/IdfqvpCI
 ji+5ivXqgji5R5uxk6kwLIoHZkJQJx9yiuTKS+EFsdM7S6LdJa5fmTI4rk/vni2wW6SWnl
 s2D53VFgs+ZxoqvplJmCUGZaXrDC81g85mI9B+yui3yw2DNmaG6Jgkzv1G04weyTJYPBlT
 agp/4D5gK0qImDLdDY3cAzfPw5VYrntbvw6NnJPBITj4TAuz+2TVhbsGVP8fiOgWBaXXte
 HTnoaQLHHGofJ+o/Jmh8CmyP8X+vNOidKYSwMBX0PkYe/wI3+mSLZOw6IRzX1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B8amY4x2
Subject: Re: [Buildroot] [PATCH 1/1] package/tinyxml2: bump to version 10.0.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Jan 2024 20:22:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/leethomason/tinyxml2/releases/tag/10.0.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tinyxml2/tinyxml2.hash | 2 +-
>  package/tinyxml2/tinyxml2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
