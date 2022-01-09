Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BEEC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06C0F40385;
	Sun,  9 Jan 2022 22:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YUTCvrBclGJd; Sun,  9 Jan 2022 22:46:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD97340439;
	Sun,  9 Jan 2022 22:46:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C4691BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AB6060B87
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bZOiqKxWfuUy for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:46:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3552860B71
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:46:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so6204385wme.4
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=08KD7jQ6usLO92dWSyuZvMiCTEyqg/pybl9RHMbxPPo=;
 b=e7B3/PKEYDYf4GZT87DoNrW4O+tHMk6tmrJLboVzEhFKASDOTSxtGnwJQGnp5bgC7S
 5PIa20FwMd1Y6ZraFUYYl/eHPYnh5I0LAK0NT0Z09rk+2mLo554edBXDIzTZuR5fTtme
 SFFNDQ8mx997eFxTQOmUzCr/TvIQcDfx4MDxcT5cLRREPf/2nwepYvyTvPHWX87bt/f8
 yWvsXD3EEc4m4aD3vjfv/YcURxDGNsrLWMJWu6VDPM1tqbSH1J3Z/ieWC9WzL6i4T/0P
 kCCg0MKpFCzoXeVm4QYAGW9rno5xW5ZTLe7TBHZOHXPA0LNc5Ww/rwI8fXZ+HwiIdgvz
 UXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=08KD7jQ6usLO92dWSyuZvMiCTEyqg/pybl9RHMbxPPo=;
 b=Zfp/q46VkkbbpfCkdqTY1pzwKDn9+ga3PLeKxki5A/fI/CqD4VyA6nEuXa31q2q8bS
 JplsnjMA4MiXG6nyh7RGxMcg5zt1ltic+T10oWrnpJNPWbE3eHON/EyonIXJgo1rcgT9
 JTT2HykfIGS5BzFMZkqpaNgtXp0V27DP0C3VnQM6XrYCP1Xm4SObDznvZ+TNIaN/57/B
 E/LRzHXDB4h6dvaP1l2wx4SXbGz9oi8T2L0PKNwPivlRZh0shrG51xfwX+peapUhEq8O
 BdjO4lLwsaeNjHRzLcTw0GGAXO/FZrCOAFy1TuoZx5xDfOAJ3tz8G9F9jVHiQHzcdQSK
 QhSg==
X-Gm-Message-State: AOAM530UHxcN1CJLPVlI2evKxmGbkjGZKPfF1ejCiUAzKNce+Ju6pN+e
 oQAPIc9tricjwnsMA8F7ReyviK1v3dhFsHlD
X-Google-Smtp-Source: ABdhPJz+xM/ym0pbawizqWuggU4eNa1jBN/swCVTYGjADJnHirmiH5MTvmudRkxSBgs+yttdng3fjg==
X-Received: by 2002:a1c:c915:: with SMTP id f21mr19594562wmb.39.1641768370481; 
 Sun, 09 Jan 2022 14:46:10 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id u12sm4990215wrf.60.2022.01.09.14.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 14:46:10 -0800 (PST)
