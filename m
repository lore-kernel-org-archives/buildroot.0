Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B72C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 09:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 223B741999;
	Sat, 29 Jul 2023 09:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 223B741999
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQ_d8JIiY0IQ; Sat, 29 Jul 2023 09:02:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 018D741B14;
	Sat, 29 Jul 2023 09:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 018D741B14
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C40201BF3FC
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EB9C41B14
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 09:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EB9C41B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9q5e4ICy12M for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 09:02:04 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47CB341999
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 09:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47CB341999
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E13E20004;
 Sat, 29 Jul 2023 09:02:01 +0000 (UTC)
Date: Sat, 29 Jul 2023 11:02:00 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230729110200.6c01af7d@windsurf>
In-Reply-To: <20230728225354.269776-1-romain.naour@gmail.com>
References: <20230728225354.269776-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690621321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J31H2OcFY6L4X0KAHgP2Xmmp1nWVZir4BG6BihqFMYg=;
 b=OmrM4zPkxyUIZyjq6tXy4lN2WGXDIQ86yghyvlajXpQKewcn47tUdAl0O0GqMtU/eZApKP
 PMX30KI5MSeefuMwlPlFx0Rne+echKP/W/tBSBPYB+6glqZ13Uy9wVGrCewK45jjb2Fm1g
 A8rnkEcmvRc8i64rO77mlRhgTzvQLZWNuShvqiutc689goFOp+MgFTZ3dYCg688NZJ7uQm
 QEN8qOySiIDxVb5qJMHXYEQx0Z/ZiX9o/jiF0JhQ4iVBxE8H/eIzU/g36+w65kIoXBy1K0
 gUrE9rIhO743Dlt0czzsWmJM7KWkx7dvHFPnqMMHZgxctU3NtoR1AhMFyxV4ng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OmrM4zPk
Subject: Re: [Buildroot] [PATCH] support/testing: Override the EDK2 CPU
 hotplug bug check
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 29 Jul 2023 00:53:54 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> In QEMU v5.1.0 up to v7.2.0, the CPU hotplug register block misbehaves.
> EDK2 hang if the bug is detected in Qemu after printing errors to IO port 0x402
> (requires BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL to see them)
> 
> The Docker image used by the Buildroot gitlab-ci uses Qemu 5.2.0, the workaround
> can be removed as soon as the Docker image is updated to provided Qemu >= 8.0.0.
> 
> https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
> http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186190 (TestGrubX8664EFI)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186198 (TestGrubi386EFI)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186306 (TestIso9660Grub2EFI)
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186317 (TestIso9660Grub2Hybrid)
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Julien Olivain <ju.o@free.fr>
> ---
> Adding Debian bullseye backport repository in the Docker image used by the Buildroot Gitlab-ci
> is not enough, since the bug is really fixed in Qemu 8.0.0 and only Qemu 7.2.0 is provided.
> ---
>  support/testing/tests/boot/test_grub.py  | 20 ++++++++++++++++++--
>  support/testing/tests/fs/test_iso9660.py | 11 ++++++++++-
>  2 files changed, 28 insertions(+), 3 deletions(-)

Looking at this, I was wondering if it could be factorized some way.
But OK, that's just 3 occurrences, and it's supposed to be temporary
until we switch to Qemu 8.0.0. So: applied as-is. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
