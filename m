Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CA1C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2330780FAF;
	Sun, 12 Feb 2023 20:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2330780FAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o_UyybIyfHf7; Sun, 12 Feb 2023 20:38:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 525DD80F50;
	Sun, 12 Feb 2023 20:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 525DD80F50
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2555B1BF30E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F372E60C00
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F372E60C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RRWK_N5rkXfd for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:38:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E781860BFF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E781860BFF
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:38:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C84C75FF95;
 Sun, 12 Feb 2023 21:38:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Feb 2023 21:38:46 +0100
Date: Sun, 12 Feb 2023 21:38:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230212203846.GT2796@scaer>
References: <20230212124421.17787-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230212124421.17787-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676234330;
 bh=vKoiF0jmw+Lgb4smZ2IGFipEVkrB9YGA9kq2KcV+vvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qxIuO8bKnrSjr8ANnGn0GUNJ9rvpWxOJ3Tlr0y/CTf03lJ54iwOkhMFiUOxK6sM0j
 KzBWVO/gPwE39W1ls5VoS4lqi1yBz0TPlhIwbWOeK5Zbvh5IU0CS8+34a4cNN4uWlc
 MXHtga1S2pYI8/htojbU1g39/V0hey66LEXPWNjE+5c3XMR/Yzbrl1kh9AK9dLF1i7
 3fWlR5NUJv0SoRffoFvzwvYs56JTrn7nppnHh/Kc3gaRAHyZd1xXl7/e+Ysx+aOk08
 RCrWTQMoYp2jbrktVRzK+Qfa2b7pHs+63CXhNoT/X6iBCE15YPnhWe2zWH4iDlr46M
 a45w+ZKTP710A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qxIuO8bK
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/zabbix: fix BR2_SHARED_STATIC_LIBS
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
Cc: Alexey Lukyanchuk <skif@skif-web.ru>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-02-12 13:44 +0100, Fabrice Fontaine spake thusly:
> zabbix uses custom --enable-{static,shared} options, instead of standard
> libtool directives resulting in the following build failure with openssl
> or libcurl:
> 
> configure:13132: /home/autobuild/autobuild/instance-6/output-1/host/bin/or1k-buildroot-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0  -I/home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -rdynamic  -static -L/home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib conftest.c -lssl -lcrypto -lm   >&5
> /home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(dso_dlfcn.o): in function `dlfcn_globallookup':
> dso_dlfcn.c:(.text+0x2c): warning: Using 'dlopen' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
> /home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(b_addr.o): in function `BIO_lookup_ex':
> b_addr.c:(.text+0x1128): warning: Using 'getaddrinfo' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
> /home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /home/autobuild/autobuild/instance-6/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/lib/libcrypto.a(b_sock.o): in function `BIO_gethostbyname':
> b_sock.c:(.text+0x90): warning: Using 'gethostbyname' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
> /home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/10.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: /tmp/cceWHjDi.o: in function `main':
> conftest.c:(.text.startup+0x8): undefined reference to `SSL_connect'
> 
> [...]
> 
> configure: error: OpenSSL library libssl or libcrypto not found
> 
> ---
> 
> configure:15199: checking for main in -lz
> configure:15219: /home/autobuild/autobuild/instance-13/output-1/host/bin/s390x-buildroot-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -g0 -D_FORTIFY_SOURCE=2  -I/home/autobuild/autobuild/instance-13/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/bin/../../usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -rdynamic  -static   -L/home/autobuild/autobuild/instance-13/output-1/host/s390x-buildroot-linux-gnu/sysroot/usr/bin/../../usr/lib conftest.c -lz   -lm    >&5
> /home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: cannot find -lz
> collect2: error: ld returned 1 exit status
> 
> [...]
> 
> configure: error: static library z required for linking libcurl not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c05230d13fa0538323bb77e8f35533e6dd02453f
>  - http://autobuild.buildroot.org/results/cc947038510e16417298b381521f226f7c45f986
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Let's not have a repeat of the previous iteration. So: applied to
master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Update commit log and comment
> 
>  package/zabbix/zabbix.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/zabbix/zabbix.mk b/package/zabbix/zabbix.mk
> index 23172a358d..06d12dbef4 100644
> --- a/package/zabbix/zabbix.mk
> +++ b/package/zabbix/zabbix.mk
> @@ -125,6 +125,13 @@ endif
>  
>  endif # BR2_PACKAGE_ZABBIX_SERVER
>  
> +# zabbix uses custom --enable-{static,shared} options, instead of
> +# standard libtool directives resulting in a build failure with libcurl
> +# or openssl.
> +ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +ZABBIX_CONF_OPTS += --disable-static
> +endif
> +
>  define ZABBIX_INSTALL_INIT_SYSTEMD
>  	$(foreach unit,$(ZABBIX_SYSTEMD_UNITS),\
>  		$(INSTALL) -D -m 0644 $(ZABBIX_PKGDIR)/$(unit) $(TARGET_DIR)/usr/lib/systemd/system/$(unit) && \
> -- 
> 2.39.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
