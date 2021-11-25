Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A195C433F5
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 19:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74C6C6072E;
	Thu, 25 Nov 2021 19:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LSPZHgGCiDq7; Thu, 25 Nov 2021 19:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F3056074E;
	Thu, 25 Nov 2021 19:46:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53F651BF401
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 414D0401D4
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 19:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5uQQSoQHCF3U for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 19:46:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EE96400A4
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 19:46:17 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id y12so29610259eda.12
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 11:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TTn0Lr8n3NVNBxiVGOAk5KYXc4tkAIHA51euNi5U9fs=;
 b=IaoOBkjvLmkv9haKrbpIYQ045G2AkB5VIXUuEJmCxp9sm69YLrJjwFPrpfuQIh65dj
 jqrS/L0KYuFvUHSUXtXO4Tu+RC63tQlUkr+1qggQB8cGWyid/GyFYa1GRSgxeRXRPXoM
 e3cszhGEdFobo1GP6GHwM79/QizzFWjrz5jr4QfN6gd6lljIuvkRTPofjyWxj+4CWtFT
 CLEAIjRfivXhuYgqyK5Oj6nbJhyFF2G8udOLnXBHd68ik/nLzdaHARHGzqdcTBsu+ryN
 +BmJZmk4Db30TqAZvOD3nFPUyy77CGi6Gqlb/FXTOflDpcvTiuzHOB6QsXxC0pvlHgKV
 QuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TTn0Lr8n3NVNBxiVGOAk5KYXc4tkAIHA51euNi5U9fs=;
 b=J7vdgPm+WfHCQ7sAxZiH1Iu6lV2LyGlZzNPdZzOhcE/KdqtjRF6V/jfrdx21YFrdR7
 sk55Ck+Vd6M06GVLMWGofolFvB60wZy517CP6WCRzfPwXZmHq9S/VbmmmPfW5Nlv5nPj
 ZvfM9KzAiAIMTK9d/9cXz9sNaIxo6fzYYVmgwE7oZlWwkvzTzMgmDZlXFTOssjBu/wkq
 wSiGTCPA+YhTDTvFmcebkOtEBHAqsI+kb230Mc7mqThbWPvbOcbVd9wcJvl0RF5ZluTb
 kr5k/6YdFq+QQHVKnpvQKopBvDByVkTr4puyj/Ly8m0o4BvdGoLABSb4W2YHgZXCqx3Y
 nwmg==
X-Gm-Message-State: AOAM532jcXRW+0HL9n37tX1A+aiyWVI1Jg9qab6FconADfuBqqjOnQHM
 cbo286WLTggvjgYouUWDDgZ7Vg==
X-Google-Smtp-Source: ABdhPJzA2CjDu2pvi56Y7fHdNzc4MslebiiiL29q/l5pzZMLGdoCBrHvxvochT6ZLkiirnNzpZkB/Q==
X-Received: by 2002:a50:ce46:: with SMTP id k6mr41648314edj.45.1637869575419; 
 Thu, 25 Nov 2021 11:46:15 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q17sm2618029edd.10.2021.11.25.11.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 11:46:14 -0800 (PST)
Message-ID: <9649abff-8bd2-2d55-f3af-5d98c9901d7a@mind.be>
Date: Thu, 25 Nov 2021 20:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>, buildroot@buildroot.org
References: <20211122135737.1784748-1-gwenj@trabucayre.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211122135737.1784748-1-gwenj@trabucayre.com>
Subject: Re: [Buildroot] [PATCH v3] package/uhd: fix usrp2 build with boost
 1.77.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/11/2021 14:57, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Fix build failure:
> uhd-3.15.0.0/host/lib/usrp/usrp2/usrp2_impl.cpp:847:29: error: 'boost::math' has not been declared
> for boost::math::sign and boost::math::iround
> 
> Backport and adapt commits:
> - 3796175f32f0cc24c16809d8175d423bc7053de9
> - d1c6290fe9c8b01068abfca6f272e2a1e031b9de
> 
> Fixes:
> - http://autobuild.buildroot.net/results/aa2bd1fbe1b4880aa8de389238380a3d35f80b53/
> - http://autobuild.buildroot.net/results/22b022f360d0f0f23161bc279b736e6a80f87c1a/
> - http://autobuild.buildroot.net/results/f65ea915509a8669c624ddab85e76576c8522005/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v2 -> v3:
> - fix patches
> Changes v1 -> v2:
> - backport the two commits in separate patches (Yann)
> - add SoB and backport info (Yann)
> ---
>   ...ost-math-iround-math-sign-with-std-l.patch | 58 +++++++++++++++++++
>   ...explicit-template-type-for-std-min-T.patch | 28 +++++++++
>   2 files changed, 86 insertions(+)
>   create mode 100644 package/uhd/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch
>   create mode 100644 package/uhd/0007-usrp2-Use-explicit-template-type-for-std-min-T.patch
> 
> diff --git a/package/uhd/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch b/package/uhd/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch
> new file mode 100644
> index 0000000000..09869da61b
> --- /dev/null
> +++ b/package/uhd/0006-usrp2-Replace-boost-math-iround-math-sign-with-std-l.patch
> @@ -0,0 +1,58 @@
> +From 3796175f32f0cc24c16809d8175d423bc7053de9 Mon Sep 17 00:00:00 2001
> +From: StefanBruens <stefan.bruens@rwth-aachen.de>
> +Date: Wed, 5 May 2021 18:24:58 +0200
> +Subject: [PATCH 003/121] usrp2: Replace boost::math::iround/math::sign with
> +std::lround

  You have a funny way of backporting patches... The 003/121 is weird 
