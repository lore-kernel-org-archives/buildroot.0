Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F883606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 19:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KYOrMlYK
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D1F2406F9;
	Wed, 21 Oct 2026 19:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IACpu34wW1dB; Wed, 21 Oct 2026 19:40:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 859B240FDC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792611632;
	b=NAOmxy0rTBm3lDNAMS4eLmu68uYHXDroFNS8o2QQ1QbvbgS36VAGCPjcSGXfvW/TT1tm
	 x4IHbnI4eeh8DHLLQrDdFTEk8KMQHAPpnx2RgxHMsBd/h+pFp1W733S+rSTugYfFeBlbP
	 bgibpysEXoG7fQS1c/82TxUc3QvtRqG58gfZFuN23M3mSXiqwJfXjVJYDuLdo2Le9nSGj
	 GTLpGxO8mCX7IYBM2f+IW42gtUqO2QPGmg8WVAMcYfzxYDlAo7lf9vcgnjp1IjneApa7j
	 ERrshz1V2icjE6yZDi8ndFK+tdCHYcQL0onK/TlgxynCjQ52A5p39nRbLhomiOmRRBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792611632;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3FVWEiNQaxKbtqKkeMr8t/M6H7/CuczdA1LM2S5jECc=;
	b=VReSYUAaD3tXJKcCA27bIzBZ+Z7dRxajcAioXOgDj/yY2euzg6U9PuNu/QigYbPo8Icf
	 Mm0asp+sUiQgRc3tlvMDIsMeH3o5xNLum2gx+4un4rHEAjqwZvg9bccZZiRWAIquoTu+g
	 csO2tOcJ6TY5hOBkQgSVRPjUx+temA/+9Np3o2bHO6s04js50E7ckoxRVtvOp1I03SpIT
	 I3dDkzQ9c0KURN9RLqmVFI+9E7uK6ORCK08MpFoI3bNlnq2bKKJV1XclXfZ0ujYSYrQln
	 1LNUTRUlE/X++rpeQH1evtfybx3lLpKrXpty//6+7uTbbGvNbOQtua7MoR9loSknyMw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792611632;
	bh=3FVWEiNQaxKbtqKkeMr8t/M6H7/CuczdA1LM2S5jECc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KYOrMlYKuYg90MpyJi37NbgAziyVTKRApYX0tQ+5i6PpRMPWRWULBm59rI7Y9xlom
	 Itx8KHos1qjb7iGuewRqLYk7E7g83jb9KhzqhfmDCsuCyWZjBqPis/guLfeWMnZgRN
	 fmBjtiOklRCDbTdwMXXLjtpX9uTYgTDW9/3UWV/5UQhamQ+NxRWCeskpDHNxAwsxtk
	 3eHBAk/MaiC7jNMQhJwpPq5yomvIZmfTm3kIFqOdFybC9eJiCBgYtrDwxunCZeBhHP
	 Rb4t4w0u/OE3omsr9/9iZKGseLq+cMEkyJ2vnnShF+G1963o8MzC72PkMIjsKbJ/BR
	 8Vq4b28mUC5NA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 859B240FDC;
	Wed, 21 Oct 2026 19:40:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 755AB3C1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B18B40FDC
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cayI95SeG2fJ for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 19:40:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA919406F9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792611628;
 b=nn1BTrR3Gn0fg95nMxnYxa63S6UQl5Q9EuU19ydWM7CPKyVHQCzzi7VNxZrrBqop0zRG
 vkEQYzBbxWS8onK+bi+7s0T0a+i12J7YYjQGP8Om1XM+LZLqoKGR+yL4D7j5x4zJrIH0U
 1r9U47JK+SQXQWr0i/bthuGaLFFn6QN2DtQFarAy/5axzsLYOzIEPPyVjRSeXmJxS9b7Q
 kOglW4GuOMoKt7hsEnA0XybK55UEJC144H3kZtuWXAQnY9Vh430yWk44HeNmZhblsOgwc
 h/do8gvkDAPeDhYCg3koJsrBbHHFW5JpuNVw2MeY4WpjmEoiS0Is4zshandpC4FwR0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792611628;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=y15wlOYc7nJlcA8IqWDK5PFI89DguPt2BJ6mPmRm8Ug=;
 b=kpnZ3zB7QXu/48o4en/ImurmwN0ezsmu9YlyY0EiFj8Ya9efRvkfyXT0lxo75Yd8qlGh
 QzEObVMHwdxh1/J2XGIQqdPTkxT5vLs7JiBO+CW7vWnQlDzmG+n2Pmehud0z2EgMV3Uvi
 Koiy6LoAthaWnmZhI5pN4MziEsxh8NTGVZ1L+Je0oRahQaDW11VejiV+i3rIiUrmaeROA
 LTz96W2m2PdF0DLjXDjsI33CzxSLCcuCfUVhqgumYoZ3a/YlAu03HIJY9k0qNRSMV0jrb
 zQcDeO/VSU9DK3sMMmHNMeSW+bIseTQtTQNQBkiOF6scJwQIiPm7Lh7VZevMehUxmZA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GpYivLZI; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA919406F9
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 19:40:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7FB5BC5CD6A;
 Wed, 21 Oct 2026 19:41:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6B177606E3;
 Wed, 21 Oct 2026 19:40:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AEB23103289F5; 
 Wed, 21 Oct 2026 21:40:17 +0200 (CEST)
Date: Wed, 21 Oct 2026 21:40:16 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>, 
 Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
Message-ID: <atkSrg2TDcaqae1h@windsurf>
References: <20261020195759.1091151-1-ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020195759.1091151-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/2] boot/grub2: bump to version 2.16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 09:57:58PM +0200, Julien Olivain via buildroot wrote:
> For release notes, see [1] and [2].
> 
> The grub2 project moved to gitlab. See [3] and [4].
> This commit updates GRUB2_SITE accordingly.
> 
> The commit removes the package patches which are included in this
> release, and also adds an upstream patch to fix an issue on arm64
> platform.
> 
> Tested by compiling and booting the defconfigs using grub2:
> 
>     qemu_aarch64_sbsa_defconfig
>     qemu_arm_ebbr_defconfig
>     qemu_loongarch64_virt_efi_defconfig
>     qemu_riscv64_virt_efi_defconfig
>     qemu_x86_64_efi_defconfig
>     pc_x86_64_bios_defconfig
>     pc_x86_64_efi_defconfig
> 
> and running the runtime tests with:
> 
>     support/testing/run-tests \
>         -d dl -o output_folder \
>             tests.boot.test_grub \
>             tests.fs.test_iso9660
> 
> [1] https://gitlab.freedesktop.org/gnu-grub/grub/-/releases/grub-2.16
> [2] https://gitlab.freedesktop.org/gnu-grub/grub/-/blob/grub-2.16/NEWS
> [3] https://gitlab.freedesktop.org/gnu-grub/grub/-/commit/754a3d867d015ffc242a7bb67fd6b88624667af9
> [4] https://lists.gnu.org/archive/html/grub-devel/2026-03/msg00036.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Series applied to master, thanks!

I'm impressed that we're now able to update grub with such a small
change, compared to how painful it was in the past.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
