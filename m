Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E40C433FE
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17BA582EA2;
	Wed, 27 Apr 2022 19:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0fAPF6pQP1O; Wed, 27 Apr 2022 19:37:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0169282D14;
	Wed, 27 Apr 2022 19:37:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E387B1BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0F5060B3D
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GWZKCmt5uJtI for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:37:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A093760A75
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:37:12 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id y21so3139567edo.2
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NyQizRuQDeWtSjv3OcPx+J2yPRY1Su2S+qaYj+AOsuE=;
 b=iFp2Bmq02vMVZO0f41HB299w22vXY8Rd2x/BwOMJiqaSD0wWki2rKaaWHCx4CQhzv1
 0zm9KVIu+w4PtQCfJHmT45YdDu2sJd4vKADDUVRIFEv86ZEySAR8JGQAv0wb5b11qHGa
 FGFESE+myUtRWMvy0BYwMXi+hUYc9neWHzQYJlWyy0p6SaPJ1ST8mZGd9c5T/5aXEjAa
 gndlS9m1v9tlnKI672+hudp+qz6NISoaKdlxYdMniaFs07TaUKPqLK8Q5NEqEq9dR/KI
 6EIws0qXKNNPB+4X4uWGlVT8SHwFROIlX54GJkXTR6mUsgMp2dvOPJjW7S1C3Sg9kXvm
 eV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NyQizRuQDeWtSjv3OcPx+J2yPRY1Su2S+qaYj+AOsuE=;
 b=MzgRCgZzyeGxD61+sYFIy8dPtFr1YHKKAiwCnEaWK05p9a2h27iyUI+XVEEqrhFEcM
 nfWBiSg+nUn1X+3wPRMImUZsf4GzBRqQNv+B3/gllmOASYM9hg/4bu2rcjWh5mTkd0qH
 Zq/QaeOhMrTIsi9hgSQ/qWjrBGBZu8HzFer5hAZL5ybnKsxOAy9UQIu4qgMl7QVPFBAr
 J8LkwILKpxwW6J0TYe7F3bfhS7RwPiVHKHOpOy4qTYUteSwgel7nphx0Tiv0RcrE38Gi
 0GF1ik+dHGcmNlPfdsQo+KKMel7WyMXn6du8865TR901eW0doK7Io98RqkW+5sIMkPhw
 bXCg==
X-Gm-Message-State: AOAM5315+VcalH26YmgTAOauGHcJs5wbcwDgl0lJ7kwpoF5/LdXZPIPu
 1F4vhwGIh00c3zc/SKqoP5Xtrw==
X-Google-Smtp-Source: ABdhPJzbxOs4AEMYgcJtfGCHHfUK7ifB3Xm2/rjkFyo8Dcz3PjaDfd0M57xEFl7daPOkXIFn9JW/jQ==
X-Received: by 2002:a05:6402:3496:b0:425:ece9:1a99 with SMTP id
 v22-20020a056402349600b00425ece91a99mr17265016edc.319.1651088230833; 
 Wed, 27 Apr 2022 12:37:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 lb18-20020a170907785200b006efe7bb40b0sm7199996ejc.74.2022.04.27.12.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:37:10 -0700 (PDT)
