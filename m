Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A35C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5379C400C1;
	Sat,  8 Jan 2022 19:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NAXMuQl_K8nS; Sat,  8 Jan 2022 19:00:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A9DD400E3;
	Sat,  8 Jan 2022 19:00:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D97F1BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AC4640266
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TPgqjqiz-E5f for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:00:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EC0E40255
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 19:00:30 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 x18-20020a7bc212000000b00347cc83ec07so2505037wmi.4
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 11:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=O3nxG+F1yCmE8Uv6aJKKHAo0ED0CZqLCdBEFQgK/uHI=;
 b=QBs0MAifnT5ttTQ7y/0ivj31ZAA7Qy267bzN7cRRFm/mIjb4y8rDjXLk3BggCbT2Hv
 v81aPmi8zIWL9XyazqBuoNwCmpoXtOXbyokEENs4ikLdzJKKdy6P+rgpWdp2jelUwZ9A
 kLSea38JWKXGOXb9vv5p872A/ouR0291hfKbEwoeS7+pgLuRjw+ZrDVWv/9UKzO/QXRc
 uuZOaiI2Wogl6CxwG3tjteSaJVas+HPvitAy73LhgN4Gsk4bGlHJVd4a0RzR94hmcs1V
 LKougF+R3cR/7DWGi5aHKfJladPzumeOz4UTRFDC45ERMZ/NdesDwUgQ14b/px5rVOFs
 W1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=O3nxG+F1yCmE8Uv6aJKKHAo0ED0CZqLCdBEFQgK/uHI=;
 b=Ag0i8T/BPSdKC8q3qXXOvSq9fORipcPwnbcTbD6I5y0R08v1tLRmCl/kbH2RCc3EcN
 YJF6zu1WpORcWX6AurB7ar34CEuhplR6mEkqZqtrMGr/lm3C6enB899XskpSyPVE244p
 tJA04lPl6BBcAm5ufFF2h0gXJFTTbusm2DCE4ml4LZ8z7lo0H95L46hrnBWyzy9GD6zc
 9bmOQJoNWS0ZC1zHzx4noS5tQRM2Q6YbcEIypmb40vc3zAF/Xw7zigb+hF8I36z3iAhW
 q+dZxVPQHicCcr8+aJcoqemQwJ8STZU1M2P3DSGxTpVNIaWApWExubVQC2300bhsvbQL
 GBiw==
X-Gm-Message-State: AOAM531YOZNgTanmmSteCgf0TeHR5OjNGlRHj+2vt4XUugeE8w8Va1Pd
 bgvmP33xOrD3NFfW2OnmHFhH/A==
X-Google-Smtp-Source: ABdhPJxNZIB93V+Vvj8Fc5OhKtQePIwrt94NO6Aj+Kfc2Bq+imDkE9tnJ6f+VN4AH3pHi4/Dsh7gUA==
X-Received: by 2002:a7b:c40b:: with SMTP id k11mr14058064wmi.132.1641668428372; 
 Sat, 08 Jan 2022 11:00:28 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id k19sm2198208wmo.29.2022.01.08.11.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 11:00:28 -0800 (PST)
