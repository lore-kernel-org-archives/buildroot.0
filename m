Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0097C6FD1D
	for <buildroot@archiver.kernel.org>; Thu, 30 Mar 2023 12:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2858F41FB4;
	Thu, 30 Mar 2023 12:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2858F41FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aph7nsJhi1Bc; Thu, 30 Mar 2023 12:35:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCFE841FAA;
	Thu, 30 Mar 2023 12:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCFE841FAA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 203FC1BF97D
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 12:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDC2860BBB
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 12:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDC2860BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmLXeqxoesp0 for <buildroot@lists.busybox.net>;
 Thu, 30 Mar 2023 12:35:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8322760BB1
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8322760BB1
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 12:35:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.135]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MjjCF-1qAdnC3Ust-00lBWg; Thu, 30 Mar 2023 14:35:09 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 30 Mar 2023 14:35:09 +0200
Message-Id: <20230330123509.23696-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330123509.23696-1-ps.report@gmx.net>
References: <20230330123509.23696-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:nHW901H8AFQeEb7cep7ia4VwrIrz9/t0uyu5Yf4bNHAt6Au+8eU
 odhNmDoCIU62bp8epMJMdSRUlmgmrjYsAYCs44VRjHtSk4FTUvpqPHjI/+iQS/3seMvweAj
 f9dEHtIJXL9gAcX1azIEfxnOF6LjPSWybu1vknfA6BzyD0KzWOevsUAPleRhg+U41i3HOIp
 N3xTuMo2myByNKQQ1EAOQ==
UI-OutboundReport: notjunk:1;M01:P0:WWS68JLdDHs=;w4MFcpMpTUqpDV6dQTJGP7WWRve
 +Es+VbyoF2pl3J3QH5boP+DnCCcogrnKwYmWUSIHD7IPsUZ3CWI5IIF+WV5rWxbTpgRTFVYIv
 fh1f0hZY28ttqNccgqqhIDrBAY3riUOIwsHMKS2LLZIa2860R/G3z15Sn6d6M7oM83MSBWFd+
 DBtPrx2svRD4MASmUacc/aZeNPCxn9L+l+kc9uDVDdzI56GOa4dskvtlxBFK9urzC/nDXrBMC
 hd+KnmOx+KLGdH4agJRlKPS7bP/7WKbt1Uq0/ZrFMegi2YbtIG6FgD2y6Kf6pfnkISZSlqcB+
 Jemv6bBGUQn5VdhxEfYJ0DTZMUQQqSatpuXsH+hYGX6jCujAkQFxZWBN0sunUOpFOIzDmYWee
 1RxMhWMapsBLl1jhwOwckNWgDOS2zeyLbptYb6wIpxquZPOvhEK2cPZr6b5qg4GyWctoa5yaa
 EIAlNFY+qwd/mfPG66z20IIRk58ZJhUVcfNex2Z6ZHZikgTOWcOeVxGjgYt7JUtCCJNt8v/Zd
 YH/CgeZoYw/n8l/dWUZmR1Y+L8Q1PJrooP2IPxOtWyLfAeBjAnixEWUT2cc0L7NRoTjk5VP1z
 tp7k72hpvPiuvpMwInL6shVWq1X5h3z+v8zuVmdod5qWZjwyq3Y741GJoVFdsSOyCYL3mDfh2
 xqiwqcidItQtP49PYtJqUvWVNVLZDD17mP1T1GbCreGrSzp6f5qDEequSieyOIOlLE9o1fipp
 DW03/FYcxSpwc5DlerIm8+zINwy4A6J42eCLrTMb5129EZRFLhcPWr3iFdqc5qt0EKGTzy2Vb
 pj3teGurg7nXFhkNB2IHhfaecEOxswGOZTuAXn9ujjCVOoTb6V0m4t8BJXimnneumCbJDfoNN
 ZhEi4sjHRLTcsdp1yNUFPn/8uRlVN6VHJfxrHb5AdvsGw2C0nIM3sc37bon0t/cp6Bcq1dU8k
 gC2DVvNsLBgUcOg4Z5z46v2W5aU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1680179710; i=ps.report@gmx.net;
 bh=o8WcWUxxVTzVIPf41Z028TkmTKipeC4voBXkHsN+KeQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=U9IgKGm3csq/klzXrBrPCzXppHr48F5flvx+3gP+XhlKaNal2WPJ9XnKSZZaMhvrL
 YJvUDJ1uTZqq0e+TLyOUmZhd9GhPb47mh1ZHJOWEHlxdiNSLKRJDVIEJ9EAVUSjF72
 xIL/b64c7umlAFMK4SuH0T4O8/ZBzfv20Ycl2zZgTSEHhjDUskxlx0870XHkJ++hzZ
 MIKXpjqhTSxCO0Fv7u0BCNGskd7kYpl8n+9GGGRN7MEdBfbDSvw7CSVeLgdXC6z2XO
 U/HKjjnj+gzmrFd/C1G13XID9TDbjwFCwSTkcI1f1iG8RV+tL3j7P5EgTpRdbR8M5S
 Z5zWG6IU4k4ZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=U9IgKGm3
