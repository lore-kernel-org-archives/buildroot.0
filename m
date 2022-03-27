Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEE5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17FED4109F;
	Sun, 27 Mar 2022 16:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQvFxVLm32Io; Sun, 27 Mar 2022 16:29:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 293B040341;
	Sun, 27 Mar 2022 16:29:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCAC41BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB58F40341
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTv9IMGARAQn for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:29:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C906E4032B
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:29:06 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id dr20so24123898ejc.6
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8TYUl0BjzgqJwuekNVUvZgba2fGe0ll+M0BMPIaIcDQ=;
 b=gShr6DJo76keECSkN+jUZQMhxGrsGSILVKlILayUryAIfsp04mJhre//hZxBnJm1pW
 FKCE6OfYhNzEjWwz7/2BQdq/eU4kZJHyk5qwDbajfIsfss8AMh8saVxGOmVoH6cBmiTu
 KRIKCFBnLa0B82Xg6W7Jy4mG3dH38qLVtJkE7HERmeSoxo9LTceA+uYiWlv1WY1aLKDm
 rBr/q9QPKZYmI2WDnj6Wg/TSGSzS1vIjxdZo45n1/wwzCTPCFkIJ7S/TRCQWaJWNVNK/
 pcmc1ja62W8MlRBzPQWVWTlR6liufqAgM7mleOk6htzuLJzsK8Q6fC9gOcRyteK/rxGj
 a5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8TYUl0BjzgqJwuekNVUvZgba2fGe0ll+M0BMPIaIcDQ=;
 b=dDdkEyveL+wsXILHIR+ih7VH7C9axiw4F5/X6y8S6CsqRtIoQYoT3m6a594+orUfmF
 sT690G0Ilo+2CbDSJmXvQFJKgCDOFfPip6WtU46g43FzeZISpsfd+PqosOK6zO55EO8U
 szXa+rUmkE5q73o2xY3g2EIPqodWPg5lUQ5u8ZPEkDpgIxZ1Id1e/BNI3KeVuhoMs7jf
 O0eC4wu9bWV3Xi6UcUBaXK0fOy5M4ynVxDuC+RWtvzKpa515dp7CbLVFM1Queuz2qVLi
 oPQljxTd6saNFEPLQ8av9HUJ86jqH+9UDzYknnKVys70sWu4kbgHfv3TrXnrJCTywrpV
 LDxA==
X-Gm-Message-State: AOAM5309UMBlqOWC6F8S4F3nuOGYbqauLEWmb+n722GgKW5W6WpRsp6Z
 J710bow2ZV9pniqk4vN7YcQf/g==
X-Google-Smtp-Source: ABdhPJwf4CSqxtwfNNmskGCnmjEzaYs35GrTEC0PqYqt4Gtgfk9WitQY9kip+TzcrJQbsS3uE6d1Dg==
X-Received: by 2002:a17:907:2ce6:b0:6df:a489:d2e1 with SMTP id
 hz6-20020a1709072ce600b006dfa489d2e1mr23067225ejc.264.1648398544708; 
 Sun, 27 Mar 2022 09:29:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 qw39-20020a1709066a2700b006e03017d60csm4879205ejc.54.2022.03.27.09.29.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:29:04 -0700 (PDT)
Message-ID: <c64cd1cf-8ef2-9f15-2416-1297bf210bd3@mind.be>
Date: Sun, 27 Mar 2022 18:29:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220325210554.526198-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220325210554.526198-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/iwd: fix uclibc build
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
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/03/2022 22:05, Fabrice Fontaine wrote:
> Fix the following uclibc build failure raised since bump to version 1.25
> in commit 0fc5bc235990073233df6352d1208624034a6b6e and
> https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=01cd8587606bf2da1af245163150589834126c1:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: src/storage.o: in function `storage_init':
> storage.c:(.text+0x13a4): undefined reference to `explicit_bzero'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/2aff8d3d7c33c95e2c57f7c8a71e69939f0580a1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-src-storage.c-fix-build-with-uclibc.patch | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch
> 
> diff --git a/package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch b/package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch
> new file mode 100644
> index 0000000000..55fdaa86fd
> --- /dev/null
> +++ b/package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch
> @@ -0,0 +1,37 @@
> +From 99e74ade2ea892e6d0b070bec1df6a135ce2c8b3 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 25 Mar 2022 16:35:49 +0100
> +Subject: [PATCH] src/storage.c: fix build with uclibc
> +
> +explicit_bzero is used in src/storage.c since commit
> +01cd8587606bf2da1af245163150589834126c1c but src/missing.h is not
> +included, as a result build with uclibc fails on:
> +
> +/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: src/storage.o: in function `storage_init':
> +storage.c:(.text+0x13a4): undefined reference to `explicit_bzero'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/2aff8d3d7c33c95e2c57f7c8a71e69939f0580a1
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://lists.01.org/hyperkitty/list/iwd@lists.01.org/thread/WB2XXRBUDHC5IVFDEOJBK23JHPURL427]
> +---
> + src/storage.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/storage.c b/src/storage.c
> +index 82a72443..aa8066b1 100644
> +--- a/src/storage.c
> ++++ b/src/storage.c
> +@@ -44,6 +44,7 @@
> + #include <ell/ell.h>
> + #include "ell/useful.h"
> +
> ++#include "src/missing.h"
> + #include "src/common.h"
> + #include "src/storage.h"
> + #include "src/crypto.h"
> +--
> +2.35.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
