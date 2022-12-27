Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AF3C4332F
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 13:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DFA0402BC;
	Tue, 27 Dec 2022 13:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DFA0402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eoUlreX1Bx9c; Tue, 27 Dec 2022 13:53:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55C3440257;
	Tue, 27 Dec 2022 13:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55C3440257
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E5C71BF32D
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 13:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77CCB40257
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 13:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77CCB40257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s6bUzKXT84iv for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 13:53:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 435E240070
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 435E240070
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 13:53:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B3E96C0005;
 Tue, 27 Dec 2022 13:53:47 +0000 (UTC)
Date: Tue, 27 Dec 2022 14:53:46 +0100
To: Max Filippov <jcmvbkbc@gmail.com>
Message-ID: <20221227145346.41a0170c@windsurf>
In-Reply-To: <CAMo8BfL61tm-ojZvSqPB7C4bzqOaugTCOo8fQ+ap-wn1k36GQQ@mail.gmail.com>
References: <20221125191155.111c4ddc@windsurf>
 <CAMo8BfKE9KqDYyFhsKK9M8XjjuR=TtONT8JdKniFKwAgfr4HVg@mail.gmail.com>
 <20221128141221.0b2f5a56@windsurf>
 <CAMo8BfL61tm-ojZvSqPB7C4bzqOaugTCOo8fQ+ap-wn1k36GQQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1672149228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DvBSuA/CFj0qsrEGmOzO+F1TY/C4a2ky95U8Po0j/NI=;
 b=ky+WqQ3CdzDg3wbWODkUYosxWQ8i3ne0LW78EPt3ilHweqUHBtidDU1OSE0Em5bxWvKaWc
 6XXgjMsaU0gk7aG7GrYKkanrRNwGqnZVbHpXJDWrv19Z1vUQ83VZNIxGkO4buJI7OFyquy
 TEyzO+i8EYLMZmmaPgebNQDReGYuT1zKRIwZOeA1z0LQKNetlcmWj68zJj7yamCgNIHUqU
 q6Y1R4g4wTasdHFJbCWtNOpSAriXUq8JZ4xqq2nKao/5UsDcxnBAlI8PPzQsafePMHN/BS
 lwDzTZ5K8KmAD5wDo13sgiEY2rWhGEoT8yrbBsL9kS2g2DsynIknI2E9V3frCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ky+WqQ3C
Subject: Re: [Buildroot] Xtensa qemu nommu defconfig not working
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Romain Naour <romain.naour@smile.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Max,

On Mon, 28 Nov 2022 05:37:25 -0800
Max Filippov <jcmvbkbc@gmail.com> wrote:

> Also starting with linux-6.1 nommu xtensa will support static PIE ELF,
> which is in every way better than bFLT. Will it be acceptable to add
> static PIE ELF as an executable file format for nommu configurations
> in the buildroot?

Yes, that would definitely be acceptable and even useful.

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
