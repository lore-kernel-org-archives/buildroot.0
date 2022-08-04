Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B64C19F2B
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 07:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0756C8141E;
	Thu,  4 Aug 2022 07:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0756C8141E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tR4NX1cWoJ6h; Thu,  4 Aug 2022 07:59:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CF8F81400;
	Thu,  4 Aug 2022 07:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CF8F81400
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 157221BF232
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 07:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F17FE40643
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 07:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F17FE40643
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u1P6pMqdR3G2 for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 07:59:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FF9D40503
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FF9D40503
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 07:59:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B8EB7240008;
 Thu,  4 Aug 2022 07:59:08 +0000 (UTC)
Date: Thu, 4 Aug 2022 09:59:07 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220804095907.4b22adc0@windsurf>
In-Reply-To: <CADvTj4r9D=kUa-N+HC2tVTt7Oxna=ZMSp-H5POaYzE2DsXCD-w@mail.gmail.com>
References: <20220313171355.271345-1-james.hilliard1@gmail.com>
 <20220803233856.3d609d8c@windsurf>
 <CADvTj4r9D=kUa-N+HC2tVTt7Oxna=ZMSp-H5POaYzE2DsXCD-w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659599949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1kmLMU+XJm9yb8CeHeuVvfTD2LD7UHf/S7jeJjScr4=;
 b=BOokC2YamgEZN3ExFlPsUhnwEmzJXGP8jepHSHsD2tJthsUsj8VKuHB1jFu23au8BTGx0n
 JBc0vjKZ3wADP1ajFDgjZXsEZCt7nRZfQlKfWQotLJVOZntHSjIWdE9BGbCc2p8gYluzw/
 Uc7qzkHCwQaLw/q5ivsvWiRtCoYQagccXm52L7gHWOJKhRRnADOY8sW5Jg73g2+gN5jwWJ
 Kul4CpQm2In6jnYQ1t4Yt35mbb1ht4LihPwQpKJEX1GecDO5AzRLzdtfFOtdotA3rYYfpp
 y4gD0ALH1e79PfX37XZjzVC3Cwg7O8MqC7bFUUfMmq5deuv6hKaXxK4kB8sPlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BOokC2Ya
Subject: Re: [Buildroot] [PATCH v2 1/2] utils/scanpypi: ensure tmp_extract
 is cleaned up on exception
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 3 Aug 2022 16:02:43 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > If I understand correctly self.tmp_extract is where the Python package
> > source code is extracted. So if you remove it at the end of
> > load_setup(), how will your new load_pyproject() added in PATCH 2/2 be
> > able to use the package source code?  
> 
> We're not deleting self.tmp_extract, we're just ensuring we current dir and
> sys.path states are cleaned up properly on failure, load_pyproject() does the
> same thing. Always restoring initial state at the end means load_pyproject()
> doesn't need to deal with current dir and sys.path global state changes induced
> by load_setup().
> 
> >
> > Also, why is this removal needed, as anyway the full tmp_path gets
> > removed at the end of the main() function?  
> 
> sys.path.remove(self.tmp_extract) is not the same as shutil.rmtree(tmp_path)
> 
> We're restoring the module search path at the end to avoid leaking global state
> changes when there's an exception.

Aaah, yes, my bad! I guess I shouldn't have reviewed this past midnight.

I'll go ahead and apply PATCH 1/2.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
