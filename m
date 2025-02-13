Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E052FC021A0
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 17:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82EF56126C;
	Thu, 13 Feb 2025 17:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNlsOH326Vpg; Thu, 13 Feb 2025 17:42:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86F2661410
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86F2661410;
	Thu, 13 Feb 2025 17:42:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 334EA12D
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 17:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DB6783F03
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 17:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0eRaipg38HAe for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 17:42:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A49883EE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A49883EE0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A49883EE0
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 17:42:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.117.255]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMofc-1tzCB73vlM-00WAZc; Thu, 13
 Feb 2025 18:42:38 +0100
Message-ID: <7535a7d7-74f3-4498-a752-6aee611b8743@gmx.de>
Date: Thu, 13 Feb 2025 18:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250212135027.759121-1-fancp2007@gmail.com>
 <20250213045050.816782-1-fancp2007@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250213045050.816782-1-fancp2007@gmail.com>
X-Provags-ID: V03:K1:My9QepuAvyXe32MQYuFz4kVEznGxV8M+rf0UKB+gSTVtb1qK4de
 R8+6ZUz8qdKPQMMVXhm9Nu2a9Zs1U5+bSi7WtjUVpvS3Ng8LihW924+nVXUIE+RtCSABSJh
 8N1Zp/OI0k5ylAMNZyijiGBw8eHQ8D1z1/zmoFcpL2NnQMN7SVAHQI9NQJnQBsLp+kqfEtP
 qz1BIQ5cV1Z5U27tCwMTA==
UI-OutboundReport: notjunk:1;M01:P0:jsVHhCWhCrM=;wEMaOrZ1mTDO540hT5S3f5AqYKK
 0LhPCP8T3FsI6QzwedjSYuTzthux7a7RZ0iOJ8ss8/lTnEv4kcghysOgk3m1s/+xEIt62dRmG
 ifkJpsOPbG7LgoIDTOPTM9Y4icMjNsq5oYd7YZsXfryPuo56eqUW8lxVlfx7m0Mq9klgjDBVH
 ogPZKiWMSc2Si1b6fB9mFTn6Wth4SnetmK+iYqhLVC9ZSNM/Hpcxy+vOcdfPNQetDW7U00DLo
 VqKnOA8/8HPDTTpscNqeREdtkaA7DOUIifA75zXMCvYo2o8RVCZIMyKwFLjzarCnWSN8iAPi9
 oXDp9IOBbp8D319yWXoHjrUZIgrrx2Wf5BB7lMiak5itgj8kwNwho0uSg2/H0uy709Pg2YND+
 gGK6ln+wtKt3dK9ALf/LsgOnvp6GAei9yIwleaH1vk5DKjgLfO/8/NwB6sU87nMNDn9P6aMH2
 9WUj2kHcKD1AT3rLyNBO4RRo6NJ9Y8j2O1zyNe9Yayo01HqWUsNcYEvMZX898qmBt+RK+HphX
 OK/czbWtaIOTMvQ+Jts3g8FYLf1KQppLRi3TV8cbycAgHSIEeucIdCZr5cBegltFsXXQ17flr
 ALZa4soYl4/L7Q+FPAflckkIqeXHiTCB5MUICHD4VcbHpijLrRTQDKWAuQRhG1JWHeRpzRmFo
 BDdKrikuk4/hHEvrNS8aR13ngUG6VGB6/aYtyFLQ1Z0DTGTQi+VdjgsS+QvRGKVHY7+8yE/Rs
 5/M2LPD+g1rDZnVTCP4JJGGUgVjSf6EBapO7AvToPfGJVqRSGq7mAchOii/Els7m1QSBKqDMr
 eo6pnLNYg0zaMzrs7UYJXmLgui/gU/Y7tRhoNQCDPIc5xNp6u/cAbbBhB3h8NGBMk/ZNWvESL
 R511HcANfaKjsdGyULD1ZVZGL5Oob/xPWqH6NCaQO60ttjKhwkhNNXvCoUwNZH9NPCn2z4bPj
 zBV9ynxK+dKF7cms59W7pVFTwIv3jawAHvB+Co2fDkVDVy1L1nQkQKLcUCZhOZBHUffOVeS5I
 X5FMU8Nx8deL8sT3OA7EW2Jy8beWg0mN9wzg4THq8wMyx4yrvx0oeMmRUVcgwDZrHf/6c9bK+
 Gn6JwdtkYzCvMjwWG9Ihi93hvmgU9v61tcTq33txdTJ0jigJksdpXHTgfSp4ljKkXtjqtOiDV
 7PZ/dwcLlhglWF3NvfUGJKDM8tYxs1FH9sXoaZBYQGjeBFeaFU0jGpf67NhSfq8jIDAPIWfBv
 AlpN80yGWjdCt3dptksxTrjosPjpAKNAoYhfMWRn7+OTwIuGgclcQhF4kgArw4Ifxd0mFJ4wP
 SDYKRGT7B3R2R2Fjg9UaEH+OG8NdI9USbOzIHNiwQxcYqEz6fGm9Ng86sRLzpY+jtA8+lrRvr
 xdNVe9CFskC5iXFdfMrwDHOFiNf/M47BHJp5hGXqqq0l81NGKAEb9WVfz9zMfr6YsBy91Gs4e
 cY3pclQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739468558; x=1740073358; i=fiona.klute@gmx.de;
 bh=cr5pPCavvuYu2coiDug+9pnkkZluiF/z+XnqlqHdql8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Wj/eKp1GCavJOr4UqcoiNSwlIe5CP4MriLGEpkSorv3KAu4Tws6Lgl7MDNHpMHUK
 LUaPgYlng75LNmh4z4HVeVAnOZDAILlH3TgDZKEsy6E1l92k+AjvUSsb1kgz3fRXm
 OAL7uqv6R+iry1mxs1CYAghOvQjpGRuERg+WbkyWdJAiVZwK9Ph9MU9p/PjDAPxSK
 ZcTBVxNc+LDxwg8b36n34cjivVYMNFr59rdMohAanXiyFhWwrGf25ZnMXvg+8+tkK
 Jpk822YvqqXvVhvNDddx8dSt1kZVaZ7mMzhWFCekUzJPSvdIksfmAA2+AbNYBVLwy
 Q8kMOud89F7RVXFIPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Wj/eKp1G
