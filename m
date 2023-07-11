Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC278EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 09:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FEB140204;
	Tue, 11 Jul 2023 09:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FEB140204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIZVfOmWzgph; Tue, 11 Jul 2023 09:55:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C7AF40189;
	Tue, 11 Jul 2023 09:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C7AF40189
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B77541BF28B
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 09:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FBEC81F1E
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 09:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FBEC81F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CkPBIGAQIIhz for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 09:55:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FF9881ED2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FF9881ED2
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 09:55:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB43020003;
 Tue, 11 Jul 2023 09:55:00 +0000 (UTC)
Date: Tue, 11 Jul 2023 11:54:58 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230711115458.34cc38a9@windsurf>
In-Reply-To: <CADvTj4p1kQLf9J=s_xqHVZVeSwHUVVMBSMHPJsA-JT2oHHNCrQ@mail.gmail.com>
References: <20230627072640.2437216-1-james.hilliard1@gmail.com>
 <20230627072640.2437216-2-james.hilliard1@gmail.com>
 <20230710200146.33aa4362@windsurf>
 <CADvTj4ruzjfhJ-Ns9rPYhrW4oGWGqCkf66gUjTT+DR+DB8C3Xw@mail.gmail.com>
 <20230711093249.73674060@windsurf>
 <CADvTj4r7QRpW3NaYQc+_iZ5Y1WnzBeMQsptvtrtTudDc47X12w@mail.gmail.com>
 <20230711100053.1d9d3671@windsurf>
 <CADvTj4p1kQLf9J=s_xqHVZVeSwHUVVMBSMHPJsA-JT2oHHNCrQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689069301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54YnXYSA0e1IAuramszqCd5mQIn2FDyDEgh1rcrqOVU=;
 b=JVkRHSrhVkpGGuBbMYwQwSmBrsRb/luQahDo6TjnridWCYaAy51GyLLKfrSFr1U2VEKRIs
 mWRmjgSVJR7afsf0VkmpbbYpU9xdFlVcL3gEXRdBc1sXQaKTAvBTPSdZc0b2pplviV8MYx
 qbKaPvNeZrBimfkjKXGE+YL9CWzBWN5/eb6funVUGU3v09IOEIY5DYDcqmTs9zB2mlIFeq
 5358q1ezKw3PadzVvFBpz0Oh05Q+xD9bDdUotcDKADxkS1kqDSki5kHLY/nYCS3rfLKSYN
 B1y+Tcu3psWB/JufNB2H69P49HLatTP65iXcRdXfEQFByh9Om1MHNKytxFHWWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JVkRHSrh
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

On Tue, 11 Jul 2023 03:43:26 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> This series can be reviewed entirely independently of the other one, I
> went ahead and marked the final pep517 setuptools migration patch as
> deferred for now so that there aren't dependency ordering issues or
> confusion regarding the relation of this series to the other one.

This is a bad idea, which causes even more confusion, as we don't
understand *why* you're making those changes.

Could you instead do what we suggest, i.e resend one single full series
that include all changes, including the final change of the PEP517
setuptools migration, together with a cover letter?

I've already asked this in 3 separate e-mails, but you insist on not
doing what is requested to get your changes integrated :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
