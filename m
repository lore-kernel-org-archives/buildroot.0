Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08979606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 20:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k7eu6/VM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Zbyl8TUb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA83B40880;
	Wed, 28 Oct 2026 20:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMcruKAEUBWQ; Wed, 28 Oct 2026 20:22:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 355E340A06
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793218966;
	b=ZJ8q6N2giUxwZU102pYQmoNSIe7w0YZdAwwx8jHcaLDGlFS0OPOyuD/R0YPEQGiIGtHj
	 ivR/sqiH9NTEHqqeYCkJrmaet3gVmZpC83MhZlG67f9Mim7tF/P8cDYbAbbTy1jw5R+FE
	 g5PEQkxgbBQGnLtUvzJIVEDLPDhu7v+qtPEg+BdG4zxAwzBYFwq3ttUp7YfMg1BV1ktw0
	 6BcUyfgbs4mg77c4aP/Zh+eXzGkRcgda8cy0IlS8TvUOpiuNfE7YZZF4+V9hyYA0tEl4D
	 GPKQxW4W77rVIq0GjtZRVvYqASjaesJnR+lG6fhdFwTXGYNy0ZqH8jNQM1jk43jF9TA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793218966;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=48MMZzO718nWB6X2ek/f+U2Q1YhjFDYphGVq4vLtCf8=;
	b=PZf/pUWgkGXHf97GC12dPv+LFUQ0VWfzfHdE9riklGrdbtMlr7qvXzFmu8tBb/ZHeOj+
	 UoTQUml2Y+SNmOmmpK1YlFan3gflHSUgmO2zpW5TY3id571VzR5W31kCxWlcW5ThUSr6X
	 qmd2rI1P9uA1jJm17FDdq4tCdQP4mgG3OxP6scFsNPLWToJVGvYzt/4wfllc1hZhWjlVK
	 3UasPvloBDy22vvQO9Y5gB2BTgEpSq+MKp3JOeQ8dOX6qjjcqyAHSkDsBjc5XlYnp5zXk
	 sNJD9Mi5PvodQx6Xcaljdf9RfhEik0RQgoImyuwla7LkptmL1Drv88YytLnXh4ndL+Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Zbyl8TUb;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793218966;
	bh=48MMZzO718nWB6X2ek/f+U2Q1YhjFDYphGVq4vLtCf8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k7eu6/VMIK0v4LKXrVIF+JAe/HKxwinEeQDFXRIHrreVpMFndeRNjZgnDifXIvjrr
	 6LpWDxPYV5CixN4X2mqHKbJaP1A6757Rh0JiUqfrOw3PXJ/cnFV1RykRH61BhH4+zT
	 YQ9z9yEtQrTYpJxNmbuHKwVc1qr65hMwDp0cz5rj6AHzcDSBqTAUMQK+Ccn+lxrj1u
	 ClFfyZq4OKD9UeddI4i5uvFk+hray7reYKU4+oA0BAcf4y5TFaiynC0rySWjCyixCB
	 eueU8NTEz1Hu+IfDjcHwDXSLp7cCAYJhrNpw3IAdXaN3Pfn835HSp1HBLUQA7t8RIR
	 ZEdL7+Jk/d6sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 355E340A06;
	Wed, 28 Oct 2026 20:22:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20869235
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 20:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E11F40A06
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 20:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwVwR6FC6CIf for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 20:22:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4EAA440880
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793218962;
 b=A/Tcp5jqEbw3WJvHKaaShAql98QP27Un0ZjWWcXrNkUcaGBMT2CPLQnQk/jUKWSjE6Hq
 I9b9qjUYhhCU51S9xcQ9vHCQ+K16hpHFJ91GzWi0+O4Pg6B4lC4NTyFppC+Q0Qqq8otzi
 jq3WO0vt/OYdUNkrlIZsIAInb/fI/dtr+MHbJXu2ayLye3yqVkhxEO7xwvExJ40H92LwX
 hx0NpFCrbEwGm6pwBMT6iJW7LKHfzl1DGqC/SEnqHmorea/oM2ZBmMyD5kRKX5/ak/QCw
 7j5Jik/DzNNXe7TY0xrGLP1fNcZ48O0CrMDKv4s9CzmFGnU7VAJznVkLNWlJfsOswOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793218962;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=IMJeJQbremJsLnrcBl75EtksCaiAA6OSniBuR3/+P18=;
 b=WqvgZ40ITI+BbIF+MtzTwtSaJuUJ8tOAhqLUklyGyxTU4yfgBqYOqi61hjgOgB/kKb4j
 8RwqasKbdsqVUokaWd7DzX4TUq1/N3ZqDPy9VjUZxNx9eklSt0y54zkvPrx6rb3Ty9kuJ
 mWnf2ih2L38XbnROTPXI+z4sIYX1X4+uhuG/1QC5r/+XZ39JABM9KljtKNbkGkYyON+Ij
 3SBRPvU04qEmLGmr5IzZskPgLRe3DDw1IESGNomCTNUoR+egvBEFyzjF/VHSab5nfHQNh
 W6RYrwiuBuo/Wi1lyq1fnxz4qbQdwoVIXQ4b3A5f+TG2cKrdkfgyTdUBFs3ESLiuAZA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Zbyl8TUb; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Zbyl8TUb
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EAA440880
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 20:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793218957;
 bh=IMJeJQbremJsLnrcBl75EtksCaiAA6OSniBuR3/+P18=;
 h=From:To:Cc:Subject:Date:From;
 b=Zbyl8TUb7GQp5cjpVaJBUc60kPvORDxlAV391hB1D9V26kFLnFHwadpCXw/UeG65U
 nrLOZifMuHcAlD/FxfL47NL0TUYLZA56lY2eOL35/sR5LsTRPtpUHRuJtZ43bf3ilu
 oUV1mvvfWTqjsdCN0f8Aem9xOMbjYZFYy7Cvrfxo7JxU/bP628tARE4H/HQuzq0wdI
 Ebk9r7ROsJdDLRHk+DYXXNV7GHlTwb0wkJbnSizmOEUV/Pl0z5g2KKxWS92qHUKMqW
 6PnLXTi3/5oD9NGq77WJCX2Ns1xPyAkNX+4ECJoiybJ7b9J1DrdR0FCciraBHMcx11
 XlDhJJ6Ic7I4A==
