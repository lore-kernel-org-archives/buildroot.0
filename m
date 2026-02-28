Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3637CEEF317
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EEB680CDB;
	Thu,  5 Mar 2026 08:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZX3LArYXDg8n; Thu,  5 Mar 2026 08:02:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C239B80CEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697743;
	bh=Olgx3r66r3hKGpxtpmbxz9P7rSvmEia/ykYDrn2eyL0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ba4qgDmGSrzsiyCt0XRp+1KSypsAfEiUSKIB+1ABNJCN3wD2aeS36GIqTTCtiLcML
	 jVTjsqW71N/cH7bAll89NjX3ghU9zW3PHA60vWUuTQTmEO8aA7lAibU3mMw2dussue
	 Crp3WIOF+pJswvCyIL+39fAsiVgCfOwsd46rOeXl3iD6DcSesSYVUkzawz8Z62BqKA
	 QD/ix/JCEK1f8Gd/g3h4NS8JCQhr1QjWJI6xjqpfLWU1yqGg3yOHxmg5455bDOkAsd
	 jvhVMrEl/y9alLdBZz42/8TR275mgG/hQW6ygwUREEfxZOTAlkPm4pDU4AB+K2/4lv
	 43H0dTozv7UMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C239B80CEE;
	Thu,  5 Mar 2026 08:02:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01DBC1EB
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49DC160623
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQVZrkAZWW3g for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51AE36065A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51AE36065A
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D99881829; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 15:14:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d332d9627c17defffda0cb64d20ee5735c0ee9fc
X-Git-Newrev: a7db1db0816d1e668b2802e9d1279915ef8b6634
X-Patchwork-Hint: ignore
Message-Id: <20260305080208.5D99881829@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmodbus: bump version to 3.1.12
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a7db1db0816d1e668b2802e9d1279915ef8b6634
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/stephane/libmodbus/blob/v3.1.12/NEWS.md

Added tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmodbus/libmodbus.hash | 3 ++-
 package/libmodbus/libmodbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
index 5c081d9710..ddca835f34 100644
--- a/package/libmodbus/libmodbus.hash
+++ b/package/libmodbus/libmodbus.hash
@@ -1,3 +1,4 @@
+# From https://github.com/stephane/libmodbus/releases/tag/v3.1.12
+sha256  2f4d4191cd196c1fba131daec03b621db75129d8255c832fc66b259d9fc46e7b  libmodbus-3.1.12.tar.gz
 # Locally computed
-sha256  15b4b2e0f68122c2da9b195de5c330489a9c97d40b4a95d2822378dc14d780e7  libmodbus-3.1.11.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 4902d6257f..5d20aef35c 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODBUS_VERSION = 3.1.11
+LIBMODBUS_VERSION = 3.1.12
 LIBMODBUS_SITE = https://github.com/stephane/libmodbus/releases/download/v$(LIBMODBUS_VERSION)
 LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
