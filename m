Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A728C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 18:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E778F60FA2;
	Thu, 21 Apr 2022 18:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kyuNtmRci4gx; Thu, 21 Apr 2022 18:00:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C54D160EC8;
	Thu, 21 Apr 2022 18:00:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 443791BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40FA460EC8
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ptnbZeXjgZix for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 18:00:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3716960EB3
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 18:00:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 o20-20020a05600c511400b0038ebbbb2ad8so3953234wms.0
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 11:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=NcNqP4UCSBnMrLZ61vUvyopaUB58Gj8a7VhepaKbl2A=;
 b=bhLeYTirbfYEc8wd0bkeDV1XAwu066Af7KQ4WUZRWklU571NJx+3msWM92VR0HTc1/
 tdykgBfPD9QGSQ53WCf41BrOkIKVkzNdLB8uStm9jex1ONw2nVrT5LxSVDACfOUDanO9
 I+iPxC4eL9LiZSNqb5Ow84ugnR8umc47ymIEfzg94LH4Z3IdLcxzeRfw4YW+i34kit+9
 bDRuKnJkeYVeB8Vw7rE8WdVbmU32A8gl2jwi9b0kmq7tDc2lXCUlZbjj55/GxoK5rD1/
 DuRLfG4O1mpF5IfGMatpYKES72+bNbMYf6K3LWkXUDmF8EFmdXet/Era/e4aMRxRYB7A
 PTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NcNqP4UCSBnMrLZ61vUvyopaUB58Gj8a7VhepaKbl2A=;
 b=CDa938XEfRffogApuC3mPeNMvsgvITLK6XuB2D60Kk36k3DGLw5Pw4/FOmMSwLI3rB
 Y+x+MM1wlxEtvts7BjpS2ABCHzLfqRh07LJg/G+l5dDlnn+4/UTfm7RlGCaWIGeM0PE7
 5tkIO10iVuyqTBs+f2AaYodZ4yBDFjx/op9ts4kyBkh0mehFc/Xn7nLUidsFLbHnivDK
 IL3PLxJvVtezMxCEVWMRcBbezWxdUtuqO2RGTpV+SMdSvDE7DgWIKVymW+NGKVQX6fJO
 FJ/dlUorpXwMYo1e8WuSIjCiV+RPEbLrCx+wZRK6zOjMI89Xbb0xoJL86tRgla7tDRzh
 Omcg==
X-Gm-Message-State: AOAM533/gtbgzZSgXynGEAWt4Cc4lbuAYlJizLTOmsqsjjSWGBEM3qj2
 5F34R+sg+38o3LzrN1GyTlv8WEStZBdJdw==
X-Google-Smtp-Source: ABdhPJwhwz2uMApnNYTUl0SPDVYNlUDDavtI7m4a62s5kiJQN+uv0onkoeAG613zVjuMoEonB7OOQw==
X-Received: by 2002:a1c:21c5:0:b0:38e:b464:6a39 with SMTP id
 h188-20020a1c21c5000000b0038eb4646a39mr495886wmh.186.1650564021380; 
 Thu, 21 Apr 2022 11:00:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a05600002aa00b0020a7cc29000sm2999449wry.75.2022.04.21.11.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 11:00:20 -0700 (PDT)
Message-ID: <51c1fbc7-459d-c5c1-0e4a-87bc119b0d2e@mind.be>
Date: Thu, 21 Apr 2022 20:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220413162520.594048-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220413162520.594048-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/liboping: fix build with gcc >=
 7
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



On 13/04/2022 18:25, Fabrice Fontaine wrote:
> Replace first patch (which is not in master after nearly 4 years) with
> a new set of pending patches to fix the following build failure with
> gcc >= 7:
> 
> liboping.c: In function 'ping_set_ttl':
> liboping.c:207:9: error: '%s' directive output may be truncated writing up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
>    207 |    "%s: %s", function, message);
>        |         ^~
> ......
>    829 |      sstrerror (ret, errbuf, sizeof (errbuf)));
>        |      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> liboping.c:206:2: note: 'snprintf' output between 15 and 270 bytes into a destination of size 256
>    206 |  snprintf (obj->errmsg, sizeof (obj->errmsg),
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    207 |    "%s: %s", function, message);
>        |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/31083354e9064b2deef86917d67e92a88af0fa46
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   ...port.patch => 0001-fix-utf8-support.patch} |  0
>   ...to-make-GCC-s-truncation-check-happy.patch | 31 ------------------
>   ...when-adding-hosts-not-when-doing-th.patch} |  0
>   ...-GCC-7-buffer-overflow-with-snprintf.patch | 28 ++++++++++++++++
>   .../0004-Fix-compile-error-on-GCC-7.patch     | 32 +++++++++++++++++++
>   5 files changed, 60 insertions(+), 31 deletions(-)
>   rename package/liboping/{0002-fix-utf8-support.patch => 0001-fix-utf8-support.patch} (100%)
>   delete mode 100644 package/liboping/0001-ping_host_add-Decrease-buffer-size-to-make-GCC-s-truncation-check-happy.patch
>   rename package/liboping/{0003-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch => 0002-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch} (100%)
>   create mode 100644 package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch
>   create mode 100644 package/liboping/0004-Fix-compile-error-on-GCC-7.patch
> 
> diff --git a/package/liboping/0002-fix-utf8-support.patch b/package/liboping/0001-fix-utf8-support.patch
> similarity index 100%
> rename from package/liboping/0002-fix-utf8-support.patch
> rename to package/liboping/0001-fix-utf8-support.patch
> diff --git a/package/liboping/0001-ping_host_add-Decrease-buffer-size-to-make-GCC-s-truncation-check-happy.patch b/package/liboping/0001-ping_host_add-Decrease-buffer-size-to-make-GCC-s-truncation-check-happy.patch
> deleted file mode 100644
> index b0aca8a715..0000000000
> --- a/package/liboping/0001-ping_host_add-Decrease-buffer-size-to-make-GCC-s-truncation-check-happy.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 18ca43507b351f339ff23062541ee8d58e813a53 Mon Sep 17 00:00:00 2001
> -From: Florian Forster <ff@octo.it>
> -Date: Sun, 29 Jul 2018 14:34:19 +0200
> -Subject: [PATCH] ping_host_add: Decrease buffer size to make GCC's truncation
> - check happy.
> -
> -Fixes: #38
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/octo/liboping/commit/18ca43507b351f339ff23062541ee8d58e813a53]
> ----
> - src/liboping.c | 6 ++----
> - 1 file changed, 2 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/liboping.c b/src/liboping.c
> -index 5253e8c..2470988 100644
> ---- a/src/liboping.c
> -+++ b/src/liboping.c
> -@@ -1636,10 +1636,8 @@ int ping_host_add (pingobj_t *obj, const char *host)
> - 		}
> - 		else
> - 		{
> --			char errmsg[PING_ERRMSG_LEN];
> --
> --			snprintf (errmsg, PING_ERRMSG_LEN, "Unknown `ai_family': %i", ai_ptr->ai_family);
> --			errmsg[PING_ERRMSG_LEN - 1] = '\0';
> -+			char errmsg[64];
> -+			snprintf (errmsg, sizeof(errmsg), "Unknown `ai_family': %d", ai_ptr->ai_family);

  I don't understand how the new patches can fix this error. But OK, I trust you 
checked it with GCC 8 :-)

  Applied to master, thanks.

  Regards,
  Arnout

