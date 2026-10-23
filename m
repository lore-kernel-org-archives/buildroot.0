Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BB0606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lXWgtX7a
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F482608FA;
	Fri, 23 Oct 2026 13:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_9uKcz128xn; Fri, 23 Oct 2026 13:21:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D407560721
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761660;
	b=SUBuirwH0Hi8HhyEkyOAUGfbrSXgC90HfcpS7hQBYnAlOKiJxX+sCtpmmi19iB+cBk5k
	 jFLa4uecAg0uvI2TiLg8/HMx03Z2KSmZgyzYvp1lza1KLhuaSbC/s7pc32z1qx+b8wnW7
	 HWgKnk9GuMhCNmOHu5ZbPXnnVkUa1sH4yvw9hRIT2UtlnYuQ1NUmxkwpkd1w4kM/je0jA
	 /UvkvFt307bXW9uTFah9JWjDiR4CprqNf/u/XeSHydb9fsL0JUQqq+LBFtzvuAOKQHQZ/
	 9uMnoA6wrPclVleDi1mkXFNbsyHeFmTmsMClySv0sMI99Zva+Bpnmc15XVxyEBSfM6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761660;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jlqB8TvyUtS7RC8ywr2mmeWP8Bwe3z0gJx2scy7G1rY=;
	b=cmGu+1aAtSNbqHPIa8Y5Xrii6cHHHly8UfOcPNW2dq7S6UAI8jDolKp4C+B0EY2gonrf
	 pzav7MjJDFaM6UZd2akGj4Fy1dXX6Ad+xcTalun0HmGGTYS16wCYtIp4kQevS3TC0wHS9
	 xcaYa6OPpheURPFuI6vmCn8j0MbBWJEw3vugVW4ytBWtiwjf5REDM2421s49Tj9yqeELm
	 7bMxCu14eGMzMnvLqVtRhyFIjzXBJD1bUGACKX9qpm3r2w2GhVY1qeFEZdDOK4W4Np785
	 Ifbe//gsDenN8z2sHHwNxYXrd5cUeBkGv0IxMIxNneQr1NHI7v91qzttt9K8NI9N06A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761659;
	bh=jlqB8TvyUtS7RC8ywr2mmeWP8Bwe3z0gJx2scy7G1rY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lXWgtX7aCvNzGT3eivRxIgJk1jYy/011vz7XIsn21fXlFDxLcixCUOa7Kr7AUhJAV
	 +GCOYfA5YKnK97vLn7/ySnwpQYmekeewbSm8JZE5gxr4PviLBZ2P5cZ9cm6mS+dZdo
	 a5QqXavowfbHLng2uGGjK7vud8gsbaTQbOVkEEzVunOUkScTujcXZJCsu68fMt8Owo
	 Kd8FLEyjXNdgQZoFpVKNiHw9s+Y0UsRS0wbE6QxBcmOvRAlAySG0vZnYb1lNm++t3R
	 cME1FQxJR2IoDuOkg63k10up9w4W7EKViD95/7u2D12lK3Z5vZ02ixBTDDkRk0Hl01
	 zXBSLHVhZQFhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D407560721;
	Fri, 23 Oct 2026 13:20:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FDE7356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46BB4401CC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYGC8VYGQvGl for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:20:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CE384400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761657;
 b=G5RaKxXJ0G4gkCHPROWF+euKmRtvEhWjP4sEck650thHsj+VexSmR916EqyQY/EYSt82
 CifL3rOIxkfm2CrhL1f6Rar/k3xJA8xtLuaQfvpobYJIBzaOT6UIjR0Y6XnpYqq04EvjF
 jn3pxeF2H+QmH4COIidsfDHHx0G/gyEjxOD4pU381l6/TL0u9eiF6+I3jToKMB1Mola3n
 5Eu7AUhUTS++C8vcJCcVralZCBUbBCfPHurnt+EUGLlspzYiKZ4BJMS15SQ7XpsMwJaet
 hGe9VUMgiVL3GNKbRMbyVQUkvxZ5KvgFXVv8kSJL7ydlP9fQdNXcHOvL/qq4rvTLFug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761657;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ypyKssKT2HUFbdcSulLTOAbYUbEztGJeBkxKc4BrhPQ=;
 b=eYwuiHdBcKF1QwyOMwme5XUtgm+GIdXheYxOh17elNJY+SU3JAzSLCSyDW81Zgga0O7W
 j7AgCpmZ7aTtugWJJZKt3/OuQXIzGvo0aXoYKbjYZqVdaxpkMSb1yUTzEfDvlF44470sJ
 0GJnrvlBsKmscwyZM2nqP/A59ZqtH1Ex3ijGT0ncJSQjBtabwYt05he9GD8danduGGJde
 M+y1NZnJIaZex1YtNuxqe//mEFeDPqB6gVA3TyQgsl9KXE+uvYlsHP07cmz0I0Mnx5jj/
 M6xzwV8ptnVI3fSyXoyfTYOvxzfoWgkDnrbf8nkNeGYBKhzh9euDnkO9WXXslOc7ZIw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dxJDwgKj; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE384400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso5949385e9.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761655; x=1793366455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ypyKssKT2HUFbdcSulLTOAbYUbEztGJeBkxKc4BrhPQ=;
 b=lnvbSt+urLRJyKu2aVlvH/XWhYCzOG7DVtR79oWq1UJR105D/s7KfEAUzOI+Mk757b
 iHM47etCzq0ACf+sXnIYfZesYnhMQDYP0L4pc09yErgcnO3hij9X1kWzh3F5vY6xjK8d
 5o6t2ANwKgsQ6fv0Nw/2On2M7VAs4BiYJNaxVbU3pi8NECekaMAytzFMVp4gX0WA5wH5
 7iOTQNM9FHBwXZAflyGzzhClhCGaObaaLF+hCZO0xkrniogH+PlocuUNr0PpyblL0jVV
 t+nmW4FiR4Ac7b3Sdo4AUx3FPRzL8Y5ZtShOzV49wyFhl4GhvAbeCvvygq1CffQKstAg
 O5pg==
