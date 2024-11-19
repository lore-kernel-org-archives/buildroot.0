Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BC0D6C2AF
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 23:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E696085390;
	Tue, 19 Nov 2024 23:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0JBFHAnUuGG; Tue, 19 Nov 2024 23:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0311585395
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0311585395;
	Tue, 19 Nov 2024 23:18:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B58C4DB2
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 23:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58A31600C6
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 23:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfKJ6zihuCTj for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 23:18:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 303056069F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 303056069F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 303056069F
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 23:18:18 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:e4f5:8dbb:490c:d591])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C7BDA2003C3;
 Wed, 20 Nov 2024 00:18:14 +0100 (CET)
Date: Wed, 20 Nov 2024 00:18:14 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Robin Jarry <robin@jarry.cc>
Cc: buildroot@buildroot.org
Message-ID: <4sdebtakm7jr5b4wpijlctmbrhpjtyh75vszxhkyfj7yjtjya4@iroijg7bnmhi>
References: <20241119214641.60188-1-vjardin@free.fr>
 <D5QIQ0798SQX.25MKE2ZHJCOXA@ringo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D5QIQ0798SQX.25MKE2ZHJCOXA@ringo>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732058296;
 bh=K01VGfsS9MNFP0uA2mX8gtlPdK0/fCrAMsuyEsMgS0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k3m8cIEkKz7GktBhqQtBMpJuYpEWUeE/e2gVh4l9+NnsiOmxJuTA3xbWEGweNCxlD
 1ZBXAIyYLrGCjLZKfCSwiM8At5we6UOthm7Oq6npDTC6mdaFEqeBLYyCgj3Yo6Pr4e
 khLSZFXnr/cewhipF5Gn8VeOJlpDR2IqxajacrjHdnizlZnX7DJFqq8H8LTDO8wZJx
 3ae756AdSUY8GjIDsMCvkNUbgkl1kaYRNurphIWHdrZ4wj+0CcJlMx7rxfT765SAp+
 NgFoAtALUfC2c4kO8EU8ZQT/nW2X7Gpp8ZfDrouCxera2tvflBAgn++J4B+Ul0F0JV
 BwyOVWc6vAYrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=k3m8cIEk
Subject: Re: [Buildroot] [PATCH 1/1] package/grout: RFC do not apply
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

Hi Robin,

> > +	$(if $(BR2_PACKAGE_MSTFLINT),mstflint)
> 
> Is there really a runtime dependency on mstflint for DPDK 24.11? I don't
> have it installed at it works fine. Or maybe you need it to enable specific
> Mellanox build options?

Right, the purpose is to support Mellanox build options of DPDK. DPDK
mlx5 requires:
  mtcr_ul
https://git.dpdk.org/dpdk/tree/drivers/common/mlx5/linux/meson.build#n49
which is needed for access QSHR (Qos Shaper Host Register)

> > +config BR2_PACKAGE_GROUT
> > +	bool "grout"
> > +	depends on BR2_PACKAGE_DPDK
> > +	depends on BR2_PACKAGE_LIBEVENT
> > +	depends on BR2_PACKAGE_NUMACTL
> > +	depends on BR2_PACKAGE_LIBECOLI
> > +	depends on BR2_PACKAGE_UTIL_LINUX
> 
> Ideally, you'd want systemd here as well. The package provides a .service
> file which handles startup config loading.

Thanks for this tip. I'll check the options.

> > +$(eval $(meson-package))
> 
> The systemd service is currently not installed by meson as it is usually
> something done by downstream packaging distros.
> 
> There are a couple of examples in the upstream rpm/deb generation:
> 
> https://github.com/DPDK/grout/blob/cea579e524ac/rpm/grout.spec#L67-L71
> 
> Possibly you can inspire from that.
> 
> bash-completion is a nice to have but not mandatory for embedded distros
> like buildroot.

OK, I'll consider
  https://github.com/DPDK/grout/blob/cea579e524ac68bf26e0d302d2913b1faee9ea26/cli/grcli.bash-completion#L3
when BR2_PACKAGE_BASH is enabled.

systemd should remain optional too.

Thanks for your comments Robin,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
