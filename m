Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E09BCD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 06:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44B95404F7;
	Mon, 18 Sep 2023 06:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44B95404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9S5j2_vfcUHp; Mon, 18 Sep 2023 06:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A0BE40446;
	Mon, 18 Sep 2023 06:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A0BE40446
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54DCD1BF40F
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 06:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E0DF40446
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 06:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E0DF40446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RAgviO0wt3ud for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 06:47:06 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38F4D400FE
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 06:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38F4D400FE
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-52a1ce52ef4so5101069a12.2
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 23:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695019624; x=1695624424;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iJ68q5vLQ1mz20LVO/Cy0cnr2Zv0Wpf7NfOsx/RBZgs=;
 b=ZqXGBL2UvUrcOn9WK0WROkM4EIUV1/D9duevPQUfL0f2U/Nb7JTE9aiA6RrDK7PglW
 EVcrYKSEfN+/qfa1nPwUI99nCxpqGNoRrGW/bgMCTeG9IdlDZbUZ2o+g8L8uaJeWe9gi
 BgMSbu2E8HEDmQjE3yjDTBitMyw3p+EL2RbGRq1ny6VaReh36iMllMzKYWbXzqbx3KKU
 6HF153eIK5/OEbd2AMxw3LIWkouU2UoYJjR0ktvK+a1BKx7IMkORydK+guW5nWs4C9Vc
 JZR/eT/wGSsQgJIsHaoYPOd/M6gK+0bceVOWrXWkVUdzOi//L5uJfjTyzz4tMtzFJQ8r
 sovA==
X-Gm-Message-State: AOJu0YxOVLtFsZE/E/A3SmWo0R2ACE1qpZ2zp4qgVTHz3SwRKn5mhgbO
 L4X0LuAU6Lwid+1oegfFXtFTXYGwDwz3Q1yg4QM=
X-Google-Smtp-Source: AGHT+IEEVmzg2nfLxuyAEuFMtfgL7i7ecTdnP9Rg4stkmhAG6QBpPsacNoTiIXOaVOYypUK0C/IR1HJdX/iAtAnFT3g=
X-Received: by 2002:a17:906:8a61:b0:9a2:185b:5375 with SMTP id
 hy1-20020a1709068a6100b009a2185b5375mr6707633ejc.18.1695019623797; Sun, 17
 Sep 2023 23:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230915155835.51140-1-arbab@linux.ibm.com>
 <20230915155835.51140-3-arbab@linux.ibm.com>
In-Reply-To: <20230915155835.51140-3-arbab@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Sep 2023 06:46:52 +0000
Message-ID: <CACPK8XcymC=5-EO8j3yjUZj3q548ZJDY6GSUSgbSHJbb+c4bjQ@mail.gmail.com>
To: Reza Arbab <arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1695019624; x=1695624424; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iJ68q5vLQ1mz20LVO/Cy0cnr2Zv0Wpf7NfOsx/RBZgs=;
 b=Zo9LrrTdLGrvJvJTLorZ2r/6hHK/K083dE2aWH/oy5WjBcDegE/5/Y0Yu/IBHlfvoK
 ZwIcm0/TrMRQ7ezi0KJGMlm5P9SuVak0JBvgIbkycGGbJrdCmVEvSE9amGNqqAX0ntME
 alZCuvRt5r0QMAYlCl4oBac914mOmWNfG9eiA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=Zo9LrrTd
Subject: Re: [Buildroot] [PATCH v2 2/5] package/petitboot: run pb-console at
 boot
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
Cc: Laurent Vivier <laurent@vivier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 15 Sept 2023 at 15:58, Reza Arbab <arbab@linux.ibm.com> wrote:
>
> Install a udev rule to run the petitboot UI on commonly-known consoles
> instead of getty. To prevent the kernel's console output from trampling
> the UI, also add a sysctl file to reduce the kernel log levels to
> KERN_ALERT.
>
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
> v2:
> * Add ttyGF* to list of commonly-known consoles.
> * Don't select BR2_TARGET_GENERIC_GETTY by default.
>
>  package/petitboot/petitboot-console-ui.rules | 5 +++++
>  package/petitboot/petitboot.mk               | 4 ++++
>  package/petitboot/sysctl.conf                | 1 +
>  system/Config.in                             | 2 +-
>  4 files changed, 11 insertions(+), 1 deletion(-)
>  create mode 100644 package/petitboot/petitboot-console-ui.rules
>  create mode 100644 package/petitboot/sysctl.conf
>
> diff --git a/package/petitboot/petitboot-console-ui.rules b/package/petitboot/petitboot-console-ui.rules
> new file mode 100644
> index 000000000000..e5c188387bc5
> --- /dev/null
> +++ b/package/petitboot/petitboot-console-ui.rules
> @@ -0,0 +1,5 @@
> +# spawn a petitboot UI on common user-visible interface devices
> +SUBSYSTEM=="tty", KERNEL=="hvc*", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name linux"
> +SUBSYSTEM=="tty", KERNEL=="tty0", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name linux"
> +SUBSYSTEM=="tty", KERNEL=="ttyGF*", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name linux"
> +SUBSYSTEM=="tty", KERNEL=="ttyS*", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name linux"
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index 8d220f88f45a..556d41230237 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -55,6 +55,10 @@ define PETITBOOT_POST_INSTALL
>                 $(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
>         $(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
>                 $(TARGET_DIR)/etc/init.d/S15pb-discover
> +       $(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/petitboot-console-ui.rules \
> +               $(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
> +       $(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/sysctl.conf \
> +               $(TARGET_DIR)/etc/sysctl.d/petitboot.conf
>         mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
>         ln -sf /usr/sbin/pb-udhcpc \
>                 $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
> diff --git a/package/petitboot/sysctl.conf b/package/petitboot/sysctl.conf
> new file mode 100644
> index 000000000000..02ab8e3275b5
> --- /dev/null
> +++ b/package/petitboot/sysctl.conf
> @@ -0,0 +1 @@
> +kernel.printk = 1 1 1 1
> diff --git a/system/Config.in b/system/Config.in
> index 24798dc06803..9587dd9ce4db 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -375,7 +375,7 @@ config BR2_SYSTEM_BIN_SH
>
>  menuconfig BR2_TARGET_GENERIC_GETTY
>         bool "Run a getty (login prompt) after boot"
> -       default y
> +       default y if !BR2_PACKAGE_PETITBOOT
>
>  if BR2_TARGET_GENERIC_GETTY
>  config BR2_TARGET_GENERIC_GETTY_PORT
> --
> 2.39.3
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
