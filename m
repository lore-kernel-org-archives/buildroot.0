Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19325EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C11D741859;
	Fri, 21 Jul 2023 21:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C11D741859
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jV028PJXvJiP; Fri, 21 Jul 2023 21:04:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 167904017B;
	Fri, 21 Jul 2023 21:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 167904017B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EB121BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35CB9600C6
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35CB9600C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id svYiFG5o9ecd for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:04:50 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17ADE606BF
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17ADE606BF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2078DC0004;
 Fri, 21 Jul 2023 21:04:48 +0000 (UTC)
Date: Fri, 21 Jul 2023 23:04:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230721230446.22afa781@windsurf>
In-Reply-To: <20230721180638.215414-2-bernd@kuhls.net>
References: <20230721180638.215414-1-bernd@kuhls.net>
 <20230721180638.215414-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689973488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6WPDLtKVsS2bDkS0obzlUUxI44/iXQpJjdX/o66aP8=;
 b=k9eLtqrxeVcFHYXfa/U4EGIIbtnST1clX0t4PGdLrGOrGoKlO6E/pA1EfankdsNEf+nxlP
 L4TSpagnywoaEkVreWwBpzl3/p9OwX61k3kHiVYjMYrDHnXR0RrDs0eGXhvwqo0trKDRrI
 RhYuvWdBPo7ijj5pBSSdOYN6GC1H36yf/+EAunmhExECKonOw/+mgNdxiW7Jb6wd7Eb+Xs
 hvg98UX7HO6Xoub8nGEAaq092vJYc29rr6fSpDbHuX57cIucHcdAe//+g23rLqax1YWUyN
 vQhyrgI2uHtuaSoUIs6ioEG1QSJaxsWhFdNcljfk5KYP1CaeBzAiihIS4JBGUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k9eLtqrx
Subject: Re: [Buildroot] [PATCH 2/3] package/libopenssl: add -latomic to
 libcrypto.pc when needed
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

Hello Bernd,

On Fri, 21 Jul 2023 20:06:37 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Without this patch openssl adds -latomic only to Libs.private in
> libcrypto.pc.

But this is exactly what's needed. If you add -latomic to Libs: it
means that libraries linking against openssl will also be linked with
libatomic, which is not needed. Libs.private ensures this will only
happen if we're static linking, which is what we want.

Let me sum up:

- With dynamic linking, we want libcrypto.so to be linked against
  libatomic.so. Anything linking against libcrypto.so has nothing to do.

- With static linking, anyone linking against libcrypto.a will need to
  link against libatomic.a as well, which is why it's important for
  libcrypto.pc to carry a Libs.private: -latomic.

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
