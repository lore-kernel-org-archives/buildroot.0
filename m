Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE732C87FCB
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 20:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5FE6613C2;
	Mon,  4 Aug 2025 20:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qFeF44-8vxy; Mon,  4 Aug 2025 20:13:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7970613C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7970613C3;
	Mon,  4 Aug 2025 20:13:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7AA81A2
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DD756137B
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xD2k0lDx0Lyb for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 20:13:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C293A613A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C293A613A4
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C293A613A4
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:13:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E68A444405;
 Mon,  4 Aug 2025 20:13:37 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  4 Aug 2025 22:13:32 +0200
Message-ID: <20250804201334.1584190-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudefvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeeivdfhveeitefgtefhgfeihfejveefffdthfdtvdffueeileduheefgeeugfenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754338418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YtlVGxPw30HXSiW4YjH2ZLqoRBIfxhl8likGu5oh0K4=;
 b=H1CwN2yUYCMcqyqpdN2+pNyim0iM6TpoiGMYm5KY9jyv37nTjGC8/4yi1hEVkXEnvWC0aj
 /wivOkN9pjUZY95YhrtNPCzTfkLodS/U//Y9fmFYl9Iq3xaHZcRJ2Nj5dYX/yoGy4OBHNu
 UqywLIUF3LupULBNZ0haZvxrQMmeoYP57oCSnK/nxd26UjkCX0FUuBzvH8QQ6GmXD0smKF
 cxvdZENB8CpXWUIsx6JlCh/v5Rx4sE1jbgxlh8YmiwF5Tn3LwQ0pW+ektIW4/p0afrTYUv
 qcaeqC21z6mcGaYjy2V12clY0AMAy7YdvnQL5G+u19vum4Y38PD3Ebpa8DAjMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H1CwN2yU
Subject: [Buildroot] [PATCH 1/2] package/gdb: allow selecting upstream
 releases on ARC
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

package/binutils and package/gcc both allow to use upstream versions
on ARC, but package/gdb allows using only the ARC version. Adjust the
packaging to align package/gdb with package/binutils and package/gcc,
so that upstream versions of gdb can be built for ARC.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/Config.in.host | 10 +++++++---
 package/gdb/gdb.mk         |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 54247ad642..ac50a292ff 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -41,11 +41,15 @@ config BR2_PACKAGE_HOST_GDB_SIM
 
 choice
 	prompt "GDB debugger Version"
-	default BR2_GDB_VERSION_15
-	depends on !BR2_arc
+	default BR2_GDB_VERSION_15 if !BR2_arc
+	default BR2_GDB_VERSION_ARC if BR2_arc
 	help
 	  Select the version of gdb you wish to use.
 
+config BR2_GDB_VERSION_ARC
+	bool "gdb arc (14.x)"
+	depends on BR2_arc
+
 config BR2_GDB_VERSION_14
 	bool "gdb 14.x"
 
@@ -68,7 +72,7 @@ endif
 # If cross-gdb is not enabled, the latest stable version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2023.09-release" if BR2_arc
+	default "arc-2023.09-release" if BR2_GDB_VERSION_ARC || (!BR2_PACKAGE_HOST_GDB && BR2_arc)
 	default "14.2"     if BR2_GDB_VERSION_14 || (!BR2_PACKAGE_HOST_GDB && !BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "15.2"	   if BR2_GDB_VERSION_15 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "16.3"	   if BR2_GDB_VERSION_16
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index b39b103d00..ca9c6d74d5 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -8,7 +8,7 @@ GDB_VERSION = $(call qstrip,$(BR2_GDB_VERSION))
 GDB_SITE = $(BR2_GNU_MIRROR)/gdb
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.xz
 
-ifeq ($(GDB_VERSION),arc-2023.09-release)
+ifeq ($(BR2_GDB_VERSION_ARC),y)
 GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
 GDB_FROM_GIT = y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