X-KAS-Sym: v3:f51bdf72230551df:ZFmkApR1VibsjJt7Rxiw73E/TfUuC2l47NCEOEFiyaEqR
 IdhoiQ+YGZzM1b6YLkQNOYDnUPRgso78ds2HVajS83W4Ah9le7nW+0ulkZwzsNQrJJDuOojXn+l
 N6TVuKh738Nfh+ttqTssLNWrtOHBvaDudfAAMSOp66Jwe5anjRUylwkg9GImoMUtoNdyJVS6r1M
 yjDDutE5CSFUQGyIDCmRr9e3VRcub4owV0TfcARgndQigQX2ey16N/r2YMHo1Nb6sXO9j6MgoAt
 rDYR1TrQs7Jz3xzydujgj5pcdBewTfLXzsIY1O4cc2zH7z3JMko8FdoA0r+8nO5aezWFygCQ==:
 Fxmj3gD8kQGBBra2UBBAihPQhVJHSz/2SI8zjFE8/IYoUkj6KRpcrnBLDCjYcynrHZ5SsrvnK6B
 rfz3R+WJooWAUb7Q54zSbMC3w5UUMR3NXtsFmT+/uHUg6HHwTbMP7PfGuup3oPn3aMybSIHSOKC
 dgdO1gup56+2VyUIkRqZt1168t031Wk9tkfJ/7LMyHehRHe7Pt27pYgCjflOQqC6qBrUnWB29ei
 1Jbf2f39wPTvA3Q5hp/dlanhy1rpLewOnWjA4F4cn1GnyhGJGnvauf7msxGjiRdD/qegKULFMV6
 4jBsYWiHAxD8QO+H6cPQwj9C91N+HQuopOViDoSVG0dghgj58xdqyqt+daO7pqVFlbAL9b4Mmpg
 vIsFp3u8S4KgE8RyG8R5fwcZhunMXSiO4RWNCJqZkEYOTEt/nrQaHP6esVMnqRayBsMR3IGfNYW
 t2zJCyJVseQk9zmPsWZ3b9DiX31WcmAzZ6LLATgd/KdYfiMxJVjbRcZ4fs5pmnOti87LCtxVeLb
 btfHz6D2sQSrcjCgBSiT0V6OPQ/tyd89pLoHUsCE38elR3jeBKAaqcYB2BLPIJpRlqsptbZ2Hpz
 Sact+0MPBzq2mrAGbxDaGiHOlKc2d+OwMkIzz9vGiug=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 64C67A4C0A3B;
 Wed, 28 Oct 2026 21:22:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38774)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMAAP-000000004V1-0lpf;
 Wed, 28 Oct 2026 20:22:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 28 Oct 2026 21:22:36 +0100
