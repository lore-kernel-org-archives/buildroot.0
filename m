Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F478EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B8CD613BF;
	Thu, 27 Jul 2023 21:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B8CD613BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAFJsUqRrS-4; Thu, 27 Jul 2023 21:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 447BB60BB6;
	Thu, 27 Jul 2023 20:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 447BB60BB6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CC0F1BF20B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 20:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3DEB60BB6
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 20:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3DEB60BB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qB39FOuUc0F6 for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 20:59:55 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C60360B8C
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 20:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C60360B8C
Received: by mail.gandi.net (Postfix) with ESMTPSA id E183D20002;
 Thu, 27 Jul 2023 20:59:51 +0000 (UTC)
Date: Thu, 27 Jul 2023 22:59:50 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230727225950.22bf4c14@windsurf>
In-Reply-To: <20230727155944.GF3544423@scaer>
References: <20230727125123.927568-1-herve.codina@bootlin.com>
 <20230727155944.GF3544423@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690491592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hzsUCW1Tagiw96EGuhQdrRpVMFCFLYiXjvftM4G9Tm8=;
 b=QlX22s3jUfdSACSjDgq/Up1Bpe0EwO2R1A8eIxVV/+XkySqvHfK1UGSINLYsrtSc8dFBbv
 xPbutGtXaskNcOPa2xU9J7MdOGdVqdfaehtv/V9uN3pG4IP9GlrPdHMhHJh/XG+iswcM6l
 3k/MYceqk4kAuD3nFQNnUg+Zj8M/+d9os+bB5bHS2XflLWUqW7ZiAtyxrj4epW9lz5stI8
 IH7JZsc8QeGsHjkHqZuZcWlx4Q+RYZSVlMHdjC34+PDvgd+mk2DpqWAfLgBQbdr+qgwKWW
 sEScaIAHRKYTJF7QiGpDEsfqCwRydIHeSFaSQ5/w1RYyGvYmk4Fjq5WqBiOgsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QlX22s3j
Subject: Re: [Buildroot] [RFC PATCH 1/1] support/download: allow to use part
 of file in checksum checking
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
Cc: Herve Codina <herve.codina@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Jul 2023 17:59:44 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

>  2. for such packages, add a post-extract hook that prepares the license
>     file(s), and register those as _FOO_LICENSE_FILES instead. By using
>     code, you can search for patterns rather than depend on constant
>     line numbers.

Like:

# The Github repository doesn't contain the source code as-is: it
# contains a tarball with the kernel driver source code, and a
# self-extractible binary for the user-space parts. So we extract both
# below, and also extract the EULA text from the self-extractible binary
define GCNANO_BINARIES_EXTRACT_HELPER
        tar --strip-components=1 -xJf $(@D)/gcnano-driver-$(GCNANO_BINARIES_DRIVER_VERSION).tar.xz -C $(@D)
        awk 'BEGIN      { start = 0; } \
                /^EOEULA/  { start = 0; } \
                        { if (start) print; } \
                /<<EOEULA/ { start = 1; }' \
                $(@D)/gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION).bin > $(@D)/EULA
        cd $(@D) && sh gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION).bin --auto-accept
endef

GCNANO_BINARIES_POST_EXTRACT_HOOKS += GCNANO_BINARIES_EXTRACT_HELPER

(which among other things extracts the EULA file, that is used as a
license file)

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
