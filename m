Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1116EC4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 08:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F4206118B;
	Wed, 19 Oct 2022 08:04:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F4206118B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pc8qYNqiOV7z; Wed, 19 Oct 2022 08:04:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7BB860C31;
	Wed, 19 Oct 2022 08:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7BB860C31
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1662B1BF95D
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 08:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A71040154
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 08:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A71040154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SDtY60WOMal5 for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 08:03:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8285240C40
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8285240C40
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 08:03:54 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id 70so16369592pjo.4
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 01:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7LQOJFLQ4WzEfvsPK61UMbyA6kt0CAbTmFlYohQlAPg=;
 b=adEaZCSix8NETNzMMlcZza1RyDgZR6yyKyFqY/lg1aE+e363HdPZBDiT22IMaAjcUq
 nGM3NsaRZAtGwuWlZa4TR1uzdu0fRbmIwqsT/xPwmFU8fQxBGeOvyoqzCt8gBTRdC30O
 urNEjDu8z9L4d+dvvZgF8K4RFDCu+jj7RJBrfmDmHD0G/LucYjDlzdqrzXfYCyhijt77
 V/7IIzguinXGdo5G79GFimgF25r1+191+29ZKGzPteMr6mufKeoIpAvZDF5ozPsUhvNA
 abL0ygbyTFv1sUUof1XEYmA0rDvkng0EjL9lPNGwD/NVZNEDmyDPXirjEAsRwgPuOgLa
 lmJw==
X-Gm-Message-State: ACrzQf1fH1kwdmjLGguuG+w/F2DlRSaIS+1tOi7Y9dUSHxbXr/TSQZtz
 99YT96r6mrbidNQ6g95Uj8uhRLIV2Q6sTO70vyOPyqqVAvo=
X-Google-Smtp-Source: AMsMyM7KBKcKiinOxqkurT3/J4eLzHENMrj67zFFZDjkUuUXe6hS7qkpokE7bo8+h6lNditvtOGarg1Krgj5YZZpaGs=
X-Received: by 2002:a17:90a:ab06:b0:20d:8764:b97a with SMTP id
 m6-20020a17090aab0600b0020d8764b97amr8460123pjq.7.1666166633685; Wed, 19 Oct
 2022 01:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221002150443.159058-1-robimarko@gmail.com>
In-Reply-To: <20221002150443.159058-1-robimarko@gmail.com>
From: Robert Marko <robimarko@gmail.com>
Date: Wed, 19 Oct 2022 10:03:42 +0200
Message-ID: <CAOX2RU79VfmjD=Fhjp1bW9RrDUM4y=kb-b4HMNKOeMp2ROdVcg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7LQOJFLQ4WzEfvsPK61UMbyA6kt0CAbTmFlYohQlAPg=;
 b=CU2TXeYP0IgVFXruoYgh8Ekw+HpDzH3Rv2QBxyyJRy0d/E4geeZQajq/O7StJ2cERr
 8TJujnCzO0o5Ng7JCGCr0TVTwoZ0TukqvH//JFqz6qesAS1RSqxbm+1k6SiMUCTsPRrq
 ZvS5mE0htP89+T4rSL8ErhIb/rvj8Le3DsLBJRFxEp+IXwlM1P+favUMaZpEMU0W1pv1
 R0lXjK4wtt73Jw/hQV450CrDNfKWsGtan1WbLUn1qCJc4BK2HDs716kADFqaOyno2Rf5
 5ZLy/jxgxtLuqUm8h9uwxGiKT/0lm3Mv0c9aNqC/SxyiVJWUO5tAUStuyyCsHQb0k2tA
 7AiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CU2TXeYP
Subject: Re: [Buildroot] [PATCH v2] package/mdio-tools: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 2 Oct 2022 at 17:04, Robert Marko <robimarko@gmail.com> wrote:
>
> mdio-tools are kernel module and accompanying tools for low-level
> debugging of devices attached on MDIO bus like PHY-s, switches etc.
>
> Userspace tools provide C22 or C45 reads and writes, benchmarking
> and even dedicated Marvell Link Street tools via the included
> kernel module.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> Changes in v2:
> * Correct license
> * Add host-pkgconf to DEPENDENCIES
> * Add minimal required kernel config options

Anything I can do to help get this reviewed?

Regards,
Robert
> ---
>  package/Config.in                  |  1 +
>  package/mdio-tools/Config.in       |  9 +++++++++
>  package/mdio-tools/mdio-tools.hash |  3 +++
>  package/mdio-tools/mdio-tools.mk   | 20 ++++++++++++++++++++
>  4 files changed, 33 insertions(+)
>  create mode 100644 package/mdio-tools/Config.in
>  create mode 100644 package/mdio-tools/mdio-tools.hash
>  create mode 100644 package/mdio-tools/mdio-tools.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index e3a34d6e97..ed41e8bdd4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -536,6 +536,7 @@ endmenu
>         source "package/mbpfan/Config.in"
>         source "package/mdadm/Config.in"
>         source "package/mdevd/Config.in"
> +       source "package/mdio-tools/Config.in"
>         source "package/memtest86/Config.in"
>         source "package/memtester/Config.in"
>         source "package/memtool/Config.in"
> diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
> new file mode 100644
> index 0000000000..feb1e825ac
> --- /dev/null
> +++ b/package/mdio-tools/Config.in
> @@ -0,0 +1,9 @@
> +comment "mdio-tools needs a Linux kernel to be built"
> +       depends on !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_MDIO_TOOLS
> +       bool "mdio-tools"
> +       depends on BR2_LINUX_KERNEL
> +       select BR2_PACKAGE_LIBMNL
> +       help
> +         Low-level debug tools for MDIO devices
> diff --git a/package/mdio-tools/mdio-tools.hash b/package/mdio-tools/mdio-tools.hash
> new file mode 100644
> index 0000000000..0111165f27
> --- /dev/null
> +++ b/package/mdio-tools/mdio-tools.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  c5e17431c62392f6c1da1ba4fb0a6f5918521509a377af74485851f93ff2a106  mdio-tools-1.2.0.tar.gz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
> new file mode 100644
> index 0000000000..308a23824b
> --- /dev/null
> +++ b/package/mdio-tools/mdio-tools.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# mdio-tools
> +#
> +################################################################################
> +
> +MDIO_TOOLS_VERSION = 1.2.0
> +MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
> +MDIO_TOOLS_LICENSE = GPL-2.0
> +MDIO_TOOLS_LICENSE_FILES = COPYING
> +MDIO_TOOLS_DEPENDENCIES = host-pkgconf libmnl
> +
> +MDIO_TOOLS_MODULE_SUBDIRS = kernel
> +define MDIO_TOOLS_LINUX_CONFIG_FIXUPS
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> +       $(call KCONFIG_ENABLE_OPT,CONFIG_MDIO_DEVICE)
> +endef
> +
> +$(eval $(kernel-module))
> +$(eval $(autotools-package))
> --
> 2.37.3
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
