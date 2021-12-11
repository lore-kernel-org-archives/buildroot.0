Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414D7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 21:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1DCC61161;
	Sat, 11 Dec 2021 21:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6p9CLoxL0zc; Sat, 11 Dec 2021 21:10:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D7DA6112B;
	Sat, 11 Dec 2021 21:10:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF771BF3A0
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6864D6111B
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id igND32jZUchU for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 21:10:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40AFC61114
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 21:10:24 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id v1so40766674edx.2
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 13:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=WQlAdeSjztVKOqsG9v3AQ8dAGTYt7n+8Uwc+B09K5mE=;
 b=IVqL+cdvGo2vZ1bGkQLLkuPKXc6lmyYbNVxhCKEOksfqv/Lz/d1v3wuzVNIil0LNCR
 b89YQvKT7dUfnLcYP6DpYn32iGp7Zpm75/IVyyUfOuWoS4+5HG8KcDpqbqSuPHSC7+GH
 ecxh8oyvjS+HKPN23uGAnhLJ79HNQlhPwLTGOgyso4X4cAyaFa0sSxl5ApxcDm6Gev3f
 ok6Bnsi5vxBkpD97gL/jAUDmry40zab8g4B5lNmbHhyA23beT6jQdX1zOMLJsJKuXZ9a
 +wzwIQVj8wCCbwIhPqEdj/zcBKfkZAis8X2wz7urqjE3D0WrqdZHXA0IeinpsC/+1eEg
 CqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WQlAdeSjztVKOqsG9v3AQ8dAGTYt7n+8Uwc+B09K5mE=;
 b=TOlDkgkudu/WLhCoTzpx3nxz3j3C5n20U5InqP/lEbRyNRhvD1/tvbUCwg2VabiFkL
 YqbdzKheZjP/JStBCw7h5C2dZISfVm55th6hkMM9Bn4l2YD3Lxbj7b/vmZGuWLYgJnNp
 XAV6OtBNgkH+lB/OrE5J3AkbJPlW06X3cUQs7YhyZq+6x+L9q91Egyne1iYkgKpDFyNB
 jTpFkG3khuunoQqNbso5+KNDzElL1OwAejJG/nwXHNDwMlOD/0XH5cJm1wgmglDQKloj
 +89uqOO4osv0Pf71R9cANLiruNzQgi889VHfz38rkZOeaHL6gA60WXwXhoE4aTrsih5U
 pCwg==
X-Gm-Message-State: AOAM5318wBzY7If40py2XoUxrTiU5GElRuPKKB9my/nwaRlv3iy/awb3
 9i8M2qdwrKqQJuwee+fyoTyf8ZPUN06owUvMXpM=
X-Google-Smtp-Source: ABdhPJxrlWR0htiZMiTniE2KtHEjRp/c8oWC/QLLbFZfHcrVqctY4+yNFqaIVOzjkqjgdQ/WPKkj5Q==
X-Received: by 2002:a17:906:c147:: with SMTP id
 dp7mr33496882ejc.173.1639257022460; 
 Sat, 11 Dec 2021 13:10:22 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q7sm3681746edr.9.2021.12.11.13.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 13:10:22 -0800 (PST)
Message-ID: <fb590506-04a3-fa04-755c-b15d37789167@mind.be>
Date: Sat, 11 Dec 2021 22:10:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Andreas Klinger <ak@it-klinger.de>, buildroot@buildroot.org
References: <20211205215423.GA13259@arbad>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211205215423.GA13259@arbad>
Subject: Re: [Buildroot] [PATCH 1/1] package/ply: bump to version 2.2.0
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



On 05/12/2021 22:54, Andreas Klinger wrote:
> Remove patches which are now included in version 2.2.0 and no longer
> needed.
> 
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...ure.ac-fix-error-with-version-string.patch | 29 -------------------
>   ...02-printxf.h-add-stdarg.h-in-include.patch | 27 -----------------
>   package/ply/ply.hash                          |  2 +-
>   package/ply/ply.mk                            |  2 +-
>   4 files changed, 2 insertions(+), 58 deletions(-)
>   delete mode 100644 package/ply/0001-configure.ac-fix-error-with-version-string.patch
>   delete mode 100644 package/ply/0002-printxf.h-add-stdarg.h-in-include.patch
> 
> diff --git a/package/ply/0001-configure.ac-fix-error-with-version-string.patch b/package/ply/0001-configure.ac-fix-error-with-version-string.patch
> deleted file mode 100644
> index e80599c649..0000000000
> --- a/package/ply/0001-configure.ac-fix-error-with-version-string.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 684bae6043fa2242a5c6551c3f260c9db0cf7dc8 Mon Sep 17 00:00:00 2001
> -From: Andreas Klinger <ak@it-klinger.de>
> -Date: Mon, 4 Jan 2021 08:40:50 +0100
> -Subject: [PATCH] configure.ac: fix error with version string
> -
> -When autoreconfiguring there's an error: "configure.ac:6: error: AC_INIT
> -should be called with package and version arguments".
> -
> -Put version string in square brackets to satisfy autoconfigure.
> -
> -Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 65387d6..7a0054e 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1,5 +1,5 @@
> - AC_PREREQ(2.61)
> --AC_INIT(ply, m4_esyscmd_s(git describe --always --dirty),
> -+AC_INIT(ply, [2.1.1],
> - 	     https://github.com/wkz/ply/issues)
> -
> - AC_GNU_SOURCE
> ---
> -2.20.1
> -
> diff --git a/package/ply/0002-printxf.h-add-stdarg.h-in-include.patch b/package/ply/0002-printxf.h-add-stdarg.h-in-include.patch
> deleted file mode 100644
> index f56e9a8e72..0000000000
> --- a/package/ply/0002-printxf.h-add-stdarg.h-in-include.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 3fb3cb779c535ec28cbba80573bbea42435108c0 Mon Sep 17 00:00:00 2001
> -From: Andreas Klinger <ak@it-klinger.de>
> -Date: Mon, 4 Jan 2021 20:48:41 +0100
> -Subject: [PATCH] printxf.h: add stdarg.h in include
> -
> -Include of <stdarg.h> is needed for va_list.
> -
> -Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ----
> - include/ply/printxf.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/include/ply/printxf.h b/include/ply/printxf.h
> -index a59f0d2..e985936 100644
> ---- a/include/ply/printxf.h
> -+++ b/include/ply/printxf.h
> -@@ -8,6 +8,7 @@
> - #define _PRINTXF_H
> -
> - #include <stdio.h>
> -+#include <stdarg.h>
> -
> - struct printxf;
> -
> ---
> -2.20.1
> -
> diff --git a/package/ply/ply.hash b/package/ply/ply.hash
> index 0ee2709b30..df01ae08e0 100644
> --- a/package/ply/ply.hash
> +++ b/package/ply/ply.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  cecf0913c65027750ac3272e936110c9f843435938f9ca2edbc34e99ba6c00e2  ply-2.1.1.tar.gz
> +sha256  8cd92fc8784873fb0507bc11f3f62a31d0345c64914ddaadb958d8b2d6de0100  ply-2.2.0.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/ply/ply.mk b/package/ply/ply.mk
> index b72b29f315..b3c56bd9a5 100644
> --- a/package/ply/ply.mk
> +++ b/package/ply/ply.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PLY_VERSION = 2.1.1
> +PLY_VERSION = 2.2.0
>   PLY_SITE = $(call github,wkz,ply,$(PLY_VERSION))
>   PLY_AUTORECONF = YES
>   PLY_LICENSE = GPL-2.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
