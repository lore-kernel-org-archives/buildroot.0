Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE643C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 06:05:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1738A61050
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 06:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1738A61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C556401B8;
	Sun, 17 Oct 2021 06:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwAhFEZeqgJq; Sun, 17 Oct 2021 06:05:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92AD9401A3;
	Sun, 17 Oct 2021 06:05:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AC301BF5DA
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 06:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED5FC81D7C
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 06:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Md8dTeFvfI5O for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 06:05:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A18E81D02
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 06:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634450733;
 bh=WyPxezKupMjiV0KVplMRvg0rYVYqtyuFmfPRUYRneYI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=HNMO7mkRyQcvcZesLQ44AFF+HAfEhBkRAZVz+q6UJXlv9e/zgvgfGRanh4ydu4aL7
 Z8IzFGo8n+RfWOM0khrLsIZJwhQAGiGv5vtKGMhGebY/5E0hI2BEkt2UseCQsVWmmO
 XLk5mmrflGUhh5CANYxLj/ufpIcRferSTgB8Kjcw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.201]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wLZ-1mdL0w228p-007VSC; Sun, 17
 Oct 2021 08:05:33 +0200
Date: Sun, 17 Oct 2021 08:05:32 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Message-ID: <20211017080532.53314788@gmx.net>
In-Reply-To: <20211016215400.31415-5-ps.report@gmx.net>
References: <20211016215400.31415-1-ps.report@gmx.net>
 <20211016215400.31415-5-ps.report@gmx.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:qz6sHSvJNgSmIt4gqtmSHPpZnvICRuZthU2MV+MP/QvzV0aUwsF
 DXFrEvE0ibeXaLmSP+CKRWIzmuIzsgOGXveN+gltA74fm89Th5Glk318TEqGawImcLxTE/o
 1IvGaSTplA452HW1PBv7SiJQnH4odl1EkSaXHkbshRxEhiTNWnzcNVW+LN+kn6AgnQ8mFVv
 fi0EWCUzhz8/V4Vy5wNMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WP4oqeYHeaE=:zph50k2vD1+fn6fpH9AwQ3
 EGPfQEKK4nJeIimrmej/44nx+7+SMj7Gm/3hBP+k8T1fsHN7mDaaTKl3WsIV2/2NBz+SQZOIw
 o4IkmmD7sgBPfjWlJA05hxFwz+lsPLf63nq4zlj/WMoK/aW3NE2rCawCM5o60ZhhJHZZvlMEi
 yMUVdIK+iI3yNvPvq6e26lGOesgPWFBzWUeY71yiH/2MQjzbuNxe82QJIh1I7qFm5F3xbAKFo
 CI3Frqm4ZT81FIwW/wN3KY2XLMwLY05+ZgAO4LznH0taecKuePPR1kPF/RXK0q9dgjnVMYGZK
 ntzgOKMGCXIL/5BlduQDejQm8VkE3w65gu53fLWSnkB/qRukm9zm6rSynKjK97mbj7Aa4FX3S
 BwVgueQBrS6MQ91RBSJLfdnDuNcMF/0UIWGH1NljVxxhWY5Vxy/bQcY+OIO6iP6mZxTF4tbmV
 nOk0DuFexfJ7+tZOqMeyOFsDpnByDEG6tTGW9aMfTsZrNWynYZcSkFHK07zhjAwzejurT9nBL
 TX5UpJjh6ht2bDuj1Ft++VvWhMKx7BaYbNMI9Hto4mTk16tots811W2Ost77Kj3KwnL3wzt9y
 iDZxaeqQanJ2npPB1qW2VYMz+B0sipXIoiD83yNbuAuyakQoITGOYsoTlR9fNVp8dg8+cLewm
 jlq+57Q2iAf1MWZkLxd3jKmsUpm0qAhMnSGXS4Ont9jsiG6s2ofv9BXALDIsJHzS/FlXGycu9
 M21+DuQnT4x4/eXhz9v8dLyxo3fFWE+kEYz3SO/KhXN+KS7mJwYf0EGcTX2Hkd0hsEEcLVGVg
 1SLPHP+wQM8JYbRDKbFm6hgWZ5px1Hk+fP/c+Y6Qgrw2nseAchz0r7NlMKAsEkISzcAsb3O5Q
 r6owZi6o8p3EQ6w6FcX/SeI0ooEHloBNS23eD0S+f9SvdJzpj5txgHXMTn33OV2kW/kNtNo3j
 ufvcpRVVSw7nFS3G6tAwjydhE1mFQEn66O33q5CvTDqXEv8vPIYT7Tcq6wEAh/tUcah+KBmr6
 7/M/9ln1+Wh2xwxmW0z7Cq0jKhjSNX2JDTHbBSeHkfdvSGsoM45uokAhvKf2ysuSJHc9dFMIt
 uvGjuH9sPT+6HM=
