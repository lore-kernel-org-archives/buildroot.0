Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB428C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87DE940B3F;
	Thu, 14 Apr 2022 20:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X5AO23OslpTr; Thu, 14 Apr 2022 20:17:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BE6F40ACC;
	Thu, 14 Apr 2022 20:17:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 556B31BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50F8C40ACC
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hpPGXkh7aRr6 for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:17:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9C7440142
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:17:19 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id p15so12108980ejc.7
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 13:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AkNuYPbyu4PkQB64b69VWMjha1QkY5PHpQLfuglbq2w=;
 b=UbpcsybURXb2CwyBYt0vJGIcxb82NxMvSafXtAoOzev8A58f0UDyX1MTQl+APLkuPo
 /+TZOEw+X/o2pg4ZWynW0o7duhmASFN2D+SS0aZm3FQtMScKkktVBtU+CNe0snJGSCsP
 N+TBE9O6reI5vN8uAq+ltxSCBbCzglt7x7QankX7Q2Dgs16RBY/Hlu8mVa/S/pa9XxaG
 xSN2XBJlviwE5n2I0j840HJRX4OK0uFRXJsaXy7olodWBrgV71HdI393P8FTK6iRi6Bj
 c2RzEaz3E0s4Zz70BGDgZGZ3v6/3w2CbIWaONN5o/ohQJqunQf6OmRf2V1ecS0qp6vMq
 3eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AkNuYPbyu4PkQB64b69VWMjha1QkY5PHpQLfuglbq2w=;
 b=1PcyOvXwMogL98h+Jq2j2Sgr4whdtcl0Vmasu5pin3e/We1OMUCPOgE5M66dsgHcpZ
 ObDfplaUNUUHP1b2cxGW0+D//YKsoMNSOfNAw6WV03KTyPxA1gn9w1k04KTDi4PdmMIH
 E9frBvEdwVp/yc4/brAGyrIQvEm6SODSNVD3TDdI9iwlGxvaSRyeIDKrEBeiwddXBTOm
 9cRRTqSS7k9dN1EN/1bOr/SFHboCwq7WNF/sEbU4m+6aSFUGQsw9KaFTL14cScrUNhNW
 fsfYiABewdKWAXXSpALIF1cxWiivqz7MwM73n01jLIKVZt1oVzrMHoACuV5Aqa8zVbHu
 PGWw==
X-Gm-Message-State: AOAM530KwmWnT7Kns2Q/xqRo4JaBOO7BPG8nUwG6wRxvXk2NHYan4moG
 lKKb3Qc8czrMPDXo7mt4l3gHux8nTvZpCg==
X-Google-Smtp-Source: ABdhPJwWkRDmHZUPsuU/vUimudE45k+CnN8UxtLaM3TH0SUgJCB5l/he08y0IrEJSQycw02FM1m+hg==
X-Received: by 2002:a17:907:7810:b0:6e7:ef73:8326 with SMTP id
 la16-20020a170907781000b006e7ef738326mr3625188ejc.429.1649967437953; 
 Thu, 14 Apr 2022 13:17:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 bq23-20020a056402215700b0041d8fcac53asm1505336edb.23.2022.04.14.13.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 13:17:17 -0700 (PDT)
