Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F59C0502C
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 08:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AAF960BF5;
	Sat, 27 Aug 2022 08:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AAF960BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HH_H37lveVAT; Sat, 27 Aug 2022 08:47:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4447460B61;
	Sat, 27 Aug 2022 08:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4447460B61
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47EA81BF3BA
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 08:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F7704017A
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 08:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F7704017A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j7sbRxPWW-tp for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 08:47:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2006340141
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2006340141
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 08:47:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5C31D19F73C;
 Sat, 27 Aug 2022 10:47:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 10:47:32 +0200
Date: Sat, 27 Aug 2022 10:47:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Johan Oudinet <johan.oudinet@gmail.com>
Message-ID: <20220827084732.GR37358@scaer>
References: <20220826130843.264607-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220826130843.264607-1-johan.oudinet@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661590055;
 bh=8I6nv68mIiS1sX4DnJDldexlH0Vzul2x9tA+fo0U9NU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g/r7+cbUCkvw8x18CDpNHnupyfJ4Pqti7o4ky36ght2WMzWCvlmZ4NF2zQ6+HKfOZ
 uvecqRfYbwFpxKPoqOGW8yYE7XX1PqJOc63ELnbi63OZ8y9K399jvyd1T/wEP3BAZi
 eDNvEUIemF5B4/CZNnwvw94HQV8pMjAmWfVLb8F2vtfrtarH53TrRNhtn2PwXoR6E5
 C1MSABPglyGN/JtXLQXag48+5yAPZdRYM8Yzao/+3Yz8mL4bC6LH9wtfpXZyLhh0/A
 B/TFzTafKgmqJXOOTf3hNWXFihTK8Gy4gwdNi4oD+L6qk6yxow7SfTnEG5w8zco4Q3
 88yf7ResXosig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g/r7+cbU
Subject: Re: [Buildroot] [PATCH v2] package/forge: new package
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

Johan, All,

On 2022-08-26 15:08 +0200, Johan Oudinet spake thusly:
> A native implementation of TLS (and various other cryptographic tools)
> in JavaScript.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[--SNIP--]
> diff --git a/package/forge/forge.mk b/package/forge/forge.mk
> new file mode 100644
> index 0000000000..c26f550c83
> --- /dev/null
> +++ b/package/forge/forge.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# forge
> +#
> +################################################################################
> +
> +FORGE_VERSION = 1.3.1
> +FORGE_SITE = $(call github,digitalbazaar,forge,v$(FORGE_VERSION))
> +FORGE_LICENSE = BSD-3-Clause, GPL-2.0
> +FORGE_LICENSE_FILES = LICENSE
> +
> +FORGE_DEPENDENCIES = host-nodejs
> +
> +define FORGE_BUILD_CMDS
> +	cd $(@D) && $(NPM) install && $(NPM) run build

So we have to install before we can build? I would have expected the
other way around... I have (almost) zero experience with npm, so I am
not sure about the semantics of 'install' vs. 'build'.

Also, where does 'install' installs things?

Regards,
Yann E. MORIN.

> +endef
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
> +
> +$(eval $(generic-package))
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
