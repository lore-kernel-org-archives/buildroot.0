Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8869C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8158560619;
	Sun, 20 Sep 2026 14:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FOh0S6D2lad; Sun, 20 Sep 2026 14:47:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 77ECD60714
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915678;
	b=nIRe6knb4mSqzpzOdK8ZTNpSYvpZHZdKyundC7FFlp6vtehLOt5W8ghOgeFsIBaovUl+
	 9taoM/FzCS3yic+158gMifCmVjCRckHgMcCgXhoXyJwX9IHUMBapdoDjbTfQ4bUrH04Rv
	 HH7aA4xf8lOoaDlPogjy++PpDP0bfceoDLPWPe08PpXwsqGpw96SMCpqtQNRTuPLATE5O
	 HRyU5qtKyVGuttnxdq1w7A5qMk5u1awzOzA/f0WvVn/bHVIkb+9SP9USboyT40ST04DLW
	 rUzuHaDlN4KKHCNbd7CL2ec5dSHRxPRwbzqMkH4lu29tPcALAAN0a7HVtgpcLFo1vqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915678;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0AyG4/N5+aD2DqL+PGexnfsXdvIUqNgLFAlu+/lTdyY=;
	b=geDZLLSTCsdUQRlYcJOBecoxgLpOTh1OBbJp262QK+Vl8Y+MiUrv/nBSf2blIO3se4cC
	 8T3j64LrzXzY6IaWWshkpa2RpxAQPaWryvSmzyoYWOqn8S13rrD1Efl31/zRpmAzbkpDu
	 AP3Gfob3rvRQht9C+6kFhQZCddqNeondG9LXs/asPXU/5gcanS2K5jKsUG50ptNtOBPTZ
	 tyhKOGBKu1JBcwRmxTP8XSxN2wCcHJ7yQUK2p6iYT7ek+M5Bl+K6eNew+UnW8Uo8GEHUN
	 h+oGvHaqhlkyregAzes+A4UqTyL5ijHG45OTpCPQpuBhdq7oiVrQZg3RrbQHusVQXVA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915678;
	bh=0AyG4/N5+aD2DqL+PGexnfsXdvIUqNgLFAlu+/lTdyY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=peLkK7s5JxtLpLSrdrDPyHr5X7iIjWLoaIv05Tp57k5ScbNW3rjphN4fjFLPpzUqi
	 3Yqcb4Xp7RNQv+hL0RaIeFp6pnTie4T5Cn57/FltQxrpbbBqIPgV+4wrcwoBIRNmpS
	 CscSA/bLuz7k4oUbTZsf6MKOnh/G1Og/qDRlQPxRW8eyf9Zj1Y+PXTVVhL+bEMK4sX
	 sBkQvlMTXieSbh2xLKZv7PObnp30HASoUefozO4JVDMzsgOCQ3bDJZfFv0son04gGA
	 ps4TD6LfaSlAn1CuE1mg6nVBtVb+ZXlv+xQ8Nmcihpm25+BzWxPqFgaGHTNdpWv6zo
	 WleVirhP3UPjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77ECD60714;
	Sun, 20 Sep 2026 14:47:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4358524D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2951840A92
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id migJbhmchmVW for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:47:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 18B0F40808
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915676;
 b=UADvPni0whEadkFSP5WZzELf8FTicBxuXbQW0iIVInL60ZQWLi83NiFFVWExoSBcRGEj
 YKP+z6fn+14E78pbdDKAHgEn6CiSyQFOHLPV42xT/bR/0+Dw88UWH8NfZrgwSUOs/k0j2
 JwUNFN6Fa4FmpPpYaG+p5PuObUmLE9DX5CyH8++GhWr7iW0BxeqPYxYmRzIa2bO/1YM2U
 NyLuz9Zpu4YdNEWAdAJucjDCfG9ZzlcrN44i0cIe82UnaTOLh5Z5I/dMJWdrHm+xywZJH
 hO9+rY3TpImKXtS7CE6HND06YE9xa6A8Kzp7gMK+HDWEvJ6zCJ91L0MIZu4p4mC4YxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915676;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1FXrMr2LeW7hvLOkx4nxseyghvKJGdNNpb0LqBqxS48=;
 b=XoKUuLuK0ZvfvuuXFrCiheGkRC3wNLXmfRJ9H/USw3MDiPSUPzIDYkhnPs0BwqepkKXA
 /oW/bSUwBg1rtQ9MH30bYyiBAZ7nlcf1BeMKy9mtyz5007rUzq4iLAQIZ6lsB22KzWDHd
 ourxee0mou3u6BmBu1j30Gx29uoaaMWPrqpE56eM1mldH5TQCl2eB1iJI0qAVvxrgR2dD
 AXTHZN5WqYvU8F5wWcYTzPrNSTu4yq/Z7PAeBXTZVs4DCzDffGmhv4HmBOTo1C3oGeG5Z
 SiLiBN35u37FLgmQmRkYwAcZYW11S48/jEyF5mwYy8r2QEcxBJnm926SfEeOoVQVTgQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nxyI4esE; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=nxyI4esE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18B0F40808
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915491;
 bh=1FXrMr2LeW7hvLOkx4nxseyghvKJGdNNpb0LqBqxS48=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=nxyI4esEz9KFEBbrWt9AKbuR0PX/CWEYxh6pg6jfq1sEfE4126hZInBP+nHm+oD/t
 WdhDf2FgLJQhSIz3r/8gg7ePLinzdF7uzWUuEoEKOQsc6mxH/PLIsy5Cv+EXOWjpcm
 Wxz1ncoDlMot/lfLH1vLMhZQ8HL2ppLRDrSRkscO0JsdQjLFSe/GecX6uHUNukoDeP
 1VtRJXZt5WhFYmxADQ6qj9KlzgSSUEGWzQ/V4XuNxTUZGUkjL5mtGfcwGO6ynKwyzj
 KpjQAEugP1jsDYV4MHpfWML3d9is5zvA6lg+hAsUSIXd2A8EzlQOFVfylSGg9KTtd5
 hEZwERx+Ec0ow==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:SedjfWjDsxC2uyCmfWg/Ro6DmTBHIieTyAqkpBxbtjmGiUCln4hzxiy33cfEtyRRWloVaMjTJgRmGSW4FKCCFnZjL7ojat6HgqQ/qDaZ7bb5F5UEweFvC1q6Vhn4xOiCxA3Cv2JREBA9gxwVtgBtk7mfD5gHLfBBCmEdix1SkbgiV6UZI+N9llThXMmZb0dXJj/KpDwzhIP08n45fruiXBUeuDzmc6IrnB3GdrNr8i6HsvHJOX0smLk6ruoDL/H4RDD6Ye1oaxt2CFaEqybE5NZfirw44cH34WDOg0U7yKXTV3OyHduH7tdMFZX/pkMl00X6YyHhuFYPGQKtgDaXXY0RjWqn9SoLuO78KSmR2+6TvpbEhXiZEOeIkYr4h3D4lu9sb9dh86YMCODlg5RpQH+0DbddsDBR6sVxfF1+bxNDNV0AjteHSoQ2UoRCphOJbGM0CWdb1huZVVqL/miptoyMu9HaFSmgGruY3ECHd0XRXb9XhpBESgDE3MamBvyVNvmopTIIuqsxYiBEi8Zdypc/UFntr/dh06D1Jb2MBXP5k15svpApwHEL0AhLwAYcXe4aeEfPFbWSbiPa3vS2r+TuAVTTzKo=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8E6BA4C486F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:44:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imh-000000000hB-1xAZ
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:40 +0200
Message-ID: <20260920144428.3009612-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 19/66] package/snort3: fix build error with
 numa support
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

