Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71884CE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FCEC60F18;
	Mon, 17 Nov 2025 19:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkJK9bKvdJvy; Mon, 17 Nov 2025 19:51:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2099160EB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2099160EB2;
	Mon, 17 Nov 2025 19:51:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3CB61BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C205B401EA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0x1QpoG_gUBr for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:51:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B94D4049B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B94D4049B
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B94D4049B
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 823EBB979430; Mon, 17 Nov 2025 20:51:17 +0100 (CET)
Message-ID: <a9cf16a5-5b04-4674-bcb2-5159942335fe@rnout.be>
Date: Mon, 17 Nov 2025 20:51:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
References: <20250906162551.3715975-2-romain.naour@smile.fr>
 <20250911192608.2672637-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250911192608.2672637-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1763409078; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=wGWyYz9JNIUvuSLcNw0LUZtEfW9zcc7nioyy4DI+R4Q=;
 b=hMacyB/Q+c/hhP4rpgZaO4S4/d4jmnrJ3gzO2PHHz5s4p1SvaRTqGjtd0r2HKclpLqwkUG
 XnPszd3LNfQzz45vKWiwlMRciNFKkd+RZykcra5ZklUoabte1rWhFBQGYCIFNyQKBPSNZy
 JqjbAQL4ly4hmnT+aUiYrYU8aHQ9vaFySUA5DuPMMUC9oJkuW7qiq9sw4Jq6x5xBeqbhNi
 N1Qu6yJd8d2oG9Lzux/7m/clGpgO/MEIMikx13QF/VSGeDIqYvKrc6eIzoVYpkd6AV/SFK
 Kh1xg/RZjHGyTw9kCwr2R0zNmwH9rGYpNcYXbzyhyvl3Dlf3W2bkwh9d2nD3uQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=hMacyB/Q
Subject: Re: [Buildroot] [PATCH 2/2] package/iozone: Fix parallel build
 problem
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/09/2025 21:26, Thomas Perale via buildroot wrote:
> In reply of:
>> Apply a patch from meta-openembedded fixing a cross-build issue [1].
>>
>> [1] https://github.com/openembedded/meta-openembedded/blob/walnascar/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch
>>
>> Fixes:
>> https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774405 (TestIozone)
>>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> 
> Applied to 2025.02.x & 2025.05.x. Thanks

  This time for real.

  Regards,
  Arnout

