Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016ECC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 19:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 757008472D;
	Fri, 29 Jul 2022 19:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 757008472D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HHaO1wEMdwiQ; Fri, 29 Jul 2022 19:56:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 948C7846E7;
	Fri, 29 Jul 2022 19:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 948C7846E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E778D1BF33A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C262060EDB
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C262060EDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NIhKSCztoXPA for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 19:55:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A3C560DE5
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A3C560DE5
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 19:55:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D8BBE1BF205;
 Fri, 29 Jul 2022 19:55:53 +0000 (UTC)
Date: Fri, 29 Jul 2022 21:55:52 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220729215552.325fbe22@windsurf>
In-Reply-To: <20220729162430.1028453-2-giulio.benetti@benettiengineering.com>
References: <20220729162430.1028453-1-giulio.benetti@benettiengineering.com>
 <20220729162430.1028453-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659124554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5RdHkEQa8JtDkUdv5JOw2gXHlkgHlGf/TSn7v7GoQWo=;
 b=VcEnr6geFcsqKY8WS1BTQjihUHZPvm1WKFj9QTyOhw/CEyGrk9A3iMXLz/tGfm/ytUZ4+E
 17J6WMKxeCul/173E1V6C23GyNWLskv2y26bqT6bMOkxaMOAyUbRHB4QbyZ+lWdCJfNlht
 FOPYMwPCFeQJMVei+DFhtHz/KrBKNeUCJgUV+9WX9kEp0oRzp1ZIP2EJh1sH6mP2HTRigi
 uMjGwDYywlEko9WhcKhx96EOJ3XUGa7T7ztQEN9Rz0mrshJZBfkKJb1Q9Vh5RN7sHeNcwf
 +T9UBla279OaapDXSAc+pSzMUA81o6Fzsj/MKq/qRSWm775cwxqsBquvN26u/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VcEnr6ge
Subject: Re: [Buildroot] [PATCH 2/2] toolchain/Config.in: update gcc bug
 99410
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Jul 2022 18:24:30 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

>  config BR2_TOOLCHAIN_HAS_GCC_BUG_99410
>  	bool
> -	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> -	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
> +	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
> +		     BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
> +		     BR2_TOOLCHAIN_GCC_AT_LEAST_12

This looks like a very convoluted way, that can be replaced with:

config BR2_TOOLCHAIN_HAS_GCC_BUG_99410
	bool
	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9

This says:

 - The bug is present if you don't have at least gcc 8.x (so versions
   older than gcc 8.x are affected)

 - The bug is present if you have at least gcc 9.x (so all versions
   more recent than 9.x included are affected)

So I replaced it with that. Let me know if you see a problem with this
change.

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
