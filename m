Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C78C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 662D981398;
	Sat, 12 Mar 2022 20:28:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HMfjkhQTDYjw; Sat, 12 Mar 2022 20:28:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 752CD8132A;
	Sat, 12 Mar 2022 20:28:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07D7F1BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E944D40486
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zZEO2F7fjU9H for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:28:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6135F4000B
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:28:31 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id p15so26056198ejc.7
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 12:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d3vF2FOFP+BW+45t3iZqv4XSqfmkhZ4GeDlRoUxsbFo=;
 b=JGK8Ua5WmZ9ZDiglFVRoCDocqNjGOA49GdPS8Xr4cx5qU19n0w/skqXvzeFEROAPHi
 yA0gfusPr9O8zqhuVo1+VC3iJ7aAgbvapE4CzUyBXhEJ+DizIFDgMufpUpo4sJtrEiF9
 eqZOHrcldXq7Ak9Q/HCEd3e4Mv9C+ISY/Vmgp+durj2o4NR7i4p9uTbHUiPSjh+smV/S
 UQYuqIopUkNaLO6pvONVU0rVUblQijgOIPIeO33czZvEvOBoJvfMxdkc1CfWqG8RsqtR
 Oe8v1SdBi/Hh099EwHMuYx+CXvnewtdK5Spqlr7u8y1xFlD82DPBv16e1FhB7FXDcgF3
 1OUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d3vF2FOFP+BW+45t3iZqv4XSqfmkhZ4GeDlRoUxsbFo=;
 b=GvYhg1jIrkwNdWGgAutQAbl5Soy11IBsEMEs9XI3ymIL2TCczOlxZckmnJVW44ZtjL
 XAt7t2iFz8EtXFPRHVmWPpvLVYM1SYy9o2TZdVUF45S9qjTCjm65wDoUjOHyHaPqlYVf
 J05eiSBdVpATxdN1voLss3cPkhZdFg8EIiztnf8T66+3dMrJJhsPJdgGla9Hh58pBkOX
 9gkONePtVIDXg3LuSww5skyYXWTsE3PmtzA3ekxaitj9+E/8oXu2Mmj7YSCRHggY8e5p
 hfSnPKXGi6Xn57qMG5BRJ9E5+LshRUC9+41MiEdIMEc8COhfpMzudrf60EZe3xUFZxLH
 xwMw==
X-Gm-Message-State: AOAM533o30cG8PHyRDgkGPXStKB1tUy0dEz2UZam+Q4wFLQh4A7PbA2c
 M768Bwtz1nwjl8WbraYgIN1/Imq4cYmdvQ==
X-Google-Smtp-Source: ABdhPJzp/DE7F1Ieu9K5gFYzWLBw2zWxBKp8y4H0uyBJQUfe+MWOGIddCQ0GwWhx7QQZi2xmnzIQEw==
X-Received: by 2002:a17:906:9b96:b0:6db:572c:7c33 with SMTP id
 dd22-20020a1709069b9600b006db572c7c33mr13395305ejc.175.1647116910220; 
 Sat, 12 Mar 2022 12:28:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a170906380a00b006a68610908asm4703677ejc.24.2022.03.12.12.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 12:28:29 -0800 (PST)
