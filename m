Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82E3C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 21:17:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6012260F70
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 21:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6012260F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C90140452;
	Sun,  1 Aug 2021 21:17:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qcboGPfLNISp; Sun,  1 Aug 2021 21:17:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5410240436;
	Sun,  1 Aug 2021 21:17:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B83ED1BF36B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 21:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A28F340436
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 21:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i0KH0leiSBuo for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 21:17:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CEBA403B6
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 21:17:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5E3935FF13;
 Sun,  1 Aug 2021 23:16:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627852620;
 bh=rsgI34lREdGx1ASmgA2ovRwTOptkC9nu2LcVv1mj6EQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h+VgvUmGyJpLeatATa37ZZmxfsC1yWMOBQsiEl3EH5TtnWJ+DtfHc6XVKop/4Zdtw
 B0RSUgpYSwxM+9ni/xDJYv3VKA9XZIhgJ7T0VbmXwibNoyRZm5X4mq3oLs1O4fkFzj
 AJkrRQC0IZb2GGMDazkQsjrrsyaDiLmIenb7vfycU488TfO55LS0rpt/v2k1X4BAUe
 1fCyrcZQTlEDq8Qp8V9A5TXghbgjoB8R/jYpNt3hRoGnTGvoyqReRJPI31Pg/YuY1z
 QoehcVIQMkGRZ9bwu7KTwK4g34FPFbj16OhlWlvJh7KZdbEOG21WnXgbZRhpKotk5a
 /1Lp1U4EjCXHA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 23:16:54 +0200
Date: Sun, 1 Aug 2021 23:16:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801211654.GA25461@scaer>
References: <20210801204650.75712-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801204650.75712-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,
 1/2] package/s390-tools: fix build with curl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alexander Egorenkov <egorenar@linux.ibm.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-01 22:46 +0200, Fabrice Fontaine spake thusly:
> Build with curl is broken since bump to version 2.17.0 in commit
> eab9110afbef9c39569c4cc988aed15c48f7ce44 and
> https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/cfb46d7547c22f0a23aca2286dc5a1d2c20aadfc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch b/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch
> new file mode 100644
> index 0000000000..2f6ea5a11c
> --- /dev/null
> +++ b/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch
> @@ -0,0 +1,71 @@
> +From 49cd01dc97740b299119f32c822ccfd989ea7ec9 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 1 Aug 2021 21:50:21 +0200
> +Subject: [PATCH] libkmipclient/Makefile: add {CURL,XML2}_CONFIG
> +
> +Add CURL_CONFIG and XML2_CONFIG to allow the user to configure the
> +binaries used in check-dep-libkmipclient
> +
> +This will allow the user to avoid the following build failures raised
> +since version 2.17.0 and
> +https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e:
> +
> +/bin/sh: 1: curl-config: not found
> +Error: libcurl is not built with the OpenSSL backend
> +make[2]: *** [Makefile:54: check-dep-libekmfweb] Error 1
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/cfb46d7547c22f0a23aca2286dc5a1d2c20aadfc
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/ibm-s390-linux/s390-tools/pull/121]
> +---
> + libkmipclient/Makefile | 13 ++++++++-----

I think this is missing the same change in libekmfweb/Makefile, which
uses curl-config.

    https://github.com/ibm-s390-linux/s390-tools/pull/121#issuecomment-890586888

Too late, as this commit has already been applied in Buildroot. This is
probably OK for us if this is enough to fix the build, but for upstream,
this will probably need to be fixed...

Thanks!

Regards,
Yann E. MORIN.

> + 1 file changed, 8 insertions(+), 5 deletions(-)
> +
> +diff --git a/libkmipclient/Makefile b/libkmipclient/Makefile
> +index 36efecb..addd096 100644
> +--- a/libkmipclient/Makefile
> ++++ b/libkmipclient/Makefile
> +@@ -50,6 +50,9 @@ detect-openssl-version.dep:
> + 	echo "}" >> $(TMPFILE)
> + 	mv $(TMPFILE) $@
> + 
> ++CURL_CONFIG ?= curl-config
> ++XML2_CONFIG ?= xml2-config
> ++
> + check-dep-libkmipclient: detect-openssl-version.dep
> + 	$(call check_dep, \
> + 		"libkmipclient", \
> +@@ -67,14 +70,14 @@ check-dep-libkmipclient: detect-openssl-version.dep
> + 		"libxml/tree.h", \
> + 		"libxml2-devel", \
> + 		"HAVE_LIBXML2=0", \
> +-		`xml2-config --cflags` `xml2-config --libs`)
> ++		`$(XML2_CONFIG) --cflags` `$(XML2_CONFIG) --libs`)
> + 	$(call check_dep, \
> + 		"libkmipclient", \
> + 		"curl/curl.h", \
> + 		"libcurl-devel", \
> + 		"HAVE_LIBCURL=0" \
> +-		`curl-config --cflags` `curl-config --libs`)
> +-	curl-config --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
> ++		`$(CURL_CONFIG) --cflags` `$(CURL_CONFIG) --libs`)
> ++	$(CURL_CONFIG) --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
> + 	touch check-dep-libkmipclient
> + 
> + skip-libkmipclient-openssl:
> +@@ -104,8 +107,8 @@ tls.o: check-dep-libkmipclient tls.c kmip.h utils.h $(rootdir)include/kmipclient
> + names.o: check-dep-libkmipclient names.c names.h utils.h $(rootdir)include/kmipclient/kmipclient.h
> + utils.o: check-dep-libkmipclient utils.c names.h utils.h $(rootdir)include/kmipclient/kmipclient.h
> + 
> +-libkmipclient.so.$(VERSION): ALL_CFLAGS += -fPIC `xml2-config --cflags` `curl-config --cflags`
> +-libkmipclient.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `xml2-config --libs` `curl-config --libs`
> ++libkmipclient.so.$(VERSION): ALL_CFLAGS += -fPIC `$(XML2_CONFIG) --cflags` `$(CURL_CONFIG) --cflags`
> ++libkmipclient.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `$(XML2_CONFIG) --libs` `$(CURL_CONFIG) --libs`
> + libkmipclient.so.$(VERSION): ALL_LDFLAGS += -shared -Wl,--version-script=libkmipclient.map \
> + 	-Wl,-z,defs,-Bsymbolic -Wl,-soname,libkmipclient.so.$(VERM)
> + libkmipclient.so.$(VERSION): kmip.o request.o response.o attribute.o key.o ttlv.o json.o \
> +-- 
> +2.30.2
> +
> diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
> index 7f7df0542e..71a7f2223c 100644
> --- a/package/s390-tools/s390-tools.mk
> +++ b/package/s390-tools/s390-tools.mk
> @@ -20,6 +20,7 @@ S390_TOOLS_MAKE_OPTS = \
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
>  S390_TOOLS_DEPENDENCIES += libcurl
>  S390_TOOLS_MAKE_OPTS += \
> +	CURL_CONFIG=$(STAGING_DIR)/usr/bin/curl-config \
>  	HAVE_CURL=1 \
>  	HAVE_LIBCURL=1
>  else
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
