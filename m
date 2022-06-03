Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A85C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Jun 2022 08:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DF4241A22;
	Fri,  3 Jun 2022 08:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFviKCFYoYwX; Fri,  3 Jun 2022 08:02:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDDAA419D1;
	Fri,  3 Jun 2022 08:02:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CB6E1BF362
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 08:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AD23400F3
 for <buildroot@lists.busybox.net>; Fri,  3 Jun 2022 08:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iMC90F09kB3k for <buildroot@lists.busybox.net>;
 Fri,  3 Jun 2022 08:02:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EA77400AF
 for <buildroot@buildroot.org>; Fri,  3 Jun 2022 08:02:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8DBD6240006;
 Fri,  3 Jun 2022 08:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654243369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rumSkiNN2c1L1GNQ2u56d9egWPu3lrJZCHcHrQDjbLg=;
 b=CfqPQbCBp/I9jVlx4R8OV9IKQPxQcm0PsFbm7mwu2TJF+qPcsOPlelQZzY5fKJ0DZyDjQF
 5bEokVbTX0Dsrq/zIa8mXijU0lL9d1nYlJj4DGgXn0eeylZdfaW7nelAOHP7JDA4XromEZ
 UesnN3ukbGjs5U00K9J6Ojlq9WhbI6Bc6CytyM7zv/11t3F3b9UxDoxOq06a7d01osTiZK
 9XCdSYDBBsRtIM58ofuC+dbSE+AGRq49GYF8qh7FGpIyafeehLBxVeARr7ufHsfFXGElZU
 cETl5C7QViXMdQrZDJFGYAmn505XVBKKdWp0fL2Xkf3dllXaIByAeeOI6lIz9w==
Date: Fri, 3 Jun 2022 10:02:48 +0200
To: Christian Stewart <christian@paral.in>
Message-ID: <20220603100248.01f89db7@windsurf>
In-Reply-To: <CA+h8R2rTCXB1bu4_0Pwxx7yzkYrY9P8DTbkSTuKM8bEa50dJVA@mail.gmail.com>
References: <62999194.1c69fb81.b5e75.5008SMTPIN_ADDED_MISSING@mx.google.com>
 <CA+h8R2rTCXB1bu4_0Pwxx7yzkYrY9P8DTbkSTuKM8bEa50dJVA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-06-02
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 2 Jun 2022 21:48:56 -0700
Christian Stewart <christian@paral.in> wrote:

> Thomas,
> 
> On Thu, Jun 2, 2022 at 9:44 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >   aarch64    |         host-go-1.18.2         | http://autobuild.buildroot.net/results/24c9186f5583e2849fa1753f3bc3cfb1441c5a4e  
> 
> Building with musl on aarch64, pthread not defined errors,
> 
> is BR2_TOOLCHAIN_HAS_THREADS set with musl, and if so, is pthread
> available there?

Well, there are several symbols causing problem which are not related
to pthread:

runtime/cgo(.text): relocation target stderr not defined
runtime/cgo(.text): relocation target fwrite not defined
runtime/cgo(.text): relocation target vfprintf not defined
runtime/cgo(.text): relocation target fputc not defined
runtime/cgo(.text): relocation target abort not defined

so I'm not sure the issue is pthread related here. Obviously musl does
implement fwrite, fputc, etc.

And yes, musl implements pthread, so BR2_TOOLCHAIN_HAS_THREADS is true
for musl-based configurations.

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
