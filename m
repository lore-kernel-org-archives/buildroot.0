Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F4DC83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 18:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39CAA40796;
	Wed, 16 Jul 2025 18:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vyrS-iH0Do4g; Wed, 16 Jul 2025 18:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5122040691
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5122040691;
	Wed, 16 Jul 2025 18:18:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F4DF234
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 812E040F39
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FRisCTiED20W for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 18:18:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C9A7A40F36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9A7A40F36
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9A7A40F36
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:18:17 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:3cb9:e8a6:c6c7:308b] (unknown
 [IPv6:2a01:e0a:12:eba0:3cb9:e8a6:c6c7:308b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 16941C00ED;
 Wed, 16 Jul 2025 20:18:16 +0200 (CEST)
Message-ID: <2ef0c48c-354b-4109-a137-1c6bd2c3da43@grenoble.cnrs.fr>
Date: Wed, 16 Jul 2025 20:18:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Buildroot development <buildroot@buildroot.org>
Cc: Petr Vorel <petr.vorel@gmail.com>, Julien Olivain <ju.o@free.fr>
References: <af8e78be-f4ad-4543-a166-b2527c0e9c3a@grenoble.cnrs.fr>
Content-Language: en-US, fr
In-Reply-To: <af8e78be-f4ad-4543-a166-b2527c0e9c3a@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1752689896;
 bh=i+4LO4iUQZ0h601ziqny/z+z36ga9YtbkA9aeuTc58o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZTpfHc7/rOAmAsrH45BUVQCMcHcJFr6lG/BZMBJGPotfYIP/EmM7XvM9wpgj0Up1K
 xNaWp5cvo/E7KOPoxPkIQbdS/3tjAYvVdtRWli0SKu0ehoDVlh8b3xFkT4vldiygmi
 eakTY0LtcQycVMisZRizpTte0iFJPNE7F6oWqzT+tNeV/C/KFRc9BRYHii6yNqqndG
 IekPLOlNn9NEyf1j6svSLwD17VXvQyeGn8bqOicZSwDtSpRSEbKkzwIN6l+9rdxE/K
 LAN9IsPDMQ2uFfpTcYsdUCdtJuerFYXEFnw1WXXFLMvSPI7J5InayrASLD9uDDJilU
 mH+r5m/QUCqLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=ZTpfHc7/
Subject: [Buildroot] [PATCH v2 2/4] support/kconfig/patches: add missing
 patch
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 324612d68e09 ("support/kconfig: fix compiler warnings") updated
two source files in support/kconfig but failed to add a corresponding
patch in the patches/ subdirectory. Let's add it now, for the sake of
maintaining consistency.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 .../patches/24-fix--Wformat-warnings.patch    | 37 +++++++++++++++++++
 support/kconfig/patches/series                |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 support/kconfig/patches/24-fix--Wformat-warnings.patch

diff --git a/support/kconfig/patches/24-fix--Wformat-warnings.patch b/support/kconfig/patches/24-fix--Wformat-warnings.patch
new file mode 100644
index 0000000000..4b631e554f
--- /dev/null
+++ b/support/kconfig/patches/24-fix--Wformat-warnings.patch
@@ -0,0 +1,37 @@
+Fix -Wformat-overflow compiler warnings.
+
+Index: kconfig/confdata.c
+===================================================================
+--- kconfig.orig/confdata.c
++++ kconfig/confdata.c
+@@ -744,7 +744,7 @@ int conf_write(const char *name)
+ 	struct menu *menu;
+ 	const char *basename;
+ 	const char *str;
+-	char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
++	char dirname[PATH_MAX+1], tmpname[PATH_MAX+20], newname[PATH_MAX+1];
+ 	char *env;
+ 
+ 	if (!name)
+@@ -974,7 +974,7 @@ int conf_write_autoconf(void)
+ 	const char *name;
+ 	FILE *out, *tristate, *out_h;
+ 	int i;
+-	char dir[PATH_MAX+1], buf[PATH_MAX+1];
++	char dir[PATH_MAX+1], buf[PATH_MAX+20];
+ 	char *s;
+ 
+ 	strcpy(dir, conf_get_configname());
+Index: kconfig/util.c
+===================================================================
+--- kconfig.orig/util.c
++++ kconfig/util.c
+@@ -35,7 +35,7 @@ struct file *file_lookup(const char *nam
+ int file_write_dep(const char *name)
+ {
+ 	char *str;
+-	char buf[PATH_MAX+1], buf2[PATH_MAX+1], dir[PATH_MAX+1];
++	char buf[PATH_MAX+20], buf2[PATH_MAX+1], dir[PATH_MAX+1];
+ 	struct symbol *sym, *env_sym;
+ 	struct expr *e;
+ 	struct file *file;
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index cc176035be..763b679900 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -12,3 +12,4 @@
 21-Avoid-false-positive-matches-from-comment-lines.patch
 22-kconfig-lxdialog-fix-check-with-GCC14.patch
 23-kconfig-mn-conf-handle-backspace-H-key.patch
+24-fix--Wformat-warnings.patch
-- 
2.43.0


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
