Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B5DC47DB3
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 18:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0F6A84010;
	Thu, 18 Jan 2024 18:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F6A84010
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYZIPjetM4Af; Thu, 18 Jan 2024 18:08:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F33C68402C;
	Thu, 18 Jan 2024 18:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F33C68402C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 652941BF2FF
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 18:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E4BC6F5B9
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 18:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E4BC6F5B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4hdpB5wmvuZA for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 18:08:11 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F34A36F59A
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 18:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F34A36F59A
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8F9F46014A;
 Thu, 18 Jan 2024 19:08:05 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34382])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 18 Jan 2024 19:08:05 +0100
MIME-Version: 1.0
Date: Thu, 18 Jan 2024 19:08:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
In-Reply-To: <20240117210756.265708-1-ju.o@free.fr>
References: <20240117210756.265708-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.5
Message-ID: <639458d877d32fb65419df7a48c941bb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705601286;
 bh=TbNPhHRxRDFg55xNlbXobyubJ0fIfHmPby3ASoa45eA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IJ/3IZDtixIsf1iWqIwQ/u1Y0OqUeyv5OVrhQEAnLNILOK74ejduI1fnJw4hFgB+c
 4LnT6+Me9Rqxwgj+BLJObWn1M9REfwStZP7f9rdOsI7CWf28f5ihnoN3HB8k0Kq9U7
 GDAxqvT5u85ILPhhD+tLniOJlh6IlIkqX/lUlpUopVVXqvwvG5Hzr15JXQrr5tlEqN
 kxNJY/O55u/8yZ6fKUyvqLYn+mHefYxPcDLwHY0ql+SMMkvXqVlVY5uj2/Ku9YN8bU
 Nb/69rLKPrV3Y9z/zytD0yOePdmFJ7vW8pyi00EMOloIQ3ITT9NquWpEBmrJF1pKXB
 efXHdr+i3rdQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IJ/3IZDt
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: fix service runtime
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 17/01/2024 22:07, Julien Olivain wrote:
> Since commit 2a8065e "package/postgresql: bump version to 16.1", the
> postgresql service fail to start at runtime with an error:
> 
>     FATAL:  could not load library 
> "/usr/lib/postgresql/dict_snowball.so": 
> /usr/lib/postgresql/dict_snowball.so: undefined symbol: 
> CurrentMemoryContext
> 
> This is due to the Posgresql autotool configure script trying to
> detect whether the toolchain linker needs --export-dynamic or not.
> This test is done with a runtime execution of a test program, and
> therefore cannot run in cross-compilation. In that case, the
> configure script assumes it is not needed. See commit [1], included
> in PostgreSQL v16.0.
> 
> This commit fixes the issue by forcing the value in _CONF_ENV. The
> package has already a Kconfig dependency on !BR2_STATIC_LIBS, so the
> value can be unconditionally set.
> 
> [1] 
> https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=9db49fc5bfdc0126be03f4b8986013e59d93b91d
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> This patch was tested on branch master at commit b200632, and also
> with patch from:
> https://patchwork.ozlabs.org/project/buildroot/patch/20240111224003.243443-1-ju.o@free.fr/
> 
> with command:
> 
>     support/testing/run-tests \
>         -d dl -o output_folder \
>         tests.package.test_postgresql
>     ...
>     OK

For info, I tested this patch on branch master at
commit d622ea0 with commands:

utils/test-pkg -a -p postgresql
                              arm-aarch64 [ 1/45]: OK
                    bootlin-aarch64-glibc [ 2/45]: OK
                bootlin-arcle-hs38-uclibc [ 3/45]: OK
                     bootlin-armv5-uclibc [ 4/45]: OK
                      bootlin-armv7-glibc [ 5/45]: OK
                    bootlin-armv7m-uclibc [ 6/45]: SKIPPED
                       bootlin-armv7-musl [ 7/45]: OK
                 bootlin-m68k-5208-uclibc [ 8/45]: SKIPPED
                bootlin-m68k-68040-uclibc [ 9/45]: OK
              bootlin-microblazeel-uclibc [10/45]: OK
                 bootlin-mipsel32r6-glibc [11/45]: OK
                    bootlin-mipsel-uclibc [12/45]: OK
                      bootlin-nios2-glibc [13/45]: OK
                  bootlin-openrisc-uclibc [14/45]: OK
         bootlin-powerpc64le-power8-glibc [15/45]: OK
            bootlin-powerpc-e500mc-uclibc [16/45]: OK
                    bootlin-riscv32-glibc [17/45]: OK
                    bootlin-riscv64-glibc [18/45]: OK
                     bootlin-riscv64-musl [19/45]: OK
                  bootlin-s390x-z13-glibc [20/45]: OK
                       bootlin-sh4-uclibc [21/45]: OK
                    bootlin-sparc64-glibc [22/45]: OK
                     bootlin-sparc-uclibc [23/45]: OK
                     bootlin-x86-64-glibc [24/45]: OK
                      bootlin-x86-64-musl [25/45]: OK
                    bootlin-x86-64-uclibc [26/45]: OK
                    bootlin-xtensa-uclibc [27/45]: OK
                             br-arm-basic [28/45]: SKIPPED
                     br-arm-full-nothread [29/45]: OK
                       br-arm-full-static [30/45]: SKIPPED
                    br-i386-pentium4-full [31/45]: OK
                 br-i386-pentium-mmx-musl [32/45]: OK
                       br-mips64-n64-full [33/45]: OK
                  br-mips64r6-el-hf-glibc [34/45]: OK
                br-powerpc-603e-basic-cpp [35/45]: SKIPPED
                br-powerpc64-power7-glibc [36/45]: OK
                        linaro-aarch64-be [37/45]: OK
                           linaro-aarch64 [38/45]: OK
                               linaro-arm [39/45]: OK
                      sourcery-arm-armv4t [40/45]: OK
                             sourcery-arm [41/45]: OK
                      sourcery-arm-thumb2 [42/45]: OK
                          sourcery-mips64 [43/45]: OK
                            sourcery-mips [44/45]: OK
                           sourcery-nios2 [45/45]: OK
45 builds, 5 skipped, 0 build failed, 0 legal-info failed, 0 show-info 
failed

> ---
>  package/postgresql/postgresql.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/postgresql/postgresql.mk 
> b/package/postgresql/postgresql.mk
> index ec5b61b932..644f93d88a 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -15,6 +15,7 @@ POSTGRESQL_INSTALL_STAGING = YES
>  POSTGRESQL_CONFIG_SCRIPTS = pg_config
>  POSTGRESQL_CONF_ENV = \
>  	ac_cv_type_struct_sockaddr_in6=yes \
> +	pgac_cv_prog_cc_LDFLAGS_EX_BE__Wl___export_dynamic=yes \
>  	LIBS=$(TARGET_NLS_LIBS)
>  POSTGRESQL_CONF_OPTS = --disable-rpath
>  POSTGRESQL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
