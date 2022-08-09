Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D37EC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 11:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D55BA4043A;
	Tue,  9 Aug 2022 11:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D55BA4043A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0RWAI7llvida; Tue,  9 Aug 2022 11:34:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C20EC402CE;
	Tue,  9 Aug 2022 11:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C20EC402CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7775F1BF2C7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50050402CE
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:34:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50050402CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AK9K_WYBAejS for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 11:34:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAF3E40297
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAF3E40297
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 11:34:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4E1ED240006;
 Tue,  9 Aug 2022 11:34:13 +0000 (UTC)
Date: Tue, 9 Aug 2022 13:34:12 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220809133412.521708e3@windsurf>
In-Reply-To: <20220809083325.1906594-2-fontaine.fabrice@gmail.com>
References: <20220809083325.1906594-1-fontaine.fabrice@gmail.com>
 <20220809083325.1906594-2-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660044854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SFcGZCPF1SGHxCUhBgcbASRA0kY+U13rJ3BuE7AiHWo=;
 b=lF7VNyyeGo/SJ61p7kIxv9oTZd8SQrPrqdQuCcaIRJ4wGBpuug/9FU+mfRstbXDiCTalhQ
 lRLbh4gFV+KoSxXrjrX+yopk4015eNXjQmsOHJYz3oECsl0aZTKnrv85HZezvLMUXHyYZg
 +fWTnpW83ZFuZEFVP6y3RHf7RVQuj6Z/mslAZUn98hxD6kd4ExNud0dfCfayfzUFWUFlPo
 A9Ei2rCLngKi0VsKkpvcbhmUMbPmXbSXaYVuieBw2aRuQP9kr3Vq7tsKWOAHcRGcsmKcCA
 6eCmrH2MKILA7eafwBCm2BlaaQt5oD6MDoRycVanU9R9ZW8skBsw5xl2Y/tCTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lF7VNyye
Subject: Re: [Buildroot] [PATCH 2/2] package/refpolicy: set default values
 for custom repo
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
Cc: Antoine Tenart <atenart@kernel.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Tue,  9 Aug 2022 10:33:25 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set default values for custom repo to make sure that a random
> configuration with an empty repo location or version for refpolicy
> doesn't fail.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/98da07a1f9b88e2e8a028a55c8cf76c6ebc28304
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I don't think that's the right way of solving this, because it would be
inconsistent with what we do for Linux, U-Boot, Barebox, TF-A and all
those projects that have a configurable version/repository option.

So I have instead applied your patch fixing the indentation in
genrandconfig.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
