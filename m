Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3602FC3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 08:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBD0F4094F;
	Sat, 10 Aug 2024 08:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBA3abAfM_t4; Sat, 10 Aug 2024 08:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89A4B413A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89A4B413A6;
	Sat, 10 Aug 2024 08:55:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F0A91BF3DB
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 08:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2988A606E3
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 08:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YR5XGnYXhM_O for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 08:55:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E7F0B606D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7F0B606D9
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7F0B606D9
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 08:55:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E0074FF803;
 Sat, 10 Aug 2024 08:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 10:55:27 +0200
Message-ID: <20240810085529.377663-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723280135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cmPcsuFgKS2TSnuakVU4Q5UfG9sTpjAdaWRp5KAwAP8=;
 b=eY8QD6xHO2yMS7J/O8PMaOinrpVLDRQfdZiAo2l4hwaDCv3PKISTDGKd/vtFOIdNKdEq/X
 N6JzP0GwlZc3bBKqLo/RjS2yPVuHtweirMY1bieuW3QwZp8MNpl/3483pI+4tt4duGCJxt
 B/1T5KmujlZ5TmGSh8o/E/V5yGSguBUoIHdNwaX1qPqUvAyN6+cLHFB2fVH0X5pxsLBzZm
 smxWQzr/qPkoc3ldzteJSsZEIKRIYMzXxK2sud5GELhFZrUWykU+RQglJQeILGbxRwfgs6
 xT68nZ6cpXWvqCCpAC3M5NmFmZ0e0mL5IOjDX8OgSoECg/oR4ZVdM6q0TCJimw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eY8QD6xH
Subject: [Buildroot] [PATCH next] package/{glibc,
 localdef}: bump to version 2.40
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit bumps glibc to version 2.40. See the release notes at:

https://sourceware.org/pipermail/libc-alpha/2024-July/158467.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index aaf7848a7c..bfb2942abb 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  2858e8e47c4c0df32b526c56d5590ec939e8178201ee9526bb070999ce4aa1f2  glibc-2.39-74-g198632a05f6c7b9ab67d3331d8caace9ceabb685.tar.gz
+sha256  6426766187d177412e7f3daed793dec93fce417db5ae99296c0d880aa808091e  glibc-2.40-18-g5641780762723156b0d20a0b9f7df1d76831bab0.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index db6fa55819..cee03a16fd 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.39-74-g198632a05f6c7b9ab67d3331d8caace9ceabb685
+GLIBC_VERSION = 2.40-18-g5641780762723156b0d20a0b9f7df1d76831bab0
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 6940900f8d..b3e8ab5a1b 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.39-74-g198632a05f6c7b9ab67d3331d8caace9ceabb685
+LOCALEDEF_VERSION = 2.40-18-g5641780762723156b0d20a0b9f7df1d76831bab0
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
