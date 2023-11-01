Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCF9C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25F30430E5;
	Wed,  1 Nov 2023 11:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25F30430E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Nas9niSshwO; Wed,  1 Nov 2023 11:40:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7839B430DE;
	Wed,  1 Nov 2023 11:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7839B430DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85FCC1BF34C
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59F0B4EC69
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59F0B4EC69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z8MHGcjnl_Rd for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:40:23 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B51594EC43
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B51594EC43
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88413E0004;
 Wed,  1 Nov 2023 11:40:19 +0000 (UTC)
Date: Wed, 1 Nov 2023 12:40:18 +0100
To: Fabien Thomas <fabien.thomas@smile.fr>
Message-ID: <20231101124018.3aa5ee54@windsurf>
In-Reply-To: <20231026095506.876284-1-fabien.thomas@smile.fr>
References: <20231026095506.876284-1-fabien.thomas@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698838820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ZqX97mRJR6EvVoFx33lgEOHc0Fp4N6W/AKyaE7jyQY=;
 b=QJFgw3O62FeouvjlRxKe/tFt7NeW3MgvOtj2cTKk++fr+pYEHZ4FXZ8XAUIoR6oo/zDwkw
 g0AVtpiLLyRT9iCCcCXZqNxfq8ycRUEVtv68/dtMBelRM9vu5K45+sOHRXd44MSfbDvhzp
 QZObnL5xzzMsOUTfumxsQ//xLcSjhYaHdn5bFX3QAyXgRVjZES5jrh6c+JWt3EtA3urfuy
 7Tq6t5/0Y4yxag1BTTRNNT8V0IujEPoXtI89n/gwBnVVxOuTW0URLQ0GAIbDhogUl3qsv2
 LZNbNmdSLNbhHoA8P85y7kYYjMiATIoKlBILouRoUptcVYSgQjSPbzYOEy6vkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QJFgw3O6
Subject: Re: [Buildroot] [PATCH] package/nettle: add missing host-gmp
 dependency
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabien,

On Thu, 26 Oct 2023 11:55:06 +0200
Fabien Thomas <fabien.thomas@smile.fr> wrote:

> Since the generic package infrastructure removed auto derivation of
> host dependencies [1] (2016.08), the host dependencies must be
> explicitly set.
> 
> While adding the nettle host variant [2] the gmp dependency was not
> duplicated and host-nettle was built without host-gmp (or built with
> gmp installed on the build machine).
> 
> While building host-gnutls required for building mkeficapsule u-boot
> tool, the configure script check if Libhogweed (nettle's companion
> library) is build with libgmp support.
> 
> If internal toolchain is used, luckily host-gmp is built before
> building host-nettle (and host-gnutls). But when using prebuilt
> external toolchain, following error shows up :
> 
> Libhogweed (nettle's companion library) 3.6 was not found. Note that you must compile nettle with gmp support.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/4bdb067e380e72c3a6cb9c6ccf3791a6cf8661e0
> [2] https://gitlab.com/buildroot.org/buildroot/-/commit/dac6e3011883ce3b35cbf64ec156186153bf0032
> [3] https://gitlab.com/gnutls/gnutls/-/commit/eb24bfa808ee029e9b3b198d66d29256eea3fd08
> 
> Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
> ---
>  package/nettle/nettle.mk | 2 ++
>  1 file changed, 2 insertions(+)

I have applied, but to be honest, I wasn't sure. Indeed, gmp is
actually an optional dependency of the nettle package. We do handle it
as a mandatory dependency for the target nettle package, which I
believe isn't correct as we really try hard in Buildroot to not make
dependencies mandatory when they really are not.

In addition, it should be associated to the actual feature that needs
it. So I believe we would ideally need to do this:

 NETTLE_VERSION = 3.9.1
 NETTLE_SITE = https://ftp.gnu.org/gnu/nettle
-NETTLE_DEPENDENCIES = host-m4 gmp
+NETTLE_DEPENDENCIES = host-m4
 NETTLE_INSTALL_STAGING = YES
 NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
 NETTLE_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
@@ -15,6 +15,13 @@ NETTLE_CPE_ID_VENDOR = nettle_project
 # with static linking
 NETTLE_CONF_OPTS = --disable-openssl
 
+ifeq ($(BR2_PACKAGE_GMP),y)
+NETTLE_CONF_OPTS += --enable-public-key
+NETTLE_DEPENDENCIES += gmp
+else
+NETTLE_CONF_OPTS += --disable-public-key
+endif
+
 HOST_NETTLE_DEPENDENCIES = host-m4 host-gmp
 
 # ARM assembly requires v6+ ISA

But of course this requires analyzing the reverse dependencies of
nettle, to figure out the ones that need vs. the ones that don't need
the public key support. The ones that need public key support would
have to select BR2_PACKAGE_GMP.

For the host variant of nettle, I'm not sure. We are a little bit less
strict on making all dependencies optional for host packages, because
there's no impact on the target root filesystem size, only an impact on
the build time. That's why I applied your patch as-is, even if you're
handling an optional dependency as a mandatory dependency.

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
