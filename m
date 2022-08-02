Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604AFC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 09:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E50F04050C;
	Tue,  2 Aug 2022 09:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E50F04050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0CsVKx98M0f; Tue,  2 Aug 2022 09:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D55D24058D;
	Tue,  2 Aug 2022 09:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D55D24058D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 359781BF57B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 09:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D5E940585
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 09:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D5E940585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ke9oPcA4mh5 for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 09:39:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47F8A40538
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47F8A40538
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 09:39:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 24CD31C0003;
 Tue,  2 Aug 2022 09:39:28 +0000 (UTC)
Date: Tue, 2 Aug 2022 11:39:26 +0200
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20220802113926.11f5814a@windsurf>
In-Reply-To: <CADYdroPfP0DZeHr3zEm052phSmi+iJFUomumySKgcU7JwWXJ4Q@mail.gmail.com>
References: <20220729154637.11397-1-fontaine.fabrice@gmail.com>
 <20220801185444.0f41358e@windsurf>
 <CADYdroMZn_F88AN2qtVbr+54=eAgJ4+e+d2d3_ErcPggynyGzA@mail.gmail.com>
 <20220802104049.560f9001@windsurf>
 <CADYdroPfP0DZeHr3zEm052phSmi+iJFUomumySKgcU7JwWXJ4Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659433168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7uTazPk4V+3JghVOmzjt4Xn62rlehJ0oSPXBjXAn9nU=;
 b=alR4Q/jEAL+rknUnzqV0rvRlvgKaRdKPxl19J01Bg+Os/bhVqkGlxVv3QqslzHrKCM5TQQ
 7nAEllaBEVSmx+cAnfdlXApL8+TMmvdvwQfAN6X0chWDwb2kDC/lhU67ld5IlJ5xnMhRai
 jPBhYnQfnbqX40rS0yQ+YRpDCJ7NZxOdvzr96DDbZDSbizzm5BKq/DgGlmDGRvyuz9sPI4
 qhPkeq1YOy3cblc9OzV0QpaiC0RrMgS3Li/YoHjYUE3jHyPTx+SgKFUL3EnWVT2T1iwlj7
 Nz4hYkNsiD/+aecweQTGEZQ18IWIy/NxjdSYz2O7FU72LXK/ggBItlDYtXidCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=alR4Q/jE
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/pkg-autotools: fix runtime path
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 2 Aug 2022 10:49:31 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> wipe doesn't have a configure.ac and autoconf'ed with a really old
> version.
> WIPE_AUTORECONF = YES should fix it.

Could you try if it does? If so, I think this is OK. We will see how
many other packages are affected. If only wipe is affected, fixing wipe
is fine. If too many packages are affected, we will have to think of a
different solution.

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