(check-package also complains about it), and the continuation line is normally 
indented with two spaces.

  The normal way of creating patches is:

- clone the upstream repo;
- checkout the tag or hash corresponding to the buildroot version;
- git am <buildroot>/package/<package>/00*.patch
- cherry-pick the upstream commits, resolve conflicts
- git format-patch -N <tag>.. -o <buildroot>/package/<package>

  Anyway, fixed and applied to master, thanks.

  Regards,
  Arnout


> +
> +Instead of multiplying zone with the sign repeatedly just make
> +the zone a signed value.
> +
> +See #437, #438
> +
> +Signed-off-by: Aaron Rossetto <aaron.rossetto@ni.com>
> +[gwenhael.goavec-merou@trabucayre.com: backport from upstream]
> +Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> +---
> + host/lib/usrp/usrp2/usrp2_impl.cpp | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/host/lib/usrp/usrp2/usrp2_impl.cpp b/host/lib/usrp/usrp2/usrp2_impl.cpp
> +index 1be4c7339..c0719a316 100644
> +--- a/host/lib/usrp/usrp2/usrp2_impl.cpp
> ++++ b/host/lib/usrp/usrp2/usrp2_impl.cpp
> +@@ -22,6 +22,7 @@
> + #include <boost/asio/ip/address_v4.hpp>
> + #include <boost/asio.hpp> //used for htonl and ntohl
> + #include <boost/thread.hpp>
> ++#include <cmath>
> +
> + using namespace uhd;
> + using namespace uhd::usrp;
> +@@ -844,20 +845,19 @@ double usrp2_impl::set_tx_dsp_freq(
> +         _tree->access<double>("/mboards/"+mb+"/tick_rate").get();
> +
> +     //calculate the DAC shift (multiples of rate)
> +-    const int sign = boost::math::sign(new_freq);
> +-    const int zone = std::min(boost::math::iround(new_freq/tick_rate), 2);
> +-    const double dac_shift = sign*zone*tick_rate;
> ++    const int zone         = std::max(std::min(std::lround(new_freq / tick_rate), 2), -2);
> ++    const double dac_shift = zone * tick_rate;
> +     new_freq -= dac_shift; //update FPGA DSP target freq
> +     UHD_LOG_TRACE("USRP2",
> +         "DSP Tuning: Requested " + std::to_string(freq_/1e6) + " MHz, Using "
> +-        "Nyquist zone " + std::to_string(sign*zone) + ", leftover DSP tuning: "
> ++        "Nyquist zone " + std::to_string(zone) + ", leftover DSP tuning: "
> +         + std::to_string(new_freq/1e6) + " MHz.");
> +
> +     //set the DAC shift (modulation mode)
> +     if (zone == 0) {
> +         _mbc[mb].codec->set_tx_mod_mode(0); //no shift
> +     } else {
> +-        _mbc[mb].codec->set_tx_mod_mode(sign*4/zone); //DAC interp = 4
> ++        _mbc[mb].codec->set_tx_mod_mode(4 / zone); // DAC interp = 4
> +     }
> +
> +     return _mbc[mb].tx_dsp->set_freq(new_freq) + dac_shift; //actual freq
> +--
> +2.32.0
> +
> diff --git a/package/uhd/0007-usrp2-Use-explicit-template-type-for-std-min-T.patch b/package/uhd/0007-usrp2-Use-explicit-template-type-for-std-min-T.patch
> new file mode 100644
> index 0000000000..3da8370153
> --- /dev/null
> +++ b/package/uhd/0007-usrp2-Use-explicit-template-type-for-std-min-T.patch
> @@ -0,0 +1,28 @@
> +From d1c6290fe9c8b01068abfca6f272e2a1e031b9de Mon Sep 17 00:00:00 2001
> +From: StefanBruens <stefan.bruens@rwth-aachen.de>
> +Date: Wed, 5 May 2021 18:49:40 +0200
> +Subject: [PATCH 004/121] usrp2: Use explicit template type for std::min<T>
> +
> +Signed-off-by: Aaron Rossetto <aaron.rossetto@ni.com>
> +[gwenhael.goavec-merou@trabucayre.com: backport from upstream]
> +Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> +---
> + host/lib/usrp/usrp2/usrp2_impl.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/host/lib/usrp/usrp2/usrp2_impl.cpp b/host/lib/usrp/usrp2/usrp2_impl.cpp
> +index 59fd9849c..e82a9fa71 100644
> +--- a/host/lib/usrp/usrp2/usrp2_impl.cpp
> ++++ b/host/lib/usrp/usrp2/usrp2_impl.cpp
> +@@ -845,7 +845,7 @@ double usrp2_impl::set_tx_dsp_freq(
> +         _tree->access<double>("/mboards/"+mb+"/tick_rate").get();
> +
> +     //calculate the DAC shift (multiples of rate)
> +-    const int zone         = std::max(std::min(std::lround(new_freq / tick_rate), 2), -2);
> ++    const int zone         = std::max(std::min<int>(std::lround(new_freq / tick_rate), 2), -2);
> +     const double dac_shift = zone * tick_rate;
> +     new_freq -= dac_shift; //update FPGA DSP target freq
> +     UHD_LOG_TRACE("USRP2",
> +--
> +2.32.0
> +
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
