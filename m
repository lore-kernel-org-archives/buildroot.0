Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CAFC00528
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47F4361170;
	Tue,  1 Aug 2023 21:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47F4361170
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X09RBq8cU_cc; Tue,  1 Aug 2023 21:11:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 805A960C02;
	Tue,  1 Aug 2023 21:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 805A960C02
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 137D31BF408
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 704CE41829
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 704CE41829
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OMc9nxWvDmqp for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:11:11 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07004415DE
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07004415DE
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0013240004;
 Tue,  1 Aug 2023 21:11:08 +0000 (UTC)
Date: Tue, 1 Aug 2023 23:11:07 +0200
To: carrier.nicolas0@gmail.com
Message-ID: <20230801231107.78940dc0@windsurf>
In-Reply-To: <20230119132856.1801425-4-carrier.nicolas0@gmail.com>
References: <20230119132856.1801425-1-carrier.nicolas0@gmail.com>
 <20230119132856.1801425-4-carrier.nicolas0@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690924269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vsz4RYAGrDXxpIM2zPYYez0n4e3y3k1LBpjDTMoFXFM=;
 b=OakNSx+P34vtEUmEUg4sUFj99DvA/gzQODzKGD6H76meafs/quBwDtx2Fc50UG4b/K/aLZ
 1bs8aQzKqtrK3WAcD3MZF/bMsYcEcrjW3/I7Q5H7kQ1eEN1ds6eZcc9hpiiAcILYOo6GWU
 GQOkWgtbROKVzecC0BReyZ9pUPNqS7o2sZuYqbTIexJBxIKYl2dTIXxGY2fKRG3tNUNE3B
 14h0amNjO5aJCRDnT2mFByu+q6Sa1q/GP0Vh2M7WSpacy0G7ccfsvE4I5rGqwG8RJLJRtz
 JntTr4F2aNoRucaa3hiIjsANo37ziR6i7kwQzDl0+FkegHunxnIb4HBnaER/Ag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OakNSx+P
Subject: Re: [Buildroot] [PATCH 3/3] package/composer: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nicolas,

On Thu, 19 Jan 2023 14:28:56 +0100
carrier.nicolas0@gmail.com wrote:

> From: Nicolas Carrier <carrier.nicolas0@gmail.com>
> 
> composer describes itself as a dependency manager for PHP, it is used
> by projects such as CakePHP.
> 
> Signed-off-by: Nicolas Carrier <carrier.nicolas0@gmail.com>
> ---
>  package/composer/composer.hash |  3 +++
>  package/composer/composer.mk   | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 package/composer/composer.hash
>  create mode 100644 package/composer/composer.mk
> 
> diff --git a/package/composer/composer.hash b/package/composer/composer.hash
> new file mode 100644
> index 0000000000..512f4399a8
> --- /dev/null
> +++ b/package/composer/composer.hash
> @@ -0,0 +1,3 @@
> +# Locally computed hashes, not provided by upstream

Actually hashes are available at https://getcomposer.org/download/.

> +sha256  2021f0d52b446e0efe3c548cc058ab5671fa38cdbcf814e7911c7e9d71d61538  composer-2.0.8.phar
> +sha256  c8cce4b6b9729f264ffdf9296d505d63432497feeed1f586d1902b942197e024  LICENSE
> diff --git a/package/composer/composer.mk b/package/composer/composer.mk
> new file mode 100644
> index 0000000000..5ff5644d29
> --- /dev/null
> +++ b/package/composer/composer.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# composer
> +#
> +################################################################################
> +
> +COMPOSER_VERSION = 2.0.8

I have bumped to 2.5.8, because at runtime 2.0.8 was spitting out a few
warnings about usage of PHP features that are deprecated/obsolete.

I've added a Config.in.host file so that this package can be enabled as
a host package from menuconfig.

And I now realize that I forgot to add a DEVELOPERS entry, so I will do
that now.

Applied with those changes!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
