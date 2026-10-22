Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6B5606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 22:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dDwf3jYL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=Ez778EOf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0177608C0;
	Thu, 22 Oct 2026 22:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2j-r0d7ZcTt6; Thu, 22 Oct 2026 22:28:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3B051608AA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792708081;
	b=itMGMeUcawG7Ws+S0bdzbEChRnK9nCKe0qFhnYC7/k1eKDMOGDLfg4OkHLzaEhFY7Cgb
	 gMg9Hu1ERA3J2Uf+1xAbQOwEeHq/bTCwYIBuogTsxB/oU7pDCviIMXQpQIioDOLdlKZRv
	 FrbathGc1aTtMkzQAODNk7k1f5V9AqC6f78embAEzNOS/i61BcqZYDao0NSTqDiw36sNA
	 n0Jxq3YuWW3SXMYkdJnmPc+qeJwMhupZGukMuuMN2f3FRtSdhCCVTWiFXtBNQvuXyo2xu
	 KV6pOtEpqahmRIyAPz19CHYj7szsJpIgFEmsgYtJRTn76wHGKejbmtiAglcCs3IpI1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792708081;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=uSFPoZQti8MaOFnjDbjkDzlZwATbvPQkJqsoQXuZ36Y=;
	b=ZZyEZ94iuowT1xK+HLCUL5QxUY90LZWSwUVioX8wEpnYClDXCZKcSetSADJwyOOBlRnu
	 7M+yc2H/r5jERoxwe83v2cOB+6ePM1YpzPETGsxCWZyxifvV5tTUXRMd/UFhg10OFaF95
	 isO/HVavY+Gp4ujmie5P5EZ7UwSF0SxqvEjelKhUyQzLbxviVpJXgSq93e/JTzUM7H5Z4
	 zWLSYPAqFYqlqXoyjZKPIj3g8Br6BJJXlHsxu17uiS3h94+gGUd06+HShsifE9Ws7yGcR
	 qUvtJhv6LVM3fkPMEr/mVZa6R6xvogwn54eY9cx7Vz36o3jeiSnMVshPFTCEASHNGmA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792708081;
	bh=uSFPoZQti8MaOFnjDbjkDzlZwATbvPQkJqsoQXuZ36Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dDwf3jYLpxRLQwtZmg0Bbpsucalhoa3UUsPuekNszafmGOJhGzW+oT++w8x8stbQK
	 3qL+6hEDe8+wX1lH/z9Y+xj2l0rIzzTlX3TQsLwdCxQ620PCqxd9z1By8MDD9874I9
	 M0SMWHDhkjoFBKlB83Pafi24+NFIPz7vQ0zcrC0Ui3Bn619H+r1YlHIF2yWS2v7MDK
	 v84AwuSvCitGn9bfsiuIuc7UZ1DKC+WYKWQkI6JvRQu2Ko+4F4ey48ROG1eyKq21KP
	 v/IpgVfbDb4cVl4lMPKochP7zuZi5+/AHfkcDVCGrVSB/7QmwXTEUfv3qRKm6HhSrQ
	 yFcwX5hnh1yRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B051608AA;
	Thu, 22 Oct 2026 22:28:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 561264BC
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B70140955
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILovD3m5bmfK for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 22:27:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 636E94094E
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792708077;
 b=Gqi4a3mUd4Jwai3aaMPC6+W+z+l70wZ7S2xB3DbqVWQpb7QU+m9gUxhmIiK1J+n8yAKt
 cg5nhkbFlXjC4j/rDhp8NIm8dVaH15wtiuENyrX0wMFyhRMl1kIPuP6nIFUI12tTjfP0u
 jpzBVUvt56Lf9fGoAsgM2L74ZL+lxGxEqdfvuuW2GmRk4F7O1Dn6lg33ywAVRvHBNWZDC
 mrZUweiEodLX+4+Z/rt7a1tRFgTJYDcLQWVtsWPnKTltXKWqAJJ2zHIiHFlUarQHAlBnj
 CO7M67yIvZ5N6eDG3Q3eJw4a9//OIi/XLiaGDSvcDvZyi9HNFrGfqccjTV6LvKBusQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792708077;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=zwTYHPA6QEU31wjSYHcphw07GBB/S8hZIgSPd6MhwCA=;
 b=WFRcAwTAv14jDHnKzytW1QoRri9vQgQP3lLA/i6HYfkPgT462CvLbebXeFQk0j4nCe8S
 HTxZZ3r1WippZN3Kro4Uf4MKEAoOI4xE72r6uoBew/A0p9m1LfRWd9b952KLW53N8RadB
 /D4Q0/scr2IWxw48SZnrst5SVGbPIYxWasbEFr4Mw7o18Msf+HORJsTXBEEe3hMRGGW9Z
 ecI5AQDntpsj75iVjfvRShV2maP0zOOrlNiWtlrpJRvhpxQl4Ji7pbWxWXjJWYOjJCwM0
 JAS3su94jzSqIwES4XTIHQA/w/r/r4ZEmf/v4PmhHox8igtz5LZyqPx0PmrefldhJ6A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=Ez778EOf; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Ez778EOf
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 636E94094E
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:27:56 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6b203527bceso326115a12.0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792708075; x=1793312875; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zwTYHPA6QEU31wjSYHcphw07GBB/S8hZIgSPd6MhwCA=;
 b=Ez778EOfZSni1moeKYZXpjFhHL4uEjLzdSu+7VeCBJGQQCcPDlVWvKk0Hf1NvexMhI
 SbNC8EuzJ1YBG5UcNAgw9KiouBPd7VLu5W6NNdFUKLCyFwTUyFlenzAZskN/GE/EcMip
 K5oetDp0hc961QMaugszliYb+tQvAKL55hEKkUcbuNx+fdQ+w+Y6zgD+AJ3WFuQmzL8t
 5huOuqbkmxzhUBPmNNK4+TLuq1uYAa+YwM6vMxcTCXm1ZJZHuAfRfrZqagXbBSoPO0so
 AlIW8IeZ+k6AddFVMIuu7xTgZjAXUw08X8JIMtSTZFhAEZxtuvdAsIppDxTYk7EV8X1L
 n7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792708075; x=1793312875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zwTYHPA6QEU31wjSYHcphw07GBB/S8hZIgSPd6MhwCA=;
 b=GRShPTdLhjPEOOQHSGCiJG+H+M948+BpYT8NpdHS11Z4pics7zWtrfXb2aLV0/hgpu
 yS7fujqVlW69hgsHlJJ/kHNIhgDg0BmlDXyrtF2milz/Pg/bPu6nKk3p8PByQveitdnY
 g7ybhJjkOt26/7wMMNYt4AoQRI0gIYjyMKo/9VlxZC4xXMvXrwBTiymR9mXu/3QsHb6Q
 UAqKy77VTuxjUSU3HSfSB2arrfnp7VVv7TRjLw3/U3snhc8LWbJoe/rO8Q7OUwyjpL46
 0R5Hj8uwkFRYGRiDPInUE+wZzUtJroJUoF+S651qJbTTfgp+d52q935tEKKV9nlF7FYa
 jvfQ==
