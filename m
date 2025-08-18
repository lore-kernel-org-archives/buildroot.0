Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3CFCA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 15:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F58F613B8;
	Mon, 18 Aug 2025 15:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M77LkQKefSOR; Mon, 18 Aug 2025 15:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93B7961BB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93B7961BB9;
	Mon, 18 Aug 2025 15:03:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9720BE2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 15:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94630400B4
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 15:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7bjVWk2E-vh for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 15:03:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF6FB40029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF6FB40029
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF6FB40029
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 15:03:28 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7e86f90d162so431217885a.0
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 08:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755529407; x=1756134207;
 h=content-transfer-encoding:thread-topic:in-reply-to:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3iqkndKKo++IYW76pqqWxRBWbhYhTFpgT3qFmEO8odw=;
 b=ws9CTZFKp/ntZaXcWuaHeI6xEezjVt5wDABIIYJG1689jaaiyq8ktrBwvqEbRaRQZ8
 81YDLstWQbdcbM0R4PnIfgNzVwNgIUlrF+w24KsbaYYbRaxoGNEGxqNr0pxqaziR5xKM
 fxxtB33Osu+EGQZ16IjR6oanhnGdTr2ceJmV0vHRX9EwgVQTJ75se6YVmfN+Ya7abX5a
 /Gj02rP7B+tBfjQZJAWBl7Fqe5kLTih2n6eHqV4WSbGUp/FBB6wTS5DiYZjiSqZytjFy
 9tAOFVWOa0v9gbSveadRza51EPmfxUK9u9dlWQNpNZbD9+PoyrK7QS5jPOpwO/ZqgQnZ
 S7AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWcOA9nW4S/16ZeClg7dAT/oTOvyxClSrfRgF2Sgysf/QRLp26yZv0jgTHw+vfzgVhPKF+IoQECLg=@buildroot.org
X-Gm-Message-State: AOJu0YztEBt+DYvXkXkaOf6BVmD8aqC1DeZYi1/JfIEv4WolEEVj1bEL
 GA0/aFXV2p6w6nduzQGLkjNG8Wo1E0sqqhtyUfbY0EzyhXmziOXHT3Om
X-Gm-Gg: ASbGnctfV0BK3asXYk0FA1s3vyrni6NKGt2TYnzJiUfGmbGW0VPE/q3W7fFZbzl6jfI
 f9uNc75aNX9AflbXb3HsdD3JXngPzXVr/7TXZU2LZ+RsNnnuu7vQCJrZLNTiXwnp+vBscXGa0JO
 OeRbSibFY9m+m3JVe1RahbVqMccKHI7HvHY8oJMhRSz6EmomQJIfTXMBYbrhmmpSk4ORgbX1oSG
 Ry6oMhyqe8hL1q4ChHWTL+T/koPLUrWdWbSaQ1DXopFphfQxcoWZ457niPhk8pjwZPsAv1brMJF
 a8ERodDHyD4FEu+NcEsaEyU8heSj5A6hGFDFbsCDZPqdgQAUcbomfApmMMHPZ8g9SADaMgtmHbe
 FSA0XTmvMkksPZc5GF08/Lr4xddIVMcOn89JlSytZBiorjak2UVxv7b4ReaTOWoTWlPLTGIJlTs
 NX5Q==
X-Google-Smtp-Source: AGHT+IFWJs5Je8knojkhRVhqiUzByJm4oo96DUNkVY7XK7BB9mOfhp/5Tq+YD+98eXs0Kj8hnA0zBA==
X-Received: by 2002:a05:620a:7103:b0:7e6:3151:8595 with SMTP id
 af79cd13be357-7e8716b357fmr2112118785a.3.1755529407141; 
 Mon, 18 Aug 2025 08:03:27 -0700 (PDT)