X-Gm-Message-State: AFq9FYLxxwYAE4kAqx6FyqVZKSe5mdOzm65A8oWu7KgELYfFhNi9EJpE
 aOtqdEdlCEFgbExD3lfp5QIu3OtJN6jPOIftuyU3JKhz7ZdXEgHe4INtPXN1TYPRLeAdEWqU9ay
 Pnos4h6M=
X-Gm-Gg: AYBFou1HCbEzOxc2HZuTKHaNha1K3Vm2UUuaTBGhvzhpVDwIzAU9jzAzM0oWTiZQVGy
 gL9ImrYKhD8IXNIm9pknuso+q5LoVB1iHSyiG3EgetB/S5pi9GyLtFLTwx5CYq7P0NL0TPGmxPV
 N2d/InGtjwoIGugGOQ6GQO6a08Q6psw+GM0oqpQYxBr5wdwUMPLaHMwSWjf7O/HuSnLQnwZ/44x
 jQpFTTDWZLdoG7w/sjVNOUGgJMyoX9g4p/lm3l9OEOd98h/WFtAWoRZya/nqDGAmATSKoDUBpJV
 YD+kSSO+BJOJ4CRSmpyv3ZI1b7P1VNTqPVwEkIPpQNoTzJzYYnRPE/xmL7bFT53WGO69BjYVHrM
 ohQdHjsOfeDynimE+d7q7LImURrlI6uRw+ItKalHcbavGRGyL3GikCpGUuzGFQC1nqV8zyAQWSh
 bmQi+QT8aGIA1I4gGT7yJm+TpAKNmX/AuwWjia++8MIDLnfncfTTQZTtINP6nGM/200YUW8Kiq5
 FIJ9vggOJzaCghHeSzz5uYvWf1s8hOR0MhLH/oCYH3JFCfAFX7EiAk0MB6oS+C5neal9JC4eOUk
 GeA=
X-Received: by 2002:a05:600c:1d1c:b0:4a2:191f:7ca6 with SMTP id
 5b1f17b1804b1-4a2191f7d70mr13496375e9.16.1792761654647; 
 Fri, 23 Oct 2026 06:20:54 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a29cdb75cfsm5107635e9.9.2026.10.23.06.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:20:54 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:20:51 +0200
