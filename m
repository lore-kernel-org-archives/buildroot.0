Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B66C43217
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 22:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A01FE40A07;
	Tue, 22 Nov 2022 22:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A01FE40A07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rLbt91GxeR5b; Tue, 22 Nov 2022 22:28:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2AEC409E3;
	Tue, 22 Nov 2022 22:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2AEC409E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FB071BF46D
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2942741901
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 22:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2942741901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xffo6a5PzGeH for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 22:28:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DBC0418C5
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DBC0418C5
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 22:28:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 808A560003;
 Tue, 22 Nov 2022 22:27:58 +0000 (UTC)
Date: Tue, 22 Nov 2022 23:27:57 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20221122232757.4dbe60ee@windsurf>
In-Reply-To: <20221111133254.1163936-1-dario.binacchi@amarulasolutions.com>
References: <20221111133254.1163936-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669156078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9rVvfi4AZhIjbHvdYwISNLfvj/GD9iKoXD20brZfbPk=;
 b=ADH3HjFGixI1R4RiJUlU7YbUZ4Td/AYUapMJHptCN/2beRCBHHirzorUdFUhpPBqktl20D
 O+G5VqE+f1Z7DCtSlIHHZOYwtxQQenqKhT3BTvR5wjb57um7HyyrbtNcLxO6437o3Ir405
 MoIyF39zNhyd37tK5eEUR0LePgxh6UB5VbWAqj3wS1ifhCWXAjs1ahf7iLMfk6+TDnVP0S
 WjEmRHCJgL6M6f0f50nFNxkHgQ1yr47pmHT8wd+dt/guRC46WJyLtBUV700k3xQvBeERHj
 cbyCsfjoxtM4PlFFmzPYVc2GyYfhPTe4A+WkmCMsUYH0b4tygqXhf7LIfpNQAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ADH3HjFG
Subject: Re: [Buildroot] [PATCH 1/1] package/sscep: new package
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Fri, 11 Nov 2022 14:32:54 +0100
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> SSCEP is a client-only implementation of the SCEP (Cisco System's Simple
> Certificate Enrollment Protocol).
> 
> The goal of SCEP is to support the secure issuance of certificates to
> network devices in a scalable manner, using existing technology whenever
> possible. The protocol supports the following operations:
> 
> * CA and RA public key distribution
> * Certificate enrollment
> * Certificate and CRL query
> 
> Certificate and CRL access can be achieved by using the LDAP protocol,
> or by using the query messages defined in SCEP.
> 
> CC: Angelo Compagnucci <angelo@amarulasolutions.com>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Thanks for your contribution. I applied to master, but after fixing a
number of things. See below.


> diff --git a/package/sscep/Config.in b/package/sscep/Config.in
> new file mode 100644
> index 000000000000..d4847f1b8a75
> --- /dev/null
> +++ b/package/sscep/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_SSCEP
> +	bool "sscep"
> +	depends on BR2_PACKAGE_OPENSSL

This should have been a "select", not a "depends on".

> diff --git a/package/sscep/sscep.mk b/package/sscep/sscep.mk
> new file mode 100644
> index 000000000000..f59f4bd03bbc
> --- /dev/null
> +++ b/package/sscep/sscep.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# sscep
> +#
> +################################################################################
> +
> +SSCEP_VERSION = v0.10.0
> +SSCEP_SITE = $(call github,certnanny,sscep,$(SSCEP_VERSION))

This should have been:

+SSCEP_VERSION = 0.10.0
+SSCEP_SITE = $(call github,certnanny,sscep,v$(SSCEP_VERSION))

I.e the "v" prefix should not be in the VERSION variable.

> +SSCEP_LICENSE = BSD

BSD is not a valid SPDX license code and is not specific enough. I've
changed this to:

+SSCEP_LICENSE = BSD-2-Clause, OpenSSL, OpenOSP


> +SSCEP_LICENSE_FILES = COPYING
> +SSCEP_AUTORECONF = YES
> +SSCEP_DEPENDENCIES += openssl

+= is not needed, a simple = is sufficient. But more importantly, the
host-pkgconf dependency was missing, causing the package to fail
building.

I've addressed all those small issues when committing.

Thanks again!

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
