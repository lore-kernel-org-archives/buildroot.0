Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25536C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE47D60D64;
	Sun, 10 Apr 2022 15:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zsmpIeN5Bvxm; Sun, 10 Apr 2022 15:07:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E325A60C31;
	Sun, 10 Apr 2022 15:07:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 579A11BF869
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 452FF415DF
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:07:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YBu3EdmBJmwe for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:07:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D58FC415DD
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:07:17 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id u19so2459956lff.4
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=pUs3McvuBOO1ah90iHrNHclfXzJKzTUDjjPDErqz/+I=;
 b=TaEtG0nDeTRFoBcKFEL49nhaW9CYi4h2tHLauXUsd/j/7vDJpTxdtMKO+Rq+0lToKT
 IaB2Iyv+xGHcuxrTfoNH6lxmRkt6OJm2twiFyB4of1koFTUOsg3lovXh6HZf3A7xEiMp
 /whPfs7wHQo0rBSPY3UB8I0wzLsRKNP8iaZ2/l0q0TCaXq9DIt7lsetYf8t1BV+25CPJ
 lerh8LKI73093YPIObMUWi6Pd7ZmBT++KONWuPSvPL9CqUIcNWmgO0IEOBApg+5w05YL
 y4z7/V3n4wd1igPgnyaORrq0po9sbGjs8hJPfGeL8hG5ovWDiyzcJEyOOk6wZKzZwnSs
 QwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pUs3McvuBOO1ah90iHrNHclfXzJKzTUDjjPDErqz/+I=;
 b=kUoQ0OUETVIMTCG/5GqVxHcCxi5lSSVGzjiFv5FHiM7tMq0/rcgrNv1JrvzthgkpGZ
 L5SXSf4E+L6bvGJzOdo1lgjgI+11jPB3D6I8vuln/V3+lP6MUNsRP45Zf3XCgcQt2lfg
 qXIDCK5gB7jRAExtVoFh+Br7jOdogKXjXNEUgJm1gxFLIUDeWaRhXsgRJxeg9hM/x4sN
 QSb97Lc8bcMHjnKlpLoheVcnszdtsFdXrvltkXXv5+2VXwE+gFqcs/4gRVNu0J9KdeZe
 4XEEIrf3l01kB+goqyQGZirJNujIRFGpnYlaiMcyYlDe7xgPWMRbHdZ4mb+OEIHWclXD
 Xsug==
X-Gm-Message-State: AOAM533r1GPDcx2RpLG08jD4MkEP7y5SrR+onwz1wluMBmURIihSJbrL
 7IR841hLJypsYsDbH/2hj/WYQqnuSdhGbw==
X-Google-Smtp-Source: ABdhPJyxBfOI64strxF/nEE+CuwVZ6GqWK8103RRrBIIq9HGf0kRvz8DU83kS96UWpmnWl9mTONYBQ==
X-Received: by 2002:a50:cc82:0:b0:41d:5fca:10c3 with SMTP id
 q2-20020a50cc82000000b0041d5fca10c3mr9784628edi.373.1649603225285; 
 Sun, 10 Apr 2022 08:07:05 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a170906297100b006e49a9535f3sm10902280ejd.114.2022.04.10.08.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 08:07:04 -0700 (PDT)
Message-ID: <1c6ee9b3-d940-4d2d-470e-e294ea8e53c3@mind.be>
Date: Sun, 10 Apr 2022 17:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220405180944.946684-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405180944.946684-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-libav: fix
 build without C++
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



On 05/04/2022 20:09, Fabrice Fontaine wrote:
> Fix the following build failure without C++ raised since bump to version
> 1.18.0 in commit 15dc48ca9becafec6ba11b08af18453bc0e40c9e:
> 
> The following exception(s) were encountered:
> Running "/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++'"
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/8ac0ba5eaaf7571857b4d8cfabf1488d640dc59a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-build-on-systems-without-C-compiler.patch | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch
> 
> diff --git a/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch b/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch
> new file mode 100644
> index 0000000000..6b275220f8
> --- /dev/null
> +++ b/package/gstreamer1/gst1-libav/0001-gst-libav-fix-build-on-systems-without-C-compiler.patch
> @@ -0,0 +1,35 @@
> +From 1477eb1fad92ac07cd057b3ecdb04edeeef9edba Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 4 Apr 2022 23:32:56 +0200
> +Subject: [PATCH] gst-libav: fix build on systems without C++ compiler
> +
> +Fix the following build failure on systems without C++ compiler:
> +
> +The following exception(s) were encountered:
> +Running "/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++ --version" gave "[Errno 2] No such file or directory: '/nvmedata/autobuild/instance-9/output-1/host/bin/or1k-buildroot-linux-musl-g++'"
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/8ac0ba5eaaf7571857b4d8cfabf1488d640dc59a
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2112>
> +
> +[Retrieved (and backported) from:
> +https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/1477eb1fad92ac07cd057b3ecdb04edeeef9edba]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + subprojects/gst-libav/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index fbfa3049afe..7da94b80d59 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1,4 +1,4 @@
> +-project('gst-libav', 'c', 'cpp',
> ++project('gst-libav', 'c',
> +   version : '1.20.1',
> +   meson_version : '>= 0.60',
> +   default_options : [ 'warning_level=1',
> +--
> +GitLab
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
