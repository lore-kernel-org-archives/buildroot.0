Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DA3C83F12
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 19:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0323841484;
	Mon, 28 Aug 2023 19:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0323841484
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JwQYfBSyNaxx; Mon, 28 Aug 2023 19:57:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17B5941403;
	Mon, 28 Aug 2023 19:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17B5941403
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 962771BF276
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 19:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F7EA81F0E
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 19:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F7EA81F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HOsTI72LANqS for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 19:57:46 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1043F81F0C
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 19:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1043F81F0C
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB66AFF805;
 Mon, 28 Aug 2023 19:57:42 +0000 (UTC)
Date: Mon, 28 Aug 2023 21:57:41 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230828215741.44c239d9@windsurf>
In-Reply-To: <20230827194003.3387773-2-james.hilliard1@gmail.com>
References: <20230827194003.3387773-1-james.hilliard1@gmail.com>
 <20230827194003.3387773-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693252663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYnnqWhMeKCD+J+vMHaRb6HNR6RZ159Y8iYwsq7doK0=;
 b=ZdXpc/xOv+6TsW71EYds+HWatVD3ukzBc0BI6Ldxkv+7UkiFTmk/37hR+J+CmwLqwW5UZX
 kkAJYQgYKFq4DuJDTIjvLmMZjQV49e/jcitDK+84m4tvm+sAYLUW2GpAmSmmgcb8iF1D7I
 QMTk+JDT3cmamjhwlkIe7wKpStHftOrOxd4VLl7ZsPH1Ue0OFLTUgGo7JUBA6UnR5AFRBZ
 Ca7wvv7QKktf7vba8TR7dCinTxMhVN9zdFypkWI2MBS+GpZUyU4AfSVdkACqexEotR2wlM
 OkLAHOKUmif6Uw40sHU5i0Mlwdv9dRA5v0/ojgErDwie/O2w8ntuVeesQTNYmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZdXpc/xO
Subject: Re: [Buildroot] [PATCH 2/2] package/qemu: add host-python-distlib
 dependency
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
Cc: Romain Naour <romain.naour@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 27 Aug 2023 13:40:03 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> The qemu documentation recommends depending on this package.

Recommends for what? Does it work without it, or not? If it isn't
there, what is the consequence?

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