Message-ID: <20261023132053.1607144-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261017140027.697390-2-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/p11-kit: switch to meson
 build system
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> P11-kit has been offering a meson build since 0.23.17 (see upstream
> NEWS [1]), and it is the build system described in the upstream
> README.
> 
> Changes in the switch to meson:
> 
> * Explicitly enable/disable NLS.
> * Explicitly enable/disable bash-completion.
> * The meson build has no explicit option for libtasn1, it is required
>   if trust_module is enabled.
> * Add patch for meson configuration to avoid depending on systemd to
>   discover install location for units, which would create a dependency
>   loop.
> * Check for BR2_INIT_SYSTEMD instead of BR2_PACKAGE_SYSTEMD to decide
>   whether to install systemd units.
> 
> [1] https://github.com/p11-glue/p11-kit/blob/0.26.5/NEWS#L164
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2026.08.x. Thanks

> ---
> Changes v1 -> v2:
> * new patch
> 
>  ...ing-systemduserunitdir-to-break-depe.patch | 61 ++++++++++++++++
>  package/p11-kit/p11-kit.mk                    | 70 +++++++++++--------
>  2 files changed, 100 insertions(+), 31 deletions(-)
>  create mode 100644 package/p11-kit/0001-meson-allow-setting-systemduserunitdir-to-break-depe.patch
> 
> diff --git a/package/p11-kit/0001-meson-allow-setting-systemduserunitdir-to-break-depe.patch b/package/p11-kit/0001-meson-allow-setting-systemduserunitdir-to-break-depe.patch
> new file mode 100644
> index 0000000000..050bc3533b
> --- /dev/null
> +++ b/package/p11-kit/0001-meson-allow-setting-systemduserunitdir-to-break-depe.patch
> @@ -0,0 +1,61 @@
> +From 709e37f781e50ef981d337249c574a9255691665 Mon Sep 17 00:00:00 2001
> +From: Fiona Klute <fiona.klute@gmx.de>
> +Date: Sat, 17 Oct 2026 14:33:02 +0200
> +Subject: [PATCH] meson: allow setting systemduserunitdir to break dependency
> + loop
> +
> +The dependency on systemd is only used to retrieve systemduserunitdir,
> +not otherwise needed during build. However, p11-kit is also an
> +(optional) dependency of systemd, creating a dependency loop.
> +
> +This patch allows setting systemduserunitdir directly to break the
> +dependency loop. If set, the given value is used unconditionally
> +without checking for systemd, otherwise systemd is detected as before.
> +
> +Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> +Upstream: https://github.com/p11-glue/p11-kit/pull/788
> +---
> + meson.build       | 11 ++++++++---
> + meson_options.txt |  4 ++++
> + 2 files changed, 12 insertions(+), 3 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 38cf81b..9e76d62 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -456,9 +456,14 @@ conf.set_quoted('TRUST_PATHS', trust_paths)
> + # systemd
> + 
> + with_systemd = false
> +-systemd = dependency('systemd', required: get_option('systemd'))
> +-if systemd.found()
> +-  systemduserunitdir = systemd.get_variable(pkgconfig : 'systemduserunitdir')
> ++systemduserunitdir = get_option('systemduserunitdir')
> ++if systemduserunitdir == ''
> ++  systemd = dependency('systemd', required: get_option('systemd'))
> ++  if systemd.found()
> ++    systemduserunitdir = systemd.get_variable(pkgconfig : 'systemduserunitdir')
> ++    with_systemd = true
> ++  endif
> ++else
> +   with_systemd = true
> + endif
> + 
> +diff --git a/meson_options.txt b/meson_options.txt
> +index c1f2362..a7c0553 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -46,6 +46,10 @@ option('systemd', type : 'feature',
> +        value : 'auto',
> +        description : 'Use systemd socket activation')
> + 
> ++option('systemduserunitdir', type : 'string',
> ++       value : '',
> ++       description : 'Override default location for systemd user units')
> ++
> + option('bashcompdir', type : 'string',
> +        value : '',
> +        description : 'Override default location for bash completion files')
> +-- 
> +2.55.0
> +
> diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
> index b3bb3e1263..17efff7b16 100644
> --- a/package/p11-kit/p11-kit.mk
> +++ b/package/p11-kit/p11-kit.mk
> @@ -7,57 +7,65 @@
>  P11_KIT_VERSION = 0.26.5
>  P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
>  P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
> +P11_KIT_DEPENDENCIES = host-pkgconf
>  P11_KIT_INSTALL_STAGING = YES
> -P11_KIT_CONF_OPTS = --disable-static
> -P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
> -	ac_cv_have_decl___progname=no
>  P11_KIT_LICENSE = BSD-3-Clause
>  P11_KIT_LICENSE_FILES = COPYING
>  P11_KIT_CPE_ID_VALID = YES
> -# Needed because the pre-generated ./configure script has an old
> -# broken expansion of AC_HEADER_STDBOOL, which incorrectly detects
> -# that <stdbool.h> cannot be used, causing breakage down the road.
> -P11_KIT_AUTORECONF = YES
> -# Needed for autoreconf
> -P11_KIT_DEPENDENCIES = host-pkgconf
> +
> +P11_KIT_CONF_OPTS = -Dtest=false
> +
> +ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
> +P11_KIT_CONF_OPTS += -Dnls=true
> +P11_KIT_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
> +else
> +P11_KIT_CONF_OPTS += -Dnls=false
> +endif
>  
>  ifeq ($(BR2_PACKAGE_LIBFFI),y)
>  P11_KIT_DEPENDENCIES += host-pkgconf libffi
> -P11_KIT_CONF_OPTS += --with-libffi
> +P11_KIT_CONF_OPTS += -Dlibffi=enabled
>  else
> -P11_KIT_CONF_OPTS += --without-libffi
> +P11_KIT_CONF_OPTS += -Dlibffi=disabled
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBTASN1),y)
> -P11_KIT_DEPENDENCIES += host-pkgconf libtasn1
> -P11_KIT_CONF_OPTS += \
> -	--enable-trust-module \
> -	--with-libtasn1
> +# host-libtasn1 is needed to provide asn1Parser
> +P11_KIT_DEPENDENCIES += host-pkgconf host-libtasn1 libtasn1
> +P11_KIT_CONF_OPTS += -Dtrust_module=enabled
>  ifeq ($(BR2_PACKAGE_CA_CERTIFICATES),y)
> -P11_KIT_CONF_OPTS += --with-trust-paths=/etc/ssl/certs/ca-certificates.crt
> +P11_KIT_CONF_OPTS += -Dtrust_paths=/etc/ssl/certs/ca-certificates.crt
>  else
> -P11_KIT_CONF_OPTS += --without-trust-paths
> +P11_KIT_CONF_OPTS += -Dtrust_paths=
>  endif
>  else
> +P11_KIT_CONF_OPTS += -Dtrust_module=disabled
> +endif
> +
> +ifeq ($(BR2_INIT_SYSTEMD),y)
>  P11_KIT_CONF_OPTS += \
> -	--disable-trust-module \
> -	--without-libtasn1
> +	-Dsystemd=enabled \
> +	-Dsystemduserunitdir=/usr/lib/systemd/user
> +else
> +P11_KIT_CONF_OPTS += -Dsystemd=disabled
>  endif
>  
> -ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> -P11_KIT_CONF_OPTS += --with-systemd
> +ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
> +P11_KIT_DEPENDENCIES += bash-completion
> +P11_KIT_CONF_OPTS += -Dbash_completion=enabled
>  else
> -P11_KIT_CONF_OPTS += --without-systemd
> +P11_KIT_CONF_OPTS += -Dbash_completion=disabled
>  endif
>  
>  HOST_P11_KIT_DEPENDENCIES = host-pkgconf
> -
>  HOST_P11_KIT_CONF_OPTS = \
> -	--without-libffi \
> -	--without-trust-paths \
> -	--disable-trust-module \
> -	--without-libtasn1 \
> -	--without-systemd
> -
> -$(eval $(autotools-package))
> -$(eval $(host-autotools-package))
> +	-Dtest=false \
> +	-Dnls=false \
> +	-Dlibffi=disabled \
> +	-Dtrust_paths= \
> +	-Dtrust_module=disabled \
> +	-Dsystemd=disabled \
> +	-Dbash_completion=disabled
> +
> +$(eval $(meson-package))
> +$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
