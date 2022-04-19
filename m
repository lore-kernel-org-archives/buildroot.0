Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BDAC433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 12:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABB6040C59;
	Tue, 19 Apr 2022 12:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tP1PCjtrPEw7; Tue, 19 Apr 2022 12:12:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7948A40183;
	Tue, 19 Apr 2022 12:12:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 89FA71BF288
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 12:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 782C260DB2
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 12:12:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRAe9ALZkBY7 for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 12:12:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C37460D5B
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 12:12:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8194FE0008;
 Tue, 19 Apr 2022 12:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650370365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ziYZ17S9sdLMp9ah8PyJRFQ+HGWnKHT8J3oP34Khwac=;
 b=gSbpY3oQ+TWxjA5j+GoUZO3b59bc1o8fNjcZEPVyiF1E5IkForLLM5Bxj8HA1ebc2g0V9J
 AWj9MirYSQOs4itdmu7nCuwFUVOpqoAp4JjiDZXg62JkeCK3stSQWjNWPtZWjuA3TSK6BW
 S+5Dnyf5OvBN0o9K3ZDPV0OlYu4gyTpXZT/RNdrHhDghElSd3s7aHJjWAyDmZv9o+v8zyk
 ccn93zGZjBds3U8um5bsb9q7WaylV8HZ2H9bprC6uoWT8s1gwip8JPeEfs4jGb4UkaXuXK
 w2OSC+v1PCEXERbXMlWxfikMVVfhnnpDkLv07gAVs2NttxNXawG81fnkF7cb1g==
Date: Tue, 19 Apr 2022 14:12:44 +0200
To: Thomas Perrot <thomas.perrot@bootlin.com>
Message-ID: <20220419141244.1ef13dd4@windsurf>
In-Reply-To: <20220419092151.91638-2-thomas.perrot@bootlin.com>
References: <20220419092151.91638-1-thomas.perrot@bootlin.com>
 <20220419092151.91638-2-thomas.perrot@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/byacc: add new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

Thanks for your contribution.

Commit title should be just:

	package/byacc: new package

On Tue, 19 Apr 2022 11:21:50 +0200
Thomas Perrot <thomas.perrot@bootlin.com> wrote:

> This package provides a Berkeley LALR Yacc parser generator that has been use
> by i.MX Code Signing tool.
> 
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  DEVELOPERS                   |  3 +++
>  package/byacc/Config.in.host | 10 ++++++++++

Config.in.host not needed, this package is merely a build dependency of
another, so we don't need to see it in menuconfig.

> +N:	Thomas Perrot <thomas.perrot@bootlin.com>
> +F:	package/byacc

Please add a trailing slash, like other entries in this file.


> diff --git a/package/byacc/byacc.hash b/package/byacc/byacc.hash
> new file mode 100644
> index 000000000000..d2ad441df39f
> --- /dev/null
> +++ b/package/byacc/byacc.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  42c1805cc529314e6a76326fe1b33e80c70862a44b01474da362e2f7db2d749c  byacc-20220128.tgz
> +sha256  654a231fe9cd4d36e580214962fa777a1df0771d6889cfc74d19a3d414f14711  LICENSE
> diff --git a/package/byacc/byacc.mk b/package/byacc/byacc.mk
> new file mode 100644
> index 000000000000..103970aac9d2
> --- /dev/null
> +++ b/package/byacc/byacc.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# byacc
> +#
> +################################################################################
> +
> +BYACC_SITE = https://invisible-mirror.net/archives/byacc
> +BYACC_VERSION = 20220128
> +BYACC_SOURCE = byacc-$(BYACC_VERSION).tgz
> +BYACC_LICENSE = Public Domain
> +BYACC_LICENSE_FILES = LICENSE
> +
> +HOST_BYACC_CONF_OPTS = --program-transform-name='s,^,b,'

Please add a comment above this that explains why this is needed, it
looks strange.

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
