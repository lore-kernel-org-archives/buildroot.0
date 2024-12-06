Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8541EE77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 21:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D68360762;
	Fri,  6 Dec 2024 21:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFglYVQmmGq6; Fri,  6 Dec 2024 21:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C3F4607BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C3F4607BC;
	Fri,  6 Dec 2024 21:51:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13122ED2
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 21:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F26CC40118
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 21:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVKtUaBpkrL6 for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 21:51:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D93AD40106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D93AD40106
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D93AD40106
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 21:51:51 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:bca7:77f2:7ee8:6a7a])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D219D78035B;
 Fri,  6 Dec 2024 22:51:46 +0100 (CET)
Date: Fri, 6 Dec 2024 22:51:46 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Brandon Maier <brandon.maier@gmail.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Robin Jarry <robin@jarry.cc>
Message-ID: <twavuqqxiozoflby6vdaw4kj5kra2fciu7svgogo2v3ktxmsxr@2dqpzeedtbcg>
References: <CADwxmTnvhL1rg7T2k8Ye+wV0gx2oCCjLmnKiCfUQsY7ud9RVPA@mail.gmail.com>
 <20241127013001.24122-1-vjardin@free.fr>
 <20241127013001.24122-2-vjardin@free.fr>
 <D5Z27LYGMKJK.2KDMDIY9CR01H@gmail.com>
 <iig5bn2go5jmwxxgusoagg4oapd7kmazljykzgemmnuvtz7a74@m5btvmgminf7>
 <CADwxmTkLcqGnLOQwn9FYtXsixsN0a_cWz5U716ZtPeNCb-usXg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADwxmTkLcqGnLOQwn9FYtXsixsN0a_cWz5U716ZtPeNCb-usXg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733521910;
 bh=FNNDIg34yykqKIdKfQY+fwj0CJIqGLNrzzZUEjiZuTA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NDnuA0ceQQj1I2NJHpC10J+evEmz4rhHf5BF/ajSlppPoHJ0U0n8e5FXyDBuY+/oa
 4YsyhIJomSJVDgZivQ9T/bwocYjzYqTHZLbXp8oo7ef0BxEYAYCbgpb2fJY8hoeoJ3
 eXSMXreOMVJuN+L8ZThSp6gzXiHndU72PnhicDukJCkMiMWUA2WxIBLso+renm8KN4
 y2N4FK4/Iqzmk1fuGSTJnF8u8b3LQihZE8lkD44DnhAjLoRbzqCzPWMjIOK/lAdt3B
 y02gVZBNyRrNspdLcJ9Og15jJ2jotF5mgQe1FmAkIcLm1FApq5tFPhliYh2VMSriFG
 uwLtsTG1UIzQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NDnuA0ce
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pkg-meson: h files only into
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

On Fri, Dec 06, 2024 at 07:47:06AM UTC, Brandon Maier wrote:
> > "ok" can start using the tags. I plan to do so for grout, libecoli and DPDK.
> 
> Alright, my main concern was that this feature would be added but not get
> used if it isn't default. If you've identified some packages for this
> then you could include them with this patch series.

I'd prefer to provide first this capability and then later to start
patching the related packages.

> > Side question: how do you handle a side-by-side build with Buildroot ?
> 
> If you want to diff the files being installed before and after. I
> would git-clone
> two copies of Buildroot, one without your changes and one with your changes.
> Create a .config with the Meson packages enabled you want and enable
> BR2_PER_PACKAGE_DIRECTORIES (PER_PACKAGE isolates the
> target/host/staging directories and makes testing installation changes easier).
> Build each of them. Then you can diff the installed files list that
> get generated in the package build directories (output/build/my-package/.file
> s-list.txt, .files-list-host.txt, and .files-list-staging.txt)
> 
> For example
> 
> > cat buildroot-1/output/build/*/.files-list.txt | sort >buildroot-1-files.txt
> > cat buildroot-2/output/build/*/.files-list.txt | sort >buildroot-2-files.txt
> > diff buildroot-1-files.txt buildroot-2-files.txt
> 
> And repeat for -host.txt and -staging.txt

Big thanks, it is very instructive. I'll try it next week.

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
