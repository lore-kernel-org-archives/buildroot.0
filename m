Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B733C352A1
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 13:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2943F81F03;
	Wed,  7 Dec 2022 13:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2943F81F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CO5Z8cUZqOVx; Wed,  7 Dec 2022 13:32:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F3998140F;
	Wed,  7 Dec 2022 13:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F3998140F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE59F1BF4D8
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 990FE40156
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 990FE40156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NBDjjbYszLuk for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 13:32:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 889C1400D2
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 889C1400D2
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 13:32:39 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-3c21d6e2f3aso185699777b3.10
 for <buildroot@buildroot.org>; Wed, 07 Dec 2022 05:32:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8S78IIkaNaExCJJon9rzUcbOljvRqCodjpXTzz7/wFE=;
 b=AgYaki0EEm5R+F4VmER6QFe9WboyBoGwiUl0ObxuwtJ5yyB2axMmoLpghxKmZopA0G
 HP817IgGlFsOl5pkjbsCQnWqNi1F08MwBsD4wAe5Ehxine3Q/fILYOM9Lx2folzpUHcz
 Qq7keo/EGFUNym3um/wz+WaKrp/ggXrs4nMY1AwAyDfK8zmr+1aydKAglosyeuY+elyx
 2k21scuWwGnS92JoxlVnEKbww18bAnGNnnYoCDv+I9qJ58mbC9pKjBocl0nbfQAExI/k
 dPeMaaNpx+9mac1WNDZ6gOteB0vEzzfy30+ztCxYUTglnjGgasuYuZRDIRTZa1CfCKPq
 P2KA==
X-Gm-Message-State: ANoB5pmW28FVH+nfzMJBCxxTUbG13jgG0AqZKVmNRsYeGIqZuwoyZRWg
 o/loEbv/vV5lnhcmUY4NVP9zDFYVgLO4fH+Byqyxl09O
X-Google-Smtp-Source: AA0mqf7cLGV0863a+t8KGUN/DQ8HyxQkSt62/6v9/j+E4Zb4yaIxH5OLVto42bMSXZNusyq+RLZPPmKLXjjlpxuARjI=
X-Received: by 2002:a0d:ebc6:0:b0:3b3:3f1d:8623 with SMTP id
 u189-20020a0debc6000000b003b33f1d8623mr60522684ywe.96.1670419958131; Wed, 07
 Dec 2022 05:32:38 -0800 (PST)
MIME-Version: 1.0
References: <20221206152921.22698-1-yegorslists@googlemail.com>
In-Reply-To: <20221206152921.22698-1-yegorslists@googlemail.com>
Date: Wed, 7 Dec 2022 14:32:27 +0100
Message-ID: <CAGm1_ksP3viXJS-D4+_mbmvAmj1QiGP3buG8Tg7LP=8tJRYANw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8S78IIkaNaExCJJon9rzUcbOljvRqCodjpXTzz7/wFE=;
 b=aS8oEQHQUKVYNn1KDWemnHRJsmxcxpj5iL/m1mg7rOg1QmzDwevDFwhU/JFixZafg5
 QBY0HGeKdYzlfXy8zvUWGxDBhapHXIjNZdVptNHtX7QqDQgA0R8Rz7REDAm2d3qR+MO1
 XyliakiRZ1x6FuM0TTZskP6NiQs/7ADIoWTLvYbHtCxakrPQDL4LLa16A5WtseUy9jHV
 V12dFPmhHKutLNe6wwFaTv0pARyz6S6yGztrGGNsSOyr6+yp1OBTY8NB20wGTPHU5g+L
 OQMKz5RmnPXuzPTwR3OBwV1Rvnpe8NFjf8DIaY8DLeSNaXkHdnKhUCctUuBESI7i7GaK
 L5yg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aS8oEQHQ
