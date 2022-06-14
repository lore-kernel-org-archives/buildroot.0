Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBD6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B5FA83218;
	Tue, 14 Jun 2022 18:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJdhxE_ZYbYw; Tue, 14 Jun 2022 18:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 791C7831DA;
	Tue, 14 Jun 2022 18:45:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D65D1BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17C4D831DA
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BjQPPYjrcftq for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:45:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06A8682FB1
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:45:08 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id u12so18867079eja.8
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 11:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=2rV0JvD5q6G+znd+3kw7XqpAq3lp1N8iniCD5jMAJTI=;
 b=e/Hc00q2iL7uAEw7RQMqlG9o1Kx1mW6QKWcZw7Yl8oSxk0m1TlOJ5iY3wX9pZSutME
 C+RVK0DfL9PyRlRl6E2/7SBVgUx6aVDdQ4NvfpkOYGxlDtUIIB9/UjmJuxQ2AtsrjrFz
 +4kfq3gMOiFv1AeeGrRyeSrntndiMw/AhMz/LQgI6OQLlnfEHvTi2qsOBWLT2x98NWk5
 w4pW1wPOc+MTIfyYppWCy9b6oJy3MNQU4IAZ0+u9hBr4ITaJEBsvL93NR1zZ3HlV6eZL
 bGGBBeu+pqRcBIwCBiBWSIk+I4K4VXmUxsP/O1O2RqSuVEbaBu8/kNyR4TeNb069yKGg
 C5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2rV0JvD5q6G+znd+3kw7XqpAq3lp1N8iniCD5jMAJTI=;
 b=eLGgBkCpVcJPf0QSgnwwvDYzF/f9KKrVc86pi5MhAgHSf5q0NJNe9S7J0LE1qbHbiS
 sup8mk5cZgy1VbTY2DQKBvAD8ZKxEQNWqqE+OdCo5ZgxzkEdDNmY/Kdl0M1CA2t4/4np
 2/GpgW0xc1TjfOmDysc3UNkCGhzblktRd6wPpNZFp8KrHGI4J0BHWeYjBVHjrBxJEtjF
 2pKuiyqAp2x39ZoBsgttMjOA6bza7IYGWahOCNUOsOONslrOY5nLCob3Xux5XD/kKFjP
 1qlOVs+6EslFO/tmVsoEe8vZaURW5el3Kls766aOnCr+da6LhqjWa3kqa/EbNBh/dH30
 Jjyg==
X-Gm-Message-State: AOAM533i3eRgISD0azMF4DO0z/ZaMRi9r9/yyDH6yf8N0pafPkKWFq0b
 i4WXbL4AxGyWlDT233nOJ7CsLw==
X-Google-Smtp-Source: AGRyM1s3G9daZZJm4yc3bvVRC5dkhOMKDqgspu8upF9NGoSl2lnVQr/iSdBOi8ZVL2nLIVm8h6Gf7Q==
X-Received: by 2002:a17:907:d24:b0:712:1142:88c7 with SMTP id
 gn36-20020a1709070d2400b00712114288c7mr5701485ejc.435.1655232307231; 
 Tue, 14 Jun 2022 11:45:07 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ge9-20020a170907908900b00711e60256cesm5293802ejb.196.2022.06.14.11.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 11:45:06 -0700 (PDT)
Message-ID: <ba3d563b-e049-93b7-6642-5f37594e9ed4@mind.be>
Date: Tue, 14 Jun 2022 20:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220611122057.1226707-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220611122057.1226707-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.5.7
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



On 11/06/2022 14:20, Bernd Kuhls wrote:
> Changelog:
> https://github.com/OpenVPN/openvpn/blob/release/2.5/Changes.rst
> 
> Removed patch which is now included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...h-pam-c-add-missing-include-limits-h.patch | 41 -------------------
>   package/openvpn/openvpn.hash                  |  2 +-
>   package/openvpn/openvpn.mk                    |  2 +-
>   3 files changed, 2 insertions(+), 43 deletions(-)
>   delete mode 100644 package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch
> 
> diff --git a/package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch b/package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch
> deleted file mode 100644
> index 34a6dbd034..0000000000
> --- a/package/openvpn/0001-auth-pam-c-add-missing-include-limits-h.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 0fed64a91d894b46105bf7e8b16edea4d90ab70c Mon Sep 17 00:00:00 2001
> -From: Antonio Quartulli <a@unstable.cc>
> -Date: Thu, 21 Apr 2022 15:19:09 +0200
> -Subject: [PATCH] auth-pam.c: add missing include limits.h
> -
> -On most systems limits.h is pulled in by some other header and thus no
> -error is ever triggered, but it's possible to find the right environment
> -which lackis this and prevents compiling auth-pam.c (possibly when using
> -LibreSSL).
> -
> -Include the header explicitly as it includes the definition of PATH_MAX.
> -
> -(note that this bug is fixed in Gentoo since 2020 by including a custom
> -patch, but apparently the issue was never reported upstream)
> -
> -Reported-by: Michelangelo Scopelliti <kernelpanic@gmx.com>
> -Signed-off-by: Antonio Quartulli <a@unstable.cc>
> -Acked-by: Gert Doering <gert@greenie.muc.de>
> -Message-Id: <20220421131909.32053-1-a@unstable.cc>
> -URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg24136.html
> -Signed-off-by: Gert Doering <gert@greenie.muc.de>
> -
> -[Retrieved from:
> -https://github.com/OpenVPN/openvpn/commit/0fed64a91d894b46105bf7e8b16edea4d90ab70c]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - src/plugins/auth-pam/auth-pam.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/plugins/auth-pam/auth-pam.c b/src/plugins/auth-pam/auth-pam.c
> -index f893b51fe3..7033944568 100644
> ---- a/src/plugins/auth-pam/auth-pam.c
> -+++ b/src/plugins/auth-pam/auth-pam.c
> -@@ -47,6 +47,7 @@
> - #include <fcntl.h>
> - #include <signal.h>
> - #include <syslog.h>
> -+#include <limits.h>
> - #include "utils.h"
> -
> - #include <openvpn-plugin.h>
> diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
> index bd598a5186..0959b7f838 100644
> --- a/package/openvpn/openvpn.hash
> +++ b/package/openvpn/openvpn.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated after checking signature
> -sha256  333a7ef3d5b317968aca2c77bdc29aa7c6d6bb3316eb3f79743b59c53242ad3d  openvpn-2.5.6.tar.gz
> +sha256  08340a389905c84196b6cd750add1bc0fa2d46a1afebfd589c24120946c13e68  openvpn-2.5.7.tar.gz
>   sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index db2f53a5f3..5c602e0448 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENVPN_VERSION = 2.5.6
> +OPENVPN_VERSION = 2.5.7
>   OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
>   OPENVPN_DEPENDENCIES = host-pkgconf
>   OPENVPN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
