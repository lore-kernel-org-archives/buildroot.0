Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C96CEE347
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 18:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B9CB60677;
	Tue, 18 Nov 2025 18:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 605Y3QGhnTZq; Tue, 18 Nov 2025 18:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6745460D7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6745460D7F;
	Tue, 18 Nov 2025 18:22:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CA151BA
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 18:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E2024011B
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 18:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2oVFLSRLcC87 for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 18:22:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 190184015F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 190184015F
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 190184015F
 for <buildroot@uclibc.org>; Tue, 18 Nov 2025 18:22:08 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1vLQL8-0009d8-Hk
 for buildroot@uclibc.org; Tue, 18 Nov 2025 19:22:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 18 Nov 2025 19:21:58 +0100
Message-ID: <pan$77033$6ba85c2c$22507ece$5e56e258@ID-313208.user.individual.net>
References: <20251117214234.1115937-1-bernd@kuhls.net>
 <20251117214234.1115937-2-bernd@kuhls.net>
 <a93aa370-e834-4794-aeca-2617d2fd7b07__8229.26729904197$1763454477$gmane$org@inbox.ru>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 2/2] package/postgresql: bump version to 18.1
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

Am Tue, 18 Nov 2025 11:27:27 +0300 schrieb Maxim Kochetkov via buildroot:

>> Upstream removed support for toolchains not providing atomics support:
>> https://git.postgresql.org/gitweb/?
p=postgresql.git;a=commit;h=81385261362962deb9861b39b509aeffe213721d
> 
> depends on BR2_TOOLCHAIN_HAS_ATOMIC ?

Hi Maxim,

while running test-pkg the bootlin-sparc-uclibc defconfig failed to build.

The atomic support of this toolchain looks weird to me (libatomic.so 
provided, but not atomic.h), but I am by no means an expert on this field:

$ make defconfig BR2_DEFCONFIG=support/config-fragments/autobuild/bootlin-
sparc-uclibc.config 

$ grep ATOMIC .config | grep TOOLCHAIN
BR2_TOOLCHAIN_HAS_LIBATOMIC=y
BR2_TOOLCHAIN_HAS_ATOMIC=y
$ 

$ make toolchain
[...]
$ find -iname atomic.h
./output/build/buildroot-config/br2/package/pulseaudio/has/atomic.h
./output/build/buildroot-config/br2/toolchain/has/atomic.h
$

$ find -type f | grep libatomic.so
./output/host/sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1.2.0
./output/host/opt/ext-toolchain/sparc-buildroot-linux-uclibc/sysroot/lib/
libatomic.so.1.2.0
./output/host/opt/ext-toolchain/sparc-buildroot-linux-uclibc/lib/
libatomic.so.1.2.0
./output/target/lib/libatomic.so.1.2.0
$

So I saw no other choice than to disable BR2_sparc completely.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
