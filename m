Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45058C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA39D408C4;
	Mon, 14 Feb 2022 20:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZV9EsBrrMp2; Mon, 14 Feb 2022 20:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB6104023E;
	Mon, 14 Feb 2022 20:14:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FBC71BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BA9540580
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q2lz5TWJkiTc for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:13:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 993EB4057F
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:13:54 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so145698wmq.3
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=VbnRVYftSBjlc/MNx2kSiuhvMsvfHu/aibA0vty8D0k=;
 b=CvS4tKzLGCJhUPEgyuRokUNFQePazdUCiyksM6U+sPAo6WZZkbPXjSVJfCWlbRSQHy
 BXDw9ewoYTlR1kz7nFXRJTpllB1L+z2he1buHO127VOkPyB5YosVRgj4yExhxxCeOQBI
 XPTcQWWzQogrl6S92gG3nkoilfhh2lyLTtSEoQ5pSv6D35Smzl4DTf6n/E/a0Tz8zTti
 RRkYujpShsWjyXY5yFPKmq6YC0PZX0GPcWuu+ql02eYoXYz36KZLoE3BCJGjnweKU2S4
 EYhy0bb0P2wNTfwrSgMCEpR6B3spUW+1nWFYEOklShGjSJQ1NfBsV3k1Vaehrsq2VFfh
 rcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VbnRVYftSBjlc/MNx2kSiuhvMsvfHu/aibA0vty8D0k=;
 b=kyuTQFK+75wzP1pHpsyDEpd+TUoXX6Lc9lVyGZ3BIW780Ee6hKyxRt4mpgO8Z36Ij3
 Qth2ae6al7kSIKmw5Ts4mm10/QmZxlQ7aHSUxrWJLkDP382z399PyCltLCu8s2YSrs93
 tKX5z6yVYrjALtgZd7v0HAjAVUpwUCK24swlVSEQhSWI8dVl5a4/PVk3rbkNuR7Ifao3
 HBn3k/q3djaTB38lj5TXLIdgcvfHSxb4Bw0cqyqU4ZFoFiv21w1ak/mUS9qEpT47QKVJ
 x/73mIVYx0LXhNFeWT5QrVVuiq9MB7zzlNbWy6iM4hdz3Gca+Dzv+oeWv6k2znzAri1+
 wMew==
X-Gm-Message-State: AOAM530Ts9ndrWpk6D3TP1p4oX+dzsoyyl1SUYrotWAWhDkkdCUIa450
 MuoB4odQjpsAzr1rMJbLSscZXQ==
X-Google-Smtp-Source: ABdhPJyhEXBYnCMmW+RlcwrxSiMpQ8+XePP3Xe2FOZWhMWxjfD4wAMg5v/GRfgaTeyJTsPUIhvyLmg==
X-Received: by 2002:a7b:c459:0:b0:34f:d1bc:2aea with SMTP id
 l25-20020a7bc459000000b0034fd1bc2aeamr344864wmi.144.1644869632779; 
 Mon, 14 Feb 2022 12:13:52 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u11sm28605631wrt.108.2022.02.14.12.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:13:52 -0800 (PST)
Message-ID: <77e919af-fe0e-2878-4f79-826b486c911a@mind.be>
Date: Mon, 14 Feb 2022 21:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220208182929.3976984-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220208182929.3976984-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/resiprocate: fix build of rend
 with gcc 11
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