Received: from [10.4.10.38] (pool-108-26-215-125.bstnma.fios.verizon.net.
 [108.26.215.125]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e87e191a42sm599197485a.54.2025.08.18.08.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 08:03:26 -0700 (PDT)
Message-ID: <63b11c22-4ed7-4d0c-a1f0-38952fa5c8e0@gmail.com>
Date: Mon, 18 Aug 2025 11:03:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jesse Taube <mr.bossman075@gmail.com>
To: Neal Frager <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 Neal Frager <neal.frager@amd.com>, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
References: <20250619154811.936265-1-neal.frager@amd.com>
Content-Language: en-US
In-Reply-To: <20250619154811.936265-1-neal.frager@amd.com>
Thread-Topic: [PATCH v1 1/1], toolchain/toolchain-bare-metal-buildroot: add
 multilib option
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755529407; x=1756134207; darn=buildroot.org;
 h=content-transfer-encoding:thread-topic:in-reply-to:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3iqkndKKo++IYW76pqqWxRBWbhYhTFpgT3qFmEO8odw=;
 b=M4tEgAnT3eBQSU/a0NwOeXp9fhdtQcgHBikupykISydjsHS+fQrWZ6yA9AwHX7JM2f
 VuQiX4K/Uk4D5oL04R5KzfiHGkFd8k6vDIQ1p/JDqH60bFtR1cL5SfEY7H+Mh1qFHhiB
 PIMMPhJTCCwbj8zp+wljay8jv9auT33Z9SToJM0WqJ/NLPt3inACRiMwTzaHI0mA/C63
 O9TaUiQixGk9+AmB9pFtvV4SmrtpDzQV/0s6j9NjnhMZKISaacmWuwUboH6XSJQCs7He
 enW5l1lTIxDHx00vAINHFMF0xBaWqGbMluAwplaPL+EvNO9olspRAwQSyGieUXQFseOD
 sv2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M4tEgAnT
Subject: Re: [Buildroot] [PATCH v1 1/1],
 toolchain/toolchain-bare-metal-buildroot: add multilib option
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  > Sometimes the default GCC and newlib libraries built for a given
  > architecture tuple are not based on the desired ABI. Since ABI 
definitions are
  > different between architectures, the simplest solution is to allow 
users to
  > build bare-metal toolchains with --enable-multilib. This way, the 
libraries
  > for every available ABI will be built and users will be able to 
select the
  > desired library for their user applications.
  >
  > This patch adds the option 
BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB to give
  > users the choice to enable multilib, if desired.
  >
  > Please note that when using a string of architecture tuples, this 
option will
  > apply to all architectures in the string, so it can significantly 
increase
  > build time.
  >
  > Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Jesse Taube <Mr.Bossman075@gmail.com>

Thanks,
Jesse Taube

  > ---
  >  package/binutils-bare-metal/binutils-bare-metal.mk |  8 +++++++-
  >  package/gcc-bare-metal/gcc-bare-metal.mk           |  8 +++++++-
  >  package/newlib-bare-metal/newlib-bare-metal.mk     |  8 +++++++-
  >  toolchain/toolchain-bare-metal-buildroot/Config.in | 14 ++++++++++++++
  >  4 files changed, 35 insertions(+), 3 deletions(-)
  >
  > diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk 
b/package/binutils-bare-metal/> binutils-bare-metal.mk
  > index 709d072765..bb04b79c2f 100644
  > --- a/package/binutils-bare-metal/binutils-bare-metal.mk
  > +++ b/package/binutils-bare-metal/binutils-bare-metal.mk
  > @@ -21,6 +21,12 @@ HOST_BINUTILS_BARE_METAL_CONF_ENV += MAKEINFO=true
  >  HOST_BINUTILS_BARE_METAL_MAKE_OPTS += MAKEINFO=true
  >  HOST_BINUTILS_BARE_METAL_INSTALL_OPTS += MAKEINFO=true install
  >
  > +ifeq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB),y)
  > +HOST_BINUTILS_BARE_METAL_MULTILIB = "--enable-multilib"
  > +else
  > +HOST_BINUTILS_BARE_METAL_MULTILIB = "--disable-multilib"
  > +endif
  > +
  >  HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
  >  	--prefix=$(HOST_DIR) \
  >  	--sysconfdir=$(HOST_DIR)/etc \
  > @@ -31,7 +37,7 @@ HOST_BINUTILS_BARE_METAL_CONF_OPTS = \
  >  	--disable-shared \
  >  	--enable-lto \
  >  	--disable-initfini-array \
  > -	--disable-multilib \
  > +	$(HOST_BINUTILS_BARE_METAL_MULTILIB) \
  >  	--disable-werror
  >
  >  define HOST_BINUTILS_BARE_METAL_CONFIGURE_CMDS
  > diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk 