Buildroot commit 5e78c6cf3323b4a45f84bcbc504f511dd268e270 bumped the
package from 3.1.40.0 to 3.11.1.0. Upstream commit
https://github.com/snort3/snort3/commit/83e9a2dda250a0ced9a105454a5a4fe59c304601
added numa support, first included in release 3.1.65.0.

This causes a build error due to the numactl package being pulled-in as
optional dependency by hwloc, the latter being a hard dependency of
snort3.

Fixes:
https://autobuild.buildroot.net/results/e8a/e8a9d787973fd109c07c185103de1f9f7339d506/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Rename-numa.h-to-numa_snort.h.patch  | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch

diff --git a/package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch b/package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch
new file mode 100644
index 0000000000..ca8f7774f1
--- /dev/null
+++ b/package/snort3/0001-Rename-numa.h-to-numa_snort.h.patch
@@ -0,0 +1,79 @@
+From 3bb2a8fc1244fcbdf24235e541fa2a06a655dcea Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 8 Sep 2026 21:20:04 +0200
+Subject: [PATCH] Rename numa.h to numa_snort.h
+
+Fixes https://github.com/snort3/snort3/issues/368
+
+and a build error seen with gcc 15.1.0 by the buildroot autobuilders:
+https://autobuild.buildroot.net/results/e8a/e8a9d787973fd109c07c185103de1f9f7339d506/build-end.log
+
+/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:
+ In member function 'virtual int NumaWrapper::available()':
+/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:50:16:
+ error: 'numa_available' was not declared in this scope; did you mean 'available'?
+   50 |         return numa_available();
+
+/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:
+ In member function 'virtual int NumaWrapper::max_node()':
+/home/autobuild/autobuild/instance-44/output-1/build/snort3-3.11.1.0/src/main/numa.h:54:16:
+ error: 'numa_max_node' was not declared in this scope; did you mean 'max_node'?
+   54 |         return numa_max_node();
+
+Upstream: https://github.com/snort3/snort3/pull/479
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/main/CMakeLists.txt           | 2 +-
+ src/main/numa.cc                  | 2 +-
+ src/main/{numa.h => numa_snort.h} | 0
+ src/main/thread_config.h          | 2 +-
+ 4 files changed, 3 insertions(+), 3 deletions(-)
+ rename src/main/{numa.h => numa_snort.h} (100%)
+
+diff --git a/src/main/CMakeLists.txt b/src/main/CMakeLists.txt
+index 117612b94..e4e816d15 100644
+--- a/src/main/CMakeLists.txt
++++ b/src/main/CMakeLists.txt
+@@ -23,7 +23,7 @@ endif ( ENABLE_SHELL )
+ add_subdirectory(test)
+ 
+ if ( HAVE_NUMA )
+-    set ( NUMA_SOURCES numa.h numa.cc)
++    set ( NUMA_SOURCES numa_snort.h numa.cc)
+ endif( HAVE_NUMA )
+ 
+ add_library (main OBJECT
+diff --git a/src/main/numa.cc b/src/main/numa.cc
+index 259f776b7..5cb23e26b 100644
+--- a/src/main/numa.cc
++++ b/src/main/numa.cc
+@@ -17,7 +17,7 @@
+ //--------------------------------------------------------------------------
+ // numa.cc author Denys Zikratyi <dzikraty@cisco.com>
+ 
+-#include "numa.h"
++#include "numa_snort.h"
+ 
+ #ifdef HAVE_CONFIG_H
+ #include "config.h"
+diff --git a/src/main/numa.h b/src/main/numa_snort.h
+similarity index 100%
+rename from src/main/numa.h
+rename to src/main/numa_snort.h
+diff --git a/src/main/thread_config.h b/src/main/thread_config.h
+index 93bfe63d2..8134da8bf 100644
+--- a/src/main/thread_config.h
++++ b/src/main/thread_config.h
+@@ -26,7 +26,7 @@
+ #include "main/thread.h"
+ 
+ #ifdef HAVE_NUMA
+-#include "numa.h"
++#include "numa_snort.h"
+ #endif
+ 
+ struct CpuSet;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
