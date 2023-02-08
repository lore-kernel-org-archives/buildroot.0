Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF8EC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 09:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8E2E610A2;
	Wed,  8 Feb 2023 09:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8E2E610A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SYXQ20HEiQ5E; Wed,  8 Feb 2023 09:34:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF279610B1;
	Wed,  8 Feb 2023 09:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF279610B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C33FB1BF2C6
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 09:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9E39409AA
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 09:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9E39409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FQiEh27Q2ETN for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 09:34:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29AEF4094D
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29AEF4094D
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 09:34:11 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1pPgq3-00027p-VD;
 Wed, 08 Feb 2023 09:34:04 +0000
Date: Wed, 8 Feb 2023 09:34:01 +0000
From: John Keeping <john@metanate.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <Y+NsiQNtivPVdAb7@donbot>
References: <20230206162617.1907911-1-john@metanate.com>
 <20230207135503.GF4124@scaer> <Y+Ku/Thi5kKP4P8E@donbot>
 <6fb44e39-92ac-60d3-2c87-8c156ac850dc@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6fb44e39-92ac-60d3-2c87-8c156ac850dc@mind.be>
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=QEyJgNY60QZu0vP5XbN59thhb+caVvzzCUpvsHCsb0E=; b=YaSHq
 Xn1XyHEG26eN4A+i4T4F9HaUpgRpwta2EfyCFf8VixvUiY5kaZj6sqgAmT5svHOnBorbn9xlJD1PP
 T3LcrCA6NO32B8TnTw+K60UQEvVz/k7p7c9PQCWMAUnV+kJSQHNX2SwgqBfQ6S5b1FqijNIVeCC3Y
 YEZkKj9BpT4ZQMDOY6WxLUkn+7fnQXQo9dZDIHQ+70M9dUh5oIGZdvD/X01JwUpAPUo05r9lBER6Q
 lUnySCF878yLQLrU6RJSM1REgSumEs9ujNapCX27jJVPoVHbpSz90Sj8T9ZjfUqg4HeMlJE+m7Adx
 AQH8eFYM/26oZdevUC1tqmNzYV12w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=YaSHqXn1
Subject: Re: [Buildroot] [PATCH] package/gcc/gcc-final: map debug prefix
 when reproducible
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Feb 08, 2023 at 09:05:01AM +0100, Arnout Vandecappelle wrote:
> On 07/02/2023 21:05, John Keeping wrote:
> [snip]
> > I've been testing this with --enable-linker-build-id in the configure
> > options as well to see whether it's possible to enable build IDs for
> > reproducible builds and this change gets a lot closer - the differences
> > are now a handful of files that embed an RPATH pointing to .libs during
> > the build.
> 
>  Just so I understand things correctly: those .libs RPATH entries get
> removed by Buildroot's patchelf run at the end of the build, but they still
> end up affecting the build-id, correct? And these RPATH entries are of
> course not affected by file-prefix-map, because that would break them
> entirely...

Yes, that's largely correct - the RPATH entries are removed and are not
present in the target.