> -
> - 			dprintf ("%s", errmsg);
> - 			ping_set_error (obj, "getaddrinfo", errmsg);
> diff --git a/package/liboping/0003-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch b/package/liboping/0002-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch
> similarity index 100%
> rename from package/liboping/0003-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch
> rename to package/liboping/0002-Open-raw-sockets-when-adding-hosts-not-when-doing-th.patch
> diff --git a/package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch b/package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch
> new file mode 100644
> index 0000000000..546f159187
> --- /dev/null
> +++ b/package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf.patch
> @@ -0,0 +1,28 @@
> +From 0ad9ee080a7cd8037c341067cc67a84e32e69fea Mon Sep 17 00:00:00 2001
> +From: Maurice Smulders <Maurice.Smulders@windtalker.com>
> +Date: Thu, 30 Dec 2021 10:45:42 -0700
> +Subject: [PATCH] Fix compile break with GCC 7+ - buffer overflow with snprintf
> +
> +[Retrieved from:
> +https://github.com/octo/liboping/pull/64/commits/0ad9ee080a7cd8037c341067cc67a84e32e69fea]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/liboping.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/src/liboping.c b/src/liboping.c
> +index bf9e059..9fd8f53 100644
> +--- a/src/liboping.c
> ++++ b/src/liboping.c
> +@@ -203,8 +203,11 @@ static char *sstrerror (int errnum, char *buf, size_t buflen)
> + static void ping_set_error (pingobj_t *obj, const char *function,
> + 	       	const char *message)
> + {
> ++#pragma GCC diagnostic push
> ++#pragma GCC diagnostic ignored "-Wformat-truncation"
> + 	snprintf (obj->errmsg, sizeof (obj->errmsg),
> + 			"%s: %s", function, message);
> ++#pragma GCC diagnostic pop
> + 	obj->errmsg[sizeof (obj->errmsg) - 1] = 0;
> + }
> +
> diff --git a/package/liboping/0004-Fix-compile-error-on-GCC-7.patch b/package/liboping/0004-Fix-compile-error-on-GCC-7.patch
> new file mode 100644
> index 0000000000..38355be40e
> --- /dev/null
> +++ b/package/liboping/0004-Fix-compile-error-on-GCC-7.patch
> @@ -0,0 +1,32 @@
> +From 3d685bdb1a6c655bce6d36cfd96e084be07cd2b1 Mon Sep 17 00:00:00 2001
> +From: Maurice Smulders <Maurice.Smulders@windtalker.com>
> +Date: Tue, 4 Jan 2022 12:49:36 -0700
> +Subject: [PATCH] Fix compile error on GCC < 7
> +
> +[Retrieved from:
> +https://github.com/octo/liboping/pull/64/commits/3d685bdb1a6c655bce6d36cfd96e084be07cd2b1]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/liboping.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/liboping.c b/src/liboping.c
> +index 9fd8f53..1ccf609 100644
> +--- a/src/liboping.c
> ++++ b/src/liboping.c
> +@@ -203,11 +203,15 @@ static char *sstrerror (int errnum, char *buf, size_t buflen)
> + static void ping_set_error (pingobj_t *obj, const char *function,
> + 	       	const char *message)
> + {
> ++#if __GNUC__ >= 7
> + #pragma GCC diagnostic push
> + #pragma GCC diagnostic ignored "-Wformat-truncation"
> ++#endif
> + 	snprintf (obj->errmsg, sizeof (obj->errmsg),
> + 			"%s: %s", function, message);
> ++#if __GNUC__ >= 7
> + #pragma GCC diagnostic pop
> ++#endif
> + 	obj->errmsg[sizeof (obj->errmsg) - 1] = 0;
> + }
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
