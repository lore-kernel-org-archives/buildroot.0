Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADAFC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 21:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32C7860C33;
	Tue, 26 Apr 2022 21:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hEMGrUR4cs9S; Tue, 26 Apr 2022 21:57:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32B6C60B85;
	Tue, 26 Apr 2022 21:57:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 873821BF3A6
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 21:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7454840496
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 21:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b9ETZoKBpk3r for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 21:57:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5596F401B3
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 21:57:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A8DD7240004;
 Tue, 26 Apr 2022 21:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651010262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7osmaGaCVZ6wpV9mic6P7ShyPG9VFppyVlNakV/jODk=;
 b=Ew18FJ1UHvkKY5S62ltq41plLPX3j9qfIud66RR/+3XMB2+cJuWdPP6fpN1FW5mAxJiRJ+
 ODZSkoRsB6KZWmAyaoDtbRiPqcL38MiI0U4lObS8us4WWBuHoMpSDM2paael74v9Krvedm
 eu/UIA4V3RbHvxzK1PmjstcjzoDbtzvymAM3+lx0AQhL7tGTlk5fVfRVAYQQHX1KumvVYl
 NeX/hBnZNMaPHacJU2+DiScEao1b5wueOSpB5GKykcfI3KbNbNB1hTFXA88aZKSfgdM1m7
 1ipPaRWlOG9dg0FXZ79PtKIeybMsl22fLRb8yFuFRoqf/VajyhD8JRU2NPELGQ==
Date: Tue, 26 Apr 2022 23:57:40 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220426235740.1b2543d1@windsurf>
In-Reply-To: <20220426212026.712081-1-fontaine.fabrice@gmail.com>
References: <20220426212026.712081-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptodev-linux: needs
 CONFIG_CRYPTO_USER_API_AEAD
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

On Tue, 26 Apr 2022 23:20:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> CONFIG_CRYPTO_USER_API_AEAD is needed to fix the following build
> failure:
> 
> ERROR: modpost: "crypto_alloc_skcipher" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
> ERROR: modpost: "scatterwalk_map_and_copy" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
> ERROR: modpost: "crypto_ahash_final" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
> ERROR: modpost: "crypto_aead_encrypt" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
> ERROR: modpost: "crypto_aead_setkey" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
> ERROR: modpost: "crypto_skcipher_decrypt" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
> ERROR: modpost: "crypto_destroy_tfm" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
> ERROR: modpost: "crypto_skcipher_setkey" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
> ERROR: modpost: "crypto_aead_decrypt" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!
> ERROR: modpost: "crypto_aead_setauthsize" [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko] undefined!

Are you sure of the relationship between these functions and
CONFIG_CRYPTO_USER_API_AEAD ?

crypto_aead_encrypt() is implemented in crypto/aead.c, which is built
when CONFIG_CRYPTO_AEAD2=y.

crypto_skcipher_setkey() is implemented in crypto/skcipher.c, which is
built when CONFIG_CRYPTO_SKCIPHER2=y.

CRYPTO_USER_API_AEAD enables a user-space interface, but here we're
talking about a kernel-level interface.

Could you clarify?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
