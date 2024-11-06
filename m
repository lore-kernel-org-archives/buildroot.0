Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0C5D59F74
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EF8D608F6;
	Wed,  6 Nov 2024 20:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfWSutwMfWod; Wed,  6 Nov 2024 20:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B0EB60689
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B0EB60689;
	Wed,  6 Nov 2024 20:41:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 732CC4C3B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52D586090A
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDrNqUd6OcyL for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:41:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A75CE606EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A75CE606EC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A75CE606EC
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:41:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.161]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mqb1W-1tdSsk0UTo-00lOgZ; Wed, 06
 Nov 2024 21:41:30 +0100
To: buildroot@buildroot.org
Date: Wed,  6 Nov 2024 21:41:08 +0100
Message-ID: <20241106204108.4039479-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241106204108.4039479-1-fiona.klute@gmx.de>
References: <20241106204108.4039479-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:FBbuDN3VIZLQIb/NQT4frNF2MwNbfVLUz3UsXtMDzYwyj9yjK+w
 IV8Rix0cz3z7xb1VGoxm3+9KDF1l82CbAtJl+2eexgNhaXJuTY08tLNVCH2HPLMYCZba3Wc
 rTf81FZOuGNjRrVHqHszT789JtaZCfTUP5/q6CMtwOpK6tFjQzPcyAX0As/WSVZAHDvwote
 i7SDc4UOibnw90rlNYDVQ==
UI-OutboundReport: notjunk:1;M01:P0:pn/clYwr/T8=;W5+szqThHgpLOm/kGTtkaZhWZwC
 fH2/UFy44dNUzk9DWKqv/VVJmMUN4uTX5DWuhzc05Xnf9p3G0Fm46jZIbYXuvGtN7UryivCt9
 3RF7MiLf0a5qmBVCPE/6wkANlrCtnRRoNAoaeMA04fQ4PiaGmiZFm0psh3sp4hHHqRh6Ci5+D
 m47VKREnRn7EMy4UextrsujygAZFBNrOiAj2p4HroiZHvl828HH7H3GiVwRYkbmxwpWFb7pHR
 U6uI292uXh812eB49CsFdjpiPaS1TdUbGdLpH+9I0JW8wcxXeWVOgXVJ02lvw+JtbULALLgkC
 Yu+b9k6jEs32yUehgDDJbhc4NX0yf2TRCqJFjzWkPi+4tKbMB6ji/Zc1W4oQiJf92++/vljxO
 SSj9avh3mZRYAwTr5A35BpIClIaH3yMt5GFxXhWlaEFLJMa7jMchzFMKu4anYgvFwjzK23vqo
 cIpm3t04IQJemzphXOdlJR8B5kBHQp97RCHFHRMrTe98/8cCRTNtvcB5fn6Y6OPwRflFLVDB9
 pEaRT86XABHQv+DdMCMAVpm7c4AkbBz0+LZrTjPh6H2eqK60BPEwGDkuTzFURGyHqH39xBuhb
 jKVarB7XL7pohn6F+fxRRwiYB5Ptax6Daaly+BTXma6YKncVxOMoeSaPy6wBGhfosXrjDVhr2
 nmWmvk318tkMpl7Py5MHdpzNvWiGcSKhMqkf1J2L0CZB9yKePQCak4rQloNK305vnS3M/mGVH
 mktsrP5DTy1hHmRrjy07hlaHgQIS15+DbXCR83MSgR8Bq+vDgfT3KCeZxgvpb+GdHgTa5bEZA
 khb793UWzICXcrBIaKtnLwLQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1730925690; x=1731530490; i=fiona.klute@gmx.de;
 bh=mDFZJ6k6kKEYNPBypOz3aFmNMwpWn2WXdtnGQxryPq8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=CG4wdmfoXdiRGVL18aarDuf7gsrUxeLhUzBOKR9ywUx4sIfVuy/qYxawguMdmBDy
 TABzmchz0m60p73NvIQdoStq9F+beCYJpv2nGWqfU0FSkjikSvMuI+lA7jJczROyg
 TytJbSI9PQwi3ucN2H/HxjtE0wXz3Is7iMFnEZLFNMlpweckChMhm2WcBS/OnMx9k
 LYd4MXNIR7NKICyoi2tj4LytCr8OYM7xGp27Ex3TR7tZkYN6e44dGEP0HXS8mfjsH
 JrdSbnTOPv1vAzf0YfTNQ0msug5jX4JTcvHXRk9Hwdnl6e3te7HOi9X5rJWxGwVro
 0D/40hRaxYIBw87s5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=CG4wdmfo
Subject: [Buildroot] [PATCH v6 5/5] package/json-glib: bump to version 1.10.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
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
