Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56281C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0732584A86;
	Wed, 23 Mar 2022 20:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rYteFGPzuFeh; Wed, 23 Mar 2022 20:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19B338475F;
	Wed, 23 Mar 2022 20:25:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C88901BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7A5C8475F
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aySxdZCYb6IF for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:25:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EBAE84317
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:25:37 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id w25so3224720edi.11
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 13:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d0FYVyCtd72ur1D6OXrpA5SaaK1n13H3gO6ADs+74hM=;
 b=a1/HotxHRn4Z5g7qxWj14ZG1JoacWTvgjzQ0JeO3JibKGVp0zn0GGyniHu7FhHaeMl
 7VzwuGry1D7o90B7md3hNPQ5pqJUuA6+ubjvyNtGem+2SX4FAMFwDx8Z4VOGeEYW5cVl
 yxwd9oI9RlUGUzhuad9TewYItzSMuhYiXM+CO6EGinJ9utF99VoG3U5DNKXdYxCmmv2Y
 d5ZfyIa9e/FtB2SCTAhNkk7BJ+28gNf3eW/wtnktfGJtnnrFfr9qom7l/cg9GXCybyX+
 4Rok25koah6CLnCu4uImfIP4vGMIsD8pJhn5JwH4a2/0+OYEmA7vuaumT4YAWsAEAcsJ
 UDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d0FYVyCtd72ur1D6OXrpA5SaaK1n13H3gO6ADs+74hM=;
 b=BhGHuwr+XU08aFdjChKbl6sHy+nAcPZDPmakkLqBrBxRjmKm7nnOD2q6RnqU4KcLQe
 2RTivFeclAV7pgFpz1IejzatzTPceDMSs4aznUE0ii+VuDgpE9+Rgc5ZZ0H9w2nY9cri
 D/22PDc393QbzlpgI9XznrsHR+gFW2ggDiKriNYvS8B5eoOm0LRTDVuIum+CA2AKEx2J
 KOjGq5PHq3rB/pZWNRgjgrde27rC54kLdt8nnRSmAAcMh6pAKHQyVm8mWIE2Weda82T5
 51vrjytvxoZMQCohA+eD5PM0wue6aVdXWLqSb64OztfX29nJHIbC386IQBq0GFIVhzZd
 ksVw==
X-Gm-Message-State: AOAM532oD3eNgryMzwF+qsAeqMmgjLkiaHAUWz7qssbhGlejCET/i3fu
 Tc5wMPQlxiK+d5opPqdEedgCpQ==
X-Google-Smtp-Source: ABdhPJyjTOG+GIRfKsp16GtTSZd4nijQIgAOadprPSMWuZ3xnHVyYwcCyeUKWdANvLOXm1yPWy8YYA==
X-Received: by 2002:a05:6402:5146:b0:415:fd95:6afa with SMTP id
 n6-20020a056402514600b00415fd956afamr2515072edd.200.1648067135879; 
 Wed, 23 Mar 2022 13:25:35 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 u4-20020aa7db84000000b004136c2c357csm398951edt.70.2022.03.23.13.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 13:25:35 -0700 (PDT)
Message-ID: <a8dc4dfb-36e0-51cf-3db9-c9889fa057ed@mind.be>
Date: Wed, 23 Mar 2022 21:25:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220313112633.1125643-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220313112633.1125643-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5base: fix build on sparc
 v8
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/03/2022 12:26, Fabrice Fontaine wrote:
> Fix the following build failure on sparc v8 raised since commit
> 5770a645a3a49a3f0f02972131a4ff5283b4c11e:
> 
> ERROR: detected a std::atomic implementation that fails for function pointers.
> Please apply the patch corresponding to your Standard Library vendor, found in
>    qtbase/config.tests/atomicfptr
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/5a2/5a20e984a5536165056b3fbd93b8712e8ddbeed4/build-end.log
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...figure.json-fix-atomicfptr-detection.patch | 48 +++++++++++++++++++
>   1 file changed, 48 insertions(+)
>   create mode 100644 package/qt5/qt5base/0008-src-corelib-configure.json-fix-atomicfptr-detection.patch
> 
> diff --git a/package/qt5/qt5base/0008-src-corelib-configure.json-fix-atomicfptr-detection.patch b/package/qt5/qt5base/0008-src-corelib-configure.json-fix-atomicfptr-detection.patch
> new file mode 100644
> index 0000000000..5f0f81a4bd
> --- /dev/null
> +++ b/package/qt5/qt5base/0008-src-corelib-configure.json-fix-atomicfptr-detection.patch
> @@ -0,0 +1,48 @@
> +From e9d1f80dffb4e29e44fc0b0627704af15cdd281a Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 13 Mar 2022 12:05:04 +0100
> +Subject: [PATCH] src/corelib/configure.json: fix atomicfptr detection
> +
> +Fix atomicfptr detection on sparc v8 by linking with libatomic if needed
> +to avoid the following build failure:
> +
> +/sysroot -std=gnu++11 -w -fPIC  -I. -I/home/peko/autobuild/instance-0/output-1/build/qt5base-d16bf02a11953dcac01dca73e6f3778f293adefe/mkspecs/devices/linux-buildroot-g++ -o main.o main.cpp
> +> /home/peko/autobuild/instance-0/output-1/host/bin/sparc-linux-g++ --sysroot=/home/peko/autobuild/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot --sysroot=/home/peko/autobuild/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot -Wl,-O1 -o atomicfptr main.o   -lexecinfo  -lrt -lpthread -ldl
> +> /home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: main.o: in function `test(std::atomic<void (*)(int)> volatile&)':
> +> main.cpp:(.text+0x40): undefined reference to `__atomic_compare_exchange_4'
> +> collect2: error: ld returned 1 exit status
> +> make[1]: *** [Makefile:69: atomicfptr] Error 1
> +
> +[...]
> +
> +ERROR: detected a std::atomic implementation that fails for function pointers.
> +Please apply the patch corresponding to your Standard Library vendor, found in
> +  qtbase/config.tests/atomicfptr
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/5a20e984a5536165056b3fbd93b8712e8ddbeed4
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://invent.kde.org/qt/qt/qtbase/-/merge_requests/138]
> +---
> + src/corelib/configure.json | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/corelib/configure.json b/src/corelib/configure.json
> +index 9b5d19d41b..ac88f5856c 100644
> +--- a/src/corelib/configure.json
> ++++ b/src/corelib/configure.json
> +@@ -309,7 +309,8 @@
> +                     "test(fptr);"
> +                 ],
> +                 "qmake": "CONFIG += c++11"
> +-            }
> ++            },
> ++            "use": "libatomic"
> +         },
> +         "clock-monotonic": {
> +             "label": "POSIX monotonic clock",
> +--
> +2.34.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
