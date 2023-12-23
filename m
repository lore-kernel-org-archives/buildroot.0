Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B43DC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 14:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 371BD60E5F;
	Sat, 23 Dec 2023 14:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 371BD60E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cUhpZ0anSk5; Sat, 23 Dec 2023 14:26:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B7A60D88;
	Sat, 23 Dec 2023 14:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80B7A60D88
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 322011BF280
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:26:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F06154044F
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F06154044F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3mDWtvW80aLk for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 14:26:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 955594034B
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 14:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 955594034B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D564C0005;
 Sat, 23 Dec 2023 14:26:35 +0000 (UTC)
Date: Sat, 23 Dec 2023 15:26:34 +0100
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Message-ID: <20231223152634.2f543c44@windsurf>
In-Reply-To: <20231220105623.192609-1-hayashi.kunihiko@socionext.com>
References: <20231220105623.192609-1-hayashi.kunihiko@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703341595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sE5SkGnr/gBsLWxHGPw/sDa6KRVME7ytvCqp9R9/rk=;
 b=QaABPpZuw1Y2iG7z+u0B0uPD7dSQrPLrB0J2QLhC60lbilo96MtyrVPr53sPxqTT7eE6NV
 LeH5lxvdlWKZlGpcQK9j5pekoruD5JVFLk4CteS876ApXYS3691c51pn4nGHhWUG0Hl0cF
 QoQCG3Ocr8JF6z3jDicLgjSnK3nYQECnCZv700bcvJ7cqZHNEh0DgD1CJAtDULo9LctXz7
 vgbBBfAGEM77wm9WKm1V+d5Ho1lLq5RsyzDpZwqV7CBzg+T8IzPj7ugFKCOaG1W2pufLCh
 9FBa0iyHlfVI1oGb5wD5Gqoj4Zk+g6wP51KUZJQnOs+pcv+QpkTVTqk60HOBgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QaABPpZu
Subject: Re: [Buildroot] [PATCH 1/1] package/eudev: add sgx group for
 eudev-3.2.12
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 20 Dec 2023 19:56:23 +0900
Kunihiko Hayashi <hayashi.kunihiko@socionext.com> wrote:

> The eudev has "sgx" group in 50-udev-default.rules as default
> since commit 247724da450b.
> 
> The group is defined by package/systemd [1], however, when
> enabling BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y with
> qemu_aarch64_virt_defconfig, the systemd isn't used and the following
> warning occurs:
> 
>     udevd[153]: specified group 'sgx' unknown

If I'm correct, this is due to those rules:

SUBSYSTEM=="misc", KERNEL=="sgx_enclave", GROUP="sgx", MODE="0660"
SUBSYSTEM=="misc", KERNEL=="sgx_vepc", GROUP="sgx", MODE="0660"

why do these rules trigger on an AArch64 system? Isn't SGX an Intel
thing?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