Message-ID: <20261028202236.298657-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/libopenh264: switch to meson
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Meson support is available since version 1.8.0, added in 2018:
https://github.com/cisco/openh264/commit/bb896dbb268b32c060480d25722c5f0c3f08e9ba

Added patch to add mips arch to meson build system, in contrast to the
previously used build system the meson files lacked mips support.

Meson needs host-nasm also for i386:
https://github.com/cisco/openh264/blob/v2.7.0/meson.build#L151

Fixes build error:

/builds/bkuhls/buildroot/br-test-pkg/bootlin-x86-i686-musl/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
 codec/encoder/core/x86/coeff.o:
 warning: relocation in read-only section `.text'
/builds/bkuhls/buildroot/br-test-pkg/bootlin-x86-i686-musl/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-musl/15.3.0/../../../../i686-buildroot-linux-musl/bin/ld:
 read-only segment has dynamic relocations
collect2: error: ld returned 1 exit status

For details see:
https://bugzilla.redhat.com/show_bug.cgi?id=2428281

Fixes:
https://autobuild.buildroot.net/results/7c2/7c2232664031cfc441b8615f36bc0ebe3be9c29f/

The oldest build error of this kind dates back to 2024:
https://autobuild.buildroot.net/results/e9d/e9df2fe3d7f044c539a775bf41a02e96e01a1d8d/
so a backport to LTS branches should be considered.

The switch to meson also fixes a build error detected by the Gitlab
pipelines for target
bootlin-aarch64-glibc-old/build/libopenh264-2.6.0/.stamp_built:

/builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/host/bin/aarch64-linux-g++
 -o h264dec codec/console/dec/src/d3d9_utils.o codec/console/dec/src/h264dec.o
 -L. -ldecoder -lcommon -lconsole_common

./libdecoder.a(wels_decoder_thread.o): In function `SemWait':
wels_decoder_thread.cpp:(.text+0x3f0): undefined reference to `sem_timedwait'
wels_decoder_thread.cpp:(.text+0x454): undefined reference to `sem_wait'
./libdecoder.a(wels_decoder_thread.o): In function `SemRelease':
wels_decoder_thread.cpp:(.text+0x4b0): undefined reference to `sem_post'
./libcommon.a(WelsThreadLib.o): In function `WelsThreadCreate':
WelsThreadLib.cpp:(.text+0xd0): undefined reference to `pthread_create'
./libcommon.a(WelsThreadLib.o): In function `WelsThreadJoin':
WelsThreadLib.cpp:(.text+0xf4): undefined reference to `pthread_join'
./libcommon.a(WelsThreadLib.o): In function `WelsEventOpen':
WelsThreadLib.cpp:(.text+0x12c): undefined reference to `sem_init'
./libcommon.a(WelsThreadLib.o): In function `WelsEventClose':
WelsThreadLib.cpp:(.text+0x194): undefined reference to `sem_destroy'
./libcommon.a(WelsThreadLib.o): In function `WelsEventSignal':
WelsThreadLib.cpp:(.text+0x1e4): undefined reference to `sem_post'
./libcommon.a(WelsThreadLib.o): In function `WelsEventWait':
WelsThreadLib.cpp:(.text+0x1f4): undefined reference to `sem_wait'
./libcommon.a(WelsThreadLib.o): In function `WelsEventWaitWithTimeOut':
WelsThreadLib.cpp:(.text+0x228): undefined reference to `sem_wait'
WelsThreadLib.cpp:(.text+0x2b0): undefined reference to `sem_timedwait'
./libcommon.a(WelsThreadLib.o): In function `WelsMultipleEventsWaitSingleBlocking':
WelsThreadLib.cpp:(.text+0x2f4): undefined reference to `sem_wait'
WelsThreadLib.cpp:(.text+0x334): undefined reference to `sem_trywait'
collect2: error: ld returned 1 exit status