Subject: [Buildroot] [RFC v2 2/2] package/libv4l: enable v4l2-tracer
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - fix --disable-v4l-tracer vs. --disable-v4l2-tracer typo
  - enhance compile failure log/research

Fails with rpi4_64 config:

  .../host/bin/aarch64-buildroot-linux-gnu-g++ -DHAVE_CONFIG_H -I. -I../.. -I../../utils/common -I.../aarch64-buildroot-linux-gnu/sysroot/usr/in
clude/json-c -I../../lib/include -Wall -Wpointer-arith -D_GNU_SOURCE -I../../include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=6
4 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=1 -std=gnu++11 -c libv4l2tracer.cpp  -fPIC -DPIC -o .libs/libv4l2tracer_la-libv4l2tracer.o
  /tmp/ccXMMihl.s: Assembler messages:
  /tmp/ccXMMihl.s:208: Error: symbol `open64' is already defined
  /tmp/ccXMMihl.s:762: Error: symbol `mmap64' is already defined
  make[5]: *** [Makefile:751: libv4l2tracer_la-libv4l2tracer.lo] Error 1

The preprocessor output shows:

  [...]
  extern "C" {
  # 61 ".../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/sys/mman.h" 3 4
  extern void * mmap (void *__addr, size_t __len, int __prot, int __flags, int __fd, __off64_t __offset) noexcept (true) __asm__ ("" "mmap64");
  [...]
  extern void *mmap64 (void *__addr, size_t __len, int __prot,
         int __flags, int __fd, __off64_t __offset) noexcept (true);

And host/aarch64-buildroot-linux-gnu/sysroot/usr/include/sys/mman.h:

  56 #ifndef __USE_FILE_OFFSET64
  57 extern void *mmap (void *__addr, size_t __len, int __prot,
  58                    int __flags, int __fd, __off_t __offset) __THROW;
  59 #else
  60 # ifdef __REDIRECT_NTH
  61 extern void * __REDIRECT_NTH (mmap,
  62                               (void *__addr, size_t __len, int __prot,
  63                                int __flags, int __fd, __off64_t __offset),
  64                               mmap64);
  65 # else
  66 #  define mmap mmap64
  67 # endif
  68 #endif
  69 #ifdef __USE_LARGEFILE64
  70 extern void *mmap64 (void *__addr, size_t __len, int __prot,
  71                      int __flags, int __fd, __off64_t __offset) __THROW;
  72 #endif
---
 package/libv4l/Config.in | 1 +
 package/libv4l/libv4l.mk | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index c88f280c3b..7a86c7de15 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -33,6 +33,7 @@ config BR2_PACKAGE_LIBV4L_UTILS
 	  - v4l2-compliance
 	  - v4l2-ctl, cx18-ctl, ivtv-ctl
 	  - v4l2-sysfs-path
+	  - v4l2-tracer (if json-c is enabled)
 	  - rds-ctl
 	  - qv4l2 (if Qt is enabled)
 
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 1142a7442f..ccb4da4fb7 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -9,7 +9,7 @@ LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
-LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap --disable-v4l2-tracer
+LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap
 # needed to get utils/qv4l link flags right
 LIBV4L_AUTORECONF = YES
 # add host-gettext for AM_ICONV macro
@@ -66,6 +66,13 @@ LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
 # libelf and clang support
 LIBV4L_CONF_OPTS += --disable-bpf
 
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+LIBV4L_CONF_OPTS += --enable-v4l2-tracer
+LIBV4L_DEPENDENCIES += json-c
+else
+LIBV4L_CONF_OPTS += --disable-v4l2-tracer
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
 LIBV4L_CONF_OPTS += --enable-qv4l2
 LIBV4L_DEPENDENCIES += qt5base
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
