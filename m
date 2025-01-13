Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920C8C02184
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 20:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E814607E8;
	Mon, 13 Jan 2025 20:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjCRRFpruWmo; Mon, 13 Jan 2025 20:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 588BF60844
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 588BF60844;
	Mon, 13 Jan 2025 20:05:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D2F0940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2576401D5
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 041cIuk-tA0Z for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 20:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E40D400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E40D400BD
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E40D400BD
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 20:05:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.64]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mof9F-1tDS5Y32qn-00bltd; Mon, 13
 Jan 2025 21:05:29 +0100
To: buildroot@buildroot.org
Date: Mon, 13 Jan 2025 21:04:54 +0100
Message-ID: <20250113200454.3108562-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113200454.3108562-1-fiona.klute@gmx.de>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:h+cU/3Q36yL5w7PxYXQ8uSE8dLc/uk4CBudWyQNSGyQ+EOUVilB
 q2ieRJD7X7b3W7yASByWCYF0spXe+oC532IBLfcYHRQBf6ZZhA6wtpkYHiXKvROzoIDYnRX
 7g65/neEonZ1QGU58lcF/lVYmonBTcdiV3nQ/e4CDinQt3q07Knt6nUkWptYAu8qYZYdqJB
 QfjOPSi7oCvD4jHH82UuA==
UI-OutboundReport: notjunk:1;M01:P0:7uAlyubuo2U=;Pzii/+G6u3DWADSfzy5349Pi40i
 bgZOUcRAfmrvL/cgMd5of53b/LhvXx8QQbLKQt4uZEbb+ikL2N2FXflXx9BgwdWqh2bmiVxdX
 9Z5B5KH6aCnG9czKcVGa4Fvhu45hWhGTO84iN1ioO3R7dg8CXAS/sMR3//m8FbcQKZ8fRiZ0y
 rip7UXqNkL8OgJvo4Sow3+hvTyJBnm9KYbrQ0q0vjKsVb7OFq+8K/UO6E/6o/VqUcgJW1dd6T
 HTgfaMP7JKL3HbxNM+wJW/kHzuQaOLcvR72jwAHOsvNZAhTsO9M2w2B1ndWk7aFZaGGQtCl7e
 vu7f5JtZDOWapylapzy2anMlSya8EmPVyALZwe9Qh+ALUL5XtxV7O+/0ShF8qAEMuNd0oUFcW
 X7cIbvWWyBSQUnJ2H+vPxygp69UhdQd7KC5xBQWrTMPzcTiOmznVs42FhFxBHlA2jss3xYCd+
 aIsngagS2v0S7lON4jcaafoBhIbNZ1jP5hcAvuCAPBhYcDMVwfl2dn9MTTOX8JLPPoeV1BZiM
 YMv37d13G7K3euVKOJzwzHZZJ30qImCRX3HOGyWmGA2ZqmQlUw/tVeoM9U9efHwYC1b5fGS/r
 e99YbquUeH1EMT4BwFFQ+Ve2vD4RDLT5/aZJ3anS47YsgnA0Fbk2Ej8wnBejHVegJ3XT4QG66
 SRRtXTi0hvtR2O6s3HLQaEA/6FnAp66VkbD0Y7pviNAZsVrCS6troglLVmtTmc8p9WT1JalVb
 d3PWraFH7PBMtRt19uroslbtf5b+rMsEIhgaDOR8p+nLYe6xiwjl/d3P8YsvZDaFnhgK6PfH2
 ajX0wUtWYdKAkW1bJCpq8j5r5J+fMwK3PLINffSx2GQwML05o+52VV9L2obRlSmAfOVTZdGTT
 3loVoxA09B1caVTcl5TspHkBk9iN4U21NfH3q52nHP66Sp/YtkZDtvIox0gW3uBoxSOCjzfq0
 siArFFijfuSpUlIuY+Rssh3oXqngVDn3gdPoYNH/gt5bB5j+enG60Fh17ykwcq0HHYVAuecG2
 dPnB5OUdSTQCVqjC2XIBBd0uazZgiN7O08MuWvaPAfE5PMs3e9BTXtk0Uw6wc8OfSn6wMbvlx
 25Fcalge1ddXPN8T/Ui0EHDqohDLHE
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736798729; x=1737403529; i=fiona.klute@gmx.de;
 bh=e9eckgokL0ORbtJ+xtTkUT/nqWGuEhiO0p50wezxfig=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Ao1CgUjjWaOpYUc7dbemqZ1M2Xc7RfPfUUx0E74VGQiQQDAWNev+/A9JcDoaE+Fc
 n49CKB2jXPCSpgeHx0osbY/2MgyJgP90Nj3VN7zDfGxBaZqXv5+wWpMDtXtWt0Bgu
 k7DQoiDnoP0VuDtgJdsKCouRm6OLGjRAepUYPDtGPnj7+vrju2Y93vt5TuQACbsUE
 0Uq6TKtu0bFq8s7/QMCMBSOaTI7adONMWvzu7h4oWHHIRLK1E8k/ib7A8BvvfwsdN
 GoaAnbZ021d/XNQrjZeuUVkkhjL/TtJwezO+JOZq4KK+7svT5OsIlMzbC/x+hA2z6
 OzudgBZDrBlIbNZATw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Ao1CgUjj
Subject: [Buildroot] [PATCH v7 5/5] package/json-glib: bump to version 1.10.6
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
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
Changes v6 -> v7 (Fiona):
* Bump json-glib to version 1.10.6

 package/json-glib/json-glib.hash | 4 ++--
 package/json-glib/json-glib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index b78d708391..0c0b2cbb73 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/json-glib/1.8/json-glib-1.8.0.sha256sum
-sha256  97ef5eb92ca811039ad50a65f06633f1aae64792789307be7170795d8b319454  json-glib-1.8.0.tar.xz
+# From https://download.gnome.org/sources/json-glib/1.10/json-glib-1.10.6.sha256sum
+sha256  77f4bcbf9339528f166b8073458693f0a20b77b7059dbc2db61746a1928b0293  json-glib-1.10.6.tar.xz
 
 # Hash for license file:
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index e216af20b1..04d696987b 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JSON_GLIB_VERSION_MAJOR = 1.8
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).0
+JSON_GLIB_VERSION_MAJOR = 1.10
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).6
 JSON_GLIB_SITE = https://download.gnome.org/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPL-2.1+
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