caused by not linking against libpthread.
In glibc versions < 2.34 this was necessary:
https://sourceware.org/git/?p=glibc.git;a=blob;f=NEWS;h=da4b2223e946368018dfb5ad73532ebf7dd84181;hb=HEAD#l1048

Meson takes care of this dependency.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/eb38a1865472c7ada979b1a1ef38fbf98bb2edbc

 .../0001-meson.build-add-mips-arch.patch      | 96 +++++++++++++++++++
 package/libopenh264/libopenh264.mk            | 40 +-------
 2 files changed, 98 insertions(+), 38 deletions(-)
 create mode 100644 package/libopenh264/0001-meson.build-add-mips-arch.patch

diff --git a/package/libopenh264/0001-meson.build-add-mips-arch.patch b/package/libopenh264/0001-meson.build-add-mips-arch.patch
new file mode 100644
index 0000000000..6a9bfc87bc
--- /dev/null
+++ b/package/libopenh264/0001-meson.build-add-mips-arch.patch
@@ -0,0 +1,96 @@
+From b6b77205cc4bf25fd4df2aa82c20014994709656 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 28 Oct 2026 20:44:49 +0100
+Subject: [PATCH] meson.build: add mips arch
+
+Upstream: https://github.com/cisco/openh264/pull/4068
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ codec/common/meson.build     | 4 ++++
+ codec/decoder/meson.build    | 4 ++++
+ codec/encoder/meson.build    | 4 ++++
+ codec/processing/meson.build | 4 ++++
+ meson.build                  | 6 ++++++
+ 5 files changed, 22 insertions(+)
+
+diff --git a/codec/common/meson.build b/codec/common/meson.build
+index 963da74b..0c63d445 100644
+--- a/codec/common/meson.build
++++ b/codec/common/meson.build
+@@ -75,6 +75,10 @@ elif cpu_family == 'ppc'
+   asm_sources = []
+ elif cpu_family == 'ppc64'
+   asm_sources = []
++elif cpu_family == 'mips'
++  asm_sources = []
++elif cpu_family == 'mips64'
++  asm_sources = []
+ else
+   error('Unsupported cpu_family @0@'.format(cpu_family))
+ endif
+diff --git a/codec/decoder/meson.build b/codec/decoder/meson.build
+index 23352ff8..ece28542 100644
+--- a/codec/decoder/meson.build
++++ b/codec/decoder/meson.build
+@@ -60,6 +60,10 @@ elif cpu_family == 'ppc'
+   asm_sources = []
+ elif cpu_family == 'ppc64'
+   asm_sources = []
++elif cpu_family == 'mips'
++  asm_sources = []
++elif cpu_family == 'mips64'
++  asm_sources = []
+ else
+   error('Unsupported cpu family @0@'.format(cpu_family))
+ endif
+diff --git a/codec/encoder/meson.build b/codec/encoder/meson.build
+index bebb74c2..f2648211 100644
+--- a/codec/encoder/meson.build
++++ b/codec/encoder/meson.build
+@@ -89,6 +89,10 @@ elif cpu_family == 'ppc'
+   asm_sources = []
+ elif cpu_family == 'ppc64'
+   asm_sources = []
++elif cpu_family == 'mips'
++  asm_sources = []
++elif cpu_family == 'mips64'
++  asm_sources = []
+ else
+   error('Unsupported cpu family @0@'.format(cpu_family))
+ endif
+diff --git a/codec/processing/meson.build b/codec/processing/meson.build
+index 1c56eb57..a7203646 100644
+--- a/codec/processing/meson.build
++++ b/codec/processing/meson.build
+@@ -62,6 +62,10 @@ elif cpu_family == 'ppc'
+   asm_sources = []
+ elif cpu_family == 'ppc64'
+   asm_sources = []
++elif cpu_family == 'mips'
++  asm_sources = []
++elif cpu_family == 'mips64'
++  asm_sources = []
+ else
+   error('Unsupported cpu family @0@'.format(cpu_family))
+ endif
+diff --git a/meson.build b/meson.build
+index 0a9f3d0d..c9d74713 100644
+--- a/meson.build
++++ b/meson.build
+@@ -105,6 +105,12 @@ if ['linux', 'freebsd', 'android', 'ios', 'darwin'].contains(system)
+   elif cpu_family == 'ppc64'
+     # We don't have powerpc64-specific optimization for now.
+     asm_format = asm_format64
++  elif cpu_family == 'mips'
++    # We don't have mips-specific optimization for now.
++    asm_format = asm_format32
++  elif cpu_family == 'mips64'
++    # We don't have mips-specific optimization for now.
++    asm_format = asm_format64
+   else
+     error('FIXME: unhandled CPU family @0@ for @1@'.format(cpu_family, system))
+   endif
+-- 
+2.47.3
+
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index c9584b4ebe..b3745669bb 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -12,44 +12,8 @@ LIBOPENH264_CPE_ID_VENDOR = cisco
 LIBOPENH264_CPE_ID_PRODUCT = openh264
 LIBOPENH264_INSTALL_STAGING = YES
 
