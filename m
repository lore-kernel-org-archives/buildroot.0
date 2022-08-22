Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567D2C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 14:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88E8860E71;
	Mon, 22 Aug 2022 14:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88E8860E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZu5JqH2lWYz; Mon, 22 Aug 2022 14:12:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0FAC60E62;
	Mon, 22 Aug 2022 14:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0FAC60E62
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0E161BF232
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 14:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAD2240887
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 14:12:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAD2240887
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZtTftzLwoTmE for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 14:12:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3593F40082
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3593F40082
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 14:12:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:961:575d:b2ff:71eb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 2A68E60139;
 Mon, 22 Aug 2022 16:12:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 22 Aug 2022 16:12:05 +0200
Date: Mon, 22 Aug 2022 16:12:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Johan Oudinet <johan.oudinet@gmail.com>
Message-ID: <20220822141205.GC2167049@scaer>
References: <20220322160725.636205-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220322160725.636205-1-johan.oudinet@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661177528;
 bh=V3jOx3NObWtOY2XFxuYevjiIuQAPj8mUWzFJ/LuuW6I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hD5YSDOIYQp/Ak1XQSsXe69A6xNG0k8riFHppPP2dwTxui9NtPw8SBK459OhzusL+
 lmnKLBdyBPCo+c7+upAtcNJd0oU1IPYBFHs6NbPku3PgXuWLwrkrHPYjcllZmyX+pK
 HN0J56ZD3A9CrLGjj9Nx4r0P1VitJq3wncmIw5AwExSOt0iBQ2OomnmrHajX2YHhZq
 M0CSVmxWPXT3urjHxqP1YYAHTan0GSbwKkfukIRrI/EajEidQ61C0KHpACtP/sspgV
 jtk1ku0gdffo/uCJCjL7AN0FGY6w8xlK/K7V/wrU5liqltZjtSRnJuu4WQNYiPBwuR
 aZB9F7XETq5PQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hD5YSDOI
Subject: Re: [Buildroot] [PATCH] package/forge: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Johan, All,

Sorry for the late review...

On 2022-03-22 17:07 +0100, Johan Oudinet spake thusly:
> A native implementation of TLS (and various other cryptographic tools)
> in JavaScript.

I see that you used the npm registry as the source for this package. So,
I'd expect it to be an nodejs package, right? If so, then it should
probably depend on nodejs being enabled.

Also, why do we need to get the package from the npm registry, instead
of from the upstream git tree?

> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[--SNIP--]
> diff --git a/package/forge/Config.in b/package/forge/Config.in
> new file mode 100644
> index 0000000000..86d4832101
> --- /dev/null
> +++ b/package/forge/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_FORGE
> +	bool "forge"

Here, I would have expected:

    depends on BR2_PACKAGE_NODEJS

> +	help
> +	  A native implementation of TLS (and various other
> +	  cryptographic tools) in JavaScript.
> +
> +	  https://github.com/digitalbazaar/forge
[--SNIP--]
> diff --git a/package/forge/forge.mk b/package/forge/forge.mk
> new file mode 100644
> index 0000000000..1872cb4e70
> --- /dev/null
> +++ b/package/forge/forge.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# forge
> +#
> +################################################################################
> +
> +FORGE_VERSION = 1.3.0
> +FORGE_SOURCE = node-forge-$(FORGE_VERSION).tgz
> +FORGE_SITE = https://registry.npmjs.org/node-forge/-
> +FORGE_LICENSE = BSD-3-Clause, GPL-2.0
> +FORGE_LICENSE_FILES = LICENSE
> +
> +# Install .min.js as .js
> +define FORGE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 644 -D $(@D)/dist/forge.all.min.js \
> +		$(TARGET_DIR)/var/www/forge.all.js
> +	$(INSTALL) -m 644 -D $(@D)/dist/forge.min.js \
> +		$(TARGET_DIR)/var/www/forge.js
> +	$(INSTALL) -m 644 -D $(@D)/dist/prime.worker.min.js \
> +		$(TARGET_DIR)/var/www/prime.worker.js
> +endef

So, I think I now see why you grabbed the package from the npm registry:
the package has been built and the minified files generated.

I'm afraid that I do not like that very much.

Instead, you should grab the sources from th github repo, have the
package depend on host-nodejes, and build the pacakge with $(NPM) build.

Regards,
Yann E. MORIN.

> +$(eval $(generic-package))
> -- 
> 2.32.0
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
