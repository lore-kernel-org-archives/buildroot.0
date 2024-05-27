Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAE0C25B78
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 14:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3486605D8;
	Mon, 27 May 2024 14:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hk0lSOshFGia; Mon, 27 May 2024 14:44:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7A6D6063D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A6D6063D;
	Mon, 27 May 2024 14:44:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7447D1D1DEF
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DB9B401B0
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRp1LhvGp-Hw for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 14:43:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C5A9401A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C5A9401A2
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C5A9401A2
 for <buildroot@buildroot.org>; Mon, 27 May 2024 14:43:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57FC6C0005;
 Mon, 27 May 2024 14:43:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sBbZe-005T5G-2S;
 Mon, 27 May 2024 16:43:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240506202304.509499-1-fontaine.fabrice@gmail.com>
Date: Mon, 27 May 2024 16:43:42 +0200
In-Reply-To: <20240506202304.509499-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 6 May 2024 22:23:04 +0200")
Message-ID: <87msob9uxt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/suricata: fix static build
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following static build failure raised since bump to version
 > version 6.0.14 in commit ce17f93e828a07292e03653be04a49480250f23f and
 > https://github.com/OISF/suricata/commit/31ba4fd1522dd0d7f933767b9205c67a4e726fe5:

 > configure:22378: checking for pcap_open_dead in -lpcap
 > configure:22407:
 > /home/buildroot/autobuild/run/instance-3/output-1/host/bin/x86_64-linux-gcc
 > -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -O2 -g0 -static -std=c11 -march=native
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 > -static -rdynamic conftest.c -lpcap -ljansson -lpthread -lyaml -lpcre
 > -latomic -lz >&5
 > /home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/12.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld:
 > /home/buildroot/autobuild/run/instance-3/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libpcap.a(pcap-linux.o):
 > in function `nl80211_init':
 > pcap-linux.c:(.text+0xc34): undefined reference to `nl_socket_alloc'

 > [...]

 > checking for pcap_open_dead in -lpcap... no

 > Fixes: ce17f93e828a07292e03653be04a49480250f23f
 >  - http://autobuild.buildroot.org/results/9e25c2508bd4100d2d1d3180e79060d762361213

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
