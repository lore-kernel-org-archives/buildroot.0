Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E09C02182
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 21:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 268B580DC7;
	Mon, 20 Jan 2025 21:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQTOwfF61EVd; Mon, 20 Jan 2025 21:17:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EE3780DB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EE3780DB4;
	Mon, 20 Jan 2025 21:17:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CA54D7
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4930E4003A
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yYlIL5RIiv7 for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 21:17:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B3E741030
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B3E741030
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B3E741030
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 21:17:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.125]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wPh-1tbsxd0bxz-00FYTW; Mon, 20
 Jan 2025 22:17:30 +0100
To: buildroot@buildroot.org
Date: Mon, 20 Jan 2025 22:17:02 +0100
Message-ID: <20250120211707.2381182-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120211707.2381182-1-fiona.klute@gmx.de>
References: <20250120211707.2381182-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:cV1XmiTFNP7SJW/Ubkc0Bc5nLYAa7XVQXro8OzISj1EjufN6AJ9
 +DTL5VdtXl2cPfY2YsHVXzYFfg36sSkncy0UUn4fR1g+aMUUtvMVvLTkijwPskqOwF0gDYE
 fREd6efxrL5CUSeDJVMS1U4coWBQOgOQQ4w0OKXGjhzRriMvZjHCCOe6uCI9tFGM9WFJTlh
 PLjpez4b5yK+uQuT9FxQQ==
UI-OutboundReport: notjunk:1;M01:P0:k4NnfsPBq9o=;Ceo2/etqj+4UkRZzGPkJ+EKm+XA
 PKnw44rnSNEmMv4uYu74Lsgroyv+MC+f+/BACn9gsiTl6dKZ+gcb9GvHAmA4hIU38qkBuNUE2
 +6LHuVwFugdYCpbXIizU+WvSdciVFGW3vUmde63tqwD9DujodN11Q4NgRYrfrSKwcyOviQyW/
 IPMy2s1jHB2SNjFPBcnfmkhtbMkx3ADakcV4d+nIzsL66a8fuYI+xvdsOwzAvXqJiD4rSQiA/
 lZ7nvlR7fG0GuSYbCSTnorLLQKhjvvARW2hVuPHCXTFbyQD7XeG9u87Z5BMKUpZLoD2x0UmP9
 Gp43eixgJGpexGEmrar0sM4dp6qfW1hoeH6jvAZC6eJCIC/lAYTFouya99QgrQGvzEE/Fo15Y
 1U/iSLAiMPPIpDi8yuZDsNgB79UjuatoGBZan5hfnR+so7unQBg58AO5U9ivtdyjMNnyafUbT
 Q3CeeSUeU5dBuRiXm/+OiQftcb/zHnm1JKN3HrfJPqBkhM5R4WcyABvBB3LwNQjKF9ISdymZV
 B1SfpZOg/K7Ym8iOPWeZhT7snXsE+1gMkcQJdheMLPUpZgBtZBhy8yRUu/lKq/zgYWDU/GhzX
 iJK1LI0Ao/2so0x6ayp4vC/t58bFOVsSieY77JFFnqG9T9ZfVHkKP0350Eu/l/P/4T2bXWv3b
 GhfiqvL6C+zrlrcmbsmfreKvCPuqlEHfNYnwxXowKby8/TfejNyqaF9OrOJqonvfwOj/98fpO
 B2MWkUXCaKyHidqOsHB7bckGeIf6QSTEnZTXgxkKCpFDODC/hxS+kAkHtuqxeZXhK4IA6RfAI
 EfEWdtEw4ujZjH1BOS1NTRyPmYAXPfQ0S0QvIwrw/TyA6w+iififmP4ZfbaxW6K/BsRMdBgFF
 8vjjfeT4eSmee2qTtZmCMbf8Cdl5DlChXbdJm3kZ/+YwnCmSL3VUyhHz/fRy2vk+2CM8ufDZi
 3hawzW9cG9Rtw/a7t/doAQpXDsZwcdqwV0M/gC1vaFXULgINeqXwosHtCugcJ0NB6HYbSGj1E
 dWH9BLZFgRRTTMU0MgDYvTJg6Jeen639CTSSbUv8KYY4pPKuUt/Fwm7wxaX89zfdSCGEAXfVl
 97dIsEx7cHOw1/06Jz+7487u2xjDk+YGsj9LG560enTY0dByUYZkzVgrAJk79olCOTaIaVueK
 5L5yqYhUYBL3Wo9AnJ2I0BKNBFQ1FDEMhn3rNVi7uJA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737407850; x=1738012650; i=fiona.klute@gmx.de;
 bh=q1Qn76Ek7Z2KIvCkllLdZraD7rrqYLZbxE4Pu7Nh8sI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tii2buQacisZ36IAMGnRkMcaShzfimcEEjra+pR+SK7x21roZTY1joYAbRNioboQ
 6nK3Ax7rLtz1vReQ5iL0JWkgAkUfX0WlII792Rw4zQe66UFSDg1v9RDXbWZTjvAWj
 Lzjj0/HSXw6TJIwetOu2Laq3CPS25hi4QoO6RWSgWppjP5ycbW/4uYKJ6ukS7YXiw
 V4RwwRU3aoZ4j9oDJYevqT4fe5L3gK74qAdsD7Ef+Z0H8YH912JP61AZL3E+eUrBp
 /fBC5baEfokmg64dd38XUE2rRU36WFcU0ZEbuAJk+WM5fa4wLXs+s02fQgVTmoqvy
 vruwKq0le4YCTzWhig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=tii2buQa