b/package/gcc-bare-metal/gcc-bare-metal.mk
  > index 17232a8ef1..03938ca81b 100644
  > --- a/package/gcc-bare-metal/gcc-bare-metal.mk
  > +++ b/package/gcc-bare-metal/gcc-bare-metal.mk
  > @@ -31,6 +31,12 @@ HOST_GCC_BARE_METAL_MAKE_OPTS = \
  >
  >  HOST_GCC_BARE_METAL_INSTALL_OPTS = install-gcc install-target-libgcc
  >
  > +ifeq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB),y)
  > +HOST_GCC_BARE_METAL_MULTILIB = "--enable-multilib"
  > +else
  > +HOST_GCC_BARE_METAL_MULTILIB = "--disable-multilib"
  > +endif
  > +
  >  HOST_GCC_BARE_METAL_CONF_OPTS = \
  >  	--prefix=$(HOST_DIR) \
  >  	--sysconfdir=$(HOST_DIR)/etc \
  > @@ -49,7 +55,7 @@ HOST_GCC_BARE_METAL_CONF_OPTS = \
  >  	--without-long-double-128 \
  >  	--without-headers \
  >  	--enable-languages=c \
  > -	--disable-multilib \
  > +	$(HOST_GCC_BARE_METAL_MULTILIB) \
  >  	--with-gmp=$(HOST_DIR) \
  >  	--with-mpc=$(HOST_DIR) \
  >  	--with-mpfr=$(HOST_DIR) \
  > diff --git a/package/newlib-bare-metal/newlib-bare-metal.mk 
b/package/newlib-bare-metal/> newlib-bare-metal.mk
  > index bd740046c9..f1e54d6f9e 100644
  > --- a/package/newlib-bare-metal/newlib-bare-metal.mk
  > +++ b/package/newlib-bare-metal/newlib-bare-metal.mk
  > @@ -22,6 +22,12 @@ NEWLIB_BARE_METAL_INSTALL_STAGING = YES
  >  NEWLIB_BARE_METAL_INSTALL_TARGET = NO
  >  NEWLIB_BARE_METAL_MAKE_OPTS = MAKEINFO=true
  >
  > +ifeq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB),y)
  > +NEWLIB_BARE_METAL_MULTILIB = "--enable-multilib"
  > +else
  > +NEWLIB_BARE_METAL_MULTILIB = "--disable-multilib"
  > +endif
  > +
  >  NEWLIB_BARE_METAL_CONF_OPTS = \
  >  	--build=$(GNU_HOST_NAME) \
  >  	--prefix=/usr \
  > @@ -35,7 +41,7 @@ NEWLIB_BARE_METAL_CONF_OPTS = \
  >  	--enable-newlib-io-long-long \
  >  	--enable-newlib-io-float \
  >  	--enable-newlib-io-long-double \
  > -	--disable-multilib \
  > +	$(NEWLIB_BARE_METAL_MULTILIB) \
  >  	--with-tooldir=/usr
  >
  >  define NEWLIB_BARE_METAL_CONFIGURE_CMDS
  > diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in 
b/toolchain/> toolchain-bare-metal-buildroot/Config.in
  > index 19c97410c6..7ba579b570 100644
  > --- a/toolchain/toolchain-bare-metal-buildroot/Config.in
  > +++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
  > @@ -12,6 +12,20 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH
  >  	  metal toolchain, use the following definition:
  >  	  "microblazeel-buildroot-elf riscv32-buildroot-elf"
  >
  > +config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB
  > +	bool "Enable multilib"
  > +	help
  > +	  Sometimes the default GCC and newlib libraries for a given
  > +	  architecture are not the desired ABI. Since ABI
  > +	  definitions are different for each architecture, this
  > +	  option will enable multilib configuration, so that all
  > +	  available ABI libraries are built which will guarantee
  > +	  that the desired version will be available for user
  > +	  applications.
  > +
  > +	  When enabled, this option will apply to all architecture
  > +	  tuples in the list.
  > +
  >  source "package/newlib-bare-metal/Config.in"
  >
  >  endif # BR2_TOOLCHAIN_BARE_METAL_BUILDROOT

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
