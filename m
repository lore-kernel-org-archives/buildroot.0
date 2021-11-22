Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F980C433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 21:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C477400FF;
	Mon, 22 Nov 2021 21:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UucyBLSBhxTU; Mon, 22 Nov 2021 21:02:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 681FE40235;
	Mon, 22 Nov 2021 21:02:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 739221BF5AD
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 21:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61E0640235
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 21:02:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BJlBshf9WO_r for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 21:02:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE2C3400FF
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 21:02:50 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x6so70518406edr.5
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 13:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=D9vI21yuIIXE1mHrLmH63kPYI1hDz6blupEqWI7uIVw=;
 b=Wtciy6eLRNx3cg0Tm1xitJ9TvUbvVeuEnXmv8ZqAalynNStTQ9UcLvNUb/GN1ST/b8
 +1jwwQAKLGNVdUYlzolbMsBqk7IdpxOEmfNxlOvcq69EfxWTRsZpP9kFJP+m7TTtga/u
 +kiPxrL5fZ9zCNMQTkJa8FvdZeNGBb8sXt4Vo1quaF3acpbcLgyG+/JRT/jEVn0KdXt3
 Q/jGXk5DBkPQ/pBcqlzkdKJf2q16wcgJ/ZQjHJo8IByRanDE/4jkDVj2LpmwRJ9Z2ZO2
 L7mCuK1cg5CZjezB0t/fIcQ5NHK5J94VVrly0pGxZrPjrQblK0cEBNTfRoYRAlPEDq9m
 E3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=D9vI21yuIIXE1mHrLmH63kPYI1hDz6blupEqWI7uIVw=;
 b=XjDnjjPLXez572wrnKPxS2RV3nLNeCwq98djInZOK9/s1Vc97G9xn3G2rGgAWLGL8F
 txmj/QAIywuEadIrwtylNY2PwL2gywTkppGtq+NoHxZarmGXj8gdjxNQQfSHLGZFTLcL
 SwqYT8fUGCs4ODutFUJkeLDodLKknUJ/VITjnCoWLnjUHX0eniGVxv6CpKxvy58V8YBy
 eUXjeTmn+Ygjb7ZF77GxbO8r8MEjy3tAXfjkRhnCwy6WxZQBxoePwmMU+Ur+uH/RXRVm
 dyR0hbaodabRWoqwoVegFnGwRVi59/oBU4M9DwhiioJoMJR4MBV2wPM/bPNNwUHh6/XG
 JndA==
X-Gm-Message-State: AOAM5318p8j6IsXB6cW980EVAJKmtvZe4NXZKXF4InmmyG9bBEvkq6bN
 I2IkACiZx/b8FmZvGVhb7ayQtA==
X-Google-Smtp-Source: ABdhPJw1zxvG40hrs8aaQ90Tp84vtFZE5HbWxTjE/D4HGGRAA4Vf8O9bClW4SnOoOZyJBIgrWBa6Sw==
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr69368118edz.43.1637614968058; 
 Mon, 22 Nov 2021 13:02:48 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hz15sm4268081ejc.63.2021.11.22.13.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 13:02:47 -0800 (PST)
Message-ID: <dea61a9d-beb3-b445-ec99-9b6d98e0ac2e@mind.be>
Date: Mon, 22 Nov 2021 22:02:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211121093548.3425517-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211121093548.3425517-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libgee: fix introspection build
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



On 21/11/2021 10:35, Fabrice Fontaine wrote:
> Fix the following build failure raised since the addition of
> introspection in commit 3915e17e7734ee3abe088d4ce1893eecd7cc4663:
> 
> /home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/../riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler -l `/usr/bin/sed -nE "s/^dlname='([A-Za-z0-9.+-]+)'/\1/p" libgee-0.8.la` -o Gee-0.8.typelib Gee-0.8.gir libgee-0.8.la
> Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
> error parsing file Gee-0.8.gir: Failed to parse included gir GObject-2.0
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/884faa0f84c8dc43ed1ca6cde9caf21c731a4b35
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...le.am-include-Makefile.introspection.patch | 40 +++++++++++++++++++
>   package/libgee/libgee.mk                      |  2 +
>   2 files changed, 42 insertions(+)
>   create mode 100644 package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch
> 
> diff --git a/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch b/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch
> new file mode 100644
> index 0000000000..0906275ae3
> --- /dev/null
> +++ b/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch
> @@ -0,0 +1,40 @@
> +From d771e8ddb5e40f234459966e46880d10f34aaa1a Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 20 Nov 2021 23:57:33 +0100
> +Subject: [PATCH] gee/Makefile.am: include Makefile.introspection
> +
> +Include Makefile.introspection instead of using a custom rule which will
> +result in the following build failure when cross-compiling on buildroot
> +because of missing --includedir:
> +
> +/home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/../riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler -l `/usr/bin/sed -nE "s/^dlname='([A-Za-z0-9.+-]+)'/\1/p" libgee-0.8.la` -o Gee-0.8.typelib Gee-0.8.gir libgee-0.8.la
> +Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
> +error parsing file Gee-0.8.gir: Failed to parse included gir GObject-2.0
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/884faa0f84c8dc43ed1ca6cde9caf21c731a4b35
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.gnome.org/GNOME/libgee/-/merge_requests/8]
> +---
> + gee/Makefile.am | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/gee/Makefile.am b/gee/Makefile.am
> +index 5634bcb..e0d950e 100644
> +--- a/gee/Makefile.am
> ++++ b/gee/Makefile.am
> +@@ -167,7 +167,8 @@ INTROSPECTION_COMPILER_ARGS= \
> + 	-l $(libgee_dlname)
> + Gee-0.8.gir: libgee_0_8_la_vala.stamp
> + Gee-0.8.typelib: Gee-0.8.gir libgee-0.8.la
> +-	@INTROSPECTION_COMPILER@ $(INTROSPECTION_COMPILER_ARGS) -o $@ $^
> ++
> ++-include $(INTROSPECTION_MAKEFILE)
> + endif
> +
> + MOSTLYCLEANFILES = \
> +--
> +2.33.0
> +
> diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
> index 48bc9c9e41..0a05a63635 100644
> --- a/package/libgee/libgee.mk
> +++ b/package/libgee/libgee.mk
> @@ -12,6 +12,8 @@ LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
>   LIBGEE_INSTALL_STAGING = YES
>   LIBGEE_LICENSE = LGPL-2.1+
>   LIBGEE_LICENSE_FILES = COPYING
> +# We're patching gee/Makefile.am
> +LIBGEE_AUTORECONF = YES
>   
>   ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>   LIBGEE_CONF_OPTS += --enable-introspection
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
