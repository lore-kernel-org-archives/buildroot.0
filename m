Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C41C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 638A64157A;
	Wed, 27 Jul 2022 14:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 638A64157A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NK3SMajgeWm5; Wed, 27 Jul 2022 14:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BC3C4156F;
	Wed, 27 Jul 2022 14:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BC3C4156F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 703761BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B5AE4013D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B5AE4013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9gpnVP7gAEsj for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:53:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C94B8400DD
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C94B8400DD
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:53:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B6A742000E;
 Wed, 27 Jul 2022 14:53:45 +0000 (UTC)
Date: Wed, 27 Jul 2022 16:53:44 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727165344.6d24a47a@windsurf>
In-Reply-To: <20220727122551.1179103-1-fontaine.fabrice@gmail.com>
References: <20220727122551.1179103-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658933626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nW8FGJd/ndc4Z6hALNcTZwwcjUH49rSjwAQ0klJFmcU=;
 b=i1ItAW3rohCctXnlbffsm2/4tYnJbClsv7mQPR31E/KpSuZDWafVrf78tcarKvD/jODdvL
 4PYh16F7dEMZKzJxMvbYLLhOl1lpQrzaNJxd9Bz8YglApL4hyBE4iUvAZSP6Q/LyVmxnKI
 lpj/uxiFZciInaShqEgK1OaG3nVeo7mw1k4iuoe//sIujRNADw3sc1/EJr+oglr8hyFS8H
 mf3nHXiXqpGm22gX2PhXYOEmH5FLiE7CudeTlmSnKn0S45Obhp3FzDFMn26pxtSid/Ftj7
 sPMt50e0qza4UXSXlG6P+acyZP3kdQ/FDsLDQfEFlGZy87LPw0INw47mg9IGuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i1ItAW3r
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodsecurity: bump to version
 3.0.7
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 14:25:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Switch to pcre2 as pcre is deprecated
> 
> https://github.com/SpiderLabs/ModSecurity/releases/tag/v3.0.7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...build-pcre.m4-fix-build-without-pcre.patch | 29 +++++++++++++++++++
>  package/libmodsecurity/libmodsecurity.hash    |  4 +--
>  package/libmodsecurity/libmodsecurity.mk      |  9 +++---
>  3 files changed, 36 insertions(+), 6 deletions(-)
>  create mode 100644 package/libmodsecurity/0004-build-pcre.m4-fix-build-without-pcre.patch

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
