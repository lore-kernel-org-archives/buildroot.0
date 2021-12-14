Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA38C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDE1A8141F;
	Tue, 14 Dec 2021 20:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ATkjfawxBu4H; Tue, 14 Dec 2021 20:05:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED989817F5;
	Tue, 14 Dec 2021 20:05:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E51BE1BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3CEF817F5
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mAEz5oLQXStO for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:05:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6ABC28141F
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:05:06 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id r25so66403594edq.7
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6gCMTzlMybmreE/r8/tmVx4CqED1lIrSej1MUeg4CDE=;
 b=gz+d8/qyecc3jJ4FY1JBQnr4G6KE5MpDPhCYoDGCBmGQvfYXWvZq9N+iNKtGCwp7vh
 7XrM10fMqqJE+jHDO4sBrhlgKFMlxYo3Q3j4/dx8Ssxs1d4Hc/fHTbvx2hQxh08+rfNy
 KRkWqM+1nKXq9TNnwo/xaP91NRB2xmDiXpqS5w7sodDHO4zbvIPeSM5s4ZNAPnFa3isK
 9K8XZnJuM4OqY5oBoaHAVXkIc6D0e1VK3YW0c3GReCCJDmm8WX6ENY/McClmNzZvkWDK
 hw/JW1AsZb2F91WLZDiApxBTLJvBazPEnj1wyb+he54iUWZXmHEbcc3tZLPH0mkMsryd
 c3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6gCMTzlMybmreE/r8/tmVx4CqED1lIrSej1MUeg4CDE=;
 b=VxrfVnqtvVCywvVc/W2XezwAunGNx3SvHGyKZ5fTRo42DoDk23qNlDCkv5D1ZBjKGS
 N/ZnapHnY5HQ+Sys9kAWnIUix4X+ASfpqet8MIp1EePUqOsgVkUXyJsH70k8FpdxfgJt
 eB8pNzzKiqz1IKQUGSxvjWQHG/v+vwLAzX29heEurD6NWOUL2vP77U+vFY/nTVRKRq0z
 /htz0Ph99EuUNSpG0Qi0mJKK7ZyfNMz3QEdQHGenTIpM9KPFBKv0yOtJ5ygQLLMuxRGD
 jnfiBd5547sR447WOyz9HSOe/822LOC5dyTP9ZuoU4oP3GiqmvgzB8Fn/LyJze5LroUb
 wGYw==
X-Gm-Message-State: AOAM532Pupd4KS6+lDUThMVpwZ+3Yqye9zPstRvHjKYVJ/FqGkGXIQjP
 476k6tUxVxEWVpVmMiPTyC1qJw==
X-Google-Smtp-Source: ABdhPJyJe7xpt0chdl9qxQ7twaCh7DgCYHq0p0xoDDrCVXvc38CoPEmt4qYzQThZfV+sso04NR2sdQ==
X-Received: by 2002:a17:906:2788:: with SMTP id
 j8mr7958129ejc.203.1639512304353; 
 Tue, 14 Dec 2021 12:05:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id he8sm234454ejc.78.2021.12.14.12.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:05:04 -0800 (PST)
