Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E976C001E0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 21:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 996348211F;
	Tue,  8 Aug 2023 21:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 996348211F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DI6NHieaHP92; Tue,  8 Aug 2023 21:54:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D913082071;
	Tue,  8 Aug 2023 21:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D913082071
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6CD11BF82D
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 799A6611A3
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 799A6611A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cd8APbjFnA0W for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 21:54:36 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3503060FAB
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 21:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3503060FAB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C475FF804;
 Tue,  8 Aug 2023 21:54:34 +0000 (UTC)
Date: Tue, 8 Aug 2023 23:54:33 +0200
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20230808235433.671b0ca3@windsurf>
In-Reply-To: <20230808214153.1453666-1-f.fainelli@gmail.com>
References: <20230808214153.1453666-1-f.fainelli@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691531674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ThPFzbuCFGvxZH2RNi7sAKYw1T146BVt2PYEtP0DOcw=;
 b=dOrwsfg4udLidge+XEMlBmhxI+c7hSCBUwQ82h2Bmhel6HCK4wd5V8vqdfuw+08Hfdu8Be
 nr0CJK5ZmJ5jWTG1Hp5hSRZ/oFyguKh3slNiyoAtAtHFYcZheJuYtl68RTwsCR28/liL/g
 MUw+KS2TOb7qYp9OLWBQMKG8pFPJytrpiijGr+AIIwuSTg3vl7/wZa2dRdEZDttbt3pIC8
 DgZ+uIi0NxqUUclZHh2Bb0DBzVEp7UQzXiFdeH5TdKPaL2+qYMlMIV9Fl6xhmYzeNo51zQ
 yxegYKPHLmo/ixi/l+q2S2EjXxh/GJGu3bd3hU8Llhco+IgKcX4jBXKxugQHeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dOrwsfg4
Subject: Re: [Buildroot] [PATCH] arch/mips: Allow building for MIPS IV
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

Hello Florian,

On Tue,  8 Aug 2023 14:41:53 -0700
Florian Fainelli <f.fainelli@gmail.com> wrote:

> MIPS IV is an older ISA than R1 but is still useful to support older
> MIPS-based systems (e.g.: Cobalt Qube).
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks for this patch. Support for MIPS IV was initially in Buildroot,
and got removed in 2014, as part of:

commit dd45fe0efb678a8a674330ad46b7641a3284dff9
Author: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date:   Mon Dec 1 11:16:59 2014 -0300

    arch/mips: remove deprecated mips1/2/3/4 support
    
    Remove the support for generating mips1/2/3/4 code since it has been
    deprecated for more than a year now.
    Also remove the unnecessary kludges in packages for it.
    
    Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
    Acked-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

> -	  64bit capable: 64, 64r2, 64r3, 64r5, 64r6
> -	  non-64bit capable: 32, 32r2, 32r3, 32r5, 32r6
> +	  64bit capable: mips4, 64, 64r2, 64r3, 64r5, 64r6
> +	  non-64bit capable: mips4, 32, 32r2, 32r3, 32r5, 32r6

This list is quite odd, because it's not even an exhaustive list of the
MIPS cores that we support.

Is mips4 supported by glibc, uclibc-ng and musl?

Since IMG kind of gave up on MIPS, we have difficulties in getting some
help in Buildroot to maintain MIPS support and address issues, so I'm a
bit cautious about adding more MIPS stuff.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
