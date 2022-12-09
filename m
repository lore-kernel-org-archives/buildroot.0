Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A87C54EBC
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 15:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4064640AB9;
	Fri,  9 Dec 2022 15:27:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4064640AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iX3Sq7aBN6vT; Fri,  9 Dec 2022 15:27:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 488994098D;
	Fri,  9 Dec 2022 15:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 488994098D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 237541BF3DA
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 15:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E88CC6118A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 15:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E88CC6118A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vBhnOvkfCzxo for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 15:27:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D259B61189
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D259B61189
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 15:27:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A49A11BF20F;
 Fri,  9 Dec 2022 15:27:09 +0000 (UTC)
Date: Fri, 9 Dec 2022 16:27:08 +0100
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20221209162708.30993bed@windsurf>
In-Reply-To: <1670597027-3905-1-git-send-email-gwenj@trabucayre.com>
References: <1670597027-3905-1-git-send-email-gwenj@trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670599630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYuZtU9Q2P9SjAPVjP3y9QRuuEH0xeAbLl0i8nkwwMQ=;
 b=nPwQJGafCe3+QqTsH1BvX0Legz8OPphsu/yqL01bgh2gBQCxgHhnD6D9Yh6yU5tJzhCmW4
 IHt8iMTes9Bvo9RfSE4gFPzH89nDxu+tpJYBh/+dKoJQSxTV8sznyCkWtUN+M383qfFx9A
 2EpBggzNInw7XzML2tIxlfdaq0BSqh8nMBVKBp1ohqUeEJX1FOa39GO0Gn1KvuLsrTIBsR
 1wYJ7rXMDIS6uwm9GRBsus3xvShfs3C1dYuxJT4Yxwbk4ZWCDHBcBrV11HQ6Tf7xT1eokd
 k+2Z3g3dplm2mfEOrHRMetNIvzWEv1HjCAGJ7Sb4dlvFuBpKp+ST2Sf+wuB9YA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nPwQJGaf
Subject: Re: [Buildroot] [PATCH v2] package/gnuradio: restrict gcc to >=
 9.3.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  9 Dec 2022 15:43:47 +0100
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Since commit 5a15095f65c655356989c91e52da1746cd96f41b gnuradio requires
> gcc >= 9.3.0

Is it really 9.3.0 that is required, or 9.x ?

Because BR2_TOOLCHAIN_GCC_AT_LEAST_9 does not guarantee 9.3.0, it
guarantees 9.x.


> -comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
> +comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library gcc >= 9"

                                                                          ^^^^ missing comma

(No need to resend just for this)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