> 
>> ---
>>   ...ve-libasync.o-and-libbif.o-from-deps.patch | 114 ++++++++++++++++++
>>   1 file changed, 114 insertions(+)
>>   create mode 100644 package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch
>>
>> diff --git a/package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch b/package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch
>> new file mode 100644
>> index 0000000000..ea4c9c97b3
>> --- /dev/null
>> +++ b/package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch
>> @@ -0,0 +1,114 @@
>> +From 34c25d67c33050f42f0f243c0fb6674c28ff44b5 Mon Sep 17 00:00:00 2001
>> +From: Romain Naour <romain.naour@smile.fr>
>> +Date: Sat, 6 Sep 2025 00:31:48 +0200
>> +Subject: [PATCH] remove libasync.o and libbif.o from deps
>> +
>> +there are no implicit rules to build them and they get wrong CFLAGS
>> +when compiled with implicit rule.
>> +
>> +They are built as part of iozone_linux.o target anyway
>> +
>> +Only fixed linux targets for now
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Upstream: Pending
>> +[Romain:
>> +  rebase on 3.508
>> +  convert to git format
>> +]
>> +Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> +---
>> +Patch from Yocto:
>> +https://github.com/openembedded/meta-openembedded/blob/walnascar/meta-oe/recipes-benchmark/iozone3/iozone3/parallelism.patch
>> +---
>> + src/current/makefile | 18 +++++++++---------
>> + 1 file changed, 9 insertions(+), 9 deletions(-)
>> +
>> +diff --git a/src/current/makefile b/src/current/makefile
>> +index bd66a4e..ba5759f 100755
>> +--- a/src/current/makefile
>> ++++ b/src/current/makefile
>> +@@ -171,7 +171,7 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
>> + #
>> + # GNU 'C' compiler Linux build with threads, largefiles, async I/O
>> + #
>> +-linux:	iozone_linux.o libasync.o libbif.o fileop_linux.o pit_server.o
>> ++linux:	iozone_linux.o fileop_linux.o pit_server.o
>> + 	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux.o libasync.o libbif.o \
>> + 		-lpthread -lrt -o iozone
>> + 	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
>> +@@ -198,7 +198,7 @@ linux-noth: iozone_linux-noth.o libbif.o fileop_linux.o pit_server.o
>> + #
>> + # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O
>> + #
>> +-linux-powerpc: iozone_linux-powerpc.o  libbif.o libasync.o fileop_linux-ppc.o pit_server.o
>> ++linux-powerpc: iozone_linux-powerpc.o fileop_linux-ppc.o pit_server.o
>> + 	$(CC) -O3 $(LDFLAGS) iozone_linux-powerpc.o libasync.o \
>> + 		libbif.o -lpthread  -lrt -o iozone
>> + 	$(CC)  -O3 -Dlinux fileop_linux-ppc.o -o fileop
>> +@@ -206,7 +206,7 @@ linux-powerpc: iozone_linux-powerpc.o  libbif.o libasync.o fileop_linux-ppc.o pi
>> + #
>> + # GNU 'C' compiler Linux build for sparc chip with threads, largefiles, async I/O
>> + #
>> +-linux-sparc: iozone_linux-sparc.o  libbif.o libasync.o fileop_linux.o pit_server.o
>> ++linux-sparc: iozone_linux-sparc.o fileop_linux.o pit_server.o
>> + 	$(CC) -O3 $(LDFLAGS) iozone_linux-sparc.o libasync.o libbif.o \
>> + 		-lpthread -lrt -o iozone
>> + 	$(CC) -O3 -Dlinux fileop_linux.o -o fileop
>> +@@ -215,7 +215,7 @@ linux-sparc: iozone_linux-sparc.o  libbif.o libasync.o fileop_linux.o pit_server
>> + #
>> + # GNU 'C' compiler Linux build with threads, largefiles, async I/O
>> + #
>> +-linux-ia64:	iozone_linux-ia64.o  libbif.o libasync.o fileop_linux-ia64.o pit_server.o
>> ++linux-ia64:	iozone_linux-ia64.o fileop_linux-ia64.o pit_server.o
>> + 	$(CC) -O3 $(LDFLAGS) iozone_linux-ia64.o libbif.o libasync.o \
>> + 		-lrt -lpthread -o iozone
>> + 	$(CC)  -O3 -Dlinux fileop_linux-ia64.o -o fileop
>> +@@ -224,7 +224,7 @@ linux-ia64:	iozone_linux-ia64.o  libbif.o libasync.o fileop_linux-ia64.o pit_ser
>> + #
>> + # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O
>> + #
>> +-linux-powerpc64: iozone_linux-powerpc64.o  libbif.o libasync.o fileop_linux-ppc64.o pit_server-linux-powerpc64.o
>> ++linux-powerpc64: iozone_linux-powerpc64.o fileop_linux-ppc64.o pit_server-linux-powerpc64.o
>> + 	$(CC) -O3 -Dunix -DHAVE_ANSIC_C -DSHARED_MEM -DASYNC_IO \
>> + 		-D_LARGEFILE64_SOURCE -Dlinux \
>> + 		iozone_linux-powerpc64.o libasync.o libbif.o -lpthread \
>> +@@ -235,7 +235,7 @@ linux-powerpc64: iozone_linux-powerpc64.o  libbif.o libasync.o fileop_linux-ppc6
>> + #
>> + # GNU 'C' compiler Linux build with threads, largefiles, async I/O
>> + #
>> +-linux-arm:	iozone_linux-arm.o  libbif.o libasync.o fileop_linux-arm.o pit_server.o
>> ++linux-arm:	iozone_linux-arm.o fileop_linux-arm.o pit_server.o
>> + 	$(CC) -O3 $(LDFLAGS) iozone_linux-arm.o libbif.o libasync.o \
>> + 		-lrt -lpthread -o iozone
>> + 	$(CC) -O3 -Dlinux fileop_linux-arm.o -o fileop
>> +@@ -267,7 +267,7 @@ endif
>> + #
>> + # GNU 'C' compiler Linux build with threads, largefiles, async I/O
>> + #
>> +-linux-AMD64:	iozone_linux-AMD64.o  libbif.o libasync.o fileop_linux-AMD64.o pit_server.o
>> ++linux-AMD64:	iozone_linux-AMD64.o fileop_linux-AMD64.o pit_server.o
>> + 	$(CC)  -O3 $(LDFLAGS) iozone_linux-AMD64.o libbif.o libasync.o \
>> + 		-lrt -lpthread -o iozone
>> + 	$(CC)  -O3 -Dlinux fileop_linux-AMD64.o -o fileop
>> +@@ -276,7 +276,7 @@ linux-AMD64:	iozone_linux-AMD64.o  libbif.o libasync.o fileop_linux-AMD64.o pit_
>> + #
>> + # GNU 'C' compiler Linux build with S/390, threads, largfiles, async I/O
>> + #
>> +-linux-S390:	iozone_linux-s390.o libbif.o libasync.o fileop_linux-s390.o pit_server.o
>> ++linux-S390:	iozone_linux-s390.o fileop_linux-s390.o pit_server.o
>> + 	$(CC)  -O2 $(LDFLAGS) -lpthread -lrt iozone_linux-s390.o \
>> + 		libbif.o libasync.o -o iozone
>> + 	$(CC)  -O3 -Dlinux fileop_linux-s390.o -o fileop
>> +@@ -285,7 +285,7 @@ linux-S390:	iozone_linux-s390.o libbif.o libasync.o fileop_linux-s390.o pit_serv
>> + #
>> + # GNU 'C' compiler Linux build with S/390, threads, largfiles, async I/O
>> + #
>> +-linux-S390X:	iozone_linux-s390x.o libbif.o libasync.o fileop_linux-s390x.o pit_server.o
>> ++linux-S390X:	iozone_linux-s390x.o fileop_linux-s390x.o pit_server.o
>> + 	$(CC)  -O2 $(LDFLAGS) -lpthread -lrt iozone_linux-s390x.o \
>> + 		libbif.o libasync.o -o iozone
>> + 	$(CC)  -O3 -Dlinux fileop_linux-s390x.o -o fileop
>> +--
>> +2.51.0
>> +
>> -- 
>> 2.51.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
