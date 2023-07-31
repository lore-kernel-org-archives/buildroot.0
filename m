Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E54C001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA51540C04;
	Mon, 31 Jul 2023 22:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA51540C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4x4mmkUdvgt; Mon, 31 Jul 2023 22:21:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B50B40C2B;
	Mon, 31 Jul 2023 22:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B50B40C2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 169CD1BF378
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0409B403B8
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0409B403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q_ssFNMR8eTF for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:21:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAFA54034A
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAFA54034A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DCD560006;
 Mon, 31 Jul 2023 22:21:44 +0000 (UTC)
Date: Tue, 1 Aug 2023 00:21:43 +0200
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Message-ID: <20230801002143.58744c00@windsurf>
In-Reply-To: <20230223231258.0e07045c@windsurf>
References: <20230223201511.217372-1-contact@martb.dev>
 <20230223201511.217372-2-contact@martb.dev>
 <20230223231258.0e07045c@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690842105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybJVFPR6Aq68uhUfNEhDcnYwis0Xd3xmC5IxOzFe6+g=;
 b=Cnu+YbVfX233ZjYecKIbJ3fqwOWrcpdAdlKX3X4CTcCYTZ3bdyVmujpNopFdEHAqj6EQqi
 /Pvv6FRRd6aGsiQ1BSU5Ycn9PrtgqbLnPuTzCoA8DEKTwl6jSWYenWYlftSoKL9XAEjFZC
 hudFneeJdMDgZt2xKr72wACoePQdOFs2qveKHbJ5DNzA1HRzAqcvPE5cQhBxGcqtuv6Iy/
 4kyqdarG0jeLieB7mfCY8jVMoIfR/B/9zzXcorbwRAgLlKLitBOdpIt1fMv7QH52l2UBHV
 hQ8gs5jY30MSF8sAfkFwshyjelEvqXkp7gHdA4rztgxHOg1x0Ik4VMwsRXDAdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Cnu+YbVf
Subject: Re: [Buildroot] [PATCH 2/2] package/gnuradio: remove pybind target
 suffix when crosscompiling
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
Cc: Martin =?UTF-8?B?QsO2aA==?= <contact@martb.dev>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Martin,

On Thu, 23 Feb 2023 23:12:58 +0100
Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> > +This is required as pybind11 uses host python3 and therefore the host platform suffixes.  
> 
> We need your Signed-off-by here, and also the upstream status of this
> patch.

Unless I missed it, I don't think you followed-up on this. In the mean
time, this issue has been fixed (I believe) in a different way in
commit
https://gitlab.com/buildroot.org/buildroot/-/commit/e22b450692a6d02da43a453f24ec057bb5517422.

Could you verify that the latest Buildroot master works for you?

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
