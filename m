Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C2CC04A94
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 09:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52C3060F00;
	Tue,  8 Aug 2023 09:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52C3060F00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aIy5ST-QlMKl; Tue,  8 Aug 2023 09:20:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8940460BC6;
	Tue,  8 Aug 2023 09:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8940460BC6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8B801BF28D
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 09:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B883814B1
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 09:20:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B883814B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yt5FaYWOd2UW for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 09:20:20 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8194081495
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 09:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8194081495
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30A694000D;
 Tue,  8 Aug 2023 09:20:17 +0000 (UTC)
Date: Tue, 8 Aug 2023 11:20:16 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230808112016.226ac8be@windsurf>
In-Reply-To: <20230808090407.558957-1-thomas@devoogdt.com>
References: <20230808090407.558957-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691486417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mv/IJnZng5eOFdtHrh+Vr/h54IQRzuALeTl2xnK/Vxs=;
 b=MsOnpfFeQt3+dyfjFYKeRVsXHgfvH5oV5lXGr8jAGZArDF9Ow+rqwBdfyOAWz4ptb+aPak
 yqdvQs56pMZrbwOi1rn9/0U50a9TEb5vg06wi+9Rk+X3Ju5oOMQJCvQ8u6bvUgeQ1BOJ7X
 eS3jMgEIoSR6gNpVplVVVeyUppqF3klATmKtUvJ10BY0hcO4KxWBMqgUE87ENTaQ5Fsayt
 xWqRdqhaWy7lLNTdzsYTXUmPXGPlPYx51RXoVHVoPfB7rvyD1WvwABQey8Go48aYozr7lu
 aa4ktTfy3VhuiGwpPBmGv+ClRg5isoWf6SZiE4qkBqV0KjlERBr7O1WBKSDoug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MsOnpfFe
Subject: Re: [Buildroot] [PATCH v1,
 next] package/llvm-project/compiler-rt: fix build with Ninja
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
Cc: Daniel Lang <dalang@gmx.at>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  8 Aug 2023 11:04:07 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> ninja: error: dependency cycle: include/sanitizer/allocator_interface.h -> include/sanitizer/allocator_interface.h
> 
> It's not clear why this cycle happens, but compiler-rt also proposes to
> create a separate build folder on their site: https://compiler-rt.llvm.org/.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Not sure to understand: the default backend for CMake is still
makefiles, and compiler-rt was not switched to using ninja. So?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