Subject: Re: [Buildroot] [PATCH v2] package/python-dicttoxml: remove package
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On Tue, Dec 6, 2022 at 4:29 PM <yegorslists@googlemail.com> wrote:
>
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Package was removed because it was unmaintained. Use
> python-dicttoxml2 instead.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Tested-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> ---
> Changes v1 -> v2:
>         - fix indentation
>
>  Config.in.legacy                               |  8 ++++++++
>  package/Config.in                              |  1 -
>  package/python-dicttoxml/Config.in             |  8 --------
>  package/python-dicttoxml/python-dicttoxml.hash |  5 -----
>  package/python-dicttoxml/python-dicttoxml.mk   | 14 --------------
>  5 files changed, 8 insertions(+), 28 deletions(-)
>  delete mode 100644 package/python-dicttoxml/Config.in
>  delete mode 100644 package/python-dicttoxml/python-dicttoxml.hash
>  delete mode 100644 package/python-dicttoxml/python-dicttoxml.mk
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 522102a0c0..99322e2e2b 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -154,6 +154,14 @@ config BR2_PACKAGE_USBREDIR_SERVER
>           0.13.0. usbredir tools (which include usbredirect binary) can
>           be used as a replacement.
>
> +config BR2_PACKAGE_PYTHON_DICTTOXML
> +       bool "python-dicttoxml removed"
> +       select BR2_LEGACY
> +       select BR2_PACKAGE_PYTHON_DICTTOXML2
> +       help
> +         Package was removed because it was unmaintained. Use
> +         python-dicttoxml2 instead.
> +
>  comment "Legacy options removed in 2022.11"
>
>  config BR2_PACKAGE_RABBITMQ_SERVER
> diff --git a/package/Config.in b/package/Config.in
> index f4a423c7a6..58edd43432 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1022,7 +1022,6 @@ menu "External python modules"
>         source "package/python-decorator/Config.in"
>         source "package/python-defusedxml/Config.in"
>         source "package/python-dialog3/Config.in"
> -       source "package/python-dicttoxml/Config.in"
>         source "package/python-dicttoxml2/Config.in"
>         source "package/python-distro/Config.in"
>         source "package/python-django/Config.in"
> diff --git a/package/python-dicttoxml/Config.in b/package/python-dicttoxml/Config.in
> deleted file mode 100644
> index 145887eddc..0000000000
> --- a/package/python-dicttoxml/Config.in
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -config BR2_PACKAGE_PYTHON_DICTTOXML
> -       bool "python-dicttoxml"
> -       select BR2_PACKAGE_PYTHON3_PYEXPAT
> -       help
> -         Converts a Python dictionary or other native data type into
> -         a valid XML string.
> -
> -         https://github.com/quandyfactory/dicttoxml
> diff --git a/package/python-dicttoxml/python-dicttoxml.hash b/package/python-dicttoxml/python-dicttoxml.hash
> deleted file mode 100644
> index d8c43d0144..0000000000
> --- a/package/python-dicttoxml/python-dicttoxml.hash
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# md5 from https://pypi.python.org/pypi/dicttoxml/json
> -md5  ec5643a048cf32dad3c28db236b923e4  dicttoxml-1.7.4.tar.gz
> -# Locally computed
> -sha256  ea44cc4ec6c0f85098c57a431a1ee891b3549347b07b7414c8a24611ecf37e45  dicttoxml-1.7.4.tar.gz
> -sha256  4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
> diff --git a/package/python-dicttoxml/python-dicttoxml.mk b/package/python-dicttoxml/python-dicttoxml.mk
> deleted file mode 100644
> index 537afff601..0000000000
> --- a/package/python-dicttoxml/python-dicttoxml.mk
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -################################################################################
> -#
> -# python-dicttoxml
> -#
> -################################################################################
> -
> -PYTHON_DICTTOXML_VERSION = 1.7.4
> -PYTHON_DICTTOXML_SOURCE = dicttoxml-$(PYTHON_DICTTOXML_VERSION).tar.gz
> -PYTHON_DICTTOXML_SITE = https://pypi.python.org/packages/74/36/534db111db9e7610a41641a1f6669a964aacaf51858f466de264cc8dcdd9
> -PYTHON_DICTTOXML_SETUP_TYPE = distutils
> -PYTHON_DICTTOXML_LICENSE = GPL-2.0
> -PYTHON_DICTTOXML_LICENSE_FILES = LICENCE.txt
> -
> -$(eval $(python-package))

Seems like after some years of silence, the maintainer is back again.
I'll test the latest version and if it works with current Python, we
can drop this patch.

Best regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