X-Gm-Message-State: AFq9FYIid3gaszXf9I2bS5xjnnRoOUnfjgKn2PbxDV1H6O2wwpMnw9sP
 9zCUdE2U7zyMSkvuIYGVkS47n86uo1D97lAw3LU7w04hVKyj02LJGa48vK/ndQ==
X-Gm-Gg: AYBFou1A04ztJ9BWhR0k/VPhlnhG+HfmhEGGxFW7aybJ6fBlU6FMOpyYW7GS9qMHy9c
 p+/dCuAwqw+s5P7tr7f62Q3H0+dFC0Veo/aJ6La1mTQoS/KyQn5Ab5hySBMunnXsE/UV3qKTczE
 xXBocT7G/vEiR2UTeapCqzNM7fprLn7OffvOpnNTg7Q3dqlCNH9pHa2QNF1yZ7SDdtuEUb5uJNK
 nPbMSshUo192szkoSOBIR9eJ0DND7Tzm1/dpMdFzaf7uNxhud4ZgPBK9LLapRjHgq6i445FNoZ8
 y/b7a4V06ZUbog+RxoFDIgjNpQqOsxQicU4ru8wkAOZtob5tl219LLjzXQWG6oeAhZhY6w1GEJV
 aclohctkAx4tY5zlSA2VfbQz6IgFsxAB/lz1fYkXMOf6g+zSaVPIb/SNohvpxPxjzqmK/jNr/73
 Bho6jsBzjxKJ2gMln+AsIYgmbLozcZrn8FyKrMCjcBFaEArdPV3bHJ9nF8UPcLvumikq+abNXpG
 VzsXF8gWVturinboU8RU2eHRJIErI5KxLQ/iLbzU2iBENPhGXTupplYiUQOVq1sd7e1oOp25efH
 g/Zt5r8RXby7m2Wv5hnkp2ZH5hc3IIOECu8+p0qHZaBXRE7Eujog0fde
