Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8DBC4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 18:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE44A40186;
	Mon, 17 Oct 2022 18:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE44A40186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G2xiZNvjM7r6; Mon, 17 Oct 2022 18:42:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED9D840142;
	Mon, 17 Oct 2022 18:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED9D840142
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA9C51BF31C
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95EB840142
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 18:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95EB840142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s-i_pREM7b1i for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 18:42:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD729400F6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD729400F6
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 18:42:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1EE371C0005;
 Mon, 17 Oct 2022 18:42:44 +0000 (UTC)
Date: Mon, 17 Oct 2022 20:42:32 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221017204232.652f8e89@windsurf>
In-Reply-To: <20221017180350.GC3666@scaer>
References: <20221017142849.41399-1-thomas.perale@mind.be>
 <20221017142849.41399-4-thomas.perale@mind.be>
 <CA+h8R2pNRrBsChKS3PHQtT0_rsVF3Wi3LwMTD9jKFoKf1ot2-A@mail.gmail.com>
 <20221017180350.GC3666@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666032165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZcokpoRqRh7vahx8vUUhwA622m8DqwONaQsaRjEsqs=;
 b=Xm+4oU4trM3hKwd/C3vXi0R32ByS9BCY4cfABTTQ4vkRXBM14VWlWVrNgzsIL6NVoRzffN
 WdrKVaawXXRQx3Tuqw3klXVwNdrAdy35qYRNwlaxbKfHNYYlEHkYUsu3Be4oD69jgcvNx3
 AX/RF3k+4YtwBUmvLmID0HF5rZbwdouZjrWnBXwYyWCmAgVSz01s4ON/5u+bTKN8kq/64q
 jmBJeUwdG+lYYPx5cZWLuKDjhq7adYl65kZ7ATNccrXRi4oNKZnbGAmikIJ1Ujh0de+P5q
 T6cYN3VlpFpFm2NxiT0TDLPyvTLpOBo/xk4yhmF+1b8hMv7f6D+BUZDFceW78A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Xm+4oU4t
Subject: Re: [Buildroot] [PATCH 3/4] package/go-bin: new package
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
Cc: Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Oct 2022 20:03:50 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Agreed. The default should be to build everything from source when
> sources are available. The pre-built packages are only a fallback as
> a convenience for those that are too much in a hurry.

Except we do exactly the opposite for Rust, and I'm not sure for the
host compiler of those languages it is a good idea to cause such a
major impact on the default build time faced by our users. I clearly
understand the need to be able from source and appreciate how important
it is, but I'm not so sure the default should be to build all those
compilers from source.

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
