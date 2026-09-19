Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5350BC982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 192296067E;
	Sat, 19 Sep 2026 16:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-6zrMmDJN8g; Sat, 19 Sep 2026 16:05:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2739B6069E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833934;
	b=dObL6n+q4xpTCZtfFHqGOcnHvG2af3VExypag6+Bt1Z46oGP74meYIwYea+rxj12BxEc
	 qJ0hnijaVFCxynFyIrcP3rOuT2SGUXybLoVtruXTERcguj07DRGESNLktLxpKDN6eQRzN
	 lXkrLO41j9j2f8xEOyNNOLCY4cwq3Kd9IdnuIzV9UmNhct4RsQvlURh/xWxJ8BF8pJpft
	 MH5JXepY7eP1siautnWoG6HqCx7iLqgl8eOTXxwcqf6htgW/m6L8QKiMHGR8OeZ1KeI14
	 oU2Crq/x6lp8WCv1+/UdRgMBuergeopqooSbfH0Rds6L67si4EWNz18LrDOSmDlBn6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833934;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0AyG4/N5+aD2DqL+PGexnfsXdvIUqNgLFAlu+/lTdyY=;
	b=CbyobO4koE1B/zXPQ/+6Ole6mlMfIGwPbKp9jQ8Y2qbYih81f8aM8l9LhZtqieeWHiss
	 T0UHeLlGcO7H5crrm/4bnCDIu+1PkeSpEmT2b3/c8XBiAiuA62MO3I+KcAmscmT/YwDeR
	 7arvEn2oYk0FXqvKt5/BOjQ0GGtfnTQeJ64N+2Ohl/SgSM+u/4R6czKqdmG+P/pMm4q+i
	 uGIm8Ejbf3iGMLulTOwgoMpJKg2FnqcmioxY8egPQaA9JeL/eqMI9c52vk1FB5LD2G8ah
	 vGLbute/eYzL+nJQ68Dygv/TL1tq0yy8GeGcORQxFZ8LKmq025msDci7lL0JHAqzeIA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833934;
	bh=0AyG4/N5+aD2DqL+PGexnfsXdvIUqNgLFAlu+/lTdyY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kB/0nsps8sfzouE4k/h/q2Cf9gGuCuh0RhFrPGEvv8DLEEvPvgrRDfD6QIGZhPnRs
	 5AS8Mcwk0q23Vt1Bd5k75DV/Q4UZFdX29SQkStCLZso33wZ8LLsX8F5+ZhB7fyDIbS
	 fHVMzwqXhxC9b+xH3chKTYu8aF7v+KIEjfdn09Uq4g0yGxUEdEnr/ESZnKds7BPMRt
	 ldjpXZY48pktHjMnfAvAOn2XrcoUVt0MerwKkesv2jZ9xHxG8asLKfsgkHFZkTaBEl
	 MxKT97NV5iQK8KDWSq2l0NXZy7ppk/I2MRy5TejPWHYEDBsDtT1v+nEb/CeKUJU7dq
	 PYnFHobg836Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2739B6069E;
	Sat, 19 Sep 2026 16:05:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B882E37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EBC840AE5
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BxCR65q3tlz for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:05:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 98DEF40B18
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833931;
 b=sidsb2AFLYEnqKSZChVJ1tqswBmY70O8WrE2h5URlqeF1L8bJMwTT8RKF39O/nJyjuEB
 VQhJiNRv48uuosd1etZOuuuVin7gJmHbMc1Oo7gzk8bA/WXeTFcWzV3OhceHEeXwnZSyJ
 iRJil444b3u+HdiIIgrAW1nV06tgOABSS/oX9EeSP/o+L9DwoQAZvy0z7nrDvN7z4WDyO
 Z5arW/xacqVU+6kyoQVp556Y1xJIJ5g+3xFqpCGyaC80swZnhkVXdXRbD0QIGRLObqMRP
 /HM1MtebLeTqNy+Voe46VnXYtZwplslzCRz4TqhKNx+g0+Qo2/4hUaiIdSjxvJSzTSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833931;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=1FXrMr2LeW7hvLOkx4nxseyghvKJGdNNpb0LqBqxS48=;
 b=Bb0PRZcE4kP1do8uAXj0unQqkfN11lixk1t5ZNJlfqluKKVNy+Mx86gEaJLsnxCCKGfR
 RQ6WyMREyq0rROcIPUcD5S2R0baceynsu75bXGkdvDGSywtthgTb/aFs/IITZhkx2nKkK
 rL7mIxcrDAO/y0RjTst6NU5F5P4C5gNbhpkmjikyddzvi8KsLOQ/V8pEOjLL3i2dzaa+v
 Vx21zdIn6mXAwMNFfdWuE/Tb5kMd8MuIvsZtK0BVo0iayXuesVjCT1svRu/d6+URUD16e
 EC7rY1FBEIJ7E3XUtrRc1eWRVHiCONcWZpCpcRdKU3ldulsIEOeZT+IYpeMcBQyyCmw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=f2WXTorX; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=f2WXTorX
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 98DEF40B18
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833546;
 bh=1FXrMr2LeW7hvLOkx4nxseyghvKJGdNNpb0LqBqxS48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=f2WXTorXM27Jl9dEyCr3dfh7uU4lsB4M5QXTDoD5lmam20noExIek3vSCUvybrpgB
 28sO6pzgxQSu7XMRtEjDTWctSn8Qu+A6njtC+93eU0meeI0udn4yY2FOMYIdeVk5sD
 AnXHRiOvgxQNXUQS6I+w0KW3SAPWHUpN4cm5G8bi0EFmbF1JN+u54qVidGkta8Xwjp
 8Ti6RX1iJydh1OdQ4fFOdo77ZewyhCgIOdZ1It+lctEps0iSYYunJkBYtCAnTgSedi
 bPDZJDpjr/YTqVUOpzQe1caNn3uV0VxiaL38imU+ShSQ/XX/eQKR0mxzn7cYjd7jfc
 xrNnszutKetGQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:g+g6+ff+yNHRngm+1DEeGdpXhaXtT2SLwAeeQIk2fOcz34qbgZcDxVL8JXpsYBxX4MgiqV4y2xbR4Fsy0e9hjJlLjd2+QoP4SkOM+P8rokUgVnPbj1pEzR3d+iC7tYG/sh9JW6UtVuS0/LiRLxZWrXOfslcDvbCxSlJwi5HaOewwcyaw8ygS+bl38UqGxd1FjEZxwEADK94PRgsR5Kzx8ERBVp6zXswdwHdr+aJHLzAkKvxSYsvLmGBF6eDf3qsuHeBh0y2Z6MVKFpr6U68ulVOuY5YB6HbUTEXjqfW5xFnUfqln9SCQLShay/sAyll7MxW3LMyPWhWLBeLmcxAQNG3cqkybct4I7f0Z3/zbxfItj1R5QMf6/vb5AfEyntIJEAyvWPDvMp2D610xsBrCO7s92iegGSY6zp/B61hrw6l7Gpdbj0UmsVtwwZAs4MDLSOMk8fGy2QO4GfXf82KE5r2RONGGq3MDGqxFXTAF39SYQvgl6eOebVA2JJZd9G8S+KpenElgnGCFBqsV8klo92H6ZznexTdpLAv+bv0pvEj45Wg+O5goXsj64aobeAR0BQfJ+JPUgpg2kaXUjgz/f8kWeDfLbftPH4fcTGCQ0E+2gJ
 rVl4zvUS8AvRepZH4tJi/FiYq5Z/nDEKT39mYlDFFctEYMLAdov252w/vxDDwgJbP/75Ef
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E3344A4C47AE;
 Sat, 19 Sep 2026 17:59:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSo-000000005Jx-2kwl;
 Sat, 19 Sep 2026 15:58:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:52 +0200
Message-ID: <20260919155845.5776-28-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 27/77] package/snort3: fix build error with
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
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
