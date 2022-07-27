Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6B1C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B66A80BC3;
	Wed, 27 Jul 2022 07:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B66A80BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gXbixsoBOwmX; Wed, 27 Jul 2022 07:23:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FF5480BAF;
	Wed, 27 Jul 2022 07:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FF5480BAF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 042F31BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D375D80BAF
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:23:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D375D80BAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ushh7KmNyKfB for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:23:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83DEC80BAB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83DEC80BAB
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:23:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4CFB320005;
 Wed, 27 Jul 2022 07:23:49 +0000 (UTC)
Date: Wed, 27 Jul 2022 09:23:48 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727092348.3b247fae@windsurf>
In-Reply-To: <20220727064006.218610-1-fontaine.fabrice@gmail.com>
References: <20220727064006.218610-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658906629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0e4TLUTFdzJA0xmk7CLU2fS/aRKn8gzxeaA6+t+MUE=;
 b=p0DbJzRoOOtSiliWoACD0UlxWtguJEhxY4DHe3iswiirg0ASD1D9A8E7OtwDqC16Z1kuDy
 ZunpFrAn3w5JJgg3knA2wj4cYGJ24/1aNO+6lrBY6bnS3mlvHXyPsZXRM90OVczN/flDiU
 RyyDWHZ6ODOPfpObY7A9yTqWz5YUPOX12lKWcRIZPTLM61mwYfm16bqF8kQxDZwR2TWMHH
 KjYI6GWbMIyFMFhjJZvnVZZ3P2rr/rtafza+Gi7Bh7rl3hDGn85zSBend5TlQdGu/XYZBY
 WNbGLnR82EMq0KuGzDV613chJ7ZVdkBMG/C2qOGlYiEvgw8PiI7QF79RZNvR5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p0DbJzRo
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gstd: fix static
 build
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

Hello,

On Wed, 27 Jul 2022 08:40:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following static build failure raised since the addition of the
> package in commit 02ea01ea22e94ef353a638bf16f62f6e3ed1208e:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/i586-buildroot-linux-musl/sysroot/usr/lib/libreadline.a(display.o): in function `_rl_move_cursor_relative':
> display.c:(.text+0xbb5): undefined reference to `tputs'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/77c10947ddc749c54c7c233e3143f5cdf1edc73d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I am confused, I have already applied
c6e99c0bc6cd045cd451a1c186bae0bdd5c4a903, which already fixes this
issue.

Could you double check?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
