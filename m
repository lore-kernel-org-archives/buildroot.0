Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB6FC3DA66
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 21:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C6D682119;
	Wed, 23 Aug 2023 21:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C6D682119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6HiQYK9qUEBu; Wed, 23 Aug 2023 21:04:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49DA0820EE;
	Wed, 23 Aug 2023 21:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49DA0820EE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A2AF1BF2A4
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 21:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01A0F40898
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 21:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01A0F40898
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tLQmFRGn7ZDK for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 21:04:24 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C50E40888
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 21:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C50E40888
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF2F760002;
 Wed, 23 Aug 2023 21:04:20 +0000 (UTC)
Date: Wed, 23 Aug 2023 23:04:19 +0200
To: Gregor Haas <gregorhaas1997@gmail.com>
Message-ID: <20230823230419.0c6746da@windsurf>
In-Reply-To: <CAMqWt3qPd-FynCeT_bZEtRXQutrrSaadDAjA+nKCKfNoKDtYkg@mail.gmail.com>
References: <20230814215233.745573-1-gregorhaas1997@gmail.com>
 <20230822214755.1af65bb4@windsurf>
 <CAMqWt3qPd-FynCeT_bZEtRXQutrrSaadDAjA+nKCKfNoKDtYkg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692824661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=903G0mH5GpzFbVkHOBcyCoxqqXySowS0EtYPHj2N2M0=;
 b=pcQYQTOJV/wfomSN/Loe+kU96fhkbxWyCU2zH5gYjlMvI1tm0jTmu7guRUI1RsNLzSwjRv
 T7VO8KDpN/hCSRx04YwBjfFc9B28jSBvglAJsKHrZT6aIYSVmNpqWQe637s+sQdvDqusaj
 ALsEZ1+CeJx19NAAlYZaeK/bc/yIIcOh0WQ1b5zgA9PyBZVKvR54CSXl9YHyZFITeKVm2M
 I3RRnmC+HeCeXt0dzsOqbcvmk44EFtKHi9XTlvyuuBH+rIRK2uHKnHJaq8OycSRMbc4eMC
 OjBBJI4DbLfjIhLYZJpFDhIX0I7sdCol4pXGYQSuGQVkAKiFnZhukq9okiiIUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pcQYQTOJ
Subject: Re: [Buildroot] [PATCH 1/1] package/bmap-tools: add dependency on
 python-six
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

Hello Gregor,

On Wed, 23 Aug 2023 13:17:09 -0700
Gregor Haas <gregorhaas1997@gmail.com> wrote:

> Just wanted to confirm that this patch also fixes my issue, so I'm okay with
> this instead of the patch I sent earlier.

Thanks for your confirmation. Ideally, I'd like to get feedback from
Yann (or other Buildroot maintainers) before formally submitting my
proposal. Let's see if I hear from Yann. If I don't hear back within
the next few days, I'll submit formally.

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
