Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1510CF11F8
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 13:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AB7C41026;
	Thu, 10 Oct 2024 13:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gk0QNiof_kLh; Thu, 10 Oct 2024 13:54:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AE3A41053
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AE3A41053;
	Thu, 10 Oct 2024 13:54:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B7281BF427
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A81960B29
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ondOLX6RgJp6 for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 13:53:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C6E0460B26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6E0460B26
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6E0460B26
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 13:53:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.249]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9MpS-1u1bAj3Qdo-017Be9; Thu, 10
 Oct 2024 15:53:53 +0200
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 15:53:14 +0200
Message-ID: <20241010135318.3064224-8-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010135318.3064224-1-fiona.klute@gmx.de>
References: <20241010135318.3064224-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:emzRep1IUKHefOtZ6EHXM3QLy2GMlwK1r5jl/UC5XyESfBiG/8n
 jTorseY5t8toVTTMS2BfCnJYggVdfGDjHp/BcjMtFXI0Cab23+p7A89upfBgSEGxihR3DoV
 /5psE4sOpRkjAZhqhQ4lDhA2mDfx77GbMMdz8Te4fMrakFolQL9Hf9u5MT+QO68sEBFJU9h
 h8TxLsrisXtOXf9SqD7IA==
UI-OutboundReport: notjunk:1;M01:P0:PDxJdLSEJu4=;XzVUqOY1TY6hqghsRyH8cBd7VqN
 K2CgFcjMGBnSK9JvqB3yRn2S/7Ed7Q1G+2gLmMxkw6d/PBDLnzTpqxjzvoXL+xOrIO1EJar+N
 jNdd3l6997o9SignBkga8zGolsatdibr6dOqVP6QW0PKYodwn8dYvs0j7c0QdbWKB3rtjZvsi
 I5DAmuanQyM/G11/fPKZLzP+ZfvY4BP1RzAdQnYZvOl1EANtTkNvirpJ8Un/GB/qFkC6Y6BIK
 2CIaPnJrVH6TTTzlVP+kxNV9d+uIJTOoZf9weMg+/Tc9Qlx7tjXHUxtqUc0bpEwGXCV9Qux1L
 uOpkZp1XELcCzJK2VeSjJdSQHgMzIYTVj6ZzXpSLF/p/U1G1aapPvGlQ9dGbJNA0YE03qesv3
 8iCw1d+S0Pb2Wj7pmklIvpKGng8QKi3qd19dTQxynf5XwzgdSDHr6DFLAhEO4XyVbyrfJv9Dd
 UlTm/0r7gSJPj8mkJG6FRgbnn2mtCBi6/uhFfBnbJK8qXdAjlXz7IHj1/um9zK1GzKzM/r9Zj
 DmjYIC9VRMUeR30Rcu+hHJcYp3k2uZZs46KhHsVTjfOvqGo6ZikJaEK9fjiodn2Vp/Q//1Z/4
 GpL/pvjJtHFjmBsEm3jash3l1cse5wnN/D/lJvOqASeHKqp5MUXKuIf4i+loC+yKEdiOp6U96
 iWw4bPM1bCuBzvVowUzljhWvSgrZc0XWRpaRe/Li2aIJBVC649LZz2OQa5REzAeSTcIHbzJjV
 vyt68iXhpKoY5Gt3Us+yyZz5FGH6W/keA8NKYLyCLEStQmk3T1S/diyfxarr2uLSMFCacTLXT
 kKwazDLtUILmfwYAdc6iRA/6TeA0vVZBa8Ma4mRrRAA/Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1728568434; x=1729173234; i=fiona.klute@gmx.de;
 bh=mDFZJ6k6kKEYNPBypOz3aFmNMwpWn2WXdtnGQxryPq8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tJnCtCUOIEoRq/vm95erpHKsTc0NW8KVoeKkCcePBEdJTW2AUTnjDw1Ju/ggN38j
 J41mPcwsQoLEsCOXKZG8YX4BkUlqUQ6k7Sh/bltmLOgx123h0VhFyBpLvYQrzq43d
 PK8MB6AFeAcmvWUfOzDY2acGNfgqflhWsJ6CQCiAsLzRGV4EKoWn43aITnfAytYQ6
 5Ps07U4iO2ALF6QMXWXfUE4noXt+QESPRULmEsVQa3C8qFBEvOHRUn/CMIZZgdvD6
 Qbz12sgPxVjUIKaBRpZZFSRvQ0QseRKwQTi0R6aFFrpe+/RNTbJdhmq98n2qgKDoR
 f+E1/UwhV+IKIZ6bTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=tJnCtCUO
Subject: [Buildroot] [PATCH v5 7/7] package/json-glib: bump to version 1.10.0
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
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
