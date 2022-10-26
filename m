Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB89C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 18:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58D1540571;
	Wed, 26 Oct 2022 18:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58D1540571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UFQ_XDHSoU6q; Wed, 26 Oct 2022 18:53:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E787400CF;
	Wed, 26 Oct 2022 18:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E787400CF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 761DE1BF279
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 18:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F93A408DA
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 18:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F93A408DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qnoB3onP2Sf for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 18:53:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7F3C408D8
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7F3C408D8
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 18:53:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8592A240005;
 Wed, 26 Oct 2022 18:53:15 +0000 (UTC)
Date: Wed, 26 Oct 2022 20:53:12 +0200
To: <yann.morin@orange.com>
Message-ID: <20221026205312.3f729eb8@windsurf>
In-Reply-To: <7333_1666791084_635936AC_7333_90_1_20221026133122.GF1657509@tl-lnx-nyma7486>
References: <20221026125836.3910730-1-thomas.petazzoni@bootlin.com>
 <7333_1666791084_635936AC_7333_90_1_20221026133122.GF1657509@tl-lnx-nyma7486>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666810396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iBwSsz6QOTvtE5I/yJaf+HyYisByYxglOvjk+hgjlwI=;
 b=gehfPWzCX6Ah0uGFVopAMOQW79PnqbzPEgjqNzyVEE8XS43a+5pq5ONOWoDgdxfKpyndCh
 WEHtE2dHs3vGIYLD7z8vAd56a16U+eDZ6la2pmo/z+n1xwotl7CSQS0JecExJuusz8PFzL
 Pcj3ljdy1lfQTrtbsxxgWTcljfVa2kQfcRrxwdPeM2WxcCgn5enpQx9sXNwmSvkPDpnA4E
 E+gGm2nAMNRljX9D2Yxb0SAnHYu2grqUzW59fAe+3ReLOnM+D7mVktivd8sfEZF3swtDcp
 bDJhwLCJb3ei7RaOB7OhTua3DtZh/rtsJJb2LCIjDHl6gys/El0LX+KyrypwUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gehfPWzC
Subject: Re: [Buildroot] [PATCH] package/musl: fixup the dynamic loader
 symlink
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
Cc: hello.skyclo@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Wed, 26 Oct 2022 15:31:22 +0200
<yann.morin@orange.com> wrote:

> What about external toolchains?

That's a very good question, which I had not looked into, so I did some
research.

External toolchains are not affected because when we copy the sysroot
from the toolchain into STAGING_DIR, we do this:

        for link in $$(find $(STAGING_DIR) -type l); do \
                target=$$(readlink $${link}) ; \
                if [ "$${target}" == "$${target$(SHARP_SIGN)/}" ] ; then \
                        continue ; \
                fi ; \
                relpath="$(call relpath_prefix,$${target$(SHARP_SIGN)/})" ; \
                echo "Fixing symlink $${link} from $${target} to $${relpath}$${target$(SHARP_SIGN)/}" ; \
                ln -sf $${relpath}$${target$(SHARP_SIGN)/} $${link} ; \
        done ; \

(from toolchain/helpers.mk:copy_toolchain_sysroot)

This causes this to happen:

>>> toolchain-external-bootlin 2021.11-1 Copying external toolchain sysroot to staging...
Fixing symlink /home/thomas/projets/buildroot/output/host/x86_64-buildroot-linux-musl/sysroot/lib/ld-musl-x86_64.so.1 from /lib/libc.so to ../lib/libc.so

So in the external toolchain, even if the symlink is broken, it gets
fixed when we import the toolchain into STAGING_DIR.

(Note: the external toolchain used here is a Bootlin toolchain,
produced by Buildroot, but without the musl.mk fix, so it does have the
bogus ld-musl-x86-64.so.1 -> /lib/libc.so link, but that gets fixed
when we import the toolchain, as described above)

Does that this seem like a good enough answer for the external
toolchain case? If so, I can submit a v2 with an amended commit log.

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
