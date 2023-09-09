Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33FFEEB57F
	for <buildroot@archiver.kernel.org>; Sat,  9 Sep 2023 06:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F38882134;
	Sat,  9 Sep 2023 06:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F38882134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CrsQlWlb_k6o; Sat,  9 Sep 2023 06:31:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 543C982083;
	Sat,  9 Sep 2023 06:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 543C982083
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B77F1BF846
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 06:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7567840A50
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 06:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7567840A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FnIX5XkIABHQ for <buildroot@lists.busybox.net>;
 Sat,  9 Sep 2023 06:31:35 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D2D040018
 for <buildroot@buildroot.org>; Sat,  9 Sep 2023 06:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D2D040018
Received: by mail.gandi.net (Postfix) with ESMTPSA id 506BA240003;
 Sat,  9 Sep 2023 06:31:32 +0000 (UTC)
Date: Sat, 9 Sep 2023 08:31:31 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230909083131.12269b20@windsurf>
In-Reply-To: <CADvTj4qEN2LesjKx3Ct20xgETaVUpzoVSMfG+3Y+FVF601X05w@mail.gmail.com>
References: <20230908192714.2716398-1-james.hilliard1@gmail.com>
 <20230908214620.0d515173@windsurf>
 <CADvTj4qEN2LesjKx3Ct20xgETaVUpzoVSMfG+3Y+FVF601X05w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694241092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hDDKm1ycHzwWDwIgx+tIZENaB8xBY7YdfBU3xBWtgfc=;
 b=dIVuIC2rqF+q0TEtq/GSimKSht+CClLTrLGrTK2M6s7Z5gdKWjSjpopBtqSlbhqKq9TAfc
 PPmXvvH7ZlIWtuvKe7WLTogeRNlovzWTL/EVeUDoSAOFIkrTUqDSPRyELRsYQ/HGQ/Yy4M
 UG6pDRCad3dzUwLVxpyzUJR/7DaX0oHUli6uMRS5EI0TEOD1mdliB3C3+02La7xk1TkSx4
 tu2Mf660fe2l1SwVWUNUq/xjsMrkehZ0zEvFA7/CMM8pnLfe9kefYtiuHr3udqPCpRceGh
 AjZUEse+cGKI/0eg7krc+RIugXbejGj1PTUv2VsLL7C2fy6BqS2pBW/0oC+BNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dIVuIC2r
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.18.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 8 Sep 2023 14:58:23 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > Shouldn't this have been changed to -Dsoup2=disabled as part of commit
> > dff67170f73959e6826ec3e87e892747f8d3a5fb, which changed wpewebkit to
> > use libsoup3 instead of libsoup2 ?  
> 
> There were build errors, the version bump seems to be required to use libsoup3.

Could you provide the failing defconfig, and verify indeed that with
-Dsoup2=disabled it doesn't work, without the version bump? We want
justifications that are more convincing than "seems to be required".

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
