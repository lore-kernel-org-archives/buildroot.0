Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F379FC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 15:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4917817A9;
	Sun, 18 May 2025 15:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2opHsx88PtWY; Sun, 18 May 2025 15:41:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4289817AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4289817AB;
	Sun, 18 May 2025 15:41:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFF3DE4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0F42403F4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1WtxnrMVu1U for <buildroot@buildroot.org>;
 Sun, 18 May 2025 15:41:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 019EF4039D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 019EF4039D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 019EF4039D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 15:41:28 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:98dc:de6c:7040:2284])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9D0D078035B;
 Sun, 18 May 2025 17:41:18 +0200 (CEST)
Date: Sun, 18 May 2025 17:41:18 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, 
 Brandon Maier <Brandon.Maier@collins.com>, Julien Olivain <ju.o@free.fr>, 
 Romain Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <2hhshlixqffg7r3o33klqzyvbxnpwllhhkskbi5igtewh6htlg@5huoxuxspqlv>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-19-olteanv@gmail.com>
 <20250422234518.2422983e@windsurf>
 <20250517173502.qbcd6au4kavfgsmj@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250517173502.qbcd6au4kavfgsmj@skbuf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747582886;
 bh=e1Dt8/1pu9SPs4leWsLYrLecxhAz9UCVCdwfMUqOpug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nS1R04LR55s69clgLf2mr/sa8ttl6CmAICNfPJU9yHUz7yT0HGdbHfoAXOhMkOr/H
 t9tnUr+R90yDO2WuTAlToghUkkfi8wfDCExsTwoa2TaaSrSDkLNMwxHP/yJvB/lUD3
 jlpeDo+HIxIXepbnoeL6Ioi333K1/+azp8/5H9UZKSDw6tS4aak/TaW+p+o2EyqmcY
 NaU2up+nGKpXZBe20qZYAUe0l8DNP5L5+/T5alOUlAm767BxTkqtjgy901HKiUnYig
 aRfVYRTePGIc68bx+Ssxnt/GVSsg1N4Vdwhnlnw5cK1Q7m5cg18ZrbOkrCjpffbMGL
 e81vw7A756wgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nS1R04LR
Subject: Re: [Buildroot] [PATCH v2 18/18] board/lx2160ardb: new platform
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vladimir, Thomas,

> > > +The components from NXP are:
> > > +  - rcw, lf-6.12.3-1.0.0
> > > +  - atf (fork), lf-6.12.3-1.0.0
> > > +  - uboot (fork), lf-6.12.3-1.0.0
> > > +  - cadence-dp-firmware (blob), lf-6.12.3-1.0.0
> > 
> > So this line should be dropped, if I understand correctly?

For me, yes. Let's focus on componenets which are needed for this board
to start with.

> > > diff --git a/board/freescale/lx2160ardb/uboot-env.txt b/board/freescale/lx2160ardb/uboot-env.txt
> > > new file mode 100644
> > > index 000000000000..ad1e5882dd9e
> > > --- /dev/null
> > > +++ b/board/freescale/lx2160ardb/uboot-env.txt
> > 
> > I agree with Vincent that it would be nice to have a simpler U-Boot
> > environment if possible.
> > 
> > > +BR2_PACKAGE_QORIQ_RESTOOL=y
> > 
> > Due to restool not being applied (build issues), I can't apply this
> > defconfig just yet. Can you send a v3 with restool fixed? Thanks!
> 
> The upstream restool is now fixed to support 32-bit builds and I am
> preparing for a v3.

I tested your HEAD, it works fine, I keep using 64-bit only.
Thanks for the updates of qoriq-restool, I hope that it can be integrated
soon within Buildroot.

> Is it that the U-Boot distro boot environment variables (which form a
> majority of the contents of this env) are not welcome in general in
> upstream Buildroot, or is it just that the environment file itself is
> too large to maintain for a board instance, and contains many
> board-unspecific things (which I agree with)?

Let's wait for Thomas' comments ; the root of my coments was this latest
(too many board-unspecific).

> I want to make sure it's the latter and not the former, because
> BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE supports specifying
> multiple input files, and I can move the distro boot portion to a
> generic location like package/uboot-tools/env-distro-boot.txt, to be
> potentially reused by other boards, and simplify the lx2160ardb env.
> Does that sound acceptable?

What would the content of env-distro-boot.txt look like ? Do you mean
that it would be generic for any NXP/Freescale boards ?

Then, each specific board would just be adding its "remaining" env
setting ? If so, you are right, it becomes an even better solution than
a minimal set of uboot env for lx2160ardb as I suggested.

best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
