Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C03AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 010A640104;
	Tue,  4 Jan 2022 17:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TwQ7uIwh-2Bl; Tue,  4 Jan 2022 17:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A591040118;
	Tue,  4 Jan 2022 17:13:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 906B41BF32A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E88C60BD3
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2_mtPjRqrBrN for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:13:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 527E460B8F
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:13:51 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id j21so150981845edt.9
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+EE9gKao0S34mnC6aSJOLy+H04wFIemfd2IiIoh/oF8=;
 b=Q4tNr5gpGKW+nFwLjZXBg5w78ffWKCVKXTasNLbIOLr9fDmjqQKMx8yTYVzi+pbSu+
 YoR4XMV/O7L0rY0YkEhrm0kMgcAA2ga4MzXMaPLbAVXPoSEmmqISnisXkyOQkcENHfCg
 nzuNgpe2GED1JauCkBk88wXfBvP9CJUOfRLyoFsQvPmP5HbSb4kWJZGmzWqv8uH07xYx
 92rOWfpIrRoUfpbg+yJsddjv8FWpKuQ1cV3kChLDI6kZjJNbKsjMeD/xHUgoX5KxJCkC
 XHImPx5mFdpcl+JRAVSjSzmdyON07JYsmv3PuEeNBFhAhXiJS7V8U6Rt3D3pnQQGS2at
 sheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+EE9gKao0S34mnC6aSJOLy+H04wFIemfd2IiIoh/oF8=;
 b=mnAuQWk9Q7iP0WX9EDL0SFpg8JTlyc9XCkmK1OIi0yJhoT5XVdWYDl0Ol+o9d0V/1T
 Lqu2aB1l/NwJSZvRjt0f59VVahkUa0t9djzRF2RuD0z8V/lxVLFySArBxL9xYYDzOvBh
 7J8U0ma2nfQP9r9sIUi5HQDoWuORyXh0lv36NQbG76oPIWAbKmi4FdQFfCOYnCECmTC0
 vuXXQ3fDZ1AHrviKQxLm+6kUJjmfDdgtGk4I8rdvNZg596NClqisNiakd4if4HU7t4AU
 AEif5LT7KULkMXzpMsKKg/YVb4I1HhrUlJH33ARKXgZLkxkJdr9So5cCxjOLSKoD46NC
 o9sQ==
X-Gm-Message-State: AOAM531cL/HmRcrSQgPXkfKAJpOv/4OlDNLaQq8jzgaUkV7SkdQVHlUW
 NwT/MdqzAkyLBH2LW1tfSAuZvCNgfUvYtQ==
X-Google-Smtp-Source: ABdhPJznPB0HcvxUmRkGB6gHFe7wUK9nvf9bM5+pulh6K8fgZP8oxOOlVEwzOmzDzSiUFWF4TmFUvw==
X-Received: by 2002:a05:6402:1778:: with SMTP id
 da24mr50328611edb.144.1641316429537; 
 Tue, 04 Jan 2022 09:13:49 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id a13sm14733087edk.29.2022.01.04.09.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:13:49 -0800 (PST)
Message-ID: <4fd6af9a-376a-4682-05b8-042c3ba41ad5@mind.be>
Date: Tue, 4 Jan 2022 18:13:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101182557.1915942-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101182557.1915942-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mdadm: bump to version 4.2
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



