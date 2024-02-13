Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D851C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 12:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E460640517;
	Tue, 13 Feb 2024 12:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LwB_-Hq27lp3; Tue, 13 Feb 2024 12:10:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4CB44116C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4CB44116C;
	Tue, 13 Feb 2024 12:10:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B0D8C1BF2FC
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 12:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA8EA40517
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 12:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bECeDdrfGsJx for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 12:10:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 565A340193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 565A340193
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 565A340193
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 12:10:02 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 255832C80CDA;
 Tue, 13 Feb 2024 13:10:00 +0100 (CET)
Message-ID: <5b2f5482-d1e5-481f-80a1-ddce036c84d4@bubu1.eu>
Date: Tue, 13 Feb 2024 13:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240213120452.2465425-1-buildroot@bubu1.eu>
In-Reply-To: <20240213120452.2465425-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707826200; bh=7rUt4ugOz3LjCYafUsxEFze+0m+hwJ6MU/B88y+L6Eg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ky9y22bcD845ssWDd34DHDp/s1qKG8vya1eFl+G6fqCtF/i9cKUZLohVIFTi0VhnB
 dF8Ym20dEFERTOpcYAXzxNyK6jcKVtlu22YCehXI7hruddIZQTqPELtEWoo8qQgAMb
 xVNwhQqEqM13ggmIGtuoyq+321tfPvzFslc48BH/rlqmFWLwltmwSd1owzyQSC2WHE
 32ul9tFFOMaVQmGTNe244/eclIj6qxT1d0J8o6QCwsFqP8ct7u4zioVXdn87pcMdAb
 wRe6WVmVsO4XtAt3ub01n6nmD1glnkNNsv2yf7t7dU0QjaK8XWHN6gmHm/LFDxOHgh
 IyidiqsC7sxdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=ky9y22bc
Subject: Re: [Buildroot] [PATCH] package/nethogs: new package
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 13.02.24 13:04, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>   package/Config.in            |  1 +
>   package/nethogs/Config.in    | 10 ++++++++++
>   package/nethogs/nethogs.hash |  3 +++
>   package/nethogs/nethogs.mk   | 21 +++++++++++++++++++++
>   4 files changed, 35 insertions(+)
>   create mode 100644 package/nethogs/Config.in
>   create mode 100644 package/nethogs/nethogs.hash
>   create mode 100644 package/nethogs/nethogs.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index bf0fe078b9..2d352dd8cc 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2476,6 +2476,7 @@ endif
>   	source "package/ndisc6/Config.in"
>   	source "package/net-tools/Config.in"
>   	source "package/netatalk/Config.in"
> +	source "package/nethogs/Config.in"

Oops, that is not quite alphabetically sorted here...

>   	source "package/netcalc/Config.in"
>   	source "package/netcat/Config.in"
>   	source "package/netcat-openbsd/Config.in"
> diff --git a/package/nethogs/Config.in b/package/nethogs/Config.in
> new file mode 100644
> index 0000000000..2d6b44739c
> --- /dev/null
> +++ b/package/nethogs/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_NETHOGS
> +	bool "nethogs"
> +	select BR2_PACKAGE_LIBPCAP
> +	select BR2_PACKAGE_NCURSES
> +	help
> +	  NetHogs is a small 'net top' tool. Instead of breaking the
> +	  traffic down per protocol or per subnet, like most tools
> +	  do, it groups bandwidth by process.
> +
> +          https://github.com/raboof/nethogs
> diff --git a/package/nethogs/nethogs.hash b/package/nethogs/nethogs.hash
> new file mode 100644
> index 0000000000..fd1f236250
> --- /dev/null
> +++ b/package/nethogs/nethogs.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  957d6afcc220dfbba44c819162f44818051c5b4fb793c47ba98294393986617d  nethogs-0.8.7.tar.gz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/nethogs/nethogs.mk b/package/nethogs/nethogs.mk
> new file mode 100644
> index 0000000000..69dabda191
> --- /dev/null
> +++ b/package/nethogs/nethogs.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# nethogs
> +#
> +################################################################################
> +
> +NETHOGS_VERSION = 0.8.7
> +NETHOGS_SITE = $(call github,raboof,nethogs,v$(NETHOGS_VERSION))
> +NETHOGS_LICENSE = GPL-2.0
> +NETHOGS_LICENSE_FILES = COPYING
> +NETHOGS_DEPENDENCIES = libpcap ncurses
> +
> +define NETHOGS_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) nethogs
> +endef
> +
> +define NETHOGS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/src/nethogs $(TARGET_DIR)/usr/sbin
> +endef
> +
> +$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
