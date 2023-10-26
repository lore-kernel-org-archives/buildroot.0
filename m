Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B94CC25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 16:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14C8040CC9;
	Thu, 26 Oct 2023 16:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14C8040CC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CBOWKASA0hxx; Thu, 26 Oct 2023 16:06:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 241F941AA9;
	Thu, 26 Oct 2023 16:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 241F941AA9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 524861BF976
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1286942D28
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1286942D28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUCeX4xvYo4y for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 16:06:54 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD22642D23
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 16:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD22642D23
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63434FF805;
 Thu, 26 Oct 2023 16:06:50 +0000 (UTC)
Date: Thu, 26 Oct 2023 18:06:49 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231026180649.66bdde4b@booty>
In-Reply-To: <20231020114236.4129636-1-neal.frager@amd.com>
References: <20231020114236.4129636-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698336410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/8Yq6WnoiAl6QLC0bmgcm47itogF1qeWuruJ5xlXiE=;
 b=YSTL8NgQZoCEHgkdpitnMdNBMiXhqxPmj0DcI3ONSMrA5i8TVAk87Z/7mJR3GjQvqrbGnD
 GyNgmis0gKZvER75RMmX7R/5/orOIrJzzeZcSlLaCRngoEAbcnqbZi4OoEg17aaBlHS8nf
 SUvpbfEmzL0RiHee/KCdbikVHBq4NpATfqIs+Gjeb3XCu/UFYayKDbtkKa4g2PJy5Y2+Uf
 bLQkOJcAh4KXDrhNaLDewQvcp4Uf5ZW67ZONH9Wcb5/fLxmD0IbbobThOpHmOxBwOLdzgn
 kuHaysDqypELeOdq5MAbp+o0Fe+Y5/I535X2aOBIt8qji+cftXI3SDSRAqUTMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YSTL8NgQ
Subject: Re: [Buildroot] [PATCH v6 01/10] package/binutils-bare-metal: new
 package
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Fri, 20 Oct 2023 12:42:27 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch adds a new package for building binutils for a bare-metal toolchain.
> The cpu architecture is defined by a toolchain-bare-metal virtual package.
> While any cpu architecture could be used, the default configuration will be a
> Xilinx microblaze little endian architecture, so that buildroot will be able
> to build the microblaze firmware applications for zynqmp and versal.
> 
> In order to build the zynqmp pmufw and versal plm applications without error,
> binutils version 2.41 or higher is required with the following patches.  All
> six of these patches have been submitted upstream with five of them already
> applied.

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
