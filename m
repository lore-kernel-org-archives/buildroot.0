Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED631C54EBD
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 15:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 751DC40453;
	Sun,  8 Jan 2023 15:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 751DC40453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FoJel239wKMj; Sun,  8 Jan 2023 15:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A36340201;
	Sun,  8 Jan 2023 15:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A36340201
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 879711BF360
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 15:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61856408DD
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 15:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61856408DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MPxLP5mdOQnL for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 15:39:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 251B4408DB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 251B4408DB
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 15:39:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E8E0C5FF93;
 Sun,  8 Jan 2023 16:39:34 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Jan 2023 16:39:34 +0100
Date: Sun, 8 Jan 2023 16:39:34 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230108153934.GB151997@scaer>
References: <20230108101137.400527-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230108101137.400527-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673192377;
 bh=CYM2Yf/ClXnNWCsi0GgzenuOl3NXrShvXKL6bgToPZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pSJg5VBRelCennerWxMlLlaGEmyUUlvNBOV4RC8WfjT3kj9NTUANUs0zuFB9FkSVa
 /rktUdFq+rat6uSRyxKiEwc8iHo/d7DPUwldXkorI9EBWd/KYKRnTsSqu0QkI37Zcs
 3ofHxaVZyaJwx+WL9Lrg23FzEKKidxC6tDF61q5yybZRNDd2K/rxuvSpdYYf4uDA4H
 NngV6oW+97KwugH+Pb9NCC6oVq8WvDJv1tULgK177MKnQtjhCNAdmgJ1LhsgpICVjN
 YVAv4lmTs2E0LwXiIB4sDdQUnzXyMXpFTNi5EKbJPmLH6YOfYwDSfxlhH68qyymry1
 n5AF+qEpC3Flg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pSJg5VBR
Subject: Re: [Buildroot] [PATCH 1/1] package/bustle: fix pcap-config call
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-01-08 11:11 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of libpcap to version
> 1.10.2 in commit 6bee8635d90f3f9e3d04e03a9db2f37a387e077 and
> https://github.com/the-tcpdump-group/libpcap/commit/d0cba780dc2b2bb4f3ca9427d1a0f03479f45707:
> 
> pcap-config: Invalid command-line option pcap-config specified
> Usage: pcap-config [ --help ] [ --static | --static-pcap-only ] [ --libs | --additional-libs ]
> perl -nle 'm/^Version:\s+(.*)$/ and print $1' \
> 	bustle.cabal > dist/build/autogen/version.txt
> echo '#define BUSTLE_VERSION "'`cat dist/build/autogen/version.txt`'"' > dist/build/autogen/version.h
> /home/buildroot/autobuild/run/instance-2/output-1/host/bin/arm-linux-gcc -Idist/build/autogen -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  \
> 	-o dist/build/bustle-pcap c-sources/pcap-reader.c c-sources/pcap-monitor.c c-sources/bustle-pcap.c \
> 	-I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/libmount -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/blkid -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gio-unix-2.0 -pthread -L/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lgio-2.0 -lgobject-2.0 -lglib-2.0
> /home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /tmp/cc5SQkTV.o: in function `bustle_pcap_reader_finalize':
> pcap-reader.c:(.text+0x254): undefined reference to `pcap_close'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f3dcb617488e4172e639e3bd51a93bc9822ea186
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0001-Makefile-fix-pcap-config-call.patch  | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/bustle/0001-Makefile-fix-pcap-config-call.patch
> 
> diff --git a/package/bustle/0001-Makefile-fix-pcap-config-call.patch b/package/bustle/0001-Makefile-fix-pcap-config-call.patch
> new file mode 100644
> index 0000000000..b02bea641b
> --- /dev/null
> +++ b/package/bustle/0001-Makefile-fix-pcap-config-call.patch
> @@ -0,0 +1,45 @@
> +From 77e2de892cd359f779c84739682431a66eb8cf31 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 8 Jan 2023 11:03:52 +0100
> +Subject: [PATCH] Makefile: fix pcap-config call
> +
> +Fix the following build failure raised since libpcap version 1.10.2 and
> +https://github.com/the-tcpdump-group/libpcap/commit/d0cba780dc2b2bb4f3ca9427d1a0f03479f45707:
> +
> +pcap-config: Invalid command-line option pcap-config specified
> +Usage: pcap-config [ --help ] [ --static | --static-pcap-only ] [ --libs | --additional-libs ]
> +perl -nle 'm/^Version:\s+(.*)$/ and print $1' \
> +	bustle.cabal > dist/build/autogen/version.txt
> +echo '#define BUSTLE_VERSION "'`cat dist/build/autogen/version.txt`'"' > dist/build/autogen/version.h
> +/home/buildroot/autobuild/run/instance-2/output-1/host/bin/arm-linux-gcc -Idist/build/autogen -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  \
> +	-o dist/build/bustle-pcap c-sources/pcap-reader.c c-sources/pcap-monitor.c c-sources/bustle-pcap.c \
> +	-I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0 -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/libmount -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/blkid -I/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/gio-unix-2.0 -pthread -L/home/buildroot/autobuild/run/instance-2/output-1/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lgio-2.0 -lgobject-2.0 -lglib-2.0
> +/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /tmp/cc5SQkTV.o: in function `bustle_pcap_reader_finalize':
> +pcap-reader.c:(.text+0x254): undefined reference to `pcap_close'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/f3dcb617488e4172e639e3bd51a93bc9822ea186
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.freedesktop.org/bustle/bustle/-/merge_requests/21]
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 8865819..721e714 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -2,7 +2,7 @@ CFLAGS = -g -O2 -Wall -Wunused -Waddress
> + DBUS_FLAGS = $(shell pkg-config --cflags --libs dbus-1)
> + GIO_FLAGS := $(shell pkg-config --cflags --libs 'glib-2.0 >= 2.26' gio-2.0 gio-unix-2.0)
> + PCAP_CONFIG ?= pcap-config
> +-PCAP_FLAGS := $(shell $(PCAP_CONFIG) --cflags pcap-config --libs)
> ++PCAP_FLAGS := $(shell $(PCAP_CONFIG) --cflags --libs)
> + DESTDIR =
> + PREFIX = /usr/local
> + BINDIR = $(DESTDIR)$(PREFIX)/bin
> +-- 
> +2.39.0
> +
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
