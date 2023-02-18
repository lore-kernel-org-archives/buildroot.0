Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FE7C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 17:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA3B641CC0;
	Sat, 18 Feb 2023 17:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA3B641CC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O5IjwcRQugFg; Sat, 18 Feb 2023 17:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7E6941CB9;
	Sat, 18 Feb 2023 17:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7E6941CB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 736701BF3E5
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 17:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D2BA60F0F
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 17:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D2BA60F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4a90JkUbyow for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 17:40:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE8E760D51
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE8E760D51
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 17:40:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.59])
 by smtp2-g21.free.fr (Postfix) with ESMTP id 926582003B4;
 Sat, 18 Feb 2023 18:40:35 +0100 (CET)
Received: from [37.171.207.33]
	by webmail.free.fr
MIME-Version: 1.0
Date: Sat, 18 Feb 2023 18:40:35 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <b5fef166-72c3-25ac-2427-e4255b68f2db@gmail.com>
References: <20230218101426.630874-1-bagasdotme@gmail.com>
 <20230218113939.526f0a76@windsurf>
 <96015d0268df72d3cdd58e7db09c1333@free.fr>
 <b5fef166-72c3-25ac-2427-e4255b68f2db@gmail.com>
Message-ID: <1852709c493974b2588cc7c9c28bba7e@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676742035;
 bh=6huMSAyDOwYktbO40QMEFhRyA/U0ITwqn1lVadXYJ1A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fd3JsPC+kY2RUos9iaU0JeG2z81ihcHbHoY3HRpdgnELblEngkwQoT2uftvOZoD/d
 yHhuxpkL8GH2EnBgReQEloLxgfxerZ4zuTy7irG+cUogRpD7ZjDtpc56mhJev3K0J1
 G0g5zDLZN53Pg/9foAb/Jbg/xE+agndwGMo5hlKaCS0WiAqshgq5Dt7nInfKx3Ul70
 lJplCfCrpYBS7SsSC4kHLgRCinUtGM7/8NOV+jaMkfvhQImjd6WDAG4u2AksKSqyG6
 Q4xAftOtTg61fhY5c4DLWSne19RGQWHXRp6ECn3i2UxMCpDLZzLZlXoCI6We8QidMf
 U6itSVkqzBFMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fd3JsPC+
Subject: Re: [Buildroot] Debugging gnupg2 unsafe search path error (was Re:
 [PATCH] Revert "package/gnupg2: bump to version 2.4.0")
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bagas,

On 18/02/2023 14:45, Bagas Sanjaya wrote:
> On 2/18/23 18:13, Julien Olivain wrote:
>> In my first proposal of gnupg2 version 2.4.0 bump [1], I initially 
>> proposed
>> to add Buildroot staging bin dir in PATH, to make sure we won't have 
>> such
>> host/br-staging confusion:
>> 
>> GNUPG2_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)
>> 
>> Bagas, could you try on your side if this solve the issue?
>> 
>> [1] 
>> https://patchwork.ozlabs.org/project/buildroot/patch/20230103193649.7488-5-ju.o@free.fr/
>> 
> 
> Hi Julien,
> 
> I applied your suggestion on top of master as:
> 
> ---- >8 ----
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index 5935ce6939..55917912a8 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -15,6 +15,9 @@ GNUPG2_SELINUX_MODULES = gpg
>  GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba 
> libnpth \
>  	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
> 
> +# Let's see if staging GNUPG2_CONF_ENV here works.
> +GNUPG2_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)
> +
>  GNUPG2_CONF_OPTS = \
>  	--disable-rpath \
>  	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
> 
> 
> Unfortunately, the build error still occurs with your suggestion.

Thank you for testing.

I still can't reproduce the issue on my side.  Compilation works fine on 
my system
(with and without a /usr/bin/gpgrt-config script), and also in the 
Buildroot
utils/docker-run (which does not include a /usr/bin/gpgrt-config 
script). My system
has the same libgpg-error version 1.46 as Buildroot.

Could you tell me what is the distribution of your host system (or what 
is the version
of the libgpg-error on the host)?  I'll try the same environment in a 
docker.

Another way to force the gpgrt-config path without putting the full 
staging usr bin
in the PATH (as Thomas recommended not to do) would be to add the 
following:

    GNUPG2_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config

While compiling gnupg2 in Buildroot, you should see in the configuration 
log:

     ...
     checking for gpg-error-config... 
/path/to/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/gpg-error-config
     checking for gpgrt-config... 
/path/to/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/gpgrt-config
     ...

Without this line, if the host contains a gpgrt-config, you should see:

     checking for gpg-error-config... 
/path/to/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/gpg-error-config
     checking for gpgrt-config... /usr/bin/gpgrt-config

and if the host does not not contain a gpgrt-config, you should see:

     checking for gpg-error-config... 
/path/to/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/gpg-error-config
     checking for gpgrt-config... no

I still suspect the root cause is the presence of a 
/usr/bin/gpgrt-config of a specific/older
libgpg-error version on the host.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
