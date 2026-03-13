Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D582107BCCE
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 17:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A95FE81098;
	Fri, 13 Mar 2026 17:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExorEbQ6VJpE; Fri, 13 Mar 2026 17:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7BC180BB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773421600;
	bh=snSnNbVzzjO5ESFlqb2xJfss0euVs7lhWOWazKxFQMY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=qZGsLM5wFrW2douL8QNfXasT6+HFmk6S5Qwzps6dLgOBIb+4ERI9F3mLFLxXeBIoK
	 zoTYr4yK2QAA02SzGI3+QitsAtvGEVZRGJjZ4IUo3IbmKYjbFw7fRafcEk43QckVyz
	 tuKF/3cYRPLvsIWEoTRzDueNb6OLKqWSa6A01U/rBTs5pnvPiR8MWSfXqYDJTAfZSn
	 8ebrXMU/UuWUJQezKm8wBxgfpyFNlm6FHscaqmq1p4dGYM12Yy2dK7gP8s1armr00b
	 ESW0Kox6yYxQSO+mKm6gxhYjTqKMagEp6x95SyRn85/5JXTqI5AQFuXAOAHCv/1DCn
	 lwYsP8vcZjLCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7BC180BB4;
	Fri, 13 Mar 2026 17:06:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 157FF1AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 17:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06CB640BD3
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 17:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-4SCRyiW5TO for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 17:06:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37D6640BCB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37D6640BCB
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37D6640BCB
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 17:06:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3DJv-1w2TXo3QVx-003vQZ; Fri, 13
 Mar 2026 18:06:34 +0100
Message-ID: <402fa802-4fd9-49a8-926a-ce9dbde5ce5e@gmx.de>
Date: Fri, 13 Mar 2026 19:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
References: <20260313110739.90948-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260313110739.90948-1-chakrabortyshubham66@gmail.com>
X-Provags-ID: V03:K1:ozzZJUN4iOsUzPamZciqa5nDVWUiTL/ZxYldLkaegKgi1BvvzgZ
 ZdltNShoFjdBFr/YRjasXEExZdxgcVfqn7rXRGTtMVx+Q1e1Ax4kiG+RBl3QfgVKwvAfrTS
 4DC7R7ObEnsdm0gFcF0CCSsltyQpSQz9ewA4bwvHgOTX6cMfClqyLCg4XbvpxrcmVSRehd0
 p58cYLg9zNonEGty7e/Jw==
UI-OutboundReport: notjunk:1;M01:P0:ryzrgP8TGhw=;RipuV+B8P2ZIEK6maJ9ToHpCxNJ
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1773421594; x=1774026394; i=fiona.klute@gmx.de;
 bh=vEGdAK9jukybikcCTy4/AbN3cvhkfJpigUYenTNJQgA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=UPa5BdPZtt5R0KVcdyCZlVfu+1hgVWcBJNjUMa46qE4BCEtGizZPG0oUc6oL/UAo
 kQWZQ9WXaCGcGlnKzZfvvLH6z3DiB3KGiutObN+zJQkSu/LzI3pMwn94aT5NTELsu
 oB2fR055atoYN14ckchbbbM3iPlLFOw8kMJ/BlW559vs048Cskd3t+W9K7N2vPt/m
 PYKLLlrTT6m/JoFY7kFvTAAwmEVwRelLiq1Ul0yrbmTyWEJ0rgP8POmkO0pTYGX8m
 XEt1bdICOIChCiHZ3XaL6Zu/x6xxkVqh2EnMDYSxdFuvoHZqzD4enwkabXyyq9T0r
 s5f8oQerUeWTdm+QlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=UPa5BdPZ
Subject: Re: [Buildroot] [PATCH] package/host-ccache: force use of
 BR_CACHE_DIR instead of user directories
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 13.03.26 um 13:07 schrieb Shubham Chakraborty:
> Override ccache's default cache directory paths to use Buildroot's
> BR_CACHE_DIR environment variable instead of CCACHE_DIR and XDG
> standard directories.
> 
> By default, ccache stores its cache in user home directories
> (~/.ccache, ~/.cache/ccache, ~/.config/ccache) based on XDG_CACHE_HOME
> and XDG_CONFIG_HOME environment variables. This causes issues in
> Buildroot because:
> 
>   - Pollutes user home directories during builds
>   - Breaks reproducibility across different build environments
>   - Complicates cache management in CI/CD systems
>   - May cause permission issues in shared build systems