Message-ID: <77b3c32f-3794-7504-de10-6c9a11beeb24@mind.be>
Date: Sun, 9 Jan 2022 23:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220108230259.3703237-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220108230259.3703237-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libsigrok: fix C++ build with
 glibmm 2.68
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/01/2022 00:02, Fabrice Fontaine wrote:
> cxx bindings are, silently, disabled since bump of glibmm to version
> 2.68.2 in commit dddb65efbdf2c7952f22a1e51009f17f1676db4a resulting in
> the following build failure with pulseview:
> 
> --   Package 'libsigrokcxx', required by 'virtual:world', not found
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ebb73892fd7471de4f0c109554dfdc65b93d3dcf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../libsigrok/0001-Support-glibmm-2.68.patch  | 129 ++++++++++++++++++
>   package/libsigrok/libsigrok.mk                |   3 +
>   2 files changed, 132 insertions(+)
>   create mode 100644 package/libsigrok/0001-Support-glibmm-2.68.patch
> 
> diff --git a/package/libsigrok/0001-Support-glibmm-2.68.patch b/package/libsigrok/0001-Support-glibmm-2.68.patch
> new file mode 100644
> index 0000000000..14d14ec406
> --- /dev/null
> +++ b/package/libsigrok/0001-Support-glibmm-2.68.patch
> @@ -0,0 +1,129 @@
> +From 31ad5ec50ec0c9cc7a92f009925c5f58aecdcce1 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 30 Dec 2021 14:58:11 +0100
> +Subject: [PATCH] Support glibmm 2.68
> +
> +Support glibmm 2.68 which has been released one year ago and is the
> +first stable release in the glibmm-2.68 ABI series:
> +https://gitlab.gnome.org/GNOME/glibmm/-/blob/2.68.2/NEWS
> +
> +As TimeVal is not available with glibmm 2.68, use DateTime which is
> +available since version 2.26
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://sourceforge.net/p/sigrok/mailman/message/37410614]
> +---
> + README                                             |  2 +-
> + bindings/cxx/classes.cpp                           | 13 ++++++-------
> + bindings/cxx/include/libsigrokcxx/libsigrokcxx.hpp |  4 ++--
> + bindings/cxx/libsigrokcxx.pc.in                    |  2 +-
> + configure.ac                                       |  7 ++++++-
> + 5 files changed, 16 insertions(+), 12 deletions(-)
> +
> +diff --git a/README b/README
> +index 768c8ca2..2515f059 100644
> +--- a/README
> ++++ b/README
> +@@ -63,7 +63,7 @@ Requirements for the C++ bindings:
> +  - doxygen (required for building the bindings, not only for C++ API docs!)
> +  - graphviz (optional, only needed for the C++ API docs)
> +  - Python (2 or 3) executable (development files are not needed)
> +- - glibmm-2.4 (>= 2.32.0)
> ++ - glibmm-2.4 (>= 2.32.0) or glibmm-2.68 (>= 2.68.0)
> +
> + Requirements for the Python bindings:
> +
> +diff --git a/bindings/cxx/classes.cpp b/bindings/cxx/classes.cpp
> +index f9f79273..de600d03 100644
> +--- a/bindings/cxx/classes.cpp
> ++++ b/bindings/cxx/classes.cpp
> +@@ -287,12 +287,12 @@ shared_ptr<UserDevice> Context::create_user_device(
> + 		default_delete<UserDevice>{}};
> + }
> +
> +-shared_ptr<Packet> Context::create_header_packet(Glib::TimeVal start_time)
> ++shared_ptr<Packet> Context::create_header_packet(Glib::DateTime start_time)
> + {
> + 	auto header = g_new(struct sr_datafeed_header, 1);
> + 	header->feed_version = 1;
> +-	header->starttime.tv_sec = start_time.tv_sec;
> +-	header->starttime.tv_usec = start_time.tv_usec;
> ++	header->starttime.tv_sec = start_time.to_unix();
> ++	header->starttime.tv_usec = start_time.get_microsecond();
> + 	auto packet = g_new(struct sr_datafeed_packet, 1);
> + 	packet->type = SR_DF_HEADER;
> + 	packet->payload = header;
> +@@ -1154,11 +1154,10 @@ int Header::feed_version() const
> + 	return _structure->feed_version;
> + }
> +
> +-Glib::TimeVal Header::start_time() const
> ++Glib::DateTime Header::start_time() const
> + {
> +-	return Glib::TimeVal(
> +-		_structure->starttime.tv_sec,
> +-		_structure->starttime.tv_usec);
> ++	Glib::DateTime time = Glib::DateTime::create_now_utc(_structure->starttime.tv_sec);
> ++	return time.add_seconds(_structure->starttime.tv_usec / 1.0e6);
> + }
> +
> + Meta::Meta(const struct sr_datafeed_meta *structure) :
> +diff --git a/bindings/cxx/include/libsigrokcxx/libsigrokcxx.hpp b/bindings/cxx/include/libsigrokcxx/libsigrokcxx.hpp
> +index 97e54e17..d090c379 100644
> +--- a/bindings/cxx/include/libsigrokcxx/libsigrokcxx.hpp
> ++++ b/bindings/cxx/include/libsigrokcxx/libsigrokcxx.hpp
> +@@ -274,7 +274,7 @@ public:
> + 	std::shared_ptr<UserDevice> create_user_device(
> + 		std::string vendor, std::string model, std::string version);
> + 	/** Create a header packet. */
> +-	std::shared_ptr<Packet> create_header_packet(Glib::TimeVal start_time);
> ++	std::shared_ptr<Packet> create_header_packet(Glib::DateTime start_time);
> + 	/** Create a meta packet. */
> + 	std::shared_ptr<Packet> create_meta_packet(
> + 		std::map<const ConfigKey *, Glib::VariantBase> config);
> +@@ -711,7 +711,7 @@ public:
> + 	/* Feed version number. */
> + 	int feed_version() const;
> + 	/* Start time of this session. */
> +-	Glib::TimeVal start_time() const;
> ++	Glib::DateTime start_time() const;
> + private:
> + 	explicit Header(const struct sr_datafeed_header *structure);
> + 	~Header();
> +diff --git a/bindings/cxx/libsigrokcxx.pc.in b/bindings/cxx/libsigrokcxx.pc.in
> +index 10a92f2d..7d2723fc 100644
> +--- a/bindings/cxx/libsigrokcxx.pc.in
> ++++ b/bindings/cxx/libsigrokcxx.pc.in
> +@@ -6,7 +6,7 @@ includedir=@includedir@
> + Name: libsigrokcxx
> + Description: C++ bindings for libsigrok
> + URL: http://www.sigrok.org
> +-Requires: libsigrok glibmm-2.4
> ++Requires: libsigrok @SR_GLIBMM_REQUIRES@
> + Version: @SR_PACKAGE_VERSION@
> + Libs: -L${libdir} -lsigrokcxx
> + Libs.private: -lm
> +diff --git a/configure.ac b/configure.ac
> +index 424b0002..d70575b7 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -407,9 +407,14 @@ AS_IF([test "x$HAVE_CXX11" != x1],
> + 	[SR_APPEND([sr_cxx_missing], [', '], ['C++11'])])
> +
> + # The C++ bindings need glibmm.
> +-SR_PKG_CHECK([glibmm], [SR_PKGLIBS_CXX], [glibmm-2.4 >= 2.32.0])
> ++SR_GLIBMM_REQUIRES=glibmm-2.4
> ++SR_PKG_CHECK([glibmm], [SR_PKGLIBS_CXX], [$SR_GLIBMM_REQUIRES >= 2.32.0])
> ++AS_IF([test "x$sr_have_glibmm" != xyes],
> ++	[SR_GLIBMM_REQUIRES=glibmm-2.68
> ++	SR_PKG_CHECK([glibmm], [SR_PKGLIBS_CXX], [$SR_GLIBMM_REQUIRES >= 2.68.0])])
> + AS_IF([test "x$sr_have_glibmm" != xyes],
> + 	[SR_APPEND([sr_cxx_missing], [', '], [glibmm])])
> ++AC_SUBST(SR_GLIBMM_REQUIRES)
> +
> + # The C++ bindings use Doxygen to parse libsigrok symbols.
> + AC_CHECK_PROG([HAVE_DOXYGEN], [doxygen], [yes], [no])
> +--
> +2.34.1
> +
> diff --git a/package/libsigrok/libsigrok.mk b/package/libsigrok/libsigrok.mk
> index 8e7c355fd0..2a26518614 100644
> --- a/package/libsigrok/libsigrok.mk
> +++ b/package/libsigrok/libsigrok.mk
> @@ -11,6 +11,8 @@ LIBSIGROK_LICENSE_FILES = COPYING
>   LIBSIGROK_INSTALL_STAGING = YES
>   LIBSIGROK_DEPENDENCIES = libglib2 libzip host-pkgconf
>   LIBSIGROK_CONF_OPTS = --disable-java --disable-python
> +# We're patching configure.ac
> +LIBSIGROK_AUTORECONF = YES
>   
>   ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
>   LIBSIGROK_CONF_OPTS += --with-libbluez
> @@ -52,6 +54,7 @@ LIBSIGROK_DEPENDENCIES += glibmm
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBSIGROKCXX),y)
> +LIBSIGROK_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++17"
>   LIBSIGROK_CONF_OPTS += --enable-cxx
>   # host-doxygen is used by C++ bindings to parse libsigrok symbols
>   LIBSIGROK_DEPENDENCIES += \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
