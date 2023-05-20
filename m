Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE23C77B7A
	for <buildroot@archiver.kernel.org>; Sat, 20 May 2023 19:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88A4B41AFD;
	Sat, 20 May 2023 19:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88A4B41AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DD7lFYg6EAmN; Sat, 20 May 2023 19:24:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7367C41B4B;
	Sat, 20 May 2023 19:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7367C41B4B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD7361BF3EA
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 19:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 864AE40138
 for <buildroot@lists.busybox.net>; Sat, 20 May 2023 19:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 864AE40138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jm36kwAbRI_W for <buildroot@lists.busybox.net>;
 Sat, 20 May 2023 19:24:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5764B400DD
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5764B400DD
 for <buildroot@buildroot.org>; Sat, 20 May 2023 19:24:47 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 4F678C3ECD
 for <buildroot@buildroot.org>; Sat, 20 May 2023 19:24:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5641AFF804;
 Sat, 20 May 2023 19:24:38 +0000 (UTC)
Date: Sat, 20 May 2023 21:24:37 +0200
To: Sourabh Hegde <hrsourabh011@gmail.com>
Message-ID: <20230520212437.2125e68b@windsurf>
In-Reply-To: <CADYjeSuBBWWpoD3HKWQ6H0RV_EL4WAsBHxvHGTiV3P_-JrLy3g@mail.gmail.com>
References: <CADYjeSuBBWWpoD3HKWQ6H0RV_EL4WAsBHxvHGTiV3P_-JrLy3g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1684610678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22wnWgfwyPRK5Uo8XHtRRARWeJkE31rN5DnzZq/C91w=;
 b=ipjuZTBxHor+Nu0VJ2GpgcjvaU9L6qd3lvCXTYZVYriuyHINnxtmahv3LMHCrXzGgDWrFR
 zyzJwQ2WO1a9vRw+2cbWTiaDFSlPJHYIe10bxm9WB+3GtrTS26dXr+4TwLqIv89dWDoFaM
 7i4xOfEi/Of51bz9SI7l0RVYi9vF+zYj0TwagV117Mkh1B0+Y6e6RZJxGKOkUu2T7h+9FT
 UjCdod8oQWR+5NqbPbCoKks9kC9CW6Wlb+xnPHIOH8gPuBH+LoBUcyUlBQ7/OA+zP3ZClO
 HoyqtirpXIvFLe46DrVe0w/dSM0FI2Ec4Bn97Lb11MTN6GP3uwrxpqWd+npU3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ipjuZTBx
Subject: Re: [Buildroot] Error while building tpm2-tools package with fapi
 support
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 19 May 2023 12:59:30 +0200
Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> Hello All,
> 
> I am trying to build the package tpm2-tools
> https://github.com/buildroot/buildroot/tree/master/package/tpm2-tools with
> "fapi tools" option enabled
> https://github.com/buildroot/buildroot/blob/603df32a0cd416caa2d2688008cb87f14ad68ef3/package/tpm2-tools/Config.in#L26
>  (BR2_PACKAGE_TPM2_TOOLS_FAPI=y, BR2_PACKAGE_TPM2_TSS_FAPI=y).
> But this results in below error

I have just built the following configuration:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_TPM2_TOOLS=y
BR2_PACKAGE_TPM2_TOOLS_FAPI=y
# BR2_TARGET_ROOTFS_TAR is not set

and it builds just fine here. Could you share your .config, or a
minimal configuration that exhibits the problem?

> checking for TSS2_FAPI... no
> configure: error: Required module tss2-fapi not found

It is simply using pkg-config to detect TSS2_FAPI. tpm2-tools correctly
has a dependency on host-pkgconf and tpm2-tss properly installs
tss2-fapi.pc.

So my guess is that you are doing a partial rebuild. You did a first
build without BR2_PACKAGE_TPM2_TOOLS_FAPI enabled, and then enabled it.
Thing is that tpm2-tss was already built as part of a previous build,
but without FAPI support.

See https://buildroot.org/downloads/manual/manual.html#full-rebuild for
some details on this.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