Subject: [Buildroot] [PATCH v9 1/6] package/json-glib: bump to version 1.10.6
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Required to build with gobject-introspection >= 1.82.0, to be bumped
in a later commit.

License information has been restructured according to REUSE
guidelines, see [1]. Update hashes and license information
accordingly.

[1] https://gitlab.gnome.org/GNOME/json-glib/-/commit/a06d43db36545aff10eb384d62548d96a7cf6020

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
Changes v8 -> v9 (Fiona):
* Update license info & hashes

Changes v7 -> v8 (Fiona):
* Move json-glib bump to start of series, to avoid broken state after
  GOI bump

Changes v6 -> v7 (Fiona):
* Bump json-glib to version 1.10.6

 package/json-glib/json-glib.hash | 13 +++++++++----
 package/json-glib/json-glib.mk   | 12 ++++++++----
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index b78d708391..d61a448f4e 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,5 +1,10 @@
-# From https://download.gnome.org/sources/json-glib/1.8/json-glib-1.8.0.sha256sum
-sha256  97ef5eb92ca811039ad50a65f06633f1aae64792789307be7170795d8b319454  json-glib-1.8.0.tar.xz
+# From https://download.gnome.org/sources/json-glib/1.10/json-glib-1.10.6.sha256sum
+sha256  77f4bcbf9339528f166b8073458693f0a20b77b7059dbc2db61746a1928b0293  json-glib-1.10.6.tar.xz
 
-# Hash for license file:
-sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
+# Hashes for license files and REUSE license/file listing
+sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSES/CC0-1.0.txt
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-or-later.txt
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
+sha256  c3d141a8d2613d8c376cf240cdecd10ea0ae2dd0e16f648e88ddae425b2d3ba8  .reuse/dep5
+# symlink to LICENSES/LGPL-2.1-or-later.txt
+sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index e216af20b1..a7a6d7f497 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -4,12 +4,16 @@
 #
 ################################################################################
 
-JSON_GLIB_VERSION_MAJOR = 1.8
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).0
+JSON_GLIB_VERSION_MAJOR = 1.10
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).6
 JSON_GLIB_SITE = https://download.gnome.org/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
-JSON_GLIB_LICENSE = LGPL-2.1+
-JSON_GLIB_LICENSE_FILES = COPYING
+JSON_GLIB_LICENSE = LGPL-2.1+, MIT (conformance test data), CC0-1.0 (parts of build system, metadata, translations)
+JSON_GLIB_LICENSE_FILES = LICENSES/CC0-1.0.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/MIT.txt \
+	.reuse/dep5 \
+	COPYING
 JSON_GLIB_INSTALL_STAGING = YES
 JSON_GLIB_CONF_OPTS = -Dgtk_doc=disabled -Dtests=false
 
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