Message-ID: <d3f66716-b46a-948f-7070-f36957ef223c@mind.be>
Date: Thu, 14 Apr 2022 22:17:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220410143413.146915-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220410143413.146915-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/kompexsqlite: security bump to
 version 1.12.15
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/04/2022 16:34, Fabrice Fontaine wrote:
> - Update site to get latest version
> - Switch to generic-package and drop patches as upstream doesn't provide
>    autotools support
> - License is MIT since version 1.12.15
> - This bump will fix the following build failure with BR2_OPTIMIZE_FAST:
> 
> src/sqlite3.c: In function 'sqlite3IsNaN':
> src/sqlite3.c:21797:3: error: #error SQLite will not work correctly with the -ffast-math option of GCC.
> 21797 | # error SQLite will not work correctly with the -ffast-math option of GCC.
>        |   ^~~~~
> 
> - This bump will also fix security issues by bumping sqlite to 3.36.0
> - Update indentation in hash file (two spaces)
> 
> http://sqlitewrapper.kompex-online.com/index.php?content=changelog
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/63e07345b97faa6d6239933f1790c6f2e02da77f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...e-use-autoconf-CXX-for-proper-builds.patch | 27 ----------
>   .../0002-append-to-cflags-and-cxxflags.patch  | 49 -------------------
>   package/kompexsqlite/kompexsqlite.hash        |  5 +-
>   package/kompexsqlite/kompexsqlite.mk          | 45 ++++++++++++++---
>   4 files changed, 42 insertions(+), 84 deletions(-)
>   delete mode 100644 package/kompexsqlite/0001-Makefile-use-autoconf-CXX-for-proper-builds.patch
>   delete mode 100644 package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch
> 
> diff --git a/package/kompexsqlite/0001-Makefile-use-autoconf-CXX-for-proper-builds.patch b/package/kompexsqlite/0001-Makefile-use-autoconf-CXX-for-proper-builds.patch
> deleted file mode 100644
> index 408c100d71..0000000000
> --- a/package/kompexsqlite/0001-Makefile-use-autoconf-CXX-for-proper-builds.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 769693d9ddf63b04dd4aad6cad080f3cee3f997e Mon Sep 17 00:00:00 2001
> -From: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -Date: Thu, 11 Jun 2015 14:08:38 -0300
> -Subject: [PATCH] Makefile: use autoconf CXX for proper builds
> -
> -Status: applied upstream.
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ----
> - Makefile.in | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/Makefile.in b/Makefile.in
> -index 91fb8b2..fe862cd 100644
> ---- a/Makefile.in
> -+++ b/Makefile.in
> -@@ -23,6 +23,7 @@ mandir = $(prefix)/share/man/man3
> - headerdir = $(prefix)/include/kompex
> -
> - CC = @CC@
> -+CXX = @CXX@
> - CFLAGS = @CFLAGS@
> - CPPFLAGS = $(CFLAGS) @CPPFLAGS@
> - LDFLAGS = @LDFLAGS@
> ---
> -2.3.6
> -
> diff --git a/package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch b/package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch
> deleted file mode 100644
> index abd0dc0fdd..0000000000
> --- a/package/kompexsqlite/0002-append-to-cflags-and-cxxflags.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From 3eb064ffa9b43fb5f245b8abda48a1c152a6f2d7 Mon Sep 17 00:00:00 2001
> -From: me <noemail@nowhere.com>
> -Date: Thu, 20 Nov 2014 14:37:34 -0700
> -Subject: [PATCH] Append to CFLAGS and CXXFLAGS as setup by ./configure.  This
> - can allow users to Customize the SQLite build process with compile time
> - #defines rather than altering the sources.
> -
> -Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ----
> -Backported from: 3eb064ffa9b43fb5f245b8abda48a1c152a6f2d7
> -
> - Makefile-shared.mk | 4 ++--
> - Makefile-static.mk | 4 ++--
> - 2 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/Makefile-shared.mk b/Makefile-shared.mk
> -index b2a4920..d15ce3c 100644
> ---- a/Makefile-shared.mk
> -+++ b/Makefile-shared.mk
> -@@ -12,10 +12,10 @@ OBJS= \
> - 	${objsdir}/sqlite3.o
> -
> - # C Compiler Flags
> --CFLAGS= -fPIC -MMD -MP
> -+CFLAGS+= -fPIC -MMD -MP
> -
> - # CC Compiler Flags
> --CPPFLAGS= -DKOMPEX_SQLITEWRAPPER_EXPORT -DKOMPEX_SQLITEWRAPPER_DYN -fPIC -MMD -MP -I${includedir}
> -+CPPFLAGS+= -DKOMPEX_SQLITEWRAPPER_EXPORT -DKOMPEX_SQLITEWRAPPER_DYN -fPIC -MMD -MP -I${includedir}
> -
> - # Link Libraries and Options
> - LDLIBSOPTIONS= -shared -fPIC
> -diff --git a/Makefile-static.mk b/Makefile-static.mk
> -index 429a4ff..0678681 100644
> ---- a/Makefile-static.mk
> -+++ b/Makefile-static.mk
> -@@ -12,10 +12,10 @@ OBJS= \
> - 	${objsdir}/sqlite3.o
> -
> - # C Compiler Flags
> --CFLAGS= -MMD -MP
> -+CFLAGS+= -MMD -MP
> -
> - # CC Compiler Flags
> --CPPFLAGS= -I${includedir} -MMD -MP
> -+CPPFLAGS+= -I${includedir} -MMD -MP
> -
> - # Link Libraries and Options
> - LDLIBSOPTIONS=
> diff --git a/package/kompexsqlite/kompexsqlite.hash b/package/kompexsqlite/kompexsqlite.hash
> index 8869e9b7d9..aa0f269570 100644
> --- a/package/kompexsqlite/kompexsqlite.hash
> +++ b/package/kompexsqlite/kompexsqlite.hash
> @@ -1,3 +1,4 @@
>   # Locally calculated
> -sha256	73bec94fe5dd3a24bd8668b3a131a84dbe39a992579eebab1236aa0e73b2c9cc	kompexsqlite-1.10.12-1.tar.gz
> -sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	LICENSE.txt
> +sha256  81773ddb156fed51ef43a5f562e3b47761c4c33de9197bf0c3e7099b08579e2a  download.php?dl=KompexSQLiteWrapper-Source_1.12.15.tar.gz
> +sha256  65fd20aeb67892740a710a09d788acfda8747741e746395739412919f84b5f9f  inc/KompexSQLiteDatabase.h
> +sha256  001f26c0b2ca407a9a5d3f5e0690d7e576687b23110e18d2a08014dd774eb71c  inc/sqlite3.h
> diff --git a/package/kompexsqlite/kompexsqlite.mk b/package/kompexsqlite/kompexsqlite.mk
> index a40088fa2d..6a619de0ef 100644
> --- a/package/kompexsqlite/kompexsqlite.mk
> +++ b/package/kompexsqlite/kompexsqlite.mk
> @@ -4,11 +4,44 @@
>   #
>   ################################################################################
>   
> -KOMPEXSQLITE_VERSION = 1.10.12-1
> -KOMPEXSQLITE_SITE = \
> -	$(call github,Aethelflaed,kompex-sqlite-wrapper,v$(KOMPEXSQLITE_VERSION))
> +KOMPEXSQLITE_VERSION = 1.12.15
> +KOMPEXSQLITE_SOURCE = download.php?dl=KompexSQLiteWrapper-Source_$(KOMPEXSQLITE_VERSION).tar.gz
> +KOMPEXSQLITE_SITE = http://sqlitewrapper.kompex-online.com/counter
>   KOMPEXSQLITE_INSTALL_STAGING = YES
> -KOMPEXSQLITE_LICENSE = LGPL-3.0+ (wrapper), Public Domain (bundled sqlite)
> -KOMPEXSQLITE_LICENSE_FILES = LICENSE.txt
> +KOMPEXSQLITE_LICENSE = MIT (wrapper), Public Domain (bundled sqlite)
> +KOMPEXSQLITE_LICENSE_FILES = inc/KompexSQLiteDatabase.h inc/sqlite3.h
>   
> -$(eval $(autotools-package))
> +ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +KOMPEXSQLITE_CONFS += ReleaseStaticLib
> +define KOMPEXSQLITE_INSTALL_STATIC_LIB
> +	$(INSTALL) -D -m 0644 $(@D)/lib/release/KompexSQLiteWrapper_Static.a \
> +		$(STAGING_DIR)/usr/lib/libkompex-sqlite-wrapper.a
> +endef
> +endif
> +
> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +KOMPEXSQLITE_CONFS += ReleaseDynamicLib
> +define KOMPEXSQLITE_INSTALL_SHARED_LIB
> +	$(INSTALL) -D -m 0755 $(@D)/lib/release/KompexSQLiteWrapper.so \
> +		$(1)/usr/lib/libkompex-sqlite-wrapper.so
> +endef
> +endif
> +
> +define KOMPEXSQLITE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +		ALLCONFS="$(KOMPEXSQLITE_CONFS)" \
> +		-C "$(@D)/Kompex SQLite Wrapper" all
> +endef
> +
> +define KOMPEXSQLITE_INSTALL_STAGING_CMDS
> +	mkdir -p $(STAGING_DIR)/usr/include/kompex
> +	$(INSTALL) -m 644 $(@D)/inc/* $(STAGING_DIR)/usr/include/kompex
> +	$(KOMPEXSQLITE_INSTALL_STATIC_LIB)
> +	$(call KOMPEXSQLITE_INSTALL_SHARED_LIB,$(STAGING_DIR))
> +endef
> +
> +define KOMPEXSQLITE_INSTALL_TARGET_CMDS
> +	$(call KOMPEXSQLITE_INSTALL_SHARED_LIB,$(TARGET_DIR))
> +endef
> +
> +$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
