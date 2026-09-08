Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBEBC79F82
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 21:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13E8060728;
	Tue,  8 Sep 2026 21:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdc6NBcn1BwK; Tue,  8 Sep 2026 21:32:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EDD1060702
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788903173;
	b=Yl/b7nB6oAlzu0VCARTRJ2cMkxtA5JlWqZ4HKTUDOh8EqqMxQpvZXkbJafLqX9/E9SGV
	 ibsS8eVjh6PnvHMFadSLBKYC1bR7/K1fpn3JgJ33SNOY9ka6P1hb8FzWuTpeMjNsnJ124
	 oLQepH88ynu51wycTBoAdCT5pylXMIEDemzYN4yDt3w6uob8X8S9pDwxe4wqqK4+SYS8d
	 lEEJmx6CN2NND1jSrM0sbLfulVkkesRTS+TErDhs9q+YkhI5rooWe9CMS+XGHFLFoS9qQ
	 GiO049CZWmdyiShFQkkhuzpmVAh91Y8HJptTF5o0RdwbBT4whyrOGHb39nLQo/guOMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788903173;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QtmfmV73DB+iZyF0DgLCx6M+FQawyCJ0poGO+WM4ddw=;
	b=ETsZ0gEMzAJ7ly3+3+Youz/M+dxJmCr0FWyw88Km6u65P2xQX/Nxk3Klw2J2IZhP4LBs
	 rv2oBmR+/uvUlK+hXkVYLfovAWFRlx8aA4x1CtNc8pJD2mft2wre59bwuWd6fm2aeP0Bk
	 FNyXkZJrzWv2Nl9RDNqtvy8hvF2uLCdkP3ju+5XnVCXUj+nMXepjn8dYjrtnyOpjszUeo
	 iKF9MMGUrlkslMMSjGldD2yBMhXkUw+fwB8YO3P37OO9jTL27Kz7cMz2vzzCOHiHcoF/j
	 blby3DYWhzvkBpHofLPrFM7S62LJkT1Q+rzF/n2fDFqv83ktu4PtRIRQk8M7o+7S7gA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788903173;
	bh=QtmfmV73DB+iZyF0DgLCx6M+FQawyCJ0poGO+WM4ddw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CXwflHDnYEr1KTl7kpjOr4NSXzcf9ay6Vp/+rvLdDfAFek9oQVZxqe7gbAAGWz5MZ
	 ETc5sP91PJM/FSMm8Q9pTZsh1CtKo4Ted9Dxd2qMJluDN75qs4Rnt9IpzxVbgoBsZM
	 VUZ5yqhspmBMbiESPShIZtr+9WtJsXjfVPH8SptJyGadgm8shAMdly2/AaeApKYReK
	 41bLZH1AeUgW1qJlScfK0+kodSntcxVgpzb28gI0Tb7Smh35T6MZXV3fErCdG+0u5c
	 cirdN5HeDX9+PrpDeiieZve49QwoUr8c6DUFlaWwOYj3U8xS7pX7bTuTqgrLNJpmL+
	 LiBsLbV7RoKnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDD1060702;
	Tue,  8 Sep 2026 21:32:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB732372
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D8A740670
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Btgc3cBPBbY for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 21:32:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 98DA84066C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788903170;
 b=iOo5vAFQ0tGX7DAxLO0VpDY1IWL+5aqvQsUEOeAId2x7z9XWMSr7zvRp3iU73HLOmwfu
 HZH1iOkFCTSzpxJUneyqmYU8RibnvF7BpS0/AGuyFAe6kbXa3VfwRdtogFJ9iCulzfb0a
 Y+OYv0e/FpHHY9DPXSu0REWyIcubrzghQcpt7FmrDLzonI6HsJVnTMDvWpsM+6IUMsLfg
 l5I5/sF8NpFTEWEzdWfX703KqvOAjeuK1d1VGWproPHSarsQH4Q89d1K01NDvixzISXNA
 ywJWoKbhIAqEPQABJlmLSjlXmeJXlMPML+YUDElIe0SZZ28t1npvBFqEdeUDVaegZbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788903170;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=WJhG+x3gWTHN/djRdlfDj042MAoA4m40VVSco2BNgSo=;
 b=APZOTdHP+l+zgjxldaYbeZ5tNt/AHDxu1KJLrTmByoFSmvHClM457HsE+YPmVraiTjNG
 rdVm0/nqIXuBRdNffpdD4XxcetE8t8Wzt+Y1MRMfVt8NbNKi8yqnKDVZIj+pT/UUiNzQP
 d/otnk8l/B5ks1QKJh1W9P7xa7RoZpUo3hwhC3S8ppvNOPGA0eCFE69f+xqt4jU38s42P
 ihaOrhltrXcHuKjxS95NxdMhKqmGi46yTD6dUpP3qB2LowZ5SICYqp2BqczV0fFECvkc5
 NNyFPCXBDAhF6oQMRvhvg9P7iePqUjXIRrcUCvdUWEvM19gc85G7a6h4OlGr2Hcr49g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dg2eDX21; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=dg2eDX21
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98DA84066C
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 21:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788903152;
 bh=WJhG+x3gWTHN/djRdlfDj042MAoA4m40VVSco2BNgSo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dg2eDX21332ngYfZWAK6TSmuGfh/n4Ha5RmdYDrw2oWM2uqEFRq+nvH4pO+WNTrtW
 4cqK3Quqqbwm9DG9RQ+U2v9wwf+0iBlP3GQvp6t7RhOE9q+1L7Ph7ZzYIJD6jH7c3D
 3qE9dsYnBpOrJPtlHEDKNj5KSGJ0yYCww3szw3y6//ExhunIFE/LRfeboMx9+66k+A
 PM4udSxCem4JYA7VWIdDjXIUIHsILMjHXxaVCQQid4ikRU39b+tm4QNYFWrKDU8vPw
 elQMohr3V6ysoyrUMv9tkjE79VycmOE+BiJ06IHLVICVV3jzFG2l1nSYH+BVXQR/al
 mZtKN8X36UIYQ==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 05565A4C3851;
 Tue,  8 Sep 2026 23:32:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53342)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x43Qd-000000005r1-3gr1;
 Tue, 08 Sep 2026 21:32:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  8 Sep 2026 23:32:29 +0200
Message-ID: <20260908213231.2542239-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908213231.2542239-1-bernd@kuhls.net>
References: <20260908213231.2542239-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 2/4] package/snort3: fix build error with numa
 support
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

Fixes:
https://autobuild.buildroot.net/results/e8a/e8a9d787973fd109c07c185103de1f9f7339d506/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/f4cb6546911bbbad6d372ec48f2ea849497f870d

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
