Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7537FC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0EF34098C;
	Wed, 27 Jul 2022 07:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0EF34098C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVYBPmG4Xil5; Wed, 27 Jul 2022 07:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D454098D;
	Wed, 27 Jul 2022 07:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0D454098D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D211D1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3BC9401C5
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3BC9401C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BnVlZiFvrQXq for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:40:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14A61403E9
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14A61403E9
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:40:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 274C0200007;
 Wed, 27 Jul 2022 07:40:35 +0000 (UTC)
Date: Wed, 27 Jul 2022 09:40:33 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727094033.21f2e5da@windsurf>
In-Reply-To: <20220727071412.330214-1-fontaine.fabrice@gmail.com>
References: <20220727071412.330214-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658907635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=duqdqVd5w9T6PuJN7I6K7ti0Igx71/x8QA+XLh40Bro=;
 b=emUHqf9RIaX4Tp5BZh+9gi9EkBjUARJ6NBV1LN2PhI5JRYugPTWroPGszwmEzwxgvPnx2d
 +WybDa1u8icpTLJPu75N8RfWuXw2xEvq/xoMfpWKoiFsH9A0zRKeHwis+ZKQwPY+4J6+jq
 4vmigWD/Xxl5NTtTyjvn8MVuFCeHbFPF9bC5iuNfUD7QXXCXduLPXpfUlo3+BbmSZkhTxr
 PnC/oWdm6zSey//3UE/GFFb2tevc1uUK7eXJyy4UmyP+hZe7x4iDVX0VW3VK4iWftGomKB
 W9oflxDgRF1W1G0+PuhIHoEZtL61hyG3Bp4KDmOR31W19CEBlLXoO+mJk/CrQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=emUHqf9R
Subject: Re: [Buildroot] [PATCH 1/1] package/zeek: disable with uclibc-ng
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

Hello Fabrice,

On Wed, 27 Jul 2022 09:14:12 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> zeek unconditionally uses f_owner_ex which is only available with
> aarch64 on uclibc-ng
> (https://github.com/wbx-github/uclibc-ng/search?q=f_owner_ex) resulting
> in the following build failure since the addition of the package in
> commit ea36681572255ec906167308c07adc42ed2ac9f9:
> 
> /home/giuliobenetti/autobuild/run/instance-0/output-1/build/zeek-4.1.1/auxil/libkqueue/src/linux/platform.c: In function 'linux_kqueue_init':
> /home/giuliobenetti/autobuild/run/instance-0/output-1/build/zeek-4.1.1/auxil/libkqueue/src/linux/platform.c:279:23: error: storage size of 'sig_owner' isn't known
>   279 |     struct f_owner_ex sig_owner;
>       |                       ^~~~~~~~~
> /home/giuliobenetti/autobuild/run/instance-0/output-1/build/zeek-4.1.1/auxil/libkqueue/src/linux/platform.c:383:22: error: 'F_OWNER_TID' undeclared (first use in this function)
>   383 |     sig_owner.type = F_OWNER_TID;
>       |                      ^~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f15bc6fda2a6117b2beef91a3f97a5d063789102
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

It's probably a bit of a pity to disable this package on uClibc just
because of this missing structure. I have no idea why uClibc has it
just in the aarch64 headers, because on both glibc and musl, it's
defined in a completely generic way.

So here is my proposal:

 (1) Unbundle libkqueue from zeek, by creating a separate libkqueue
     package (BTW zeek should be investigated further, it contains
     several bundled libraries, and it should preferably use external
     packages instead of bundled libraries).

 (2) Add a patch in libkqueue that checks for the availability of
     f_owner_ex, and if not available, provides its own definition.

 (3) Send a patch to uClibc to add the missing f_owner_ex definition.

Do you think you could have a look into this?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
