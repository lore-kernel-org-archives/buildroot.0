Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C0BE65D0B
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 00:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 012964249F;
	Fri, 22 Nov 2024 00:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXbexW8z7swE; Fri, 22 Nov 2024 00:20:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C459C424A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C459C424A3;
	Fri, 22 Nov 2024 00:20:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE48FB8E
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 00:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BA754249F
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 00:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPHc70KWXv9C for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 00:20:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC42642497
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC42642497
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC42642497
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 00:20:40 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:491e:31cb:7baf:f404])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2ED5F19F58A;
 Fri, 22 Nov 2024 01:20:35 +0100 (CET)
Date: Fri, 22 Nov 2024 01:20:34 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Brandon Maier <brandon.maier@gmail.com>
Cc: Robin Jarry <robin@jarry.cc>, buildroot@buildroot.org
Message-ID: <q75xktmldvlans2dyvm2ssodi7bzjcpqb7yyjw6mowmb4i5yhc@em7opvmlgjgm>
References: <20241119205901.58762-1-vjardin@free.fr>
 <CADwxmTktxHDhbw56oraJFHrNknUD+sqNvbAD8EpOEJHKs-5vDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADwxmTktxHDhbw56oraJFHrNknUD+sqNvbAD8EpOEJHKs-5vDQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732234837;
 bh=tNQrVYEcB3jnlrKlxV3bFeFARFSKurwTo+TilRwe90A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DmxgWlY2GtE2IBVst0FLZjdXy65N7TKnZ6J8qfDMOcBesCeSI9y13md+gwHVyxIbf
 Rafnxsb5zvHKlEfcN0gL8oyoSKkr0P6O3rfmmia3A3yAPuQsQ8YuWlpB7oXR86GV01
 FwJVFuBgDCl+7FaAlV3ITkGfqmAagrW94OiVDHNvS7jgFdN0gjEQiwhmM5ruN3aDuE
 iyBk/6MPaXUxuJXBFVeYJ0KU/xGoXmKqm0b1GUmMMcViT+3bu8Uyeia3rlkFUhSfKM
 rrnkvO832DJl/wmGSBtbsOs79/nuvytAyb3Zk2YP+N5pPkfufxQoTT92tlyYgK7woy
 Q+gGzw1kQtXQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DmxgWlY2
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-meson: h files only into
 sysroot
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

Hi Brandon,

On Thu, Nov 21, 2024 at 07:49:15AM UTC, Brandon Maier wrote:
> >  define $(2)_INSTALL_STAGING_CMDS
> >         $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
> > -               $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
> > +               $$(MESON) install -C $$($$(PKG)_SRCDIR)/build --tags=runtime,devel
> 
> Perhaps a new variable like $(PKG)_MESON_INSTALL_STAGING_TAGS.

I guess I get your point, just to confirm and then I'll submit an
update: do you suggess,

  - if there is a $(PKG)_INSTALL_STAGING = YES 
      and
    a $(PKG)_MESON_INSTALL_STAGING_TAGS = YES
      then, we should use the meson's tags ?

or

  - if there is a $(PKG)_MESON_INSTALL_STAGING_TAGS = YES
    whatever the $(PKG)_INSTALL_STAGING = YES/NO/not set 
      then, we should use the meson's tags ?

I am just concerned about two conflicting interpertations. Are there any
other cases from Buildroot that could inspire to apply the same logic ?

best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