Subject: Re: [Buildroot] [PATCH v2] package/sqlite: fix build issue since
 bump to 3.49.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 13.02.25 um 05:50 schrieb Scott Fan:
> As of release 3.49.0, the author has replaced the configure script used in
> the precompiled amalgamation tarball with Autosetup instead of Autotools.
>
> The "autotools-package" and "host-autotools-package" lines are no longer
> available, so those have to be replaced by the "generic-package" and
> "host-generic-package" lines in the .mk file.
>
> The Autosetup configuration script does not support the
> "enable-dynamic-extensions" and "disable-static-shell" options,
> so the relevant lines in the .mk file are removed.
>
> The Autosetup configuration script can automatically detect whether
> threads are supported and set the relevant SQLITE_THREADSAFE flag,
> so the relevant lines in the .mk file are removed.
>
> Fixes:
>    https://autobuild.buildroot.org/?reason=sqlite-3.49.0
>
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Target package works fine, thank you!
Fiona

> ---
> Changes v1 -> v2:
>    - add the 'host-generic-package' configurations in the .mk file
>    - remove the thread-safe related configurations in the .mk file
>    - update commit message
> ---
>   package/sqlite/sqlite.mk | 82 ++++++++++++++++++++++++++--------------
>   1 file changed, 54 insertions(+), 28 deletions(-)
>
> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
> index a23f6e1d66..5a8b033ce0 100644
> --- a/package/sqlite/sqlite.mk
> +++ b/package/sqlite/sqlite.mk
> @@ -21,14 +21,6 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA),y)
>   SQLITE_CFLAGS += -DSQLITE_ENABLE_COLUMN_METADATA
>   endif
>
> -ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
> -SQLITE_CFLAGS += -DSQLITE_ENABLE_FTS3
> -endif
> -
> -ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),y)
> -SQLITE_CFLAGS += -DSQLITE_ENABLE_JSON1
> -endif
> -
>   ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),y)
>   SQLITE_CFLAGS += -DSQLITE_ENABLE_UNLOCK_NOTIFY
>   endif
> @@ -50,30 +42,64 @@ else
>   SQLITE_CFLAGS += $(subst -Ofast,-O3,$(TARGET_CFLAGS))
>   endif
>
> -SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
> -
> -ifeq ($(BR2_STATIC_LIBS),y)
> -SQLITE_CONF_OPTS += --enable-dynamic-extensions=no
> -else
> -SQLITE_CONF_OPTS += --disable-static-shell
> -endif
> -
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> -SQLITE_CONF_OPTS += --enable-threadsafe
> -else
> -SQLITE_CONF_OPTS += --disable-threadsafe
> -SQLITE_CFLAGS += -DSQLITE_THREADSAFE=0
> -endif
> -
>   ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
>   SQLITE_DEPENDENCIES += ncurses readline
> -SQLITE_CONF_OPTS += --disable-editline --enable-readline
>   else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
>   SQLITE_DEPENDENCIES += libedit
> -SQLITE_CONF_OPTS += --enable-editline --disable-readline
> +SQLITE_CONF_OPTS += --disable-readline --editline
>   else
> -SQLITE_CONF_OPTS += --disable-editline --disable-readline
> +SQLITE_CONF_OPTS += --disable-readline
>   endif
>
> -$(eval $(autotools-package))
> -$(eval $(host-autotools-package))
> +ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
> +SQLITE_CONF_OPTS += --fts3
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),)
> +SQLITE_CONF_OPTS += --disable-json
> +endif
> +
> +SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)"
> +
> +define SQLITE_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
> +		--prefix=/usr \
> +		--host="$(GNU_TARGET_NAME)" \
> +		--build="$(GNU_HOST_NAME)" \
> +		--sysroot="$(STAGING_DIR)" \
> +		$(SQLITE_CONF_OPTS) \
> +	)
> +endef
> +
> +define SQLITE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define SQLITE_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D) install
> +endef
> +
> +define SQLITE_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
> +endef
> +
> +define HOST_SQLITE_CONFIGURE_CMDS
> +	(cd $(@D); $(HOST_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
> +		--prefix=/usr \
> +		--host="$(GNU_HOST_NAME)" \
> +		--build="$(GNU_HOST_NAME)" \
> +		--sysroot="$(HOST_DIR)" \
> +		$(SQLITE_CONF_OPTS) \
> +	)
> +endef
> +
> +define HOST_SQLITE_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define HOST_SQLITE_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) DESTDIR="$(HOST_DIR)" -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