Under what circumstances can these issues appear? I've done many 
Buildroot builds with CCache enabled and haven't encountered any of 
them. HOST_CCACHE_PATCH_CONFIGURATION should already be doing what you 
describe as the purpose of the new patch, if that's not working 
understanding why seems important.

Best regards,
Fiona

> This patch modifies ccache source to:
>   - Replace util::getenv_path("CCACHE_DIR") with "BR_CACHE_DIR"
>   - Replace hardcoded paths (.ccache, .cache/ccache, .config/ccache)
>     with Buildroot's HOST_CCACHE_DEFAULT_CCACHE_DIR
>   - Disable XDG_CACHE_HOME, XDG_CONFIG_HOME, and XDG_RUNTIME_DIR lookups
>   - Update command-line option handling to use BR_CACHE_DIR
> 
> This ensures ccache respects Buildroot's cache directory configuration
> and avoids user home directory pollution.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>   ...ost-ccache-force-use-of-BR_CACHE_DIR.patch | 108 ++++++++++++++++++
>   package/ccache/ccache.mk                      |  11 +-
>   2 files changed, 110 insertions(+), 9 deletions(-)
>   create mode 100644 package/ccache/0001-package-host-ccache-force-use-of-BR_CACHE_DIR.patch
> 
> diff --git a/package/ccache/0001-package-host-ccache-force-use-of-BR_CACHE_DIR.patch b/package/ccache/0001-package-host-ccache-force-use-of-BR_CACHE_DIR.patch
> new file mode 100644
> index 0000000000..a990c43dd2
> --- /dev/null
> +++ b/package/ccache/0001-package-host-ccache-force-use-of-BR_CACHE_DIR.patch
> @@ -0,0 +1,108 @@
> +From 5140c64cdd2d469ff5be7f94cc11de928cbe585a Mon Sep 17 00:00:00 2001
> +From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +Date: Fri, 13 Mar 2026 15:38:53 +0530
> +Subject: [PATCH] package/host-ccache: force use of BR_CACHE_DIR.
> +
> +Override ccache's default cache directory paths to use Buildroot's
> +BR_CACHE_DIR environment variable instead of CCACHE_DIR and XDG
> +standard directories.
> +
> +By default, ccache stores its cache in user home directories
> +(~/.ccache, ~/.cache/ccache, ~/.config/ccache) based on XDG_CACHE_HOME
> +and XDG_CONFIG_HOME environment variables. This causes issues in
> +Buildroot because:
> +
> + - Pollutes user home directories during builds
> + - Breaks reproducibility across different build environments
> + - Complicates cache management in CI/CD systems
> + - May cause permission issues in shared build systems
> +
> +This patch modifies ccache source to:
> + - Replace util::getenv_path("CCACHE_DIR") with "BR_CACHE_DIR"
> + - Replace hardcoded paths (.ccache, .cache/ccache, .config/ccache)
> +   with Buildroot's HOST_CCACHE_DEFAULT_CCACHE_DIR
> + - Disable XDG_CACHE_HOME, XDG_CONFIG_HOME, and XDG_RUNTIME_DIR lookups
> + - Update command-line option handling to use BR_CACHE_DIR
> +
> +This ensures ccache respects Buildroot's cache directory configuration
> +and avoids user home directory pollution.
> +
> +Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> +---
> + src/ccache/config.cpp           | 14 +++++++-------
> + src/ccache/core/mainoptions.cpp |  2 +-
> + 2 files changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/ccache/config.cpp b/src/ccache/config.cpp
> +index a4f67d8..1a6e130 100644
> +--- a/src/ccache/config.cpp
> ++++ b/src/ccache/config.cpp
> +@@ -500,7 +500,7 @@ default_cache_dir(const fs::path& home_dir)
> + #  ifdef __APPLE__
> +   return home_dir / "Library/Caches/ccache";
> + #  else
> +-  return home_dir / ".cache/ccache";
> ++  return home_dir / HOST_CCACHE_DEFAULT_CCACHE_DIR;
> + #  endif
> + }
> +
> +@@ -510,7 +510,7 @@ default_config_dir(const fs::path& home_dir)
> + #  ifdef __APPLE__
> +   return home_dir / "Library/Preferences/ccache";
> + #  else
> +-  return home_dir / ".config/ccache";
> ++  return home_dir / HOST_CCACHE_DEFAULT_CCACHE_DIR;
> + #  endif
> + }
> +
> +@@ -598,13 +598,13 @@ Config::read(const std::vector<std::string>& cmdline_config_settings)
> +     create_cmdline_settings_map(cmdline_config_settings);
> +
> +   const fs::path home_dir = home_directory();
> +-  const util::DirEntry legacy_ccache_dir = home_dir / ".ccache";
> ++  const util::DirEntry legacy_ccache_dir = home_dir / HOST_CCACHE_DEFAULT_CCACHE_DIR;
> + #ifdef _WIN32
> +   auto env_appdata = util::getenv_path("APPDATA");
> +   auto env_local_appdata = util::getenv_path("LOCALAPPDATA");
> + #else
> +-  auto env_xdg_cache_home = util::getenv_path("XDG_CACHE_HOME");
> +-  auto env_xdg_config_home = util::getenv_path("XDG_CONFIG_HOME");
> ++  auto env_xdg_cache_home = std::optional<fs::path>(std::nullopt);
> ++  auto env_xdg_config_home = std::optional<fs::path>(std::nullopt);
> + #endif
> +
> +   auto env_ccache_configpath = util::getenv_path("CCACHE_CONFIGPATH");
> +@@ -627,7 +627,7 @@ Config::read(const std::vector<std::string>& cmdline_config_settings)
> +     // A missing config file in SYSCONFDIR is OK so don't check return value.
> +     update_from_file(system_config_path());
> +
> +-    auto env_ccache_dir = util::getenv_path("CCACHE_DIR");
> ++    auto env_ccache_dir = util::getenv_path("BR_CACHE_DIR");
> +     auto cmdline_cache_dir = cmdline_settings_map.find("cache_dir");
> +
> +     fs::path config_dir;
> +@@ -1232,7 +1232,7 @@ Config::default_temporary_dir() const
> + {
> +   static const fs::path run_user_tmp_dir = [] {
> + #ifndef _WIN32
> +-    const char* const xdg_runtime_dir = getenv("XDG_RUNTIME_DIR");
> ++    const char* const xdg_runtime_dir = nullptr;
> +     if (xdg_runtime_dir && DirEntry(xdg_runtime_dir).is_directory()) {
> +       fs::path dir = FMT("{}/ccache-tmp", xdg_runtime_dir);
> +       if (fs::create_directories(dir) && access(dir.c_str(), W_OK) == 0) {
> +diff --git a/src/ccache/core/mainoptions.cpp b/src/ccache/core/mainoptions.cpp
> +index d253ebc..9ad2824 100644
> +--- a/src/ccache/core/mainoptions.cpp
> ++++ b/src/ccache/core/mainoptions.cpp
> +@@ -527,7 +527,7 @@ process_main_options(int argc, const char* const* argv)
> +
> +     switch (c) {
> +     case 'd': // --dir
> +-      util::setenv("CCACHE_DIR", arg);
> ++      util::setenv("BR_CACHE_DIR", arg);
> +       break;
> +     case FORMAT:
> +       if (arg == "tab") {
> +--
> +2.53.0
> +
> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> index 30f87f7d90..f2f73a115d 100644
> --- a/package/ccache/ccache.mk
> +++ b/package/ccache/ccache.mk
> @@ -42,16 +42,9 @@ HOST_CCACHE_CONF_OPTS += \
>   #    so rewrite BR_CACHE_DIR to take that into consideration for SDK purpose
>   HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,%,$(BR_CACHE_DIR))
>   
> -define HOST_CCACHE_PATCH_CONFIGURATION
> -	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/ccache/config.cpp
> -	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/config.cpp
> -	sed -i 's,"/.cache/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/config.cpp
> -	sed -i 's,"/.config/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/config.cpp
> -	sed -i 's,getenv("XDG_CACHE_HOME"),nullptr,' $(@D)/src/ccache/config.cpp
> -	sed -i 's,getenv("XDG_CONFIG_HOME"),nullptr,' $(@D)/src/ccache/config.cpp
> -endef
> +HOST_CCACHE_CONF_OPTS += \
> +	-DCMAKE_CXX_FLAGS='$(HOST_CXXFLAGS) -DHOST_CCACHE_DEFAULT_CCACHE_DIR=\"$(HOST_CCACHE_DEFAULT_CCACHE_DIR)\"'
>   
> -HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
>   
>   define HOST_CCACHE_MAKE_CACHE_DIR
>   	mkdir -p $(BR_CACHE_DIR)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
