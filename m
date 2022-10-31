Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8F1FA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB57280D8A;
	Mon, 31 Oct 2022 10:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB57280D8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8pIm7De8MsX1; Mon, 31 Oct 2022 10:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0393380D04;
	Mon, 31 Oct 2022 10:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0393380D04
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7A951BF3EC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2B8C401CA
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2B8C401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4uOxA3pQQRA for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:44:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9747C40192
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9747C40192
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:44:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9239E40005;
 Mon, 31 Oct 2022 10:44:45 +0000 (UTC)
Date: Mon, 31 Oct 2022 11:44:44 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221031114444.283e4776@windsurf>
In-Reply-To: <20220821053547.667311-1-christian@paral.in>
References: <20220821053547.667311-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667213086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ct4BK49NNgtsrYIQxmmxw9ifdk64r+cKNF5rYegurFI=;
 b=BuLPe+L2+10LIChyONRmrOQz+RcS2FoVeTN061bOtVVq2Xlrsk7vWpPuAztBylicJwtQZP
 aVeDl+l6zAtVujJOCG8LRT8ZOs++yR0zP0YyPFyjqs9OKv0Hh7bbX44/B/PE8oD7sjr45t
 SPi78uJmT8CUbIPI27Xyu+8J5IwzqYgfdoSOqcagPvvqJ+nR3PJbnSXahwwJ2jtWair+aW
 4eduQob6SQuz1EnC+EMS0qhj2cTNxGJxDYotI1ADKCcOF6EWB2Wqq3QY0LUhBXHLuKdqjv
 JSabAw8E5Efwo80CdN6mOjJxMp/84tuUeau1GsgVOmENgW6uLba824CNDitcrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BuLPe+L2
Subject: Re: [Buildroot] [PATCH v1 1/1] package/cni-plugins: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Sat, 20 Aug 2022 22:35:47 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index d2bd0d809a..bc02190365 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -530,6 +530,7 @@ F:	package/python-pylibftdi/
>  N:	Christian Stewart <christian@paral.in>
>  F:	package/batman-adv/
>  F:	package/containerd/
> +F:	package/cni-plugins/

By alphabetic ordering I believe it falls before containerd, so I fixed
that up.

> diff --git a/package/cni-plugins/Config.in b/package/cni-plugins/Config.in
> new file mode 100644
> index 0000000000..e01cadc026
> --- /dev/null
> +++ b/package/cni-plugins/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_CNI_PLUGINS
> +	bool "cni-plugins"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
> +	depends on BR2_USE_MMU
> +	help
> +	  Container Networking Interface plugins.

But they are plugins for what? They don't have any dependency on
anything specific.

> +	  https://github.com/containernetworking/plugins
> +
> +comment "cni-plugins needs a glibc or musl toolchain w/ threads"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
> +		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS

You forgot BR2_USE_MMU here. I forgot it as well initially, so I fixed
it up as part of a follow-up commit.

> +define CNI_PLUGINS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/opt/cni/bin
> +	$(foreach d,$(CNI_PLUGINS_INSTALL_BINS),\
> +		$(INSTALL) -D -m 0755 $(@D)/bin/$$(basename $(d)) \
> +			$(TARGET_DIR)/opt/cni/bin

I kept it like this, but it's fairly unusual to install stuff in /opt.
Is this the normal location for these plugins? Shouldn't they go in
/usr/libexec/cni/, or something like that?

So overall, I applied, but there are some questions :)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
