Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D63EE4993
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 19:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 535BF60F90;
	Tue, 22 Aug 2023 19:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 535BF60F90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dk1FNZVz5JCN; Tue, 22 Aug 2023 19:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5C4660BF7;
	Tue, 22 Aug 2023 19:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5C4660BF7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 898041BF370
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4168860BF7
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 19:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4168860BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d6W9yNJ3DA_F for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 19:14:41 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C57D760087
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 19:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C57D760087
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9EB120008;
 Tue, 22 Aug 2023 19:14:37 +0000 (UTC)
Date: Tue, 22 Aug 2023 21:14:36 +0200
To: Yu Chien Peter Lin <peterlin@andestech.com>
Message-ID: <20230822211436.5f9af493@windsurf>
In-Reply-To: <20230815054327.1436-1-peterlin@andestech.com>
References: <20230815054327.1436-1-peterlin@andestech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692731678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qQTnEdjMy/UWwcD7VQkFxsU+UIMo+QXEH+NrGzg0//E=;
 b=H9mVvtk6SQHXKAEl1iHwU6LQYN2lfkzd47+3CqUqlyrCpG5nSuDqp2ChijdMYs51crd4L5
 IwvxwiDERmZHEJFHc6PTx7g4WGtPFgO3cbK7o14Zgad10g8Hzvn+DCUVSVHS6f0M+LVexO
 Mc02NmGPIoXHVEgbvpFP/3DnRforRXmG2R9ZI1ZqmzQf+eyB5kGKjGBK7EeOLZqsx+I8fN
 2A+xRK4DML98I/Y8Pr5ChrjiD3ypCnQ5CpCRnAZUbSpuwmd2TF4J9659CLsnqBXKsfFmXI
 XpIXPdBNK5s4MsdI+kirKsA3n06nAToXDGInD7GMV0jtX/LPVafSHYtMVsfwKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H9mVvtk6
Subject: Re: [Buildroot] [PATCH v2] configs/andes_ae350_45: Select RVA for
 AE350 platform
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
Cc: ycliang@andestech.com, kilian.zinnecker@mail.de, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 15 Aug 2023 13:43:27 +0800
Yu Chien Peter Lin <peterlin@andestech.com> wrote:

> Let's select the RVA as Andes 45-series CPUs support
> IMAFDC extensions.
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Changes v1 -> v2:
>   - reword commit message
> ---
>  configs/andes_ae350_45_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks. However, it could be simplified a bit thanks
to recent changes in the RISC-V support. We could have:

@@ -1,9 +1,4 @@
 BR2_riscv=y
-BR2_riscv_custom=y
-BR2_RISCV_ISA_RVM=y
-BR2_RISCV_ISA_RVA=y
-BR2_RISCV_ISA_RVF=y
-BR2_RISCV_ISA_RVD=y
 BR2_RISCV_ISA_RVC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
 BR2_GLOBAL_PATCH_DIR="board/andes/ae350/patches"

Indeed, now riscv_g still allows to enable the C extension.

Could you have a look into this and submit a patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