-ifeq ($(BR2_aarch64),y)
-LIBOPENH264_ARCH = aarch64
-else ifeq ($(BR2_arm)$(BR2_armeb),y)
-LIBOPENH264_ARCH = arm
-else ifeq ($(BR2_i386),y)
-LIBOPENH264_ARCH = x86
-LIBOPENH264_DEPENDENCIES += host-nasm
-else ifeq ($(BR2_mips)$(BR2_mipsel),y)
-LIBOPENH264_ARCH = mips
-else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
-LIBOPENH264_ARCH = mips64
-else ifeq ($(BR2_x86_64),y)
-LIBOPENH264_ARCH = x86_64
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
 LIBOPENH264_DEPENDENCIES += host-nasm
 endif
 
-# ENABLE64BIT is really only used for x86-64, other 64 bits
-# architecture don't need it.
-LIBOPENH264_MAKE_OPTS = \
-	ARCH=$(LIBOPENH264_ARCH) \
-	ENABLE64BIT=$(if $(BR2_x86_64),Yes,No) \
-	USE_STACK_PROTECTOR=No
-
-define LIBOPENH264_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		$(LIBOPENH264_MAKE_OPTS)
-endef
-
-define LIBOPENH264_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		$(LIBOPENH264_MAKE_OPTS) \
-		DESTDIR=$(STAGING_DIR) PREFIX=/usr install
-endef
-
-define LIBOPENH264_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		$(LIBOPENH264_MAKE_OPTS) \
-		DESTDIR=$(TARGET_DIR) PREFIX=/usr install
-endef
-
-$(eval $(generic-package))
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
