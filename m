Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46F4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 19:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C83C405F4;
	Tue, 14 Dec 2021 19:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bznGVZWML5i5; Tue, 14 Dec 2021 19:43:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DB06405EA;
	Tue, 14 Dec 2021 19:43:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 576661BF94B
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53ED060BF3
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 19:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjUxUHEluLyv for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 19:43:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3459060087
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 19:43:34 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b7so7585937edd.6
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 11:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=9AjMYNrrd/DeCWjURZxllzMrsgm7mpq9huD8wbq7VN8=;
 b=aSYZafpbTqkvNw943sYWbsP2Phk4iT9vR5wpwnLR6xib50YTou7lM/VabWqrr3v+lm
 2bUphgYMRXPBlhufFMdOeXAWx7AxC3QEJomG4HUj61bAIOIpeRGqehLU+8Q6njwD86f0
 w3d/dObkIQeOvowrscn/4akuN+MuwJbTAteg4TcGgLWzlfRe6DUlV8lckOQQx9aY393q
 RqraYI4Di1N49++WXKX9ajJCdhQkEztgGVsgXP7AzXSWVD9GyONZkPuyoPn1xj3Xv8Xj
 ioFuu1bs38mVUAIp+VINnXhfEHxlYg7Ujmy99WsYC61qy+SZMaE4J1xFmiiCVjCEZZMG
 kOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9AjMYNrrd/DeCWjURZxllzMrsgm7mpq9huD8wbq7VN8=;
 b=0INilNbgFFgChWMH8fgcg46nOvIhwYwhKikJGVNnW2hMmhRNvpkzYu42tCjii/W++A
 i6FCVmNlExlYQWnzs3xxJjiWXni2WNsj5bxz8tsjNYT5TY/u12VU4WuKNUwj/aIxhRJu
 xKBiXcS39u6XWjpocbmWK5oYxKJdUdKXRY4V0dJinDxaa0P/nXAFKFHL47KpWMdkW+Ae
 oj2qrE0fRgGUCjrR5rOjpRy45hDIpH+7lmuf9Utm+BBkS+9QSTGug8TqJJJuqFjoIo6l
 A4e5weTMtr8vbth0oy90GNHC8XwTozsR64Mc6HjSrxds78ZvQr+TJxzKUTqhk2HN5RGw
 vm7Q==
X-Gm-Message-State: AOAM533MTph/eQymkFC8WDtgyXmQs4Jpf9UTUIRiJuYGzIUlARHBlvyc
 LHY///gcfK2PhXcQ6vvHrSCegw==
X-Google-Smtp-Source: ABdhPJxmKFOyCXouMnNZ7JOLxZcHfIGWkE157tDfdPrxFOYSFjasFnFtmU5nEDL/Te0koo00jH7z+w==
X-Received: by 2002:a05:6402:35c2:: with SMTP id
 z2mr10692391edc.92.1639511012042; 
 Tue, 14 Dec 2021 11:43:32 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 12sm220065ejh.173.2021.12.14.11.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 11:43:31 -0800 (PST)
Message-ID: <21eb337e-539c-4c43-f27d-d13d604d607c@mind.be>
Date: Tue, 14 Dec 2021 20:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211212192237.838191-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212192237.838191-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libmediaart: fix static build
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



On 12/12/2021 20:22, Fabrice Fontaine wrote:
> Fix the following static build failure raised since bump to version
> 1.9.5 in commit 3db4d486d689b4a9d59c8f7637211893b0a1cb1b:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
> __uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/18d26882a68dcf8f09b3e3d25636454a12939310
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  I understand that you don't really want to upstream the patch when the MR you 
raised already hasn't seen any activity for 2 months, but still I think it's 
better to do that, because:

- it raises visibility for others who encounter the same problem;
- it makes it possible to add the upstream link in the patch, which facilitates 
later updates.

  I completely understand that you don't want to spend time on useless stuff, 
but I think the time is limited and that it's not useless even if upstream is 
not reactive.


  Regards,
  Arnout

> ---
>   ...t-meson.build-replace-shared_library.patch | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch
> 
> diff --git a/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch b/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch
> new file mode 100644
> index 0000000000..d4b377d327
> --- /dev/null
> +++ b/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch
> @@ -0,0 +1,35 @@
> +From 2272d762436a3b0d2e4fef8fb4f1669814904620 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 12 Dec 2021 20:14:54 +0100
> +Subject: [PATCH] libmediaart/meson.build: replace shared_library
> +
> +Replace shared_library by library call to avoid the following build
> +failure when building statically:
> +
> +/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
> +__uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/18d26882a68dcf8f09b3e3d25636454a12939310
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + libmediaart/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libmediaart/meson.build b/libmediaart/meson.build
> +index 2f44e63..1fd3b99 100644
> +--- a/libmediaart/meson.build
> ++++ b/libmediaart/meson.build
> +@@ -30,7 +30,7 @@ marshal = gnome.genmarshal('marshal',
> +
> + libmediaart_dependencies = [glib, gio_unix, gobject, image_library]
> +
> +-libmediaart = shared_library(
> ++libmediaart = library(
> +   'mediaart-' + libmediaart_api_version,
> +   libmediaart_sources, marshal[0], marshal[1],
> +   version: libmediaart_ltversion,
> +--
> +2.33.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
