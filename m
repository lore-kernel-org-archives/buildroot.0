Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AF2C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9AF760F15;
	Mon,  5 Feb 2024 15:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9AF760F15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WvZxiJezi3gJ; Mon,  5 Feb 2024 15:46:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23FFF60F06;
	Mon,  5 Feb 2024 15:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23FFF60F06
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 884E81BF2F6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FBE440320
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FBE440320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XtXt-Yp0ThZV for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:46:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18E87400D9
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18E87400D9
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4D20240004;
 Mon,  5 Feb 2024 15:46:52 +0000 (UTC)
Date: Mon, 5 Feb 2024 16:46:52 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240205164652.535887b4@windsurf>
In-Reply-To: <CAPi7W82Bn1_zo8dxaghGDifmaiwOz8SWR1JiFgV6FFhPru2B6Q@mail.gmail.com>
References: <20240116214427.945514-1-fontaine.fabrice@gmail.com>
 <20240205163358.7752aec0@windsurf>
 <CAPi7W82Bn1_zo8dxaghGDifmaiwOz8SWR1JiFgV6FFhPru2B6Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707148013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kw9qknrG6Rc+xQV8GMjZr8JylzRafAougLZ2JPi7G4s=;
 b=Re2K/ExMkW73w+n//wGj2RZeg6jrxik/WZudfuDIXtHKIKqxujp8ZN7vIFCy599dTzKRhL
 pTdtuWXFiYrQi+qrH3BnOwyfmV3H09/e1LcLp9FUbmKqcP/bvkXaSFsni0W4ZJvcLzYpHS
 YUBJmsfQ7yU0hZFCfsiDAQFddyBznL6JawCBzTqS4gjf8EP/IXCBXps9kS6cjbid2m06vR
 5eq8pPZ7QfnJ1gbgA2fTN5oBUVPE83o5GwQNOXk0ZrBHWqfiDS5t5YgxmfyLJM3+z53FaJ
 +LrdABOnSGeqiiFAa/Lkzh1rk7WpmL4GgY82EBJypdXyCZoIZ/3bAszjVf2VmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Re2K/ExM
Subject: Re: [Buildroot] [PATCH 1/1] package/libtracefs: needs threads
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 5 Feb 2024 16:36:45 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Thanks a lot! It looks like you missed trace-cmd package, which also
> > selects libtracefs, so I fixed that up when applying. Thanks!  
> 
> I didn't miss trace-cmd, it already has a dependency on
> BR2_TOOLCHAIN_HAS_THREADS_NPTL.

It is totally true, but in general we try to propagate the dependencies
anyway so that we keep track of why we have those dependencies. I agree
it's not a 100% accurate rule in the way we apply it.

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
