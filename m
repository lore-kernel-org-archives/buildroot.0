Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8829FC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 04:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 091A4607D6;
	Mon, 29 Jul 2024 04:51:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KyRVfc94Lp8f; Mon, 29 Jul 2024 04:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A954A607C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A954A607C6;
	Mon, 29 Jul 2024 04:51:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1EEBE1BF30C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 04:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 186734016D
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 04:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1roneJoTJENp for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 04:51:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 412BC400C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 412BC400C5
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 412BC400C5
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 04:51:47 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B357435211FD; Mon, 29 Jul 2024 06:51:43 +0200 (CEST)
Date: Mon, 29 Jul 2024 06:51:43 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zqcf31ivOCwqs+01@waldemar-brodkorb.de>
References: <20240728115817.743185-1-dm.chestnykh@gmail.com>
 <20240728180047.38c594f2@windsurf>
 <CA+RUeSqWVBsZYMV1S_2eDnLbEJY6E7o4aqDQjd9j=puoSs0cfQ@mail.gmail.com>
 <20240728221140.01aa7ed1@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240728221140.01aa7ed1@windsurf>
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722228703; bh=23bmMbTQek/oWoc4QN34u4my4dx0/LpZgd4I/x4+ESg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EiqQX47pUG1eoBBSFoxxd9PbhaP05mn4kT6W6V4OoJRQi52+44Uu81agLvwqD6tRY
 SYJpfWbkCS/PD2CRw9qHe9zEuiBfbRGP4XsiGK0Aw6SFVujmyOxLjeu0sZverHxUb5
 qXHQ3sYAU5tRQcb0EoDbtgnt0bi475yuNEn77kqaXSTsxevuGsU+pldLWO/My+FPJG
 j8fvIyapdvbswSCFL+GTPn42zYGUi8CuGGuJn0ERpVCXZ3VErEzqKgjxrDowV88Eoo
 GJ1AbcaGdUgHvWGmIwQeYkN+qxX38oUxGGDCmQBlDovtKkIVfVzaREHZWk4r5FrYwh
 ILO3w53knp9rw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=EiqQX47p
Subject: Re: [Buildroot] [PATCH] package/uclibc: Fix ARC build with 4.x
 kernel headers
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
Cc: buildroot@buildroot.org, Dmitriy Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sun, 28 Jul 2024 19:21:20 +0300
> Dmitriy Chestnykh <dm.chestnykh@gmail.com> wrote:
> 
> > Hello Thomas
> > The SuperH4 issue has already been fixed by patch number 0002 (
> > https://gitlab.com/buildroot.org/buildroot/-/commit/f463a4953534df13397ce113bfbbc03d4b8e4df7
> > )
> 
> Indeed, thanks!
> 
> I still have an issue with SuperH 4 though.. it doesn't boot in Qemu:
> 
>   https://gitlab.com/buildroot.org/toolchains-builder/-/pipelines/1391146782

That is strange. I cloned buildroot-toolchains, 
make qemu_sh4_r2d_defconfig && make

For me it works with the included Qemu 9.0.0.
Strange thing is my zImage is smaller then the artefact which can be
downloaded and did not work.

$ ls -l Downloads/zImage 
  -rw-r--r-- 1 6037536 Jul 29 06:06 Downloads/zImage
$ ls -l buildroot-toolchains/output/images/zImage 
  -rw-r--r-- 1 4530208 Jul 29 05:57 buildroot-toolchains/output/images/zImage

Are the toolchain checks are running some tests inside the image?

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