Message-ID: <41dda551-a569-3870-483c-736296887057@mind.be>
Date: Sat, 12 Mar 2022 21:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220225230519.1584174-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220225230519.1584174-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/zabbix: fix shared netsnmp build
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/02/2022 00:05, Fabrice Fontaine wrote:
> Fix the following shared build failure with netsnmp raised since the
> addition of the package in commit
> 42382a171277ead59e365f5920e757f01c04ac77:
> 
> configure: error: "libnetsnmp.a static library was not found in /home/buildroot/autobuild/instance-0/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib"
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/0f541e45d1fa27b3302968683bf64949131ec1c9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   ...-netsnmp.m4-fix-shared-netsnmp-build.patch | 44 +++++++++++++++++++
>   package/zabbix/zabbix.mk                      |  2 +
>   2 files changed, 46 insertions(+)
>   create mode 100644 package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
> 
> diff --git a/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch b/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
> new file mode 100644
> index 0000000000..ffb1f54ba2
> --- /dev/null
> +++ b/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
> @@ -0,0 +1,44 @@
> +From 3e810c0804ec40ad6e111a9791cdb2033ecdad71 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 25 Feb 2022 23:30:19 +0100
> +Subject: [PATCH] m4/netsnmp.m4: fix shared netsnmp build
> +
> +Since commit fe391e8689c523d3c7ea6b173d25aa5dba3a6902, the build fails
> +with the following error if the user provides the path of
> +net-snmp-config through the --with-net-snmp option:
> +
> +configure: error: "libnetsnmp.a static library was not found in /home/buildroot/autobuild/instance-0/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib"
> +
> +However, the assumption that a static library will be provided by the
> +system is just plain wrong so replace AC_MSG_ERROR by AC_MSG_WARN
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/0f541e45d1fa27b3302968683bf64949131ec1c9
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/zabbix/zabbix/pull/61]
> +---
> + m4/netsnmp.m4 | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/m4/netsnmp.m4 b/m4/netsnmp.m4
> +index 5e84d84303..87e21a67e6 100644
> +--- a/m4/netsnmp.m4
> ++++ b/m4/netsnmp.m4
> +@@ -140,8 +140,11 @@ AC_HELP_STRING([--with-net-snmp@<:@=ARG@:>@],
> + 			test [ "x$static_linking_support" = "xno" -o -z "$static_linking_support" ] -a -z "$_libsnmp_dir_lib" && AC_MSG_ERROR(["Compiler not support statically linked libs from default folders"])
> +
> + 			if test "x$static_linking_support" = "xno" -o -z "$static_linking_support"; then
> +-				test -f $_libsnmp_dir_lib/libnetsnmp.a || AC_MSG_ERROR(["libnetsnmp.a static library was not found in $_libsnmp_dir_lib"])
> +-				SNMP_LIBS=`echo "$SNMP_LIBS"|sed "s|-lnetsnmp|$_libsnmp_dir_lib/libnetsnmp.a|g"`

  This whole thing looks fishy... "if static linking is NO, then link with the 
static library"?

  Anyway, applied to master, thanks.

  Regards,
  Arnout

> ++				if test -f $_libsnmp_dir_lib/libnetsnmp.a; then
> ++					SNMP_LIBS=`echo "$SNMP_LIBS"|sed "s|-lnetsnmp|$_libsnmp_dir_lib/libnetsnmp.a|g"`
> ++				else
> ++					AC_MSG_WARN(["libnetsnmp.a static library was not found in $_libsnmp_dir_lib"])
> ++				fi
> + 			else
> + 				SNMP_LIBS=`echo "$SNMP_LIBS"|sed "s/-lnetsnmp/${static_linking_support}static -lnetsnmp ${static_linking_support}dynamic/g"`
> + 			fi
> +--
> +2.34.1
> +
> diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
> index e6564e68fd..a8ecbb42db 100644
> --- a/package/zabbix/zabbix.mk
> +++ b/package/zabbix/zabbix.mk
> @@ -10,6 +10,8 @@ ZABBIX_SITE = https://cdn.zabbix.com/zabbix/sources/stable/$(ZABBIX_VERSION_MAJO
>   ZABBIX_LICENSE = GPL-2.0+
>   ZABBIX_LICENSE_FILES = README COPYING
>   ZABBIX_CPE_ID_VENDOR = zabbix
> +# We're patching m4/netsnmp.m4
> +ZABBIX_AUTORECONF = YES
>   
>   ZABBIX_DEPENDENCIES = pcre
>   ZABBIX_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
