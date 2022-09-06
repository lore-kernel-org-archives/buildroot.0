Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A49EECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 08:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6CC681272;
	Tue,  6 Sep 2022 08:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6CC681272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BY9JSUWo6eGJ; Tue,  6 Sep 2022 08:43:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6CF380F5D;
	Tue,  6 Sep 2022 08:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6CF380F5D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 791061BF28F
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 08:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53E3A40B7F
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 08:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53E3A40B7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQ_0x4ARFKh3 for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 08:43:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6125E404BF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6125E404BF
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 08:43:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 061ECB0057C;
 Tue,  6 Sep 2022 10:42:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 10:42:53 +0200
Date: Tue, 6 Sep 2022 10:42:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220906084253.GR1490660@scaer>
References: <20220904190218.198854-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904190218.198854-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662453777;
 bh=yvrMfpMh+Rt1xrLxXQrq2/uAXRahQFHfQOhjz2lPedI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R1aDsZBaLc/Sea7cikLO6SX9hBborpDR/eq4aPeeBdoUn3bzbJjXoankrSKid9SsX
 2DeaNpmNXJ7nzCwpwA7odgvp2AeKPFbF8p7a2u/Mn9cGvllCeulwcu2Yeh9P4g5n/v
 Z4fjQSmgMAVR5qhYpo/hg2GMwHxXhxVLiruGtNmnl8m4qPLcXUd6CXe9/Vxb49VXyt
 vsMXovLbCc3K4a++dVyWVsBAUmHaz7CfHqxNVNhooyUrVhZmxhrGq9HgkB2hBO3djm
 0ysARYOkIRziBYMiilcw1nJ4iAmPIZ7oMvA4qg2/Nux4IYYVQVsREh4vKtUFcnpdSs
 MvJCpdufpjqRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R1aDsZBa
Subject: Re: [Buildroot] [PATCH v1 1/2] package/libyaml: add host package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2022-09-04 12:02 -0700, Christian Stewart via buildroot spake thusly:
> Add a Config.in.host to enable the host-libyaml package.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Following the comment by Thomas, I've marked this two-patch series as
changes-requested in Patchwork.

Regards,
Yann E. MORIN.

> ---
>  package/Config.in.host         | 1 +
>  package/libyaml/Config.in.host | 7 +++++++
>  2 files changed, 8 insertions(+)
>  create mode 100644 package/libyaml/Config.in.host
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 99edeafece..66b64fd7c6 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -47,6 +47,7 @@ menu "Host utilities"
>  	source "package/jsmin/Config.in.host"
>  	source "package/kmod/Config.in.host"
>  	source "package/libp11/Config.in.host"
> +	source "package/libyaml/Config.in.host"
>  	source "package/lld/Config.in.host"
>  	source "package/lpc3250loader/Config.in.host"
>  	source "package/lttng-babeltrace/Config.in.host"
> diff --git a/package/libyaml/Config.in.host b/package/libyaml/Config.in.host
> new file mode 100644
> index 0000000000..fd47362a91
> --- /dev/null
> +++ b/package/libyaml/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_LIBYAML
> +	bool "host libyaml"
> +	help
> +	  LibYAML is a YAML 1.1 parser and emitter written in C.
> +	  Host package.
> +
> +	  http://pyyaml.org/wiki/LibYAML
> \ No newline at end of file
> -- 
> 2.37.3
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
