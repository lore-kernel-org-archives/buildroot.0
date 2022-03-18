Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF5CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8989760BDD;
	Fri, 18 Mar 2022 22:17:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hyXu2i5NLDJx; Fri, 18 Mar 2022 22:17:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EB2E60B24;
	Fri, 18 Mar 2022 22:17:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED5471BF853
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCD6B84850
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:17:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8cTg6l8i6Ezt for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:17:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6BF78483F
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:17:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20af:3c78:ddff:75e1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6738E13F861;
 Fri, 18 Mar 2022 23:17:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647641854;
 bh=Di29Acjrqv5fxHlMFIC0fZskks74/ESvJKJiLQHvLEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tjC2s7yn0r5nqHbovLyDPhEPO01c85B03OUXGeHXldNA38yNoKs4CKVQP3TGFIDdE
 8KMBDqDixbW448D5WHHY8YcUDOLuJJ/+r+XWhDQ2NPd+Dg6n/0+J+/whKqFe2YBgv4
 wlJntyb9kKe/h4vDuiDvHksxP/xZQ/u/K5gcQ/RS86j2FMxV68fQpf8BQvkgR7OBRQ
 xVPUcvnLLmPc00rEH8zxx9J2NFsM7a9rarX93C/1HpLemmnTKwbvjDCK+Akq62cj4u
 DUedXRdY7g2ujj3CZywBcsMFN9pE7dmu5sLbCPSquU5o2MBpF0uyIvyEx39AY6Z2uB
 P5EeViL+Zd4Rw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Mar 2022 23:17:30 +0100
Date: Fri, 18 Mar 2022 23:17:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220318221730.GR283544@scaer>
References: <20220313114118.1127008-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220313114118.1127008-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/minidlna: fix CVE-2022-26505
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Simon Dawson <spdawson@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-03-13 12:41 +0100, Fabrice Fontaine spake thusly:
> A DNS rebinding issue in ReadyMedia (formerly MiniDLNA) before 1.3.1
> allows a remote web server to exfiltrate media files.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...rotect-against-DNS-rebinding-attacks.patch | 66 +++++++++++++++++++
>  package/minidlna/minidlna.mk                  |  3 +
>  2 files changed, 69 insertions(+)
>  create mode 100644 package/minidlna/0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch
> 
> diff --git a/package/minidlna/0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch b/package/minidlna/0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch
> new file mode 100644
> index 0000000000..6d601f53b9
> --- /dev/null
> +++ b/package/minidlna/0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch
> @@ -0,0 +1,66 @@
> +From c21208508dbc131712281ec5340687e5ae89e940 Mon Sep 17 00:00:00 2001
> +From: Justin Maggard <jmaggard@arlo.com>
> +Date: Wed, 9 Feb 2022 18:32:50 -0800
> +Subject: [PATCH] upnphttp: Protect against DNS rebinding attacks
> +
> +Validate HTTP requests to protect against DNS rebinding.
> +
> +[Retrieved from:
> +https://sourceforge.net/p/minidlna/git/ci/c21208508dbc131712281ec5340687e5ae89e940/]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + upnphttp.c | 17 +++++++++++++++++
> + upnphttp.h |  2 ++
> + 2 files changed, 19 insertions(+)
> +
> +diff --git a/upnphttp.c b/upnphttp.c
> +index c8b5e99..62db89a 100644
> +--- a/upnphttp.c
> ++++ b/upnphttp.c
> +@@ -273,6 +273,11 @@ ParseHttpHeaders(struct upnphttp * h)
> + 				p = colon + 1;
> + 				while(isspace(*p))
> + 					p++;
> ++				n = 0;
> ++				while(p[n] >= ' ')
> ++					n++;
> ++				h->req_Host = p;
> ++				h->req_HostLen = n;
> + 				for(n = 0; n < n_lan_addr; n++)
> + 				{
> + 					for(i = 0; lan_addr[n].str[i]; i++)
> +@@ -909,6 +914,18 @@ ProcessHttpQuery_upnphttp(struct upnphttp * h)
> + 	}
> + 
> + 	DPRINTF(E_DEBUG, L_HTTP, "HTTP REQUEST: %.*s\n", h->req_buflen, h->req_buf);
> ++	if(h->req_Host && h->req_HostLen > 0) {
> ++		const char *ptr = h->req_Host;
> ++		DPRINTF(E_MAXDEBUG, L_HTTP, "Host: %.*s\n", h->req_HostLen, h->req_Host);
> ++		for(i = 0; i < h->req_HostLen; i++) {
> ++			if(*ptr != ':' && *ptr != '.' && (*ptr > '9' || *ptr < '0')) {
> ++				DPRINTF(E_ERROR, L_HTTP, "DNS rebinding attack suspected (Host: %.*s)", h->req_HostLen, h->req_Host);
> ++				Send404(h);/* 403 */
> ++				return;
> ++			}
> ++			ptr++;
> ++		}
> ++	}
> + 	if(strcmp("POST", HttpCommand) == 0)
> + 	{
> + 		h->req_command = EPost;
> +diff --git a/upnphttp.h b/upnphttp.h
> +index e28a943..57eb2bb 100644
> +--- a/upnphttp.h
> ++++ b/upnphttp.h
> +@@ -89,6 +89,8 @@ struct upnphttp {
> + 	struct client_cache_s * req_client;
> + 	const char * req_soapAction;
> + 	int req_soapActionLen;
> ++	const char * req_Host;        /* Host: header */
> ++	int req_HostLen;
> + 	const char * req_Callback;	/* For SUBSCRIBE */
> + 	int req_CallbackLen;
> + 	const char * req_NT;
> +-- 
> +2.34.1
> +
> diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
> index adea200f4f..01ee8d0028 100644
> --- a/package/minidlna/minidlna.mk
> +++ b/package/minidlna/minidlna.mk
> @@ -12,6 +12,9 @@ MINIDLNA_CPE_ID_VENDOR = readymedia_project
>  MINIDLNA_CPE_ID_PRODUCT = readymedia
>  MINIDLNA_SELINUX_MODULES = minidlna
>  
> +# 0001-upnphttp-Protect-against-DNS-rebinding-attacks.patch
> +MINIDLNA_IGNORE_CVES += CVE-2022-26505
> +
>  MINIDLNA_DEPENDENCIES = \
>  	$(TARGET_NLS_DEPENDENCIES) \
>  	ffmpeg flac libvorbis libogg libid3tag libexif jpeg sqlite \
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
