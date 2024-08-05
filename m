Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E13EC3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 07:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26FB58083C;
	Mon,  5 Aug 2024 07:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a42Gwg_CE2ty; Mon,  5 Aug 2024 07:24:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 350E0808E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 350E0808E7;
	Mon,  5 Aug 2024 07:24:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58E2D1BF333
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:24:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52AAF402AD
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 07:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArH912z8m8hi for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 07:24:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C3098402AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3098402AA
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3098402AA
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 07:24:52 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1DF1C35363D0; Mon,  5 Aug 2024 09:24:50 +0200 (CEST)
Date: Mon, 5 Aug 2024 09:24:49 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZrB+QUlNw6G1wbV4@waldemar-brodkorb.de>
References: <Zq9j8m3YPt0Xh0gY@waldemar-brodkorb.de>
 <20240804231254.6301c5df@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240804231254.6301c5df@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722842690; bh=dVml31kIOD35AGvqXYlxddz/MSpEqAK1ba/WpRh6fms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aCTOUJQqihmfNZAd1MmdAy8W9of83VfOgzLxyEhWI0SVSZyJVPA9FvgQTUNmybHoT
 +ccE6lFSTBonNeD30oqpUPEDPxkmnkJSMgXB+KAHfp4QcRYDjU6iPwfNvUVgY1R8E3
 0L162DDCDpCYjblrh6MrRj8idY/VwH8dc/VmqP78ezsWNECSVBk2cN88WelVoGwcAa
 HmbfIRWH/QK4BoN5qzAndrnQRE1z//IY6fqPUJEOv9okYSy4cIEYNr9zXYn8u2OCXt
 yzhURGrlYaQ5Z/kUvH8rh22c8Lp70+OKacY+H0KiCSOpjGgxjTa4TyPFhjWjCKn48h
 MD/jTIQwsrumw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=aCTOUJQq
Subject: Re: [Buildroot] [PATCH] package/nginx: fix sparc compile
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> On Sun, 4 Aug 2024 13:20:18 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > When libatomic_ops are enabled the shared library is using symbols
> > from libatomic.
> > 
> > In output/build/nginx-1.24.0/objs/autoconf.err
> > You get:
> > checking for atomic_ops library
> > 
> > /home/wbx/buildroot/output/host/lib/gcc/sparc-buildroot-linux-uclibc/13.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
> > /tmp/ccx4rHjO.o: in function `main':
> > autotest.c:(.text.startup+0x30): undefined reference to
> > `__atomic_fetch_add_4'
> > collect2: error: ld returned 1 exit status
> > 
> > Fixes:
> >  - http://autobuild.buildroot.net/results/5de/5de45530bbc615b1c44cc73a0ae7bf4cff5f1a56/
> 
> Do you have a minimal reproducer for this issue?
> 
> >  NGINX_CONF_ENV += ngx_force_have_libatomic=yes
> >  ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
> >  NGINX_CFLAGS += "-DAO_NO_SPARC_V9"
> > +NGINX_LDFLAGS += -latomic
> >  endif
> 
> Basically, I am wondering if this is the correct condition to put this.
> Other architecture than SPARC may need to link against libatomic. So
> perhaps it should instead be:
> 
> ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> NGINX_LDFLAGS += -latomic
> endif
> 
> but as I am not 100% sure, I wanted to first reproduce the issue.

The minimal reproducer is:
BR2_sparc=y
BR2_PACKAGE_NGINX=y

For sparc only libatomic_ops is selected via
package/nginx/Config.in. So I think the build issue is unique to
sparcv8/leon.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
