Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBC0C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CF4041738;
	Mon,  7 Mar 2022 22:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k--RhWedAVWU; Mon,  7 Mar 2022 22:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D64E416C6;
	Mon,  7 Mar 2022 22:06:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE3361BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE17B416C6
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:06:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bEwI57jKiHMs for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:06:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CA19410D1
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:06:10 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id qa43so34978638ejc.12
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 14:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FILazNwrxgfffsjU9PR1pFqgOW75kRQfteAk6gxISmk=;
 b=VghTQxoR8m6k31/6iQTbE9cUqr2iExJk26Wz1PpUvIjoZrrS9xg2ftXdOpEsunnf9B
 ucCZ2zur0GuRinyP5tt/baRpy0WEj3s3aPCFfcXOo5E4h8aDotIclYf2BwdPqXyAM0pI
 ejhUAF03LXJhgB2PQIVP3dAGw8iyiiYqeeFMHUkrOQn450W4e5hfrbJU0HNmfQPTCeoa
 hV4Xb9l/HIJ7g3KuWeeoU17W661R6/JwMlOoBpxtVz4DdK1LsFkdZXUWL81PF5uPl6Sc
 MRtEng2fJXNKghW3FmQSsecQj0164CuW1wiVSoSX0v7cT9NSZRvk3AbwI8Af3PEeRt7X
 Hr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=FILazNwrxgfffsjU9PR1pFqgOW75kRQfteAk6gxISmk=;
 b=E0k39ETF9rIA2tcvFVopoV3g61xMNTgdRi9NjYIx66w40GM7AEkpbLJkQE3tawqiLI
 forb8zpDkZhEmL3CGw1q0auMTyh8QMtzxNlShvzwWCSXVuOE3AP/O8H1rNJMWnMzP80L
 4rm06P37rRihxRv64O3NMM95gpE/F8RYDBbp2rnTNSUNpp81yTfdYGsKBCjF8RddQvnk
 ZZVRohkRhdnjUFUyMio/XlNhUE+paxDRtNG2oqpGuq0sdJ6jvGf7YqW+mEooo6PEm4B4
 tGyOPhlvKEDL9vvEa29mayy79PgKULtuHZYE2YGpevHImFG3E/O9rckfuXYHbMLnG4oQ
 4Q3w==
X-Gm-Message-State: AOAM5331yUWgCxYYiAJXMQvYBhu8ezktAL0ag5Ect0JD6CrQI+4mczow
 UYPWXhp85euUWlOAQwwjOnPGHg==
X-Google-Smtp-Source: ABdhPJzPJhlCtZY+3AL/+ZZOYrV8jhuuOxKsCGp0NcZRP12YyLQu2H4jS6CcMiQsaMt6gVPwYaAkEQ==
X-Received: by 2002:a17:906:74c3:b0:6da:be6d:d64b with SMTP id
 z3-20020a17090674c300b006dabe6dd64bmr10926269ejl.695.1646690768498; 
 Mon, 07 Mar 2022 14:06:08 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 fx3-20020a170906b74300b006daecedee44sm3501615ejb.220.2022.03.07.14.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 14:06:08 -0800 (PST)
Message-ID: <dfc6e6fe-22c7-6a2e-d388-0eaa042c4e31@mind.be>
Date: Mon, 7 Mar 2022 23:06:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220222203746.3139075-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220222203746.3139075-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/sord: fix build without threads
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/02/2022 21:37, Fabrice Fontaine wrote:
> Fix the following build failure without threads raised since the
> addition of the package in commit
> 0d4c8ce8a2f26989e0e2d95b977d60e450c090a9:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot find -lpthread
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/170d0114987b39a2b9ea173df7a5e806bd270fd8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0001-wscript-add-no-threads-option.patch  | 59 +++++++++++++++++++
>   package/sord/sord.mk                          |  4 ++
>   2 files changed, 63 insertions(+)
>   create mode 100644 package/sord/0001-wscript-add-no-threads-option.patch
> 
> diff --git a/package/sord/0001-wscript-add-no-threads-option.patch b/package/sord/0001-wscript-add-no-threads-option.patch
> new file mode 100644
> index 0000000000..750ea8f4ad
> --- /dev/null
> +++ b/package/sord/0001-wscript-add-no-threads-option.patch
> @@ -0,0 +1,59 @@
> +From 82ab045a45c06187dca5e9d2a9a4003fcfbfa830 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 22 Feb 2022 21:22:31 +0100
> +Subject: [PATCH] wscript: add -no-threads option
> +
> +Add -no-threads options to avoid the following build failure on embedded
> +toolchains without threads support:
> +
> +/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot find -lpthread
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/170d0114987b39a2b9ea173df7a5e806bd270fd8
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/drobilla/sord/pull/3]
> +---
> + wscript | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/wscript b/wscript
> +index fd8578e..d71d78c 100644
> +--- a/wscript
> ++++ b/wscript
> +@@ -35,6 +35,7 @@ def options(ctx):
> +         {'no-utils':     'do not build command line utilities',
> +          'static':       'build static library',
> +          'no-shared':    'do not build shared library',
> ++         'no-threads':   'disable threads',
> +          'static-progs': 'build programs as static binaries'})
> +
> +     opt.add_option('--dump', type='string', default='', dest='dump',
> +@@ -55,6 +56,7 @@ def configure(conf):
> +
> +     conf.env.BUILD_UTILS  = not Options.options.no_utils
> +     conf.env.BUILD_SHARED = not Options.options.no_shared
> ++    conf.env.ENABLE_THREADS = not Options.options.no_threads
> +     conf.env.STATIC_PROGS = Options.options.static_progs
> +     conf.env.BUILD_STATIC = (Options.options.static or
> +                              Options.options.static_progs)
> +@@ -124,7 +126,7 @@ def configure(conf):
> +     conf.check_pkg('serd-0 >= 0.30.0', uselib_store='SERD')
> +     conf.check_pkg('libpcre', uselib_store='PCRE', mandatory=False)
> +
> +-    if conf.env.HAVE_PCRE:
> ++    if conf.env.HAVE_PCRE and conf.env.ENABLE_THREADS:
> +         if conf.check(cflags=['-pthread'], mandatory=False):
> +             conf.env.PTHREAD_CFLAGS    = ['-pthread']
> +             if conf.env.CC_NAME != 'clang':
> +@@ -160,6 +162,7 @@ def configure(conf):
> +         conf,
> +         {'Static library': bool(conf.env.BUILD_STATIC),
> +          'Shared library': bool(conf.env.BUILD_SHARED),
> ++         'Threads':        bool(conf.env.ENABLE_THREADS),
> +          'Utilities':      bool(conf.env.BUILD_UTILS),
> +          'Unit tests':     bool(conf.env.BUILD_TESTS),
> +          'Debug dumping':  dump})
> +--
> +2.34.1
> +
> diff --git a/package/sord/sord.mk b/package/sord/sord.mk
> index f805805e9d..c06ef9c55c 100644
> --- a/package/sord/sord.mk
> +++ b/package/sord/sord.mk
> @@ -22,4 +22,8 @@ ifeq ($(BR2_STATIC_LIBS),y)
>   SORD_CONF_OPTS += --static --no-shared --static-progs
>   endif
>   
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
> +SORD_CONF_OPTS += --no-threads
> +endif
> +
>   $(eval $(waf-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
