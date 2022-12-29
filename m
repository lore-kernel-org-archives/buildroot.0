Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9413C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5997340498;
	Thu, 29 Dec 2022 09:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5997340498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IPfNtxsbxdOX; Thu, 29 Dec 2022 09:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ECFB4057F;
	Thu, 29 Dec 2022 09:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ECFB4057F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CF9F1BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB04E402B8
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB04E402B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnY7NARaJ0_7 for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:05:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A7E840201
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A7E840201
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:05:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AFA7F240008;
 Thu, 29 Dec 2022 09:05:46 +0000 (UTC)
Date: Thu, 29 Dec 2022 10:05:45 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221229100545.00b3e43a@windsurf>
In-Reply-To: <20221229084814.3302-1-fontaine.fabrice@gmail.com>
References: <20221229084814.3302-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672304746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFTCd5lD3+rMHA6cLEc9qgW4s7WGEVzhz9Cx5pW/bXI=;
 b=RxDz+/59A9wH708T/eTaiH8pGrQ4t+JmYZb6QQg8JI+OuiTibpHlc4DCL+hbJHWWA6lgNW
 qEx7heWBVXDipugjD6ai+sNjnd+i8ngJzhY83xExXHCWTgvJnJmHC3OOIjNk5FKmGg+R3v
 HpuILVDcIMPcy0DTYyAhN96dzfiyBWxEOhzeuj6+WwgDik0aZ+Ts6rWtRy9BladZP/PmdO
 6FGo2HfKwlSN9gFkQtsxutAZbvu25txRnn491p/siX+7s/At3Uyr70hC3OFsRZig3SPNzA
 Sc9Gsllk7HApKhuIb7j7Wbm2M4nowM4wB18NE/8kX5hA8RqnDrrKc6h9ugLC2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RxDz+/59
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/tiff: add libdeflate optional dependency
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

On Thu, 29 Dec 2022 09:48:14 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libdeflate is an optional dependency which is enabled by default since
> version 4.2.0 and
> https://gitlab.com/libtiff/libtiff/-/commit/3a2de853a932bd0ea79d1677d319841edb736c38
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Drop default y

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
