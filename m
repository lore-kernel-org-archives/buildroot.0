Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D52C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 16:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96B6C6085B;
	Mon, 18 Mar 2024 16:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a25e_IOK4Klc; Mon, 18 Mar 2024 16:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A47256085E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A47256085E;
	Mon, 18 Mar 2024 16:48:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DED051BF377
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 16:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D981A40903
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 16:48:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jphbV3Ut4QRq for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 16:48:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7687A408E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7687A408E0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7687A408E0
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 16:48:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF74C40006;
 Mon, 18 Mar 2024 16:48:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rmG9e-002nPQ-16;
 Mon, 18 Mar 2024 17:48:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240302105802.281681-1-fontaine.fabrice@gmail.com>
Date: Mon, 18 Mar 2024 17:48:06 +0100
In-Reply-To: <20240302105802.281681-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 2 Mar 2024 11:58:02 +0100")
Message-ID: <87msqvebax.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/openvmtools: needs dynamic
 library
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
Cc: Karoly Kasza <kaszak@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > openvmtools can't be built statically since at least bump to version
 > 10.3.5 in commit 5f0f0f7e4f3362a3695d5876d0f41125a2544285:

 > libtool: link:
 > /home/autobuild/autobuild/instance-9/output-1/per-package/openvmtools/host/bin/i586-buildroot-linux-musl-gcc
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 > -Ofast -g0 -static -Wall -Wno-pointer-sign -Wno-unused-value
 > -fno-strict-aliasing -Wno-unknown-pragmas -Wno-uninitialized
 > -Wno-deprecated-declarations -Wno-unused-const-variable
 > -Wno-unused-but-set-variable -static -o vmtoolsd vmtoolsd-cmdLine.o
 > vmtoolsd-mainLoop.o vmtoolsd-mainPosix.o vmtoolsd-pluginMgr.o
 > vmtoolsd-serviceObj.o vmtoolsd-threadPool.o vmtoolsd-toolsRpc.o
 > vmtoolsd-svcSignals.o vmtoolsd-toolsHangDetector.o -pthread
 > -Wl,--export-dynamic -pthread -pthread -pthread
 > /home/autobuild/autobuild/instance-9/output-1/build/openvmtools-11.3.5-18557794/libvmtools/.libs/libvmtools.a
 > -L/home/autobuild/autobuild/instance-9/output-1/per-package/openvmtools/host/bin/../i586-buildroot-linux-musl/sysroot/usr/lib
 > /home/autobuild/autobuild/instance-9/output-1/per-package/openvmtools/host/i586-buildroot-li
 >  nux-musl/sysroot/usr/lib/libdnet.a
 > /home/autobuild/autobuild/instance-9/output-1/per-package/openvmtools/host/i586-buildroot-linux-musl/sysroot/usr/lib/libtirpc.a
 > -lrt -lcrypt -lpthread -lgmodule-2.0 -lgobject-2.0
 > /home/autobuild/autobuild/instance-9/output-1/per-package/openvmtools/host/i586-buildroot-linux-musl/sysroot/usr/lib/libffi.a
 > -lgthread-2.0 -lglib-2.0 -lm
 > /home/autobuild/autobuild/instance-9/output-1/per-package/openvmtools/host/i586-buildroot-linux-musl/sysroot/usr/lib/libpcre.a
 > ../../lib/globalConfig/.libs/libGlobalConfig.a -pthread
 > /home/autobuild/autobuild/instance-9/output-1/per-package/openvmtools/host/bin/../lib/gcc/i586-buildroot-linux-musl/10.4.0/../../../../i586-buildroot-linux-musl/bin/ld:
 > /home/autobuild/autobuild/instance-9/output-1/build/openvmtools-11.3.5-18557794/libvmtools/.libs/libvmtools.a(libvmtools_la-vmtools.o):(.modinfo+0x0):
 > multiple definition of `vm_version';
 > vmtoolsd-mainPosix.o:(.modinfo+0x0): first defined here

 > Fixes:
 >  - http://autobuild.buildroot.org/results/61b03301bc36247c75e797fb294ec7f96bce6e22
 >  - http://autobuild.buildroot.org/results/eea487eb0de911f4e4bce7a557d4c93d732181cf

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