The files are still slightly different as a follow-on effect since the
path is included in the string table.  (Note that the two build
directories I'm using for testing have different *length* names.)

	$ diff -u <(readelf -hlS build-1/target/bin/mount) <(readelf -hlS build-1abc/target/bin/mount) 
	--- /dev/fd/63  2023-02-08 09:26:16.879386009 +0000
	+++ /dev/fd/62  2023-02-08 09:26:16.882719365 +0000
	@@ -8,7 +8,7 @@
	   Type:                              DYN (Position-Independent Executable file)
	   Machine:                           ARM
	   Version:                           0x1
	-  Entry point address:               0x44ac
	+  Entry point address:               0x44b0
	   Start of program headers:          52 (bytes into file)
	   Start of section headers:          41268 (bytes into file)
	   Flags:                             0x5000200, Version5 EABI, soft-float ABI
	@@ -28,18 +28,18 @@
	   [ 4] .hash             HASH            000001ac 0001ac 0004a0 04   A  6   0  4
	   [ 5] .gnu.hash         GNU_HASH        0000064c 00064c 000018 04   A  6   0  4
	   [ 6] .dynsym           DYNSYM          00000664 000664 000a30 10   A  7   3  4
	-  [ 7] .dynstr           STRTAB          00001094 001094 000a69 00   A  0   0  1
	-  [ 8] .gnu.version      VERSYM          00001afe 001afe 000146 02   A  6   0  2
	-  [ 9] .gnu.version_r    VERNEED         00001c44 001c44 000130 00   A  7   3  4
	-  [10] .rel.dyn          REL             00001d74 001d74 000260 08   A  6   0  4
	-  [11] .rel.plt          REL             00001fd4 001fd4 0004a8 08  AI  6  23  4
	-  [12] .init             PROGBITS        0000247c 00247c 00000c 00  AX  0   0  4
	-  [13] .plt              PROGBITS        00002488 002488 000710 04  AX  0   0  4
	-  [14] .text             PROGBITS        00002b98 002b98 0057d4 00  AX  0   0  4
	-  [15] .fini             PROGBITS        0000836c 00836c 000008 00  AX  0   0  4
	-  [16] .rodata           PROGBITS        00008374 008374 00151c 00   A  0   0  4
	-  [17] .ARM.exidx        ARM_EXIDX       00009890 009890 000008 00  AL 14   0  4
	-  [18] .eh_frame         PROGBITS        00009898 009898 000004 00   A  0   0  4
	+  [ 7] .dynstr           STRTAB          00001094 001094 000a6c 00   A  0   0  1
	+  [ 8] .gnu.version      VERSYM          00001b00 001b00 000146 02   A  6   0  2
	+  [ 9] .gnu.version_r    VERNEED         00001c48 001c48 000130 00   A  7   3  4
	+  [10] .rel.dyn          REL             00001d78 001d78 000260 08   A  6   0  4
	+  [11] .rel.plt          REL             00001fd8 001fd8 0004a8 08  AI  6  23  4
	+  [12] .init             PROGBITS        00002480 002480 00000c 00  AX  0   0  4
	+  [13] .plt              PROGBITS        0000248c 00248c 000710 04  AX  0   0  4
	+  [14] .text             PROGBITS        00002b9c 002b9c 0057d4 00  AX  0   0  4
	+  [15] .fini             PROGBITS        00008370 008370 000008 00  AX  0   0  4
	+  [16] .rodata           PROGBITS        00008378 008378 00151c 00   A  0   0  4
	+  [17] .ARM.exidx        ARM_EXIDX       00009894 009894 000008 00  AL 14   0  4
	+  [18] .eh_frame         PROGBITS        0000989c 00989c 000004 00   A  0   0  4
	   [19] .init_array       INIT_ARRAY      0001994c 00994c 000004 04  WA  0   0  4
	   [20] .fini_array       FINI_ARRAY      00019950 009950 000004 04  WA  0   0  4
	   [21] .data.rel.ro      PROGBITS        00019954 009954 0002fc 00  WA  0   0  4
	@@ -57,11 +57,11 @@
	 
	 Program Headers:
	   Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
	-  EXIDX          0x009890 0x00009890 0x00009890 0x00008 0x00008 R   0x4
	+  EXIDX          0x009894 0x00009894 0x00009894 0x00008 0x00008 R   0x4
	   PHDR           0x000034 0x00000034 0x00000034 0x00120 0x00120 R   0x4
	   INTERP         0x000154 0x00000154 0x00000154 0x00013 0x00013 R   0x1
	       [Requesting program interpreter: /lib/ld-linux.so.3]
	-  LOAD           0x000000 0x00000000 0x00000000 0x0989c 0x0989c R E 0x10000
	+  LOAD           0x000000 0x00000000 0x00000000 0x098a0 0x098a0 R E 0x10000
	   LOAD           0x00994c 0x0001994c 0x0001994c 0x006c0 0x006cc RW  0x10000
	   DYNAMIC        0x009c50 0x00019c50 0x00019c50 0x00120 0x00120 RW  0x4
	   NOTE           0x000168 0x00000168 0x00000168 0x00044 0x00044 R   0x4

	$ diff -u <(readelf -p 7 build-1/target/bin/mount) <(readelf -p 7 build-1abc/target/bin/mount) 
	--- /dev/fd/63  2023-02-08 09:26:28.439469928 +0000
	+++ /dev/fd/62  2023-02-08 09:26:28.439469928 +0000
	@@ -171,5 +171,5 @@
	   [   a0b]  MOUNT_2.21
	   [   a16]  MOUNT_2.24
	   [   a21]  MOUNT_2.19
	-  [   a2d]  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	+  [   a2d]  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
