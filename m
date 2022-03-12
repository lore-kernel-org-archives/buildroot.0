Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E0FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 16:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43F95410D0;
	Sat, 12 Mar 2022 16:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXz0s_wT56tH; Sat, 12 Mar 2022 16:58:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4888E40876;
	Sat, 12 Mar 2022 16:58:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 749BE1BF3FF
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71C49813DA
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 16:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id md6CxHvNXJJv for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 16:58:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44C93813A4
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 16:58:46 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id h13so14515000ede.5
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 08:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fw7KXukHc6Np+2iBtUMoQKHyo+JhOi0x+nxOsvBgF0E=;
 b=JjL5RDKAJfVCqapblMQJolbu5EdiTbnZRy+c+18DyV6rbkbcF0E8nfC2ZnIQ/YFGrM
 9lCvqT/V6ToQgoBoBdGQZ6r7AgzO3ognj+Jqeq4pav4Nuq1/CYfQtQQSmxKxjVJ8E1gg
 smNNsqO9ouwV3+kwWs+9tkxBSnfHqECd49135n/visUgVlI1PP/F2EgI0SYtexebuYnL
 D9bejrWOppMfKnhPn//4Yf5eyDvAm34usk+SIqyAOkkmt3jkJBBXGii7hxDbCx0wJWLl
 iDlaSqXU5kqOWZ6r/T2Tno17wKsoMHPeL7lk9hRC5mt9tGDrJfQtmnov1GmPIQ8hk24j
 YeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fw7KXukHc6Np+2iBtUMoQKHyo+JhOi0x+nxOsvBgF0E=;
 b=h5t/PXCfW1evQ+GYEUep5jiJ8G6ZHmN41bmU9Vd0bT2kVZ2NearleMB9Fo7zDB3ehx
 ohoV//+U/MPn4U2hMZL8K+jYzuKZR1nwKSzTFwoKP0g3L7HoNKSYrXovSS47+wFnrV+u
 06eQamu50C42OJd4VkOidEqUGYLc6yXhqvBkZzBHWe3FOXIkPWZZUNLoUoyxPHOaRoZS
 /+YEHNf6NSR+hGyq8npjyCLGK6g8nLMQ2PtpNxE0uWDggBQ9qeDXiRI6As9rpIY4MhWw
 gPibNCDuCHvlQ8ef3lV+/GdUodo8ydKiRPa4d2G82wVx4MRXNe8KGj2yUFiUyqPsVjJ5
 /1Lw==
X-Gm-Message-State: AOAM532wDuNzMYXERbw4RPE7s70zQE7OXl07UGevvbPO5uRcQSlIhv4J
 zo/23agot6cR3gnHhg52J7dRSQ==
X-Google-Smtp-Source: ABdhPJwDD63BZayv5DwIDMgY2NATL+iaUGhK7nJ4M+7Rx+ibQt/sj6yNkGr7bYX+1/kU0fmpV0f87g==
X-Received: by 2002:a05:6402:292c:b0:416:8eb:3fc4 with SMTP id
 ee44-20020a056402292c00b0041608eb3fc4mr13424468edb.2.1647104324523; 
 Sat, 12 Mar 2022 08:58:44 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a170906859600b006daa190edb6sm4501147ejx.224.2022.03.12.08.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 08:58:44 -0800 (PST)
Message-ID: <994c5deb-cd52-508c-1041-a4679de3be49@mind.be>
Date: Sat, 12 Mar 2022 17:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220217184836.418858-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220217184836.418858-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH/next 1/1] package/tvheadend: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/02/2022 19:48, Bernd Kuhls wrote:
> Removed patch which was applied upstream:
> https://github.com/tvheadend/tvheadend/commit/fb7b24114685a7e38d842168dce4c613360cd330
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../0002-configure-add-execinfo-option.patch  | 55 -------------------
>   package/tvheadend/tvheadend.hash              |  2 +-
>   package/tvheadend/tvheadend.mk                |  2 +-
>   3 files changed, 2 insertions(+), 57 deletions(-)
>   delete mode 100644 package/tvheadend/0002-configure-add-execinfo-option.patch
> 
> diff --git a/package/tvheadend/0002-configure-add-execinfo-option.patch b/package/tvheadend/0002-configure-add-execinfo-option.patch
> deleted file mode 100644
> index c55d127d58..0000000000
> --- a/package/tvheadend/0002-configure-add-execinfo-option.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 04c01e631cb1bf47dd50b1ef92a086308e380eff Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 1 Jan 2022 16:53:29 +0100
> -Subject: [PATCH] configure: add execinfo option
> -
> -Add execinfo option to allow the user to disable the feature even if
> -execinfo.h is found on the system
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upsteam status: https://github.com/tvheadend/tvheadend/pull/1431]
> ----
> - configure | 17 +++++++++++++++--
> - 1 file changed, 15 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure b/configure
> -index 4dad024c4..c087502bf 100755
> ---- a/configure
> -+++ b/configure
> -@@ -75,6 +75,7 @@ OPTIONS=(
> -   "ddci:yes"
> -   "cclang_threadsan:no"
> -   "gperftools:no"
> -+  "execinfo:auto"
> - )
> -
> - #
> -@@ -150,11 +151,23 @@ if [ ${PLATFORM} = "freebsd" ]; then
> -     # If we don't have libunwind then fallback to execinfo.
> -     if ! enabled libunwind
> -     then
> --        check_cc_header execinfo
> -+        if enabled_or_auto execinfo; then
> -+            if check_cc_header execinfo; then
> -+                enable execinfo
> -+            else
> -+                die "execinfo.h not found (use --disable-execinfo)"
> -+           fi
> -+        fi
> -     fi
> -
> - else
> --    check_cc_header execinfo
> -+    if enabled_or_auto execinfo; then
> -+        if check_cc_header execinfo; then
> -+            enable execinfo
> -+        else
> -+            die "execinfo.h not found (use --disable-execinfo)"
> -+        fi
> -+    fi
> - fi
> - check_cc_option mmx
> - check_cc_option sse2
> ---
> -2.33.0
> -
> diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
> index db06af53b7..44ff745221 100644
> --- a/package/tvheadend/tvheadend.hash
> +++ b/package/tvheadend/tvheadend.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  11eeca461e74fbe8306916933cab96d35a99fa89d81e26126e194875c41b6fad  tvheadend-b8710206eb073c72b142bce95846b77a0ffa34a6.tar.gz
> +sha256  10b8e8387cf341a8c639b3ecbab17dd245dc109afd6c99ca6b7fc3f2b5efc50e  tvheadend-1295dd2be863f5beb764290fce9317b24193dfc0.tar.gz
>   sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index 58ebdcb054..d2547b8746 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TVHEADEND_VERSION = b8710206eb073c72b142bce95846b77a0ffa34a6
> +TVHEADEND_VERSION = 1295dd2be863f5beb764290fce9317b24193dfc0
>   TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
>   TVHEADEND_LICENSE = GPL-3.0+
>   TVHEADEND_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