X-Received: by 2002:aa7:c3d5:0:b0:6b3:af2b:3aaa with SMTP id
 4fb4d7f45d1cf-6b432c34848mr759336a12.34.1792708074573; 
 Thu, 22 Oct 2026 15:27:54 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b432cc929bsm314515a12.26.2026.10.22.15.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 15:27:53 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 00:27:52 +0200
Message-Id: <20261022222752.3530250-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022222752.3530250-1-yegorslists@googlemail.com>
References: <20261022222752.3530250-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/iozone: bump to version 3.511
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changes since 3.508: http://www.iozone.org/src/current/Changes.txt

The 3.511 release is only available as a .tgz tarball.

Drop 0002-Fix-build-without-ASYNC_IO.patch: since 3.509, iozone provides
an end_async() stub when ASYNC_IO isn't defined, so the undefined
reference it worked around is gone.

Rebase 0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch: 3.509 changed
the stub declarations, and the new end_async() stub needs a prototype
too.

Refresh the makefile patches, as 3.511 added new linux-generic and
linux-aarch64 targets, and renumber the remaining patches. License file
hash is unchanged.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../0001-Add-new-targets-for-iozone.patch     |  17 +-
 .../0002-Fix-build-without-ASYNC_IO.patch     | 191 ------------------
 ...e-libasync.o-and-libbif.o-from-deps.patch} |  23 +--
 ...-build-without-ASYNC_IO-with-GCC-15.patch} |  39 ++--
 ...rom-linux-noaio-and-linux-noth-deps.patch} |  11 +-
 package/iozone/iozone.hash                    |   2 +-
 package/iozone/iozone.mk                      |   4 +-
 7 files changed, 48 insertions(+), 239 deletions(-)
 delete mode 100644 package/iozone/0002-Fix-build-without-ASYNC_IO.patch
 rename package/iozone/{0003-remove-libasync.o-and-libbif.o-from-deps.patch => 0002-remove-libasync.o-and-libbif.o-from-deps.patch} (88%)
 rename package/iozone/{0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch => 0003-Fix-build-without-ASYNC_IO-with-GCC-15.patch} (72%)
 rename package/iozone/{0005-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch => 0004-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch} (88%)

diff --git a/package/iozone/0001-Add-new-targets-for-iozone.patch b/package/iozone/0001-Add-new-targets-for-iozone.patch
index 585f128724..618412c7be 100644
--- a/package/iozone/0001-Add-new-targets-for-iozone.patch
+++ b/package/iozone/0001-Add-new-targets-for-iozone.patch
@@ -1,4 +1,4 @@
-From 015b6fa0c4a503ae822e6cf787de82e09bc44511 Mon Sep 17 00:00:00 2001
+From 0d6e519d6cf4b7b2550d136d17f198d363fb0150 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Sun, 10 Oct 2021 10:15:26 +0200
 Subject: [PATCH] Add new targets for iozone:
@@ -17,10 +17,10 @@ Signed-off-by: Romain Naour <romain.naour@smile.fr>
  1 file changed, 47 insertions(+), 9 deletions(-)
 
 diff --git a/src/current/makefile b/src/current/makefile
-index 24a391e..bd66a4e 100755
+index 32aa57e..98c5368 100755
 --- a/src/current/makefile
 +++ b/src/current/makefile
-@@ -172,10 +172,28 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
+@@ -174,10 +174,28 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
  # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
  #
  linux:	iozone_linux.o libasync.o libbif.o fileop_linux.o pit_server.o
@@ -50,9 +50,9 @@ index 24a391e..bd66a4e 100755
 +	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
 +	$(CC)  $(CFLAGS) -Dlinux pit_server.o -o pit_server
  
