Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6A5C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 21:50:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2E4C60F70
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 21:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2E4C60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C51B40623;
	Fri, 12 Nov 2021 21:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y3nY65-RI5Ii; Fri, 12 Nov 2021 21:50:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AFC8404FE;
	Fri, 12 Nov 2021 21:50:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DED301BF3A9
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 21:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC160827A5
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 21:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OU4HvnS_79Gf for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 21:50:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1C93827A1
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 21:50:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7AD0219F57C;
 Fri, 12 Nov 2021 22:50:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636753838;
 bh=9aAoBa4mSRHXw/ttZ2Nv/qv911Ql23JH3/4tlIhe+oM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PqTgooUo8k9mUkfWbokJIuHxAjOvMlMtmLbXVhCD6A/H/gMs4UbYXnQAb7EktBnyR
 ovU1ufobX/OBrRVujFPiBRJDrJniPwsjlRcjG/HFPsmKsXHgctuvXujJ4Ngtdfu3mq
 mM8g4qNcMg/2kDhcTGEf+g2e7XKMvq1ZtI2zi1CyUQRNYDoOConAxhUtw+V8AWVRJK
 FBrun18fb9BtdRXQaRgsWdYb98hTL5xi9rXQ0kLUnNSYsFKpUhoXW3+MkdOCiyushX
 Czf9Ni7fHigyzqnmPDYMDpB98o2CdxmBBubq3gFmb9sSgdb4rMpTAX0iAGZN7JK1kX
 8gS+Wwglm8QpA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 22:50:34 +0100
Date: Fri, 12 Nov 2021 22:50:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211112215034.GD247986@scaer>
References: <20211112131645.3334046-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112131645.3334046-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: fix build with gcc 4.8
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-12 14:16 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure with gcc 4.8 raised since the addition
> of the package in commit c23612b5db036fe89accb8db48690d1ce1be4b1b:
> 
> In file included from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_impl.hpp:100:0,
>                  from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg.cpp:50:
> /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_hw.hpp: In constructor 'HWAccelIterator::HWAccelIterator(cv::VideoAccelerationType, bool, AVDictionary*)':
> /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_hw.hpp:939:23: error: use of deleted function 'std::basic_istringstream<char>& std::basic_istringstream<char>::operator=(const std::basic_istringstream<char>&)'
>              s_stream_ = std::istringstream(accel_list);
>                        ^
> In file included from /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/complex:45:0,
>                  from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/core/include/opencv2/core/cvstd.inl.hpp:47,
>                  from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/core/include/opencv2/core.hpp:3306,
>                  from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/include/opencv2/videoio.hpp:46,
>                  from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/precomp.hpp:57,
>                  from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg.cpp:42:
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/sstream:272:11: note: 'std::basic_istringstream<char>& std::basic_istringstream<char>::operator=(const std::basic_istringstream<char>&)' is implicitly deleted because the default definition would be ill-formed:
>      class basic_istringstream : public basic_istream<_CharT, _Traits>
>            ^
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/sstream:272:11: error: use of deleted function 'std::basic_istream<char>& std::basic_istream<char>::operator=(const std::basic_istream<char>&)'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/60f8846b435dafda0ced412d59ffe15bdff0810d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...src-cap_ffmpeg_impl.hpp-fix-build-wi.patch | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/opencv4/0001-modules-videoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch
> 
> diff --git a/package/opencv4/0001-modules-videoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch b/package/opencv4/0001-modules-videoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch
> new file mode 100644
> index 0000000000..6d5d6d0647
> --- /dev/null
> +++ b/package/opencv4/0001-modules-videoio-src-cap_ffmpeg_impl.hpp-fix-build-wi.patch
> @@ -0,0 +1,52 @@
> +From 4c92a2869b9a8f736a12ba859b74e5cadce62387 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 12 Nov 2021 09:50:17 +0100
> +Subject: [PATCH] modules/videoio/src/cap_ffmpeg_impl.hpp: fix build with gcc
> + 4.8
> +
> +Fix the following build failure with gcc 4.8:
> +
> +In file included from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_impl.hpp:100:0,
> +                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg.cpp:50:
> +/home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_hw.hpp: In constructor 'HWAccelIterator::HWAccelIterator(cv::VideoAccelerationType, bool, AVDictionary*)':
> +/home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg_hw.hpp:939:23: error: use of deleted function 'std::basic_istringstream<char>& std::basic_istringstream<char>::operator=(const std::basic_istringstream<char>&)'
> +             s_stream_ = std::istringstream(accel_list);
> +                       ^
> +In file included from /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/complex:45:0,
> +                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/core/include/opencv2/core/cvstd.inl.hpp:47,
> +                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/core/include/opencv2/core.hpp:3306,
> +                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/include/opencv2/videoio.hpp:46,
> +                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/precomp.hpp:57,
> +                 from /home/buildroot/autobuild/instance-3/output-1/build/opencv4-4.5.4/modules/videoio/src/cap_ffmpeg.cpp:42:
> +/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/sstream:272:11: note: 'std::basic_istringstream<char>& std::basic_istringstream<char>::operator=(const std::basic_istringstream<char>&)' is implicitly deleted because the default definition would be ill-formed:
> +     class basic_istringstream : public basic_istream<_CharT, _Traits>
> +           ^
> +/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-none-linux-gnueabi/include/c++/4.8.3/sstream:272:11: error: use of deleted function 'std::basic_istream<char>& std::basic_istream<char>::operator=(const std::basic_istream<char>&)'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/60f8846b435dafda0ced412d59ffe15bdff0810d
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/opencv/opencv/commit/4c92a2869b9a8f736a12ba859b74e5cadce62387]
> +---
> + modules/videoio/src/cap_ffmpeg_impl.hpp | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src/cap_ffmpeg_impl.hpp
> +index d393b73ff4a2..76e1b855b7c8 100644
> +--- a/modules/videoio/src/cap_ffmpeg_impl.hpp
> ++++ b/modules/videoio/src/cap_ffmpeg_impl.hpp
> +@@ -93,6 +93,12 @@ extern "C" {
> + }
> + #endif
> + 
> ++// GCC 4.x compilation bug. Details: https://github.com/opencv/opencv/issues/20292
> ++#if (defined(__GNUC__) && __GNUC__ < 5) && !defined(__clang__)
> ++#undef USE_AV_HW_CODECS
> ++#define USE_AV_HW_CODECS 0
> ++#endif
> ++
> + //#define USE_AV_HW_CODECS 0
> + #ifndef USE_AV_HW_CODECS
> + #if LIBAVUTIL_VERSION_MAJOR >= 56 // FFMPEG 4.0+
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
