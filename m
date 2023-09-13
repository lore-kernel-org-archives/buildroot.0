Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB96DCA5534
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 09:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A02560FC9;
	Wed, 13 Sep 2023 09:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A02560FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DjPsUsnaybmP; Wed, 13 Sep 2023 09:45:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 489D060B78;
	Wed, 13 Sep 2023 09:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 489D060B78
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C50041BF847
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 09:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F4F34011F
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 09:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F4F34011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kElKvX2VwwPU for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 09:45:13 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F038140065
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 09:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F038140065
Received: by mail.gandi.net (Postfix) with ESMTPSA id B070F1BF206;
 Wed, 13 Sep 2023 09:45:09 +0000 (UTC)
Date: Wed, 13 Sep 2023 11:45:08 +0200
To: Wit <linuxcdeveloper@gmail.com>
Message-ID: <20230913114508.70a1ea44@windsurf>
In-Reply-To: <CAEVrM6QhnK8kbQDtjzx8_rNLTq4s96EK=vUQz-vf1QVZUpt64g@mail.gmail.com>
References: <CAEVrM6T=5vb98vVUr4AxNWf7xV6VSLyuNME1HpxW=KVJR1vvQw@mail.gmail.com>
 <CAEVrM6QhnK8kbQDtjzx8_rNLTq4s96EK=vUQz-vf1QVZUpt64g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1694598310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kAnA0i7eEvXr43p7SPcXLI8SiCMnIV/41kphDReLMmY=;
 b=mzoCUDi4bkHIdk7xaM9BGoK2ZcjTVLKOUB31gwW+Hn1WzOcvkTcnbqYs/LaYT8yQ+hxm/e
 LOw1uObzyq1Jm/XaDEPkvlsrMBAqB2FSXh2ShMe/KKZQXwETQnKAGT+SUo4MpnWW0wRNzp
 dbisJQm5xouCKqJQbar2gh58oOeBm2OCFmfvi1kJHXDY7f+4fQZuCrQdS/BLIS0LnJ1yVx
 T+AyxcxbSaYfOvAZO/NNFmM49NOPWBFsznWY6OhPHsbLFAuA47rOLsedwTJbEKbIfLYhpo
 7y50zd54WZs5vPu29F70cJlmnTI+Rta4EhMElQhLZyIpAY9u9GQxroVrU1FxAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mzoCUDi4
Subject: Re: [Buildroot] Fwd: [PATCH] fs/user-initrd: add new method for
 building customizable INITRD
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

Hello Witold,

On Wed, 13 Sep 2023 06:41:48 +0200
Wit <linuxcdeveloper@gmail.com> wrote:

> Hello All!
> 
> As for now user has not much influence on creation of contents of an
> INITRD image I've made some proof of concept of some wider idea of
> creating customizable INITRD image.
> This patch adds possibility of creating customizable INITRD image by
> selecting some of packages to install. At the moment it supports only
> glibc builds but I planned to add support for musl and uClibc as well.
> I've got also some other plans regarding this patch.
> This patch adds new submenu in "Filesystem images" main menu.
> 
> I'm sending this patch for evaluation. If the idea of this patch is ok
> for you I could take care of developing it.
> 
> Signed-off-by: Witold Kowolik <linuxcdeveloper@gmail.com>

Thanks for your proposal. A couple of comments:

(1) Your patch is line-wrapped, so difficult to review. Could you use
    git send-email to send your patches?

(2) Have you looked at Dracut and its integration in Buildroot? Because
    to me it does pretty much the same as what you're doing. We know
    Dracut's integration in Buildroot has some shortcomings, but I'd
    rather see them being resolved rather than introduce another new
    mechanism.

(3) I see you're using a Perl script. We generally try to have most of
    the Buildroot plumbing implemented either in shell or in Python.
    However, it's true that having a Python interpreter on the host is
    no longer required, while having a Perl interpreter is (which would
    go in favor of keeping a Perl script).

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