On 01/01/2022 19:25, Fabrice Fontaine wrote:
> - Drop first patch and use install-bin target added by
>    https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=b4a5ad4958cb3ad87c3c5fa993e7572c38596d09
> - Drop second patch (already in version)
> - Handle libudev optional dependency through CXFLAGS instead of
>    overriding CFLAGS as wanted by upstream:
>    https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=af3396dadfcd3b13480d021b8d3645c6d2420f79
> - Update indentation in hash file (two spaces)
> 
> https://www.spinics.net/lists/raid/msg69218.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-install-targets-for-mdadm-and-mdmon.patch | 32 -----------------
>   ...-include-sysmacros.h-unconditionally.patch | 35 -------------------
>   package/mdadm/mdadm.hash                      |  4 +--
>   package/mdadm/mdadm.mk                        | 21 +++++++----
>   4 files changed, 17 insertions(+), 75 deletions(-)
>   delete mode 100644 package/mdadm/0001-add-install-targets-for-mdadm-and-mdmon.patch
>   delete mode 100644 package/mdadm/0002-mdadm.h-include-sysmacros.h-unconditionally.patch
> 
> diff --git a/package/mdadm/0001-add-install-targets-for-mdadm-and-mdmon.patch b/package/mdadm/0001-add-install-targets-for-mdadm-and-mdmon.patch
> deleted file mode 100644
> index 15df7557e7..0000000000
> --- a/package/mdadm/0001-add-install-targets-for-mdadm-and-mdmon.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From a1a9243671b1e23123f57e879890325154b8e00d Mon Sep 17 00:00:00 2001
> -From: Christophe Vu-Brugier <cvubrugier@lacie.com>
> -Date: Wed, 6 Mar 2013 16:03:14 +0100
> -Subject: [PATCH] Add install targets for mdadm and mdmon
> -
> -
> -Signed-off-by: Christophe Vu-Brugier <cvubrugier@lacie.com>
> ----
> - Makefile |    6 +++++-
> - 1 file changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 315455b..27d8eeb 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -231,8 +231,12 @@ $(MON_OBJS) : $(INCL) mdmon.h
> - sha1.o : sha1.c sha1.h md5.h
> - 	$(CC) $(CFLAGS) -DHAVE_STDINT_H -o sha1.o -c sha1.c
> -
> --install : mdadm mdmon install-man install-udev
> -+install : install-mdadm install-mdmon install-man install-udev
> -+
> -+install-mdadm :
> - 	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
> -+
> -+install-mdmon :
> - 	$(INSTALL) -D $(STRIP) -m 755 mdmon $(DESTDIR)$(BINDIR)/mdmon
> -
> - install-static : mdadm.static install-man
> ---
> -1.7.10.4
> -
> diff --git a/package/mdadm/0002-mdadm.h-include-sysmacros.h-unconditionally.patch b/package/mdadm/0002-mdadm.h-include-sysmacros.h-unconditionally.patch
> deleted file mode 100644
> index c8944c8475..0000000000
> --- a/package/mdadm/0002-mdadm.h-include-sysmacros.h-unconditionally.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 6c781ad75d92c6f65832810c44afcba1b2dffc41 Mon Sep 17 00:00:00 2001
> -From: Baruch Siach <baruch@tkos.co.il>
> -Date: Tue, 6 Aug 2019 16:01:15 +0300
> -Subject: [PATCH] mdadm.h: include sysmacros.h unconditionally
> -
> -musl libc now also requires sys/sysmacros.h for the major/minor macros.
> -All supported libc implementations carry sys/sysmacros.h, including
> -diet-libc, klibc, and uclibc-ng.
> -
> -Cc: Hauke Mehrtens <hauke@hauke-m.de>
> -Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ----
> -Upstream status: https://marc.info/?l=linux-raid&m=156509677018508
> -
> - mdadm.h | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/mdadm.h b/mdadm.h
> -index c36d7fdb10f6..d61a9ca82dc1 100644
> ---- a/mdadm.h
> -+++ b/mdadm.h
> -@@ -45,10 +45,8 @@ extern __off64_t lseek64 __P ((int __fd, __off64_t __offset, int __whence));
> - #include	<errno.h>
> - #include	<string.h>
> - #include	<syslog.h>
> --#ifdef __GLIBC__
> - /* Newer glibc requires sys/sysmacros.h directly for makedev() */
> - #include	<sys/sysmacros.h>
> --#endif
> - #ifdef __dietlibc__
> - #include	<strings.h>
> - /* dietlibc has deprecated random and srandom!! */
> ---
> -2.20.1
> -
> diff --git a/package/mdadm/mdadm.hash b/package/mdadm/mdadm.hash
> index b15cb4e031..b9631a2aaa 100644
> --- a/package/mdadm/mdadm.hash
> +++ b/package/mdadm/mdadm.hash
> @@ -1,4 +1,4 @@
>   # From https://www.kernel.org/pub/linux/utils/raid/mdadm/sha256sums.asc
> -sha256 ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a  mdadm-4.1.tar.xz
> +sha256  461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d  mdadm-4.2.tar.xz
>   # Locally calculated
> -sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
> index 171782712f..6ee0bb60c9 100644
> --- a/package/mdadm/mdadm.mk
> +++ b/package/mdadm/mdadm.mk
> @@ -4,14 +4,19 @@
>   #
>   ################################################################################
>   
> -MDADM_VERSION = 4.1
> +MDADM_VERSION = 4.2
>   MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
>   MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
>   MDADM_LICENSE = GPL-2.0+
>   MDADM_LICENSE_FILES = COPYING
>   
> -MDADM_BUILD_OPTS = $(TARGET_CONFIGURE_OPTS) \
> -	CFLAGS="$(TARGET_CFLAGS) -DNO_COROSYNC -DNO_DLM" \
> +MDADM_CXFLAGS = $(TARGET_CFLAGS)
> +
> +MDADM_BUILD_OPTS = \
> +	CC=$(TARGET_CC) \
> +	COROSYNC=-DNO_COROSYNC \
> +	DLM=-DNO_DLM \
> +	CXFLAGS="$(MDADM_CXFLAGS)" \
>   	CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
>   	CHECK_RUN_DIR=0
>   
> @@ -19,14 +24,18 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
>   MDADM_BUILD_OPTS += USE_PTHREADS=
>   endif
>   
> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +MDADM_DEPENDENCIES += udev
> +else
> +MDADM_CXFLAGS += -DNO_LIBUDEV
> +endif
> +
>   define MDADM_BUILD_CMDS
>   	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(MDADM_BUILD_OPTS) mdadm mdmon
>   endef
>   
>   define MDADM_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> -		DESTDIR=$(TARGET_DIR) \
> -		install-mdadm install-mdmon
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-bin
>   endef
>   
>   $(eval $(generic-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