Message-ID: <7d0d7166-68c5-f227-b036-9f4743d1007f@mind.be>
Date: Wed, 27 Apr 2022 21:37:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220426223517.997019-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220426223517.997019-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland: don't rely on implicit
 GNU extensions
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/04/2022 00:35, James Hilliard wrote:
> Backport a patch so that we don't rely on implicit GNU extensions.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/c22/c227166c2825ae4e884936fbe627f3997e0e19b7
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...on-t-rely-on-implicit-GNU-extensions.patch | 108 ++++++++++++++++++
>   1 file changed, 108 insertions(+)
>   create mode 100644 package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch
> 
> diff --git a/package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch b/package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch
> new file mode 100644
> index 0000000000..fcafa98f46
> --- /dev/null
> +++ b/package/wayland/0002-build-don-t-rely-on-implicit-GNU-extensions.patch
> @@ -0,0 +1,108 @@
> +From 0d314c4a04ef1b86a1ea66107b2d1a8d1bcd93b9 Mon Sep 17 00:00:00 2001
> +From: Simon Ser <contact@emersion.fr>
> +Date: Mon, 10 Jan 2022 14:51:55 +0100
> +Subject: [PATCH] build: don't rely on implicit GNU extensions
> +
> +Currently libwayland assumes GNU extensions will be available, but
> +doesn't define the C standard to use. Instead, let's unconditionally
> +enable POSIX extensions, and enable GNU extensions on a case-by-case
> +basis as needed.
> +
> +Signed-off-by: Simon Ser <contact@emersion.fr>
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[james.hilliard1@gmail.com: backport from upstream commit
> +0d314c4a04ef1b86a1ea66107b2d1a8d1bcd93b9]
> +---
> + cursor/xcursor.c        |  1 +
> + meson.build             | 10 ++++++++--
> + tests/display-test.c    |  1 +
> + tests/event-loop-test.c |  1 +
> + tests/fixed-test.c      |  1 +
> + 5 files changed, 12 insertions(+), 2 deletions(-)
> +
> +diff --git a/cursor/xcursor.c b/cursor/xcursor.c
> +index 0506680..188be7c 100644
> +--- a/cursor/xcursor.c
> ++++ b/cursor/xcursor.c
> +@@ -23,6 +23,7 @@
> +  * SOFTWARE.
> +  */
> +
> ++#define _GNU_SOURCE
> + #include "xcursor.h"
> + #include <stdio.h>
> + #include <stdlib.h>
> +diff --git a/meson.build b/meson.build
> +index 07bbd29..cab267e 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -14,6 +14,12 @@ config_h = configuration_data()
> + config_h.set_quoted('PACKAGE', meson.project_name())
> + config_h.set_quoted('PACKAGE_VERSION', meson.project_version())
> +
> ++cc_args = []
> ++if host_machine.system() != 'freebsd'
> ++	cc_args += ['-D_POSIX_C_SOURCE=200809L']
> ++endif
> ++add_project_arguments(cc_args, language: 'c')
> ++
> + compiler_flags = [
> + 	'-Wno-unused-parameter',
> + 	'-Wstrict-prototypes',
> +@@ -79,7 +85,7 @@ if get_option('libraries')
> + 	]
> +
> + 	foreach d: decls
> +-		if not cc.has_header_symbol(d['header'], d['symbol'], dependencies: epoll_dep)
> ++		if not cc.has_header_symbol(d['header'], d['symbol'], dependencies: epoll_dep, args: cc_args)
> + 			error('@0@ is needed to compile Wayland libraries'.format(d['symbol']))
> + 		endif
> + 	endforeach
> +@@ -87,7 +93,7 @@ if get_option('libraries')
> + 	rt_dep = []
> + 	if not cc.has_function('clock_gettime', prefix: '#include <time.h>')
> + 		rt_dep = cc.find_library('rt')
> +-		if not cc.has_function('clock_gettime', prefix: '#include <time.h>', dependencies: rt_dep)
> ++		if not cc.has_function('clock_gettime', prefix: '#include <time.h>', dependencies: rt_dep, args: cc_args)
> + 			error('clock_gettime not found')
> + 		endif
> + 	endif
> +diff --git a/tests/display-test.c b/tests/display-test.c
> +index 763adc9..a6f410d 100644
> +--- a/tests/display-test.c
> ++++ b/tests/display-test.c
> +@@ -24,6 +24,7 @@
> +  * SOFTWARE.
> +  */
> +
> ++#define _GNU_SOURCE
> + #include <stdbool.h>
> + #include <stdio.h>
> + #include <stdlib.h>
> +diff --git a/tests/event-loop-test.c b/tests/event-loop-test.c
> +index 9d43c91..a51ba8f 100644
> +--- a/tests/event-loop-test.c
> ++++ b/tests/event-loop-test.c
> +@@ -24,6 +24,7 @@
> +  * SOFTWARE.
> +  */
> +
> ++#define _GNU_SOURCE
> + #include <stdlib.h>
> + #include <stdint.h>
> + #include <assert.h>
> +diff --git a/tests/fixed-test.c b/tests/fixed-test.c
> +index 47a4dae..0b58797 100644
> +--- a/tests/fixed-test.c
> ++++ b/tests/fixed-test.c
> +@@ -23,6 +23,7 @@
> +  * SOFTWARE.
> +  */
> +
> ++#define _GNU_SOURCE
> + #include <stdlib.h>
> + #include <stdio.h>
> + #include <assert.h>
> +--
> +2.25.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
