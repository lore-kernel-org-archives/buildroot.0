Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03222EE49AE
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 18:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3E1261204;
	Tue, 22 Aug 2023 18:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3E1261204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mQysEWD_EhGu; Tue, 22 Aug 2023 18:10:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7D11611E5;
	Tue, 22 Aug 2023 18:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7D11611E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9FF01BF35E
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B37A881B83
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 18:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B37A881B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tTshKZ6GrKV4 for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 18:10:42 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 892A181B70
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 18:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 892A181B70
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5ED31BF206;
 Tue, 22 Aug 2023 18:10:40 +0000 (UTC)
Date: Tue, 22 Aug 2023 20:10:39 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230822201039.2c5f5e49@windsurf>
In-Reply-To: <ZORnh9dzTr/VmBfa@waldemar-brodkorb.de>
References: <ZORnh9dzTr/VmBfa@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692727841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vh1cqWYUlC7tVPTtJVjAyPbbO77dwBPDv/ca74W6/N4=;
 b=UB70sfvo+RNDY7PlRWCP28ZUnKu217bJo0wpLd5dgQVRgtPhifcFrZn/WXH6jWb1SXvYz8
 LbBDQ6Hn5cuJNir5kfCdZhqWlCfdvq7GgJjgMYE6+d91Ih39uq/SRgq1O8e54yt2e4Ei9f
 EjC+TBnT3NvNZ84N5+Bv+Hzt9D102d4OAea4H7VCuzG0mrfSqkNQRXdCv0IgSTiqlDlsLo
 /YigTVJ7og88FxHDxLrMYix2KbKiTq7rz9JVefZYZvZSUO9EpHbjuFD3AlGNBua/b6nGKB
 A18Hsd4tpfnVJIvsGEnBGXn74H6WMWeykC6wPdki0WyYkCHLsoL0lp1TIzPxPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UB70sfvo
Subject: Re: [Buildroot] [PATCH] package/gmp: fix compile error for riscv
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 22 Aug 2023 09:45:11 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> In commit 87b2a30319394c2cc79efae1af7833cad8c62b32 gmp got updated
> to 6.2.1, since then the compile error exist.
> 
> Compile error looks like this:
> tmp-mul_1.s: Assembler messages:
> tmp-mul_1.s:55: Error: unrecognized opcode `mul a5,a7,a3'
> tmp-mul_1.s:57: Error: unrecognized opcode `mulhu a7,a7,a3'
> 
> Patch should be backported to stable branches.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/2f2/2f2112bea73adbf49eabb62fe6cda6a9cd5d0567
>  - http://autobuild.buildroot.net/results/566/566a4945555b781ed127997176f73b3c17ecab5d
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/gmp/gmp.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Yann, Peter: I have intentionally cherry-picked this patch into the
next branch as well, but it is slightly different due to the renaming
of the RISC-V option. I did it now because my thinking is that if I
don't do it now while merging the patch, we will forget about it when
we merge back next into master. At least here, there will be a very
easy to resolve merge conflict, and we will notice that we need to keep
the version coming from the next branch. Let me know if you find this
sensible or stupid, so that I know how to do better next time if needed :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
