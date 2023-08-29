Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B4BC6FA8F
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 11:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E04DF6079B;
	Tue, 29 Aug 2023 11:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E04DF6079B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pfbLQBevsuv6; Tue, 29 Aug 2023 11:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E2A360757;
	Tue, 29 Aug 2023 11:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E2A360757
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2D6B1BF2CF
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 11:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B39BB813C2
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 11:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B39BB813C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bWlU9BrpCVe3 for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 11:03:52 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31D21813B9
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 11:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31D21813B9
Received: by mail.gandi.net (Postfix) with ESMTPSA id D08A760009;
 Tue, 29 Aug 2023 11:03:48 +0000 (UTC)
Date: Tue, 29 Aug 2023 13:03:47 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230829130347.2e824d96@windsurf>
In-Reply-To: <ZO2RWByvuzXKowuR@waldemar-brodkorb.de>
References: <ZO2RWByvuzXKowuR@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693307029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mYqZ57VkhavJZhivZ2tJGl8dDPN/87uqceRBRfic6Dk=;
 b=byh5PewFKpw4BYDUgCkPE8m+0v4+8x5GpPA9t2O/iTuBnehHrHHaOxLZJwXXv91DzbGr6R
 ebSqhKc5urGYoSTrKi7mGvkF7FGii3MGSi0tYecMdOZfVhBsURjaVidPM6Hj8yM5cxGsEc
 EYdGbfCha8y/QQNCAMlUp2o5p+iuiysE4/HT/V5g/5Yv4kKfmeN+58WbQwSKaBCFji7FgX
 0rD1aRieaNnTmWoKc48iG2glogY0II7bxyx7mC1U3hCk6BJ3kBsaMZgiRhNZKdI9/eaesh
 9yqmsULaXIwfDU/eQMDjTb441BVF/UzpFTvFUUXOvb8cXZndhrE/U6hAkXqGZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=byh5PewF
Subject: Re: [Buildroot] [PATCH v2] package/f2fs-tools: fix musl compile
 error
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

On Tue, 29 Aug 2023 08:34:00 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> musl 1.2.4 removed the lseek64 function, but kept a definition of lseek64
> when _LARGEFILE64_SOURCE is defined.
> 
> Add patch from upstream to kill the usage of lseek64.
> 
> There is no need to backport it to older Buildroot releases, because musl 1.2.4
> is not part of any release.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/17f/17f4ea7d62581cf8c574deeb98e1785220d5bd3f
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   - add a patch from upstream to kill lseek64 entirely
> ---
>  ...ls-convert-to-lseek-and-kill-lseek64.patch | 459 ++++++++++++++++++
>  1 file changed, 459 insertions(+)
>  create mode 100644 package/f2fs-tools/0001-f2fs-tools-convert-to-lseek-and-kill-lseek64.patch

I like this much better than your previously proposed fix. Applied to
master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
