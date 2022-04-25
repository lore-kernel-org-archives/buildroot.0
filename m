Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FDDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0CC8415C0;
	Mon, 25 Apr 2022 20:25:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02VpmHNVKCst; Mon, 25 Apr 2022 20:25:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A782E401B5;
	Mon, 25 Apr 2022 20:25:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52D251BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 407FF40B04
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jminzB2avCbC for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:25:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 11B4540A9D
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:25:09 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id l18so5247783ejc.7
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 13:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jho1o0I3/KKs2ZjpVNa3DUKcBXXM22N7vrwwoGgEVtQ=;
 b=P1Hpg87H3Vq19V0TYgPDuZ7aHmsnJMmTUS5sycrD96Yc97sogCd495CzJHXMzDW6gz
 GFo+TsXfB5juewK4wt1M5W/SYVQHtutbouAzo6jMyuycC8/25tx8CPDPjqj+/cHCsdso
 8z0XI7JdliAX4l6RAMk9xlQa7afShuZpebwJZQ8qKtrtOTQRsu0iD3Vo/LkZJXODNnQF
 3LEasw5ikgNlGr7pR7dCuEcgawRV6BXbAiyV898Db7rPfnpZVo3SWKSY+ahOXzps1wKL
 kEJ3e0p66pvtIPki/ns6d71HvfIzHsOBnwrWi5LbRMwUynF3G3txNLMIOUhqtgNUZ5YA
 IsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jho1o0I3/KKs2ZjpVNa3DUKcBXXM22N7vrwwoGgEVtQ=;
 b=dCmSgwnUvP46v6b7oHv3kcX0iTl9wKKMBCfkK+HNGMpsZ6tP8ax9HlNoylu/J4YCy2
 2IGjWeHSaYU6U1/+ZaefdaCumuv6zVtXudWFbhHKOcm2bv+UA/WhVb/a45A2k0679SKb
 YHC71umzgmDdJrBxpx9FdNSFuutfL0kfPxCJDN0t4E4XOt/1A5L0FRK7GjtyjgZTiLss
 CbsoRWRVibVhob/fNM6mK/iDMQpw3kEIAPv8dEx0b9nKfWLg0mguw32e9Tj5JFXQLKhY
 juHGYuqJE/O8XMpSTe9Sb0iretKY7ti1JaupSVHlhjDZP2g4qwLHSQul22PY8pJyj+qd
 qm5g==
X-Gm-Message-State: AOAM5336IAPAKbIJqKKQUv1eoFouMleRw9+ms0dd0ZbF+o0a+2hfPJ3h
 R0o5wlgEanTUrQyFOpO3wN8A3w==
X-Google-Smtp-Source: ABdhPJyTp3l7PKM2sSHmy14XT7bo63sEe8gzk8feKE+g7Of13iG8UPELxXPv1f3sMS8MS46eQiLiyw==
X-Received: by 2002:a17:906:4cd8:b0:6db:372:c4ba with SMTP id
 q24-20020a1709064cd800b006db0372c4bamr17653481ejt.57.1650918308304; 
 Mon, 25 Apr 2022 13:25:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a1709064f0f00b006f00349c4c3sm3860119eju.122.2022.04.25.13.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:25:07 -0700 (PDT)
Message-ID: <30d904b3-df65-afc6-1562-490684eb4406@mind.be>
Date: Mon, 25 Apr 2022 22:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220423205413.4083987-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220423205413.4083987-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/argp-standalone: fix NLS build
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/04/2022 22:54, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump to version 1.4.1 in
> commit 0fe85041bc9e0b4ade4d71dd10b61c3b9ec8945d and
> https://github.com/ericonr/argp-standalone/commit/e5fe9ad9e83e6765cf8fa787f903d4c6792338b5:
> 
> /home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: libargp.a(argp-parse.o): in function `argp_version_parser':
> /home/buildroot/autobuild/instance-2/output-1/build/argp-standalone-1.4.1/argp-parse.c:181: undefined reference to `libintl_dgettext'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/adb9c4b747352497adbc9df866709b17fe0f9755
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/argp-standalone/argp-standalone.mk | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
> index 80ca04046d..269239fa5b 100644
> --- a/package/argp-standalone/argp-standalone.mk
> +++ b/package/argp-standalone/argp-standalone.mk
> @@ -12,9 +12,11 @@ ARGP_STANDALONE_LICENSE = LGPL-2.1+
>   ARGP_STANDALONE_LICENSE_FILES = README.md
>   # From git
>   ARGP_STANDALONE_AUTORECONF = YES
> +ARGP_STANDALONE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>   
>   ARGP_STANDALONE_CONF_ENV = \
> -	CFLAGS="$(TARGET_CFLAGS) -fPIC -fgnu89-inline"
> +	CFLAGS="$(TARGET_CFLAGS) -fPIC -fgnu89-inline" \
> +	LIBS=$(TARGET_NLS_LIBS)
>   
>   define ARGP_STANDALONE_INSTALL_STAGING_CMDS
>   	$(INSTALL) -D $(@D)/libargp.a $(STAGING_DIR)/usr/lib/libargp.a
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
