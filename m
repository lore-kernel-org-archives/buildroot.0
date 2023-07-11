Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A092C0015E
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 09:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C45E402F4;
	Tue, 11 Jul 2023 09:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C45E402F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxSullU3xE9n; Tue, 11 Jul 2023 09:57:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68D6940189;
	Tue, 11 Jul 2023 09:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68D6940189
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 672F31BF28B
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 09:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E4CD417C4
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 09:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E4CD417C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gP7jZ6zAPEBb for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 09:57:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2730417BA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2730417BA
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 09:57:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC8421C000E;
 Tue, 11 Jul 2023 09:57:31 +0000 (UTC)
Date: Tue, 11 Jul 2023 11:57:30 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230711115730.5a8d7510@windsurf>
In-Reply-To: <20230711115458.34cc38a9@windsurf>
References: <20230627072640.2437216-1-james.hilliard1@gmail.com>
 <20230627072640.2437216-2-james.hilliard1@gmail.com>
 <20230710200146.33aa4362@windsurf>
 <CADvTj4ruzjfhJ-Ns9rPYhrW4oGWGqCkf66gUjTT+DR+DB8C3Xw@mail.gmail.com>
 <20230711093249.73674060@windsurf>
 <CADvTj4r7QRpW3NaYQc+_iZ5Y1WnzBeMQsptvtrtTudDc47X12w@mail.gmail.com>
 <20230711100053.1d9d3671@windsurf>
 <CADvTj4p1kQLf9J=s_xqHVZVeSwHUVVMBSMHPJsA-JT2oHHNCrQ@mail.gmail.com>
 <20230711115458.34cc38a9@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689069452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=chrg7Crg9tP3XJ+5D6MH1+YadFdTRZm3wNqDpsNvxiw=;
 b=NMzG1ZDr46RODMQVJm9OLLccSbw2TaYDElWAlzzqAA5VSFod+H4KOLmTZcxlDk/FOJV8HH
 FiWWDZROXOHbsQNSJ2wFvQ71tcNoGFc3YFZvEcKkv9us1+pGT2S5pdVztD2DdUgr51/qTW
 ViePjE3gUbLAbc45Wfv2fVRpIj/9FAEEbzTkZhD+YVX/61NqA+gUiNBJLf3U5ssRSe88gm
 P+J0NhPJa56hOFMnZD5t4LYodAc2BXSS+fIcELFmCi6GXxp9Pu3DCPPwfLsYEEBWLB0mgg
 QW8uWN3baWXfHmU/eXaP+DnbmasB8oj7DNThumqbxomejiLykhtSaR/NhH2NOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NMzG1ZDr
Subject: Re: [Buildroot] [PATCH 2/2] package/python-terminaltables: fix
 build backend
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 11 Jul 2023 11:54:58 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> This is a bad idea, which causes even more confusion, as we don't
> understand *why* you're making those changes.
> 
> Could you instead do what we suggest, i.e resend one single full series
> that include all changes, including the final change of the PEP517
> setuptools migration, together with a cover letter?
> 
> I've already asked this in 3 separate e-mails, but you insist on not
> doing what is requested to get your changes integrated :-/

Another problem of marking PATCH 5/5 as deferred is that we now have
PATCH 1/5 to PATCH 4/5 in patchwork, and we wonder where PATCH 5/5 has
gone.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
