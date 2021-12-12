Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB7FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A181A4014E;
	Sun, 12 Dec 2021 14:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WSXRX2Fm_uIC; Sun, 12 Dec 2021 14:10:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72CD5401CE;
	Sun, 12 Dec 2021 14:10:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29D701BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 182B960D6A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mtaFJArrJnRU for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:10:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E748F60D68
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:10:06 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id o20so44651534eds.10
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=h0D6u5bQ9m3NECFsQbIvUSYKD4Gbycu/ElnSmh4IVV0=;
 b=g/yImnpoQ2RAqucZMB4mahRmtEh8hcq9qm03xOWTCaVj3XJo2qjbGrbCUwKQLDnmC9
 lx11YQtHY4QHb9bJ2fC8/25/ZeYbmYR1eWgHLuGYld/R/YCoDkFbhi9s2W04e3/aKruJ
 mfUvcvr7ErMv0nyA3VehkOYrzXzXZKE+b6YWKT2GwHJtC+l9WEfaL6hdRexn0v9QkBe9
 qFLzz0aR/71MVJtsBq4cyynyMBSOBXH/96r9aLXr7yj1tvMOrZx8uQwhU8fDjDBd6uat
 h0T2BWI+M/ZBbFjaTCJDB9mJxef8cUQ7ybn0Vo/dadjlj2SdIvCelM3wjzHhJR5ppKJe
 NrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=h0D6u5bQ9m3NECFsQbIvUSYKD4Gbycu/ElnSmh4IVV0=;
 b=Gx4s+PXyc6xPsnYkwMaV1uw4ZjSbXVv5m34ExpFAxR9XMQKl7q8d+5hzSMakxNR6v2
 lMSby8lR0LNrSpkn7P55TpE6bIYgms8G14LkqGVg0sAkiIEmZd5P4FPOkdT+hdoeLC+L
 B1DFMwqzuFLichepx0sifuKjPfZkpUmwp8Gi6a/UlvFJp4SMocl1/EFZINk41ks40QzB
 1OqZB4m2R/AwEgmPWpIqoslaqjuLcx4kvuSFJFmV15RSMa2kc7/1c5BvtTfAbHBLATUf
 WYAuIICaDLWMPnzI7O3+K/F4w9LT4Ppeb5ZHpGk4CGdnrJgHn3SMfaCU5FXiIz3HJLee
 pywQ==
X-Gm-Message-State: AOAM533ns9rtfCqk0lsuy/DNQqBkoGKyBsSqjhH0BC4OnJAE+JwyHC/1
 aS2jImX3p7FtrJ5hZLIBP9goEQ==
X-Google-Smtp-Source: ABdhPJywSa+zYtu7q/OmGZliulwPhFpHzA/NUeH+Lj/5g0kIjSxNYXKx2NJulrgEwbZqL3zjwpioCA==
X-Received: by 2002:a17:906:7009:: with SMTP id
 n9mr37350887ejj.431.1639318205015; 
 Sun, 12 Dec 2021 06:10:05 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hd15sm4622364ejc.69.2021.12.12.06.10.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:10:04 -0800 (PST)
Message-ID: <8eb16fd8-a03f-d876-03ac-85037741e9ea@mind.be>
Date: Sun, 12 Dec 2021 15:10:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20211209214046.428061-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211209214046.428061-1-angelo@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH] package/cups: bump to version 2.4.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/12/2021 22:40, Angelo Compagnucci wrote:
> Updating attached patch and configure parameters to the latest
> cups version.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

  The hash of NOTICE has changed.
  Applied to master with that fixed, thanks.

  Regards,
  Arnout

> ---
>   ...move-man-from-BUILDDIRS-in-configure.patch | 21 +++++++++++--------
>   package/cups/cups.hash                        |  2 +-
>   package/cups/cups.mk                          |  6 +++---
>   3 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
> index 7fcf7133c8..6b81a93de2 100644
> --- a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
> +++ b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
> @@ -8,23 +8,26 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   [Michael: updated for 2.3.3]
>   Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> +[Angelo: updated for 2.4.0]
> +Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>   ---
>    config-scripts/cups-common.m4 | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
>   
>   diff --git a/config-scripts/cups-common.m4 b/config-scripts/cups-common.m4
> -index a460a73..d427acb 100644
> +index 3a162b6d5..fb629fdfd 100644
>   --- a/config-scripts/cups-common.m4
>   +++ b/config-scripts/cups-common.m4
> -@@ -434,7 +434,7 @@ LIBHEADERSPRIV="\$(COREHEADERSPRIV) \$(DRIVERHEADERSPRIV)"
> +@@ -462,7 +462,7 @@ LIBHEADERS="\$(COREHEADERS) \$(DRIVERHEADERS)"
> + LIBHEADERSPRIV="\$(COREHEADERSPRIV) \$(DRIVERHEADERSPRIV)"
>    
> - case "$COMPONENTS" in
> - 	all)
> --		BUILDDIRS="tools filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale man doc examples templates"
> -+		BUILDDIRS="tools filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale doc examples templates"
> - 		;;
> -
> - 	core)
> + AS_CASE(["$COMPONENTS"], [all], [
> +-    BUILDDIRS="tools filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale man doc examples templates"
> ++    BUILDDIRS="tools filter backend berkeley cgi-bin monitor notifier ppdc scheduler systemv conf data desktop locale doc examples templates"
> + ], [core], [
> +     BUILDDIRS="tools examples locale"
> + ], [corelite], [
> +
>   --
>   2.17.1
>   
> diff --git a/package/cups/cups.hash b/package/cups/cups.hash
> index 22e081255c..01939f804e 100644
> --- a/package/cups/cups.hash
> +++ b/package/cups/cups.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated:
> -sha256  deb3575bbe79c0ae963402787f265bfcf8d804a71fc2c94318a74efec86f96df  cups-2.3.3op2-source.tar.gz
> +sha256  9abecec128ca6847c5bb2d3e3d30c87b782c0697b9acf284d16fa38f80a3a6de  cups-2.4.0-source.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
>   sha256  1f8e5879fb8b15e3ee5111809fd3ca22c606d0897d6b5e74329e480c348e034d  NOTICE
> diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> index 80aecdba5e..e406d3bc64 100644
> --- a/package/cups/cups.mk
> +++ b/package/cups/cups.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CUPS_VERSION = 2.3.3op2
> +CUPS_VERSION = 2.4.0
>   CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
>   CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
>   CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
> @@ -50,10 +50,10 @@ CUPS_CONF_OPTS += --disable-dbus
>   endif
>   
>   ifeq ($(BR2_PACKAGE_GNUTLS),y)
> -CUPS_CONF_OPTS += --enable-gnutls
> +CUPS_CONF_OPTS += --with-tls=yes
>   CUPS_DEPENDENCIES += gnutls
>   else
> -CUPS_CONF_OPTS += --disable-gnutls
> +CUPS_CONF_OPTS += --with-tls=no
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBUSB),y)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