Message-ID: <bf829883-2fa5-182a-d093-f8eb0b192778@mind.be>
Date: Tue, 14 Dec 2021 21:05:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211212210525.1019574-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211212210525.1019574-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/glog: bump to version 0.5.0
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
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/12/2021 22:05, Fabrice Fontaine wrote:
> - Drop patches (already in version)
> - Disable gtest which has been added (and is enabled by default) with
>    https://github.com/google/glog/commit/be25d94c21137fa2fdc53f2dc9c61a94bcf72ba4
> - Update indentation in hash file (two spaces)
> 
> https://github.com/google/glog/releases/tag/v0.5.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...mbolize.cc-fix-build-without-dlfcn.h.patch | 37 ---------
>   ...-utilities-fix-build-without-pthread.patch | 83 -------------------
>   package/glog/glog.hash                        |  4 +-
>   package/glog/glog.mk                          |  3 +-
>   4 files changed, 4 insertions(+), 123 deletions(-)
>   delete mode 100644 package/glog/0001-src-symbolize.cc-fix-build-without-dlfcn.h.patch
>   delete mode 100644 package/glog/0002-src-utilities-fix-build-without-pthread.patch
> 
> diff --git a/package/glog/0001-src-symbolize.cc-fix-build-without-dlfcn.h.patch b/package/glog/0001-src-symbolize.cc-fix-build-without-dlfcn.h.patch
> deleted file mode 100644
> index 73c6e670ed..0000000000
> --- a/package/glog/0001-src-symbolize.cc-fix-build-without-dlfcn.h.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From f71e0899439aaa0e6172243a0862bf8a72a241fc Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Mon, 28 Oct 2019 18:21:55 +0100
> -Subject: [PATCH] src/symbolize.cc: fix build without dlfcn.h
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/google/glog/pull/475]
> ----
> - src/symbolize.cc | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/symbolize.cc b/src/symbolize.cc
> -index 1ffc607..ff027f2 100644
> ---- a/src/symbolize.cc
> -+++ b/src/symbolize.cc
> -@@ -110,7 +110,9 @@ _END_GOOGLE_NAMESPACE_
> -
> - #if defined(__ELF__)
> -
> -+#if defined(HAVE_DLFCN_H)
> - #include <dlfcn.h>
> -+#endif
> - #if defined(OS_OPENBSD)
> - #include <sys/exec_elf.h>
> - #else
> -@@ -832,7 +834,7 @@ static ATTRIBUTE_NOINLINE bool SymbolizeAndDemangle(void *pc, char *out,
> -
> - _END_GOOGLE_NAMESPACE_
> -
> --#elif defined(OS_MACOSX) && defined(HAVE_DLADDR)
> -+#elif defined(OS_MACOSX) && defined(HAVE_DLADDR) && defined(HAVE_DLFCN_H)
> -
> - #include <dlfcn.h>
> - #include <string.h>
> ---
> -2.23.0
> -
> diff --git a/package/glog/0002-src-utilities-fix-build-without-pthread.patch b/package/glog/0002-src-utilities-fix-build-without-pthread.patch
> deleted file mode 100644
> index 503f57a697..0000000000
> --- a/package/glog/0002-src-utilities-fix-build-without-pthread.patch
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -From 9630e0e848da22e27b346c38d9b05f0a16cbf7b3 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Thu, 31 Oct 2019 19:27:16 +0100
> -Subject: [PATCH] src/utilities: fix build without pthread
> -
> -- Remove is_default_thread function which is an internal and not used
> -  function
> -- Remove g_main_thread_id as it was used only by is_default_thread
> -
> -Fixes:
> - - http://autobuild.buildroot.net/results/5320bbe1205e782e3516d9bead8d1ed825bcbaad
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/google/glog/commit/9630e0e848da22e27b346c38d9b05f0a16cbf7b3]
> ----
> - src/utilities.cc | 16 +++-------------
> - src/utilities.h  |  2 --
> - 2 files changed, 3 insertions(+), 15 deletions(-)
> -
> -diff --git a/src/utilities.cc b/src/utilities.cc
> -index d463b33b..9a1e35d0 100644
> ---- a/src/utilities.cc
> -+++ b/src/utilities.cc
> -@@ -61,7 +61,6 @@ using std::string;
> - _START_GOOGLE_NAMESPACE_
> -
> - static const char* g_program_invocation_short_name = NULL;
> --static pthread_t g_main_thread_id;
> -
> - _END_GOOGLE_NAMESPACE_
> -
> -@@ -181,16 +180,6 @@ bool IsGoogleLoggingInitialized() {
> -   return g_program_invocation_short_name != NULL;
> - }
> -
> --bool is_default_thread() {
> --  if (g_program_invocation_short_name == NULL) {
> --    // InitGoogleLogging() not yet called, so unlikely to be in a different
> --    // thread
> --    return true;
> --  } else {
> --    return pthread_equal(pthread_self(), g_main_thread_id);
> --  }
> --}
> --
> - #ifdef OS_WINDOWS
> - struct timeval {
> -   long tv_sec, tv_usec;
> -@@ -276,9 +265,11 @@ pid_t GetTID() {
> -   return getpid();  // Linux:  getpid returns thread ID when gettid is absent
> - #elif defined OS_WINDOWS && !defined OS_CYGWIN
> -   return GetCurrentThreadId();
> --#else
> -+#elif defined(HAVE_PTHREAD)
> -   // If none of the techniques above worked, we use pthread_self().
> -   return (pid_t)(uintptr_t)pthread_self();
> -+#else
> -+  return -1;
> - #endif
> - }
> -
> -@@ -350,7 +341,6 @@ void InitGoogleLoggingUtilities(const char* argv0) {
> -   if (!slash)  slash = strrchr(argv0, '\\');
> - #endif
> -   g_program_invocation_short_name = slash ? slash + 1 : argv0;
> --  g_main_thread_id = pthread_self();
> -
> - #ifdef HAVE_STACKTRACE
> -   InstallFailureFunction(&DumpStackTraceAndExit);
> -diff --git a/src/utilities.h b/src/utilities.h
> -index ca21cfb3..c66f9146 100644
> ---- a/src/utilities.h
> -+++ b/src/utilities.h
> -@@ -163,8 +163,6 @@ const char* ProgramInvocationShortName();
> -
> - bool IsGoogleLoggingInitialized();
> -
> --bool is_default_thread();
> --
> - int64 CycleClock_Now();
> -
> - int64 UsecToCycles(int64 usec);
> diff --git a/package/glog/glog.hash b/package/glog/glog.hash
> index b9ba665400..3f84472967 100644
> --- a/package/glog/glog.hash
> +++ b/package/glog/glog.hash
> @@ -1,5 +1,5 @@
>   # Locally computed
> -sha256 f28359aeba12f30d73d9e4711ef356dc842886968112162bc73002645139c39c  glog-0.4.0.tar.gz
> +sha256  eede71f28371bf39aa69b45de23b329d37214016e2055269b3b5e7cfd40b59f5  glog-0.5.0.tar.gz
>   
>   # Hash for License file:
> -sha256 0fc497129c5c69ff6f22da6933c7e4aaef082fde8437fd57680c2780100772a4  COPYING
> +sha256  0fc497129c5c69ff6f22da6933c7e4aaef082fde8437fd57680c2780100772a4  COPYING
> diff --git a/package/glog/glog.mk b/package/glog/glog.mk
> index 2863e78345..325107fb9e 100644
> --- a/package/glog/glog.mk
> +++ b/package/glog/glog.mk
> @@ -4,12 +4,13 @@
>   #
>   ################################################################################
>   
> -GLOG_VERSION = 0.4.0
> +GLOG_VERSION = 0.5.0
>   GLOG_SITE = $(call github,google,glog,v$(GLOG_VERSION))
>   GLOG_INSTALL_STAGING = YES
>   GLOG_LICENSE = BSD-3-Clause
>   GLOG_LICENSE_FILES = COPYING
>   GLOG_CONF_OPTS = \
> +	-DWITH_GTEST=OFF \
>   	$(if $(BR2_TOOLCHAIN_HAS_THREADS),-DWITH_THREADS=ON, -DWITH_THREADS=OFF)
>   
>   ifeq ($(BR2_PACKAGE_GFLAGS),y)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
