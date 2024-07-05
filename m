Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F789C38150
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 19:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2673F60708;
	Fri,  5 Jul 2024 19:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Wpwu8FGsuCO; Fri,  5 Jul 2024 19:29:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3225860818
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3225860818;
	Fri,  5 Jul 2024 19:29:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACD9C1BF98E
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 19:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A639E414BB
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 19:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtjmzPkplgQL for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 19:29:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3BD41408BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BD41408BF
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BD41408BF
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 19:29:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6179E20002;
 Fri,  5 Jul 2024 19:29:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sPoc7-000VHv-20;
 Fri, 05 Jul 2024 21:28:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240616124322.692320-1-peter@korsgaard.com>
 <20240616124322.692320-2-peter@korsgaard.com>
Date: Fri, 05 Jul 2024 21:28:59 +0200
In-Reply-To: <20240616124322.692320-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 16 Jun 2024 14:43:22 +0200")
Message-ID: <87bk3bvds4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/glibc: security bump to 2.39-74
 for post-2.39 security fixes
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 >   GLIBC-SA-2024-0004:
 >     ISO-2022-CN-EXT: fix out-of-bound writes when writing escape
 >     sequence (CVE-2024-2961)

 >   GLIBC-SA-2024-0005:
 >     nscd: Stack-based buffer overflow in netgroup cache (CVE-2024-33599)

 >   GLIBC-SA-2024-0006:
 >     nscd: Null pointer crash after notfound response (CVE-2024-33600)

 >   GLIBC-SA-2024-0007:
 >     nscd: netgroup cache may terminate daemon on memory allocation
 >     failure (CVE-2024-33601)

 >   GLIBC-SA-2024-0008:
 >     nscd: netgroup cache assumes NSS callback uses in-buffer strings
 >     (CVE-2024-33602)

 > In addition, the following bugs are fixed:

 >   [19622] network: Support aliasing with struct sockaddr
 >   [30701] time: getutxent misbehaves on 32-bit x86 when _TIME_BITS=64
 >   [30994] REP MOVSB performance suffers from page aliasing on Zen 4
 >   [31339] libc: arm32 loader crash after cleanup in 2.36
 >   [31325] mips: clone3 is wrong for o32
 >   [31335] math: Compile glibc with -march=x86-64-v3 should disable FMA4
 >     multi-arch version
 >   [31402] libc: clone (NULL, NULL, ...) clobbers %r7 register on
 >     s390{,x}
 >   [31479] libc: Missing #include <sys/rseq.h> in sched_getcpu.c may
 >     result in a loss of rseq acceleration
 >   [31316] build: Fails test misc/tst-dirname "Didn't expect signal from
 >     child: got `Illegal instruction'" on non SSE CPUs
 >   [31371] x86-64: APX and Tile registers aren't preserved in ld.so
 >     trampoline
 >   [31372] dynamic-link: _dl_tlsdesc_dynamic doesn't preserve all caller-
 >     saved registers
 >   [31429] build: Glibc failed to build with -march=x86-64-v3
 >   [31501] dynamic-link: _dl_tlsdesc_dynamic_xsavec may clobber %rbx
 >   [31640] dynamic-link: POWER10 ld.so crashes in
 >     elf_machine_load_address with GCC 14
 >   [31676] Configuring with CC="gcc -march=x86-64-v3"
 >     --with-rtld-early-cflags=-march=x86-64 results in linker failure
 >   [31677] nscd: nscd: netgroup cache: invalid memcpy under low
 >     memory/storage conditions
 >   [31678] nscd: nscd: Null pointer dereferences after failed netgroup
 >     cache insertion
 >   [31679] nscd: nscd: netgroup cache may terminate daemon on memory
 >     allocation failure
 >   [31680] nscd: nscd: netgroup cache assumes NSS callback uses in-buffer
 >     strings
 >   [31686] dynamic-link: Stack-based buffer overflow in
 >     parse_tunables_string
 >   [31719] dynamic-link: --enable-hardcoded-path-in-tests doesn't work
 >     with -Wl,--enable-new-dtags
 >   [31782] Test build failure with recent GCC trunk
 >     (x86/tst-cpu-features-supports.c:69:3: error: parameter to builtin
 >     not valid: avx5124fmaps)
 >   [31798] pidfd_getpid.c is miscompiled by GCC 6.4
 >   [31867] build: "CPU ISA level is lower than required" on SSE2-free
 >     CPUs
 >   [31883] build: ISA level support configure check relies on bashism /
 >     is otherwise broken for arithmetic

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