On 08/02/2022 19:29, Fabrice Fontaine wrote:
> Fix the following build failure of rend with gcc 11:
> 
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/riscv32-buildroot-linux-gnu/include/c++/11.2.0/bits/stl_tree.h:770:15: error: static assertion failed: comparison object must be invocable as const
>    770 |               is_invocable_v<const _Compare&, const _Key&, const _Key&>,
>        |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ad9d89fefe1a667daa123397a072bf130bfa03a7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...e-issue-compiling-with-Visual-Studio.patch | 95 +++++++++++++++++++
>   1 file changed, 95 insertions(+)
>   create mode 100644 package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch
> 
> diff --git a/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch b/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch
> new file mode 100644
> index 0000000000..826774ce8d
> --- /dev/null
> +++ b/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch
> @@ -0,0 +1,95 @@
> +From be76b10a50749e2e11dce8dcc38b414a7f9d8747 Mon Sep 17 00:00:00 2001
> +From: Ben Walden <bwalden@redboxvoice.com>
> +Date: Sat, 22 Aug 2020 23:14:11 +0100
> +Subject: [PATCH] Fix some issue compiling with Visual Studio 16.7.0 and tidy
> + up Visual Studio 16 project files
> +
> +[Retrieved (and updated to keep only RendKa.cxx update) from:
> +https://github.com/resiprocate/resiprocate/commit/be76b10a50749e2e11dce8dcc38b414a7f9d8747]
> +SIgned-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + VisualStudioReadme.htm                        |   65 +
> + contrib/GeoIP/GeoIP_12_0.vcxproj              |  550 -------
> + contrib/GeoIP/GeoIP_16_0.vcxproj              |   93 +-
> + .../db/build_windows/db_static_12_0.vcxproj   | 1260 -----------------
> + .../db/build_windows/db_static_16_0.vcxproj   |  696 +--------
> + contrib/db/dbinc/atomic.h                     |    4 +-
> + contrib/db/mp/mp_fget.c                       |    4 +-
> + contrib/db/mp/mp_mvcc.c                       |    4 +-
> + contrib/db/mp/mp_region.c                     |    4 +-
> + contrib/db/mutex/mut_method.c                 |    2 +-
> + contrib/pcre/pcre_12_0.vcxproj                |  466 ------
> + contrib/pcre/pcre_16_0.vcxproj                |  159 +--
> + contrib/popt/popt_12_0.vcxproj                |  394 ------
> + contrib/popt/popt_16_0.vcxproj                |  120 +-
> + reSIProcate_16_0.sln                          |   58 +-
> + .../queuetostream_12_0.vcxproj                |  582 --------
> + .../queuetostream_16_0.vcxproj                |  207 ++-
> + repro/repro_12_0.vcxproj                      |  825 -----------
> + repro/repro_12_0.vcxproj.filters              |   47 -
> + repro/repro_16_0.vcxproj                      |  159 ++-
> + repro/reprocmd/reprocmd_12_0.vcxproj          |  597 --------
> + repro/reprocmd/reprocmd_16_0.vcxproj          |  139 +-
> + repro/reprolib_12_0.vcxproj                   |  596 --------
> + repro/reprolib_12_0.vcxproj.filters           |  136 --
> + repro/reprolib_16_0.vcxproj                   |  132 +-
> + resip/dum/dum_12_0.vcxproj                    |  615 --------
> + resip/dum/dum_16_0.vcxproj                    |  124 +-
> + resip/dum/test/basicCall_12_0.vcxproj         |  621 --------
> + resip/dum/test/basicCall_16_0.vcxproj         |  145 +-
> + resip/dum/test/basicClient_12_0.vcxproj       |  653 ---------
> + resip/dum/test/basicClient_16_0.vcxproj       |  158 +--
> + resip/dum/test/basicMessage_12_0.vcxproj      |  615 --------
> + resip/dum/test/basicMessage_16_0.vcxproj      |  141 +-
> + resip/dum/test/basicRegister_12_0.vcxproj     |  615 --------
> + resip/dum/test/basicRegister_16_0.vcxproj     |  137 +-
> + resip/rend/RendKa.cxx                         |    2 +-
> + resip/rend/rend_12_0.vcxproj                  |  352 -----
> + resip/rend/rend_16_0.vcxproj                  |   89 +-
> + resip/stack/resiprocate_12_0.vcxproj          |  873 ------------
> + resip/stack/resiprocate_12_0.vcxproj.filters  |  351 -----
> + resip/stack/resiprocate_16_0.vcxproj          |  165 ++-
> + resip/stack/test/test_12_0.vcxproj            |  627 --------
> + resip/stack/test/test_16_0.vcxproj            |  171 ++-
> + rutil/dns/ares/ares_12_0.vcxproj              |  488 -------
> + rutil/dns/ares/ares_12_0.vcxproj.filters      |   34 -
> + rutil/dns/ares/ares_16_0.vcxproj              |  159 +--
> + rutil/rutil_12_0.vcxproj                      |  604 --------
> + rutil/rutil_16_0.vcxproj                      |  153 +-
> + 48 files changed, 1409 insertions(+), 13782 deletions(-)
> + delete mode 100644 contrib/GeoIP/GeoIP_12_0.vcxproj
> + delete mode 100644 contrib/db/build_windows/db_static_12_0.vcxproj
> + delete mode 100644 contrib/pcre/pcre_12_0.vcxproj
> + delete mode 100644 contrib/popt/popt_12_0.vcxproj
> + delete mode 100644 repro/accountingconsumers/queuetostream_12_0.vcxproj
> + delete mode 100644 repro/repro_12_0.vcxproj
> + delete mode 100644 repro/repro_12_0.vcxproj.filters
> + delete mode 100644 repro/reprocmd/reprocmd_12_0.vcxproj
> + delete mode 100644 repro/reprolib_12_0.vcxproj
> + delete mode 100644 repro/reprolib_12_0.vcxproj.filters
> + delete mode 100644 resip/dum/dum_12_0.vcxproj
> + delete mode 100644 resip/dum/test/basicCall_12_0.vcxproj
> + delete mode 100644 resip/dum/test/basicClient_12_0.vcxproj
> + delete mode 100644 resip/dum/test/basicMessage_12_0.vcxproj
> + delete mode 100644 resip/dum/test/basicRegister_12_0.vcxproj
> + delete mode 100644 resip/rend/rend_12_0.vcxproj
> + delete mode 100644 resip/stack/resiprocate_12_0.vcxproj
> + delete mode 100644 resip/stack/resiprocate_12_0.vcxproj.filters
> + delete mode 100644 resip/stack/test/test_12_0.vcxproj
> + delete mode 100644 rutil/dns/ares/ares_12_0.vcxproj
> + delete mode 100644 rutil/dns/ares/ares_12_0.vcxproj.filters
> + delete mode 100644 rutil/rutil_12_0.vcxproj
> +
> +diff --git a/resip/rend/RendKa.cxx b/resip/rend/RendKa.cxx
> +index 8645f17636..8321ada1ee 100644
> +--- a/resip/rend/RendKa.cxx
> ++++ b/resip/rend/RendKa.cxx
> +@@ -66,7 +66,7 @@ bool operator<(const RendKaAssoc& a, const RendKaAssoc& b)
> +
> + struct RendKaConn
> + {
> +-   bool operator() (const RendKaAssocPtr& a, const RendKaAssocPtr& b)
> ++   bool operator()(const RendKaAssocPtr& a, const RendKaAssocPtr& b) const
> +    {
> +       return *a < *b;
> +    }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