Subject: Re: [Buildroot] [PATCH v1 5/5] package/uqmi: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello *,

On Sat, 16 Oct 2021 23:54:00 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  DEVELOPERS             |  1 +
>  package/Config.in      |  1 +
>  package/uqmi/Config.in | 14 ++++++++++++++
>  package/uqmi/uqmi.hash |  3 +++
>  package/uqmi/uqmi.mk   | 15 +++++++++++++++
>  5 files changed, 34 insertions(+)
>  create mode 100644 package/uqmi/Config.in
>  create mode 100644 package/uqmi/uqmi.hash
>  create mode 100644 package/uqmi/uqmi.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 19f6d95270..09b7258cb7 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2176,6 +2176,7 @@ F:	package/racehound/
>  F:	package/redir/
>  F:	package/rtl8812au-aircrack-ng/
>  F:	package/uredir/
> +F:	package/uqmi/
>  F:	package/wayland-utils/
>
>  N:	Peter Thompson <peter.macleod.thompson@gmail.com>
> diff --git a/package/Config.in b/package/Config.in
> index 48f365d773..92026e85c2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2343,6 +2343,7 @@ endif
>  	source "package/uhttpd/Config.in"
>  	source "package/ulogd/Config.in"
>  	source "package/unbound/Config.in"
> +	source "package/uqmi/Config.in"
>  	source "package/uredir/Config.in"
>  	source "package/ushare/Config.in"
>  	source "package/ussp-push/Config.in"
> diff --git a/package/uqmi/Config.in b/package/uqmi/Config.in
> new file mode 100644
> index 0000000000..47b19e04d4
> --- /dev/null
> +++ b/package/uqmi/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_UQMI
> +	bool "uqmi"
> +	depends on !BR2_STATIC_LIBS # libubox
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
> +	select BR2_PACKAGE_JSON_C
> +	select BR2_PACKAGE_LIBUBOX
> +	help
> +	  This command line tool originates from the OpenWrt project
> +	  to configure LTE modem in QMI mode for WAN connection.
> +
> +	  https://git.openwrt.org/project/uqmi.git
> +
> +comment "uqmi needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> diff --git a/package/uqmi/uqmi.hash b/package/uqmi/uqmi.hash
> new file mode 100644
> index 0000000000..2db5d330e2
> --- /dev/null
> +++ b/package/uqmi/uqmi.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  aae6a72791da8f58012303ba3bfeeb613e74597cbebfb9e7c2d9125e6f256799  uqmi-0a19b5b77140465c29e2afa7d611fe93abc9672f-br1.tar.gz
> +sha256  a69bf44dbff15d727578d2069a654d60e9034c5e2cc3e199a012e72afef6c259  main.c
> diff --git a/package/uqmi/uqmi.mk b/package/uqmi/uqmi.mk
> new file mode 100644
> index 0000000000..02544f5637
> --- /dev/null
> +++ b/package/uqmi/uqmi.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# uqmi
> +#
> +################################################################################
> +
> +UQMI_VERSION = 0a19b5b77140465c29e2afa7d611fe93abc9672f
> +UQMI_SITE = https://git.openwrt.org/project/uqmi.git
> +UQMI_SITE_METHOD = git
> +UQMI_LICENSE = LGPL-2.0+
> +UQMI_LICENSE_FILES = main.c
> +UQMI_INSTALL_STAGING = YES

Install staging is nonsense and should be removed..., will send
v2 soon....

Regards,
Peter

> +UQMI_DEPENDENCIES = json-c libubox
> +
> +$(eval $(cmake-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