- #
- # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
-@@ -841,13 +859,33 @@ iozone_linux.o:	iozone.c libbif.c libasync.c
+ # Generic GNU/Clang Linux cross-compile build with threads, largefiles, async I/O.
+ # Honors the toolchain's $(CC), $(CFLAGS) and $(LDFLAGS); the data model (32- vs
+@@ -881,13 +899,33 @@ iozone_linux.o:	iozone.c libbif.c libasync.c
  	@echo ""
  	@echo "Building iozone for Linux"
  	@echo ""
@@ -91,7 +91,7 @@ index 24a391e..bd66a4e 100755
  
  fileop_AIX.o:	fileop.c
  	@echo ""
-@@ -951,7 +989,7 @@ fileop_linux.o:	fileop.c
+@@ -991,7 +1029,7 @@ fileop_linux.o:	fileop.c
  	@echo ""
  	@echo "Building fileop for Linux"
  	@echo ""
@@ -100,6 +100,3 @@ index 24a391e..bd66a4e 100755
  
  fileop_openbsd.o:	fileop.c
  	@echo ""
--- 
-2.51.0
-
diff --git a/package/iozone/0002-Fix-build-without-ASYNC_IO.patch b/package/iozone/0002-Fix-build-without-ASYNC_IO.patch
deleted file mode 100644
index 92621e5242..0000000000
--- a/package/iozone/0002-Fix-build-without-ASYNC_IO.patch
+++ /dev/null
@@ -1,191 +0,0 @@
-From cdd5e78a275c8cda5d48d15acc96c3be5170bf2f Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Sat, 6 Sep 2025 00:26:00 +0200
-Subject: [PATCH] Fix build without ASYNC_IO
-
-Fix the following build failure without ASYNC_IO:
-
-/home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/12.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: iozone_linux-noaio.o: in function `read_perf_test':
-iozone.c:(.text+0x11a74): undefined reference to `end_async'
-
-Fixes:
- - http://autobuild.buildroot.org/results/31a4f0ac9eeb71df5d2f40ffe9f1f256cb58e399
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: sent to capps@iozone.org
-[Romain:
-  rebase on 3.508
-  convert to git format
-]
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- src/current/iozone.c | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/src/current/iozone.c b/src/current/iozone.c
-index 6657a9b..8de26cf 100755
---- a/src/current/iozone.c
-+++ b/src/current/iozone.c
-@@ -9196,6 +9196,7 @@ long long *data1,*data2;
- 				}
- 			  }
- 			}
-+#ifdef ASYNC_IO
- 			if(async_flag)
- 			{
- 				if(no_copy_flag)
-@@ -9203,6 +9204,7 @@ long long *data1,*data2;
- 				end_async(gc);
- 				gc=0;
- 			}
-+#endif
- 			buffer1=0;
- 			if(hist_summary)
- 			{
-@@ -9677,6 +9679,7 @@ long long *data1, *data2;
- 				}
- 			  }
- 			}
-+#ifdef ASYNC_IO
- 			if(async_flag)
- 			{
- 				if(no_copy_flag)
-@@ -9684,6 +9687,7 @@ long long *data1, *data2;
- 				end_async(gc);
- 				gc=0;
- 			}
-+#endif
- 			if(rlocking)
- 			{
- 				lock_offset=I_LSEEK(fd,0,SEEK_CUR);
-@@ -10140,6 +10144,7 @@ long long *data1,*data2;
- 				}
- 			   }
- 			}
-+#ifdef ASYNC_IO
- 			if(async_flag)
- 			{
- 				if(no_copy_flag)
-@@ -10147,6 +10152,7 @@ long long *data1,*data2;
- 				end_async(gc);
- 				gc=0;
- 			}
-+#endif
- 			if(rlocking)
- 			{
- 				mylockr((int) fd, (int) 0, (int)1,
-@@ -10792,6 +10798,7 @@ printf("Read_Stride\n");
- 			   }
- 			}
- 		}
-+#ifdef ASYNC_IO
- 		if(async_flag)
- 		{
- 			if(no_copy_flag)
-@@ -10799,6 +10806,7 @@ printf("Read_Stride\n");
- 			end_async(gc);
- 			gc=0;
- 		}
-+#endif
- 			
- 		/* This is a bit tricky.  The goal is to read with a stride through
- 		   the file. The problem is that you need to touch all of the file
-@@ -15528,6 +15536,7 @@ thread_read_test(x)
- 			   }
- 		   }
- 		}
-+#ifdef ASYNC_IO
- 		if(async_flag)
- 		{
- 			if(no_copy_flag)
-@@ -15535,6 +15544,7 @@ thread_read_test(x)
- 			end_async(gc);
- 			gc=0;
- 		}
-+#endif
- 		read_so_far+=reclen/1024;
- 		r_traj_bytes_completed+=reclen;
- 		r_traj_ops_completed++;
-@@ -16093,6 +16103,7 @@ thread_pread_test(x)
- 			   }
- 		   }
- 		}
-+#ifdef ASYNC_IO
- 		if(async_flag)
- 		{
- 			if(no_copy_flag)
-@@ -16100,6 +16111,7 @@ thread_pread_test(x)
- 			end_async(gc);
- 			gc=0;
- 		}
-+#endif
- 		read_so_far+=reclen/1024;
- 		r_traj_bytes_completed+=reclen;
- 		r_traj_ops_completed++;
-@@ -16708,6 +16720,7 @@ thread_rread_test(x)
- 			}
- 		   }
- 		}
-+#ifdef ASYNC_IO
- 		if(async_flag)
- 		{
- 			if(no_copy_flag)
-@@ -16715,6 +16728,7 @@ thread_rread_test(x)
- 			end_async(gc);
- 			gc=0;
- 		}
-+#endif
- 		re_read_so_far+=reclen/1024;
- 		r_traj_bytes_completed+=reclen;
- 		r_traj_ops_completed++;
-@@ -17287,6 +17301,7 @@ thread_reverse_read_test(x)
- 			  lock_offset, reclen);
- 		}
- 		current_position+=reclen;
-+#ifdef ASYNC_IO
- 		if(async_flag)
- 		{
- 			if(no_copy_flag)
-@@ -17294,6 +17309,7 @@ thread_reverse_read_test(x)
- 			end_async(gc);
- 			gc=0;
- 		}
-+#endif
- 		t_offset = (off64_t)reclen*2;
- 		if (!(h_flag || k_flag || mmapflag))
- 		{
-@@ -17821,6 +17837,7 @@ thread_stride_read_test(x)
- 			}
- 		   }
- 		}
-+#ifdef ASYNC_IO
- 		if(async_flag)
- 		{
- 			if(no_copy_flag)
-@@ -17828,6 +17845,7 @@ thread_stride_read_test(x)
- 			end_async(gc);
- 			gc=0;
- 		}
-+#endif
- 		if(current_position + (stride * reclen) >= (numrecs64 * reclen)-reclen) 
- 		{
- 			current_position=0;
-@@ -18571,6 +18589,7 @@ void *x;
- 			}
- 		   }
- 		}
-+#ifdef ASYNC_IO
- 		if(async_flag)
- 		{
- 			if(no_copy_flag)
-@@ -18578,6 +18597,7 @@ void *x;
- 			end_async(gc);
- 			gc=0;
- 		}
-+#endif
- 		ranread_so_far+=reclen/1024;
- 		if(*stop_flag)
- 		{
--- 
-2.51.0
-
diff --git a/package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch b/package/iozone/0002-remove-libasync.o-and-libbif.o-from-deps.patch
similarity index 88%
rename from package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch
rename to package/iozone/0002-remove-libasync.o-and-libbif.o-from-deps.patch
index ea4c9c97b3..aca6c3cbc1 100644
--- a/package/iozone/0003-remove-libasync.o-and-libbif.o-from-deps.patch
+++ b/package/iozone/0002-remove-libasync.o-and-libbif.o-from-deps.patch
@@ -25,10 +25,10 @@ https://github.com/openembedded/meta-openembedded/blob/walnascar/meta-oe/recipes
  1 file changed, 9 insertions(+), 9 deletions(-)
 
 diff --git a/src/current/makefile b/src/current/makefile
-index bd66a4e..ba5759f 100755
+index 98c5368..497583f 100755
 --- a/src/current/makefile
 +++ b/src/current/makefile
-@@ -171,7 +171,7 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
+@@ -173,7 +173,7 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
  #
  # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
  #
@@ -37,7 +37,7 @@ index bd66a4e..ba5759f 100755
  	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux.o libasync.o libbif.o \
  		-lpthread -lrt -o iozone
  	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
-@@ -198,7 +198,7 @@ linux-noth: iozone_linux-noth.o libbif.o fileop_linux.o pit_server.o
+@@ -215,7 +215,7 @@ linux-generic: iozone_linux-generic.o libasync.o libbif.o fileop_linux.o pit_ser
  #
  # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
  #
@@ -46,7 +46,7 @@ index bd66a4e..ba5759f 100755
  	$(CC) -O3 $(LDFLAGS) iozone_linux-powerpc.o libasync.o \
  		libbif.o -lpthread  -lrt -o iozone
  	$(CC)  -O3 -Dlinux fileop_linux-ppc.o -o fileop
-@@ -206,7 +206,7 @@ linux-powerpc: iozone_linux-powerpc.o  libbif.o libasync.o fileop_linux-ppc.o pi
+@@ -223,7 +223,7 @@ linux-powerpc: iozone_linux-powerpc.o  libbif.o libasync.o fileop_linux-ppc.o pi
  #
  # GNU 'C' compiler Linux build for sparc chip with threads, largefiles, async I/O 
  #
@@ -55,7 +55,7 @@ index bd66a4e..ba5759f 100755
  	$(CC) -O3 $(LDFLAGS) iozone_linux-sparc.o libasync.o libbif.o \
  		-lpthread -lrt -o iozone
  	$(CC) -O3 -Dlinux fileop_linux.o -o fileop
-@@ -215,7 +215,7 @@ linux-sparc: iozone_linux-sparc.o  libbif.o libasync.o fileop_linux.o pit_server
+@@ -232,7 +232,7 @@ linux-sparc: iozone_linux-sparc.o  libbif.o libasync.o fileop_linux.o pit_server
  #
  # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
  #
@@ -64,7 +64,7 @@ index bd66a4e..ba5759f 100755
  	$(CC) -O3 $(LDFLAGS) iozone_linux-ia64.o libbif.o libasync.o \
  		-lrt -lpthread -o iozone
  	$(CC)  -O3 -Dlinux fileop_linux-ia64.o -o fileop
-@@ -224,7 +224,7 @@ linux-ia64:	iozone_linux-ia64.o  libbif.o libasync.o fileop_linux-ia64.o pit_ser
+@@ -241,7 +241,7 @@ linux-ia64:	iozone_linux-ia64.o  libbif.o libasync.o fileop_linux-ia64.o pit_ser
  #
  # GNU 'C' compiler Linux build for powerpc chip with threads, largefiles, async I/O 
  #
@@ -73,7 +73,7 @@ index bd66a4e..ba5759f 100755
  	$(CC) -O3 -Dunix -DHAVE_ANSIC_C -DSHARED_MEM -DASYNC_IO \
  		-D_LARGEFILE64_SOURCE -Dlinux \
  		iozone_linux-powerpc64.o libasync.o libbif.o -lpthread \
-@@ -235,7 +235,7 @@ linux-powerpc64: iozone_linux-powerpc64.o  libbif.o libasync.o fileop_linux-ppc6
+@@ -252,7 +252,7 @@ linux-powerpc64: iozone_linux-powerpc64.o  libbif.o libasync.o fileop_linux-ppc6
  #
  # GNU 'C' compiler Linux build with threads, largefiles, async I/O
  #
@@ -82,7 +82,7 @@ index bd66a4e..ba5759f 100755
  	$(CC) -O3 $(LDFLAGS) iozone_linux-arm.o libbif.o libasync.o \
  		-lrt -lpthread -o iozone
  	$(CC) -O3 -Dlinux fileop_linux-arm.o -o fileop
-@@ -267,7 +267,7 @@ endif
+@@ -295,7 +295,7 @@ endif
  #
  # GNU 'C' compiler Linux build with threads, largefiles, async I/O 
  #
@@ -91,7 +91,7 @@ index bd66a4e..ba5759f 100755
  	$(CC)  -O3 $(LDFLAGS) iozone_linux-AMD64.o libbif.o libasync.o \
  		-lrt -lpthread -o iozone
  	$(CC)  -O3 -Dlinux fileop_linux-AMD64.o -o fileop
-@@ -276,7 +276,7 @@ linux-AMD64:	iozone_linux-AMD64.o  libbif.o libasync.o fileop_linux-AMD64.o pit_
+@@ -304,7 +304,7 @@ linux-AMD64:	iozone_linux-AMD64.o  libbif.o libasync.o fileop_linux-AMD64.o pit_
  #
  # GNU 'C' compiler Linux build with S/390, threads, largfiles, async I/O
  #
@@ -100,7 +100,7 @@ index bd66a4e..ba5759f 100755
  	$(CC)  -O2 $(LDFLAGS) -lpthread -lrt iozone_linux-s390.o \
  		libbif.o libasync.o -o iozone
  	$(CC)  -O3 -Dlinux fileop_linux-s390.o -o fileop
-@@ -285,7 +285,7 @@ linux-S390:	iozone_linux-s390.o libbif.o libasync.o fileop_linux-s390.o pit_serv
+@@ -313,7 +313,7 @@ linux-S390:	iozone_linux-s390.o libbif.o libasync.o fileop_linux-s390.o pit_serv
  #
  # GNU 'C' compiler Linux build with S/390, threads, largfiles, async I/O
  #
@@ -109,6 +109,3 @@ index bd66a4e..ba5759f 100755
  	$(CC)  -O2 $(LDFLAGS) -lpthread -lrt iozone_linux-s390x.o \
  		libbif.o libasync.o -o iozone
  	$(CC)  -O3 -Dlinux fileop_linux-s390x.o -o fileop
--- 
-2.51.0
-
diff --git a/package/iozone/0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch b/package/iozone/0003-Fix-build-without-ASYNC_IO-with-GCC-15.patch
similarity index 72%
rename from package/iozone/0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch
rename to package/iozone/0003-Fix-build-without-ASYNC_IO-with-GCC-15.patch
index b049ce60ed..ff23aa66a5 100644
--- a/package/iozone/0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch
+++ b/package/iozone/0003-Fix-build-without-ASYNC_IO-with-GCC-15.patch
@@ -1,12 +1,12 @@
-From 0cc510655874362bc95c608021ef7921ae389559 Mon Sep 17 00:00:00 2001
+From dbba660298c09171be82b4eeb01352922089a60a Mon Sep 17 00:00:00 2001
 From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Thu, 22 Oct 2026 22:16:32 +0200
+Date: Fri, 23 Oct 2026 00:16:42 +0200
 Subject: [PATCH] Fix build without ASYNC_IO with GCC >= 15
 
-Without ASYNC_IO (e.g. the linux-noaio target), the async_*() stubs
-are declared and defined without parameter lists. GCC 15 defaults to
-C23, where an empty parameter list means the function takes no
-arguments, so the build fails:
+Without ASYNC_IO (e.g. the linux-noaio target), the async_*() and
+end_async() stubs are declared and defined without parameter lists.
+GCC 15 defaults to C23, where an empty parameter list means the
+function takes no arguments, so the build fails:
 
 iozone.c:8150:32: error: too many arguments to function 'async_write_no_copy'; expected 0, have 7
 iozone.c:9126:31: error: too many arguments to function 'async_read_no_copy'; expected 0, have 8
@@ -19,31 +19,36 @@ Upstream: sent to capps@iozone.org
 Assisted-by: Claude:claude-opus-5-5
 Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 ---
- src/current/iozone.c | 26 +++++++++++++++-----------
- 1 file changed, 15 insertions(+), 11 deletions(-)
+ src/current/iozone.c | 33 ++++++++++++++++++---------------
+ 1 file changed, 18 insertions(+), 15 deletions(-)
 
 diff --git a/src/current/iozone.c b/src/current/iozone.c
-index 8de26cf..5542714 100755
+index 41e0684..6200168 100755
 --- a/src/current/iozone.c
 +++ b/src/current/iozone.c
-@@ -1332,11 +1332,11 @@ size_t async_write_no_copy(struct cache *,long long ,char *,long long,long long,
+@@ -1331,14 +1331,13 @@ size_t async_write(struct cache *,long long, char *, long long, off64_t, long lo
+ size_t async_write_no_copy(struct cache *,long long ,char *,long long,long long,long long,char *);
  #else
  long long *gc=0;
- void async_init(long long **,int,int);
+-/* void async_init(long long **,int,int);*/
+-void async_init();
 -int async_read();
 -int async_read_no_copy();
 -size_t async_write();
 -size_t async_write_no_copy();
 -void async_release();
