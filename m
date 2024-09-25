Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417ABC369B0
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 09:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA40661118;
	Wed, 25 Sep 2024 09:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxmVwLSxpmxZ; Wed, 25 Sep 2024 09:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 219746112D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 219746112D;
	Wed, 25 Sep 2024 09:06:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD5AC1BF865
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 09:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB0BA42553
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 09:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UzRA6OzrS2AO for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 09:05:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 212A942551
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 212A942551
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 212A942551
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 09:05:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.185]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ycr-1sulft2sTz-009Rl3; Wed, 25
 Sep 2024 11:05:46 +0200
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 11:05:25 +0200
Message-ID: <20240925090526.3462217-8-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925090526.3462217-1-fiona.klute@gmx.de>
References: <20240925090526.3462217-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:1QmGvpF3Fdj4pizNnrrl9Ux4VJpeYsLx0/bUYpjhLsDVZWKhDPt
 rIItb3jPbOudBPmpY/gHesiwRegmQReTZhRHjZGAwXqHYbZVNNDtJsOZwo7dByD3C4w5+Ua
 KnKs1UOlTqLT4+7VMPPOcRD+Mt2LWi8chNbvWcojpTWz+SjCDGH+I2e64I6+EvLl79m5V/0
 u5wBg8dtsvPuZHLap/GeA==
UI-OutboundReport: notjunk:1;M01:P0:Wb9pJdW+A3E=;J5l4UGAacx2qyWoAVac5ndZY2Mv
 iZDsPS2OUp22g3RHur48DU2RdIq1aefvJMexz562fv4utYO1JwD7Rcvkq/F3LGvZaie9zAgx3
 b1UG+oxKVs0zVZj+wqBV9kR69Os4yar+TJyLrsZcUpnGyxiaYrzXcVOBbf0EPYktah0VmIphO
 czAifBkSwOtwzU0zfT84cYlRK+ZeAkulzahWYoufehqvbp45bHiip6N4wJ+EJuURkYYZWd7BO
 ko9VMpHmZNhS6SAovb/P3AMkeZiGsUMnhq4n2M5+gIIH6yo0as5rY4S3a8VSDkW8AudYn1Alm
 zZlIJ2s2xc4IrPjUWb4Fq6QqcY3BazCA0n8M/gtz9l5uJoNJjQApbLBAVPmChARdsyndE4d7z
 uW5bzKHUQK0jIqJpv8cDHWpTyPc4IFMD7SAJ/CkuWUf0Bes13q6oA6t8x+7OgzS4C4C5SspOC
 rXw52lXLVrNFYWpSwubjOKQD2IZjJoL+xEdeRUtaWJr8TQMbqWLxqlZ7Pf+zw8pciMLS1rNml
 cpX9czQnH7tMmE1eiEiZP/W023hPwXpa7xO5F74mt+wODh5E12Np1YdbeyxSof+9L73GdnP4p
 d9l8OBkn5jlYYJHXd4U1p53P+8oPDHObB/lYb4jootiD7+bG3GNZiv6dqffx7KkdtbyvHQroP
 A89noaREq5Pi9rCZPvAc2g+kxPJ3gJceW8B9qkKfs0vpgJlDA76iZ3vuChZhG8G02CiVCnrVN
 euS6GiqxDxmS2LN5J3O3ILs5XaLtmsW9G5JilVeGw88mmKQXSZayQGLdFhE70nGqHTa52Zqcl
 UjF5JnjgsE6yA73mpCP8iFBw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1727255147; x=1727859947; i=fiona.klute@gmx.de;
 bh=mDFZJ6k6kKEYNPBypOz3aFmNMwpWn2WXdtnGQxryPq8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=GdGaGfUCwJv6dKLS/pSj2pn8yuLq/8ze3wOrG9MDu+zj1qjDogdQ6XxriT9GVXhP
 5SrJ07kYCNGPG4paXWT1yzpep7QZy/F+MQqmcTIrJHaDgKLWMLO+vCy6bJpK+AzcS
 /79wQtaCbECPAPSVJkk3T91pdk8SydPHxtL4ZTKQcBCE4DFtpYMyfyKZkOXdJ8yPo
 T39tsiNxZOP7TaaJvTD8rlrczIO3oEvnjZMCwwMihgggNscSdcx6l4w53G9j3cfkg
 DyyxgezvqSGT6WQuFpkvIRZWev0WVdrLqBKGZVxq9luwQ4N9YLccb+0BZJtOUILPa
 0JEYkubPx9nZdWifCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=GdGaGfUC
Subject: [Buildroot] [PATCH v4 7/7] package/json-glib: bump to version 1.10.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Fixes a build failure due to warnings from g-ir-scanner:

env PKG_CONFIG_PATH=/home/fiona/development/buildroot/output/revpi/build/json-glib-1.8.0/build/meson-uninstalled PKG_CONFIG_SYSROOT_DIR=/home/fiona/development/buildroot/output/revpi/host/aarch64-buildroot-linux-musl/sysroot PKG_CONFIG_LIBDIR=/home/fiona/development/buildroot/output/revpi/host/aarch64-buildroot-linux-musl/sysroot/usr/lib/pkgconfig:/home/fiona/development/buildroot/output/revpi/host/aarch64-buildroot-linux-musl/sysroot/usr/share/pkgconfig PKG_CONFIG=/home/fiona/development/buildroot/output/revpi/host/bin/pkgconf CC=/home/fiona/development/buildroot/output/revpi/host/bin/aarch64-buildroot-linux-musl-gcc /home/fiona/development/buildroot/output/revpi/host/aarch64-buildroot-linux-musl/sysroot/usr/bin/g-ir-scanner --quiet --no-libtool --namespace=Json --nsversion=1.0 --warn-all --output json-glib/Json-1.0.gir --c-include=json-glib/json-glib.h --quiet --warn-all -DJSON_COMPILATION -I/home/fiona/development/buildroot/output/revpi/build/json-glib-1.8.0/json-glib -I/home/fion
 a/development/buildroot/output/revpi/build/json-glib-1.8.0/build/json-glib -I/home/fiona/development/buildroot/output/revpi/build/json-glib-1.8.0/. -I/home/fiona/development/buildroot/output/revpi/build/json-glib-1.8.0/build/. --filelist=/home/fiona/development/buildroot/output/revpi/build/json-glib-1.8.0/build/json-glib/libjson-glib-1.0.so.0.800.0.p/Json_1.0_gir_filelist --include=GObject-2.0 --include=Gio-2.0 --symbol-prefix=json --identifier-prefix=Json --pkg-export=json-glib-1.0 --cflags-begin -I/home/fiona/development/buildroot/output/revpi/build/json-glib-1.8.0/. -I/home/fiona/development/buildroot/output/revpi/build/json-glib-1.8.0/build/. -I/home/fiona/development/buildroot/output/revpi/host/aarch64-buildroot-linux-musl/sysroot/usr/include -I/home/fiona/development/buildroot/output/revpi/host/aarch64-buildroot-linux-musl/sysroot/usr/include/glib-2.0 -I/home/fiona/development/buildroot/output/revpi/host/aarch64-buildroot-linux-musl/sysroot/usr/lib/glib-2.0/include -I/home/fio
 na/development/buildroot/output/revpi/host/aarch64-buildroot-linux-musl/sysroot/usr/include/libmount -I/home/fiona/development/buildroot/output/revpi/host/aarch64-buildroot-linux-musl/sysroot/usr/include/blkid -I/home/fiona/development/buildroot/output/revpi/host/aarch64-buildroot-linux-musl/sysroot/usr/include/gobject-introspection-1.0 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 --cflags-end --add-include-path=/home/fiona/development/buildroot/output/revpi/host/aarch64-buildroot-linux-musl/sysroot/usr/lib/../share/gir-1.0 --add-include-path=/usr/share/gir-1.0 -L/home/fiona/development/buildroot/output/revpi/build/json-glib-1.8.0/build/json-glib --library json-glib-1.0 -L/home/fiona/development/buildroot/output/revpi/host/aarch64-buildroot-linux-musl/sysroot/usr/lib --extra-library=gio-2.0 --extra-library=gobject-2.0 --extra-library=glib-2.0 --extra-library=girepository-1.0 --sources-top-dirs /home/fiona/development/buildroot/output/revpi/build/json-glib-1.8.0/ 
 --sources-top-dirs /home/fiona/development/buildroot/output/revpi/build/json-glib-1.8.0/build/ --warn-error
../json-glib/json-object.c:944: Warning: Json: invalid "closure" annotation: only valid on callback parameters
../json-glib/json-array.c:718: Warning: Json: invalid "closure" annotation: only valid on callback parameters
<unknown>:: Fatal: Json: warnings configured as fatal
<unknown>:: Fatal: Json: warnings configured as fatal

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/json-glib/json-glib.hash | 4 ++--
 package/json-glib/json-glib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index b78d708391..1b475233af 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/json-glib/1.8/json-glib-1.8.0.sha256sum
-sha256  97ef5eb92ca811039ad50a65f06633f1aae64792789307be7170795d8b319454  json-glib-1.8.0.tar.xz
+# From https://download.gnome.org/sources/json-glib/1.10/json-glib-1.10.0.sha256sum
+sha256  1bca8d66d96106ecc147df3133b95a5bb784f1fa6f15d06dd7c1a8fb4a10af7b  json-glib-1.10.0.tar.xz
 
 # Hash for license file:
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index e216af20b1..8b440788a2 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_GLIB_VERSION_MAJOR = 1.8
+JSON_GLIB_VERSION_MAJOR = 1.10
 JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).0
 JSON_GLIB_SITE = https://download.gnome.org/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