Message-ID: <ee728679-ed33-323c-ee39-d2987033ca22@mind.be>
Date: Sat, 8 Jan 2022 20:00:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220108175811.2978380-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220108175811.2978380-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/babeltrace2: bump to version
 2.0.4
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/01/2022 18:58, Fabrice Fontaine wrote:
> - Drop second patch (already in version)
> - Update indentation in hash file (two spaces)
> 
> https://github.com/efficios/babeltrace/releases/tag/v2.0.4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...trace_ir_ref.c-rename-user-structure.patch | 57 -------------------
>   package/babeltrace2/babeltrace2.hash          | 12 ++--
>   package/babeltrace2/babeltrace2.mk            |  2 +-
>   3 files changed, 7 insertions(+), 64 deletions(-)
>   delete mode 100644 package/babeltrace2/0002-tests-lib-test_trace_ir_ref.c-rename-user-structure.patch
> 
> diff --git a/package/babeltrace2/0002-tests-lib-test_trace_ir_ref.c-rename-user-structure.patch b/package/babeltrace2/0002-tests-lib-test_trace_ir_ref.c-rename-user-structure.patch
> deleted file mode 100644
> index ac9eee82d8..0000000000
> --- a/package/babeltrace2/0002-tests-lib-test_trace_ir_ref.c-rename-user-structure.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From 7a27f13c192d15cae47740f3e884bba16f15ed41 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 26 Sep 2020 22:03:10 +0200
> -Subject: [PATCH] tests/lib/test_trace_ir_ref.c: rename user structure
> -
> -Rename user structure to bt_user to avoid the following build failure
> -with uclibc:
> -
> -test_trace_ir_ref.c:41:8: error: redefinition of 'struct user'
> - struct user {
> -        ^
> -In file included from /home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/procfs.h:33,
> -                 from /home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/ucontext.h:25,
> -                 from /home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/signal.h:329,
> -                 from /home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0/glib/gbacktrace.h:36,
> -                 from /home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0/glib.h:34,
> -                 from ../../src/common/assert.h:28,
> -                 from ../../src/lib/object.h:28,
> -                 from test_trace_ir_ref.c:25:
> -/home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/user.h:48:8: note: originally defined here
> - struct user
> -        ^~~~
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/e4229e2b9c892b419a9d2eaa6929b80ea62dd130
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/efficios/babeltrace/pull/115]
> ----
> - tests/lib/test_trace_ir_ref.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/tests/lib/test_trace_ir_ref.c b/tests/lib/test_trace_ir_ref.c
> -index d5dfa9cf..70caf29c 100644
> ---- a/tests/lib/test_trace_ir_ref.c
> -+++ b/tests/lib/test_trace_ir_ref.c
> -@@ -25,7 +25,7 @@
> -
> - #define NR_TESTS 37
> -
> --struct user {
> -+struct bt_user {
> - 	bt_trace_class *tc;
> - 	bt_stream_class *sc;
> - 	bt_event_class *ec;
> -@@ -265,7 +265,7 @@ static void test_example_scenario(bt_self_component_source *self_comp)
> - 	bt_stream_class *weak_sc1 = NULL, *weak_sc2 = NULL;
> - 	bt_event_class *weak_ec1 = NULL, *weak_ec2 = NULL,
> - 			*weak_ec3 = NULL;
> --	struct user user_a = { 0 }, user_b = { 0 }, user_c = { 0 };
> -+	struct bt_user user_a = { 0 }, user_b = { 0 }, user_c = { 0 };
> -
> - 	/* The only reference which exists at this point is on TC1. */
> - 	tc1 = create_tc1(self_comp);
> ---
> -2.28.0
> -
> diff --git a/package/babeltrace2/babeltrace2.hash b/package/babeltrace2/babeltrace2.hash
> index 27c47ba26f..164e65cded 100644
> --- a/package/babeltrace2/babeltrace2.hash
> +++ b/package/babeltrace2/babeltrace2.hash
> @@ -1,8 +1,8 @@
> -# From https://www.efficios.com/files/babeltrace/babeltrace2-2.0.3.tar.bz2.sha256
> -sha256 a53625152554102d868ba8395347d0daba0bec9c4b854c3e9bd97c77b0bf04a0  babeltrace2-2.0.3.tar.bz2
> +# From https://www.efficios.com/files/babeltrace/babeltrace2-2.0.4.tar.bz2.sha256
> +sha256  774f116685dab5db9c51577dde43c8c1df482aae6bb78a089b1e9e7c8b489bca  babeltrace2-2.0.4.tar.bz2
>   
>   # Hash for license files
> -sha256 d919c6347409efde6dea63c6f349fb06bc060a2b721fc3df07b5f720b5f1d60e  LICENSE
> -sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
> -sha256 c68fd1ffc1623ea0dace21abf57305818e4998a4ae0c79010aaaa943eb660b55  lgpl-2.1.txt
> -sha256 2f801b7c2494850c3d91da820eb230502dc0192c9d0db024db37ec08d0be1434  mit-license.txt
> +sha256  d919c6347409efde6dea63c6f349fb06bc060a2b721fc3df07b5f720b5f1d60e  LICENSE
> +sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
> +sha256  c68fd1ffc1623ea0dace21abf57305818e4998a4ae0c79010aaaa943eb660b55  lgpl-2.1.txt
> +sha256  2f801b7c2494850c3d91da820eb230502dc0192c9d0db024db37ec08d0be1434  mit-license.txt
> diff --git a/package/babeltrace2/babeltrace2.mk b/package/babeltrace2/babeltrace2.mk
> index 1e03f5fdd2..eedfc72b8c 100644
> --- a/package/babeltrace2/babeltrace2.mk
> +++ b/package/babeltrace2/babeltrace2.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   BABELTRACE2_SITE = https://www.efficios.com/files/babeltrace
> -BABELTRACE2_VERSION = 2.0.3
> +BABELTRACE2_VERSION = 2.0.4
>   BABELTRACE2_SOURCE = babeltrace2-$(BABELTRACE2_VERSION).tar.bz2
>   BABELTRACE2_LICENSE = MIT, LGPL-2.1 (src/common/list.h), GPL-2.0 (test code)
>   BABELTRACE2_LICENSE_FILES = mit-license.txt lgpl-2.1.txt gpl-2.0.txt LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
