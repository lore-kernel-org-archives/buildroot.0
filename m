Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A36C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D35A760FCC;
	Thu, 21 Apr 2022 19:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5e_uhxqr7TkN; Thu, 21 Apr 2022 19:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C92DB607F0;
	Thu, 21 Apr 2022 19:12:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9151BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9762040A6E
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3aBQZaInaTOB for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:12:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADAC640131
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:12:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k22so8001004wrd.2
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 12:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=rpsgg3Af0L1W0pCWLbwL/F79WM6/ktgV2BTNXOA55SA=;
 b=BzExtIKCXiHji6U6i08K2ZDRz3qVEVgtqGtMJEqw94R44KYZKoIT3xF5Je0LRPQ0nR
 SQL9OW4GDe7WWwd77rhIQICB7AZqzm1PlAMd+1sDSyOk8U5fHWwfWGjBN7HI1e+L7RPJ
 yWWCr4iSHjkPmf+uzsiBCvfgr4oemNyHmiCWeTx+0DbWPeDKPlXkGXqXCzyIDrfZMGyk
 4Q57tmvS+M4ML8Go95c4og2zCf5z60fwmHzddWX+4wMSVKFV+x5pCNEl/Mk+SzB0UpYO
 mC7cGFj0aLcf+CvnZ2jj/8fgvZ4NVQgUKEsr2OMbWQv7xzgnKe5mTVnJyh1l0fNwHmF9
 JxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rpsgg3Af0L1W0pCWLbwL/F79WM6/ktgV2BTNXOA55SA=;
 b=v06z9FHMc+K9E+viToszLpAgdvphydpwzI6WAaKymliHS5jk1VrgSlTt8R1K3SGMB6
 AJVP2yUEZPTtcsMfDN/qttTMTmwLZfZSF+0zjATW9vEzfXXgdYV9+MXYWLfmr+09I33I
 vXlCReYtNVsmizYZJrPcwCdwSkVEkGFh2qSU/cvbORAzcL/enk3cSsYaLBySGA+Df2v8
 10zsa37qpMNjNqD5sPjzYCMc9UJcO867SuJI/5aZKoiiysBUQqmmZa2cZb2M/ApbV9oX
 5Wau+JNOW1NBFebcENNuCahk79HeoKg+xN5QXHu7gVAAPnVYdSsDvT4xIG7NWNk1Pbsn
 WD/w==
X-Gm-Message-State: AOAM531ebt+dNZ06FjhzbJ7GXigL+L2244lhrXTbjqxfH74QNcCrFHYo
 icY6raH5tELptH96PTMBYvQCiQ==
X-Google-Smtp-Source: ABdhPJyn5TvakQnaxEpJ8g5XB24p1rRY0lXokqMK+g8L9g5ywmpQn75BGXoX0dpjOP17RljRXo4DlA==
X-Received: by 2002:a5d:44d0:0:b0:207:9ac8:2c3b with SMTP id
 z16-20020a5d44d0000000b002079ac82c3bmr845387wrr.688.1650568333961; 
 Thu, 21 Apr 2022 12:12:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v2-20020adf8b42000000b0020aa790a258sm3054401wra.8.2022.04.21.12.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 12:12:13 -0700 (PDT)
Message-ID: <746f43b3-af24-04b2-ae34-b03601d30964@mind.be>
Date: Thu, 21 Apr 2022 21:12:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220416072006.1099281-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220416072006.1099281-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-python: fix
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



On 16/04/2022 09:20, Fabrice Fontaine wrote:
> Fix the following build failure without C++ raised since the addition of
> the package in commit ba0d78b90705fa6f564e105437be4817caf2ca6c:
> 
> The following exception(s) were encountered:
> Running "/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++'"
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/eebf65036f79d21d347714d62afecd0108393308
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-build-on-systems-without-C-compiler.patch | 35 +++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch
> 
> diff --git a/package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch b/package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch
> new file mode 100644
> index 0000000000..7d3059d61a
> --- /dev/null
> +++ b/package/gstreamer1/gst1-python/0001-gst-python-fix-build-on-systems-without-C-compiler.patch
> @@ -0,0 +1,35 @@
> +From 26c2385faed0bb997368daabd4c64207b3fc01ca Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 15 Apr 2022 18:58:49 +0200
> +Subject: [PATCH] gst-python: fix build on systems without C++ compiler
> +
> +Fix the following build failure on systems without C++ compiler:
> +
> +The following exception(s) were encountered:
> +Running "/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '/home/autobuild/autobuild/instance-0/output-1/host/bin/i686-buildroot-linux-gnu-g++'"
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/eebf65036f79d21d347714d62afecd0108393308
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2200>
> +
> +[Retrieved (and backported) from:
> +https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/26c2385faed0bb997368daabd4c64207b3fc01ca]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + subprojects/gst-python/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 1462604b297..c28df16192a 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -1,4 +1,4 @@
> +-project('gst-python', 'c', 'cpp',
> ++project('gst-python', 'c',
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
