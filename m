Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90632D68BCF
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 19:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2654160682;
	Fri, 15 Nov 2024 19:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPzI7HSCfuRk; Fri, 15 Nov 2024 19:52:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27AC160738
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27AC160738;
	Fri, 15 Nov 2024 19:52:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 273AEBF
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 19:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07CC3404EF
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 19:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKCOIX8Dezy0 for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 19:52:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A306F400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A306F400AF
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A306F400AF
 for <buildroot@uclibc.org>; Fri, 15 Nov 2024 19:52:13 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1tC2MT-00094m-QQ
 for buildroot@uclibc.org; Fri, 15 Nov 2024 20:52:09 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 15 Nov 2024 20:51:44 +0100
Message-ID: <pan$864c$16c9c8cd$9e750283$328e7b9@ID-313208.user.individual.net>
References: <20241110103624.1041337-1-bernd@kuhls.net>
 <20241110181334.0746f1a8__5312.39102581225$1731258842$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/1] package/libvpl: not supported on mips64
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sun, 10 Nov 2024 18:13:34 +0100 schrieb Thomas Petazzoni via buildroot:

> $ ARCH-linux-gcc -dM -E - < /dev/null | grep -E "(LP|ILP)"
> 
> For example, it looks like i386 would be supported.

Hi Thomas,

tested a defconfig based on support/config-fragments/autobuild/br-i386-
pentium4-full.config

BR2_x86_pentium4=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/
tarballs/br-i386-pentium4-full-2020.11.2.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_LIBVPL=y

libvpl build is broken:

output/build/libvpl-2.13.0/api/vpl/mfxdefs.h:75:6: error: #error Unknown 
packing
   75 |     #error Unknown packing

because the compiler does not define __ILP32__

$ i686-linux-gcc -dM -E - < /dev/null | grep -E "(LP|ILP)"
$ 

The same is valid for support/config-fragments/autobuild/bootlin-riscv32-
glibc.config

$ riscv32-linux-gcc  -dM -E - < /dev/null | grep -E "(LP|ILP)"
$ 

I did not test other 32bit platforms because the only dependee of libvpl, 
intel-vpl-gpu-rt, is unsupported on 32bit archs anyway.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
