Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390CFC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 15:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E284340C95;
	Mon, 19 May 2025 15:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VdACrDO5Phe; Mon, 19 May 2025 15:37:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1101A40C6D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1101A40C6D;
	Mon, 19 May 2025 15:37:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3446E193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25B5740BFD
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6rQcYZXhZxta for <buildroot@buildroot.org>;
 Mon, 19 May 2025 15:37:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 01C4D405E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01C4D405E6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01C4D405E6
 for <buildroot@buildroot.org>; Mon, 19 May 2025 15:37:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.126.193]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0X8o-1vDOQu2X5g-00x6M0; Mon, 19
 May 2025 17:37:28 +0200
Message-ID: <8eccd976-c4c1-4fdc-a3c5-340b4a7f979b@gmx.de>
Date: Mon, 19 May 2025 17:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Dimitrios Siganos <dimitris@siganos.org>
References: <20250118133740.4001841-1-fiona.klute@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250118133740.4001841-1-fiona.klute@gmx.de>
X-Provags-ID: V03:K1:RgHjaXM5wB4DVkmUSBBwu1nHWLq+Dwfr801c4csgIBpwzMNvrbn
 F6JhNrFCPsPXQpeCwx0C9qg/OPIHnSNOm37THHcn2jxs6SaLVlgQxIaRaZA4mxX3A3vH43f
 pOIzP3Nwmbhri+aRBvQ3MppUQpnaOwK/4lMig1gCHb+2kdOw4kRALvxqTBHZgvM74JsmkhR
 1SUn4zXQ5sgCDBg6sUzuA==
UI-OutboundReport: notjunk:1;M01:P0:R4OxfOZn/ZQ=;CXiNVQkb6m94zMP/s1rWX1CAPAK
 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
 l17oq+T0XVKRJyE4bH4nFqdBtptm0UXFXz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1747669048; x=1748273848; i=fiona.klute@gmx.de;
 bh=a4w+XKNW6OIugTtMm951W0jui3bH0RPrIo61jnwgCbQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Yzm0pCQqp/pPHp/dWnB1z+cXjZxeLnR1C7Mwrts0IMN+MTyp9gNHq7T+MLXiQ/fZ
 DQpe1WoeW79sbiVA8+lUXV8Z89vrYRreK93iQrofLv5XlK48HmlewfRfY6JtP1sGt
 hUGFc6A4yAwiK7j30yQw3e467gyIj2rVgdog5OPuL6twa8dY0OgRRyFCTgNrEinNf
 GkPvxjYAQ3wjcKi9xYTwYXSv8k5MhzoWkYV4neYct8xKJZpR6fbIyOTavjIk1be2b
 LaJ/9BIOuIeScinh6MVhyFCmzDWCpaltadZH/mhEdu9mzTqb0wfp0ysciQ89HrYWX
 WKr8AjuhmrNz0MNFNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Yzm0pCQq
Subject: Re: [Buildroot] [PATCH 1/1] package/wireless-regdb: sysv init
 script to set regdomain
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

Hi everyone,

just want to check if there's any interest in merging this. It's trivial 
enough to maintain in an external tree otherwise, I just figured it 
might be useful for anyone who's also using a wireless setup that 
doesn't have a built-in way to set the regulatory domain (namely, 
NetworkManager).

Best regards,
Fiona

Am 18.01.25 um 14:37 schrieb Fiona Klute:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> This is useful when the tools used to manage the wifi interface do not
> support setting the regdomain (e.g. NetworkManager). As long as the
> country code is not set in configuration the init script does not
> change anything.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
> If this doesn't seem relevant for Buildroot please let me know, I'll
> move it to a local package then. On the other hand, if it's merged I
> could create a follow-up to allow setting the initial regdomain in the
> config file from the Buildroot config.
> 
>   package/wireless-regdb/S35wireless-regdb | 39 ++++++++++++++++++++++++
>   package/wireless-regdb/wireless-regdb.mk |  7 +++++
>   2 files changed, 46 insertions(+)
>   create mode 100644 package/wireless-regdb/S35wireless-regdb
> 
> diff --git a/package/wireless-regdb/S35wireless-regdb b/package/wireless-regdb/S35wireless-regdb
> new file mode 100644
> index 0000000000..b7bdf3b351
> --- /dev/null
> +++ b/package/wireless-regdb/S35wireless-regdb
> @@ -0,0 +1,39 @@
> +#!/bin/sh
> +DAEMON="wireless-regdb"
> +
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +
> +if [ -z "$COUNTRY" ]; then
> +	echo "Wireless regulatory domain not configured, nothing to do."
> +	exit 0
> +fi
> +
> +start() {
> +	printf "Setting wireless regulatory domain %s: " "$COUNTRY"
> +	/usr/sbin/iw reg set "$COUNTRY"
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
> +}
> +
> +case "$1" in
> +	start|restart|reload)
> +		start
> +		;;
> +	stop)
> +		# set "world" regdomain
> +		COUNTRY="00"
> +		start
> +		;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart|reload}"
> +		exit 1
> +		;;
> +esac
> +
> +exit $?
> diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
> index 2aec19c507..930addb7c4 100644
> --- a/package/wireless-regdb/wireless-regdb.mk
> +++ b/package/wireless-regdb/wireless-regdb.mk
> @@ -27,4 +27,11 @@ define WIRELESS_REGDB_INSTALL_TARGET_CMDS
>   		$(TARGET_DIR)/lib/firmware/regulatory.db.p7s
>   endef
>   
> +ifeq ($(BR2_PACKAGE_IW),y)
> +define WIRELESS_REGDB_INSTALL_INIT_SYSV
> +	$(INSTALL) -m 0755 -D package/wireless-regdb/S35wireless-regdb \
> +		$(TARGET_DIR)/etc/init.d/S35wireless-regdb ;
> +endef
> +endif
> +
>   $(eval $(generic-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