+-void end_async();
++void async_init(long long **,int,int);
 +int async_read(long long *, long long , char *, off64_t, long long, long long, off64_t, long long);
 +int async_read_no_copy(long long *, long long, char **, off64_t, long long, long long, off64_t, long long);
 +size_t async_write(long long *,long long, char *, long long, off64_t, long long);
 +size_t async_write_no_copy(long long *,long long ,char *,long long,long long,long long,char *);
 +void async_release(long long *);
++void end_async(long long *);
  #endif
  void do_float(int, double, int, int);
  int create_xls(char *);
-@@ -20144,37 +20144,41 @@ long long length;
+@@ -20126,43 +20125,47 @@ long long length;
  
  #ifndef ASYNC_IO
  int
@@ -71,6 +76,13 @@ index 8de26cf..5542714 100755
  	exit(171);
  }
  void
+-end_async()
++end_async(long long *gc)
+ {
+ 	printf("Your system does not support async I/O\n");
+ 	exit(172);
+ }
+ void
 -async_init()
 +async_init(long long **gc, int fd, int flag)
  {
@@ -91,6 +103,3 @@ index 8de26cf..5542714 100755
  {
  	printf("Your system does not support async I/O\n");
  	exit(173);
--- 
-2.34.1
-
diff --git a/package/iozone/0005-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch b/package/iozone/0004-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch
similarity index 88%
rename from package/iozone/0005-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch
rename to package/iozone/0004-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch
index 0c4987d4df..9c9817bf85 100644
--- a/package/iozone/0005-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch
+++ b/package/iozone/0004-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch
@@ -1,4 +1,4 @@
-From 3bfbc2fe58400d32aabbceaa19a4348981931d9d Mon Sep 17 00:00:00 2001
+From 985d250303803dbf4c8efe175e24700f8358268d Mon Sep 17 00:00:00 2001
 From: Yegor Yefremov <yegorslists@googlemail.com>
 Date: Thu, 22 Oct 2026 22:59:56 +0200
 Subject: [PATCH] remove libbif.o from linux-noaio and linux-noth deps
@@ -22,10 +22,10 @@ Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/current/makefile b/src/current/makefile
-index ba5759f..168fe93 100755
+index 497583f..ea45811 100755
 --- a/src/current/makefile
 +++ b/src/current/makefile
-@@ -180,7 +180,7 @@ linux:	iozone_linux.o fileop_linux.o pit_server.o
+@@ -182,7 +182,7 @@ linux:	iozone_linux.o fileop_linux.o pit_server.o
  #
  # GNU 'C' compiler Linux build with threads, largefiles
  #
@@ -34,7 +34,7 @@ index ba5759f..168fe93 100755
  	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux-noaio.o libbif.o \
  		-lpthread -lrt -o iozone
  	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
-@@ -189,7 +189,7 @@ linux-noaio: iozone_linux-noaio.o libbif.o fileop_linux.o pit_server.o
+@@ -191,7 +191,7 @@ linux-noaio: iozone_linux-noaio.o libbif.o fileop_linux.o pit_server.o
  #
  # GNU 'C' compiler Linux build with largefiles
  #
@@ -43,6 +43,3 @@ index ba5759f..168fe93 100755
  	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux-noth.o libbif.o \
  		-lrt -o iozone
  	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
--- 
-2.34.1
-
diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index 1f41483b4a..9999a3eb22 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ee55af310a65ec97e1db214aebd75ee87f458b529cea3da37081a63974e8ace3  iozone3_508.tar
+sha256  1aa00bc3cd627ec46ca17aa78c8fabd143d32025155c741f49392b1bdd776298  iozone3_511.tgz
 sha256  bff7909fd698708d15613a4fb977a193cff98f44ef170c2dc1dd502974df75b2  docs/License.txt
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 07034cd96f..bf85393ac3 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3.508
-IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tar
+IOZONE_VERSION = 3.511
+IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tgz
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
 IOZONE_LICENSE_FILES = docs/License.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
