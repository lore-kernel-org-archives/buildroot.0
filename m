Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B93C5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49BA5611F0;
	Wed,  4 Jun 2025 18:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pL8nxaH2Z1rv; Wed,  4 Jun 2025 18:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 446A160EE6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 446A160EE6;
	Wed,  4 Jun 2025 18:28:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F01E1A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D20924023C
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSfPOFXGthYx for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA3944026B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA3944026B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C74E286517; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:39:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 48ba7de0dea29162b120aaa7121ae92ad694cd69
X-Git-Newrev: 4580f1e46496ea5733a84ff64900e79725fac0f8
X-Patchwork-Hint: ignore
Message-Id: <20250604182758.C74E286517@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/binutils: apply
 security patch for CVE-2025-3198
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4580f1e46496ea5733a84ff64900e79725fac0f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This fixes a memory leaks that affects both binutils 2.43 and 2.44,
see https://www.cve.org/CVERecord?id=CVE-2025-3198

Fixes the following CVE:
- CVE-2025-3198: A vulnerability has been found in GNU Binutils 2.43/2.44
                 and classified as problematic. Affected by this
                 vulnerability is the function display_info of the file
                 binutils/bucomm.c of the component objdump.
                 The manipulation leads to memory leak.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4dc951f3eed55617991ba8cd9337fdf5f3d5f1f5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/binutils/2.43.1/0003-objdump-memleak.patch | 31 ++++++++++++++++++++++
 package/binutils/2.44/0003-objdump-memleak.patch   | 31 ++++++++++++++++++++++
 package/binutils/binutils.mk                       |  3 +++
 3 files changed, 65 insertions(+)

diff --git a/package/binutils/2.43.1/0003-objdump-memleak.patch b/package/binutils/2.43.1/0003-objdump-memleak.patch
new file mode 100644
index 0000000000..1b1632093d
--- /dev/null
+++ b/package/binutils/2.43.1/0003-objdump-memleak.patch
@@ -0,0 +1,31 @@
+From ba6ad3a18cb26b79e0e3b84c39f707535bbc344d Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 19 Feb 2025 07:58:54 +1030
+Subject: [PATCH] PR32716, objdump -i memory leak
+
+PR binutils/32716
+* bucomm.c (display_info): Free arg.info.
+
+Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d
+
+CVE: CVE-2025-3198
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ binutils/bucomm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/binutils/bucomm.c b/binutils/bucomm.c
+index ccf54099154..d4554737db1 100644
+--- a/binutils/bucomm.c
++++ b/binutils/bucomm.c
+@@ -435,6 +435,7 @@ display_info (void)
+   if (!arg.error)
+     display_target_tables (&arg);
+ 
++  free (arg.info);
+   return arg.error;
+ }
+ 
+-- 
+2.43.5
+
diff --git a/package/binutils/2.44/0003-objdump-memleak.patch b/package/binutils/2.44/0003-objdump-memleak.patch
new file mode 100644
index 0000000000..1b1632093d
--- /dev/null
+++ b/package/binutils/2.44/0003-objdump-memleak.patch
@@ -0,0 +1,31 @@
+From ba6ad3a18cb26b79e0e3b84c39f707535bbc344d Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 19 Feb 2025 07:58:54 +1030
+Subject: [PATCH] PR32716, objdump -i memory leak
+
+PR binutils/32716
+* bucomm.c (display_info): Free arg.info.
+
+Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d
+
+CVE: CVE-2025-3198
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ binutils/bucomm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/binutils/bucomm.c b/binutils/bucomm.c
+index ccf54099154..d4554737db1 100644
+--- a/binutils/bucomm.c
++++ b/binutils/bucomm.c
+@@ -435,6 +435,7 @@ display_info (void)
+   if (!arg.error)
+     display_target_tables (&arg);
+ 
++  free (arg.info);
+   return arg.error;
+ }
+ 
+-- 
+2.43.5
+
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index fd6fc3de8d..2b5064d739 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -31,6 +31,9 @@ BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
 BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
 BINUTILS_CPE_ID_VENDOR = gnu
 
+# 0003-objdump-memleak.patch
+BINUTILS_IGNORE_CVES += CVE-2025-3198
+
 ifeq ($(BINUTILS_FROM_GIT),y)
 BINUTILS_DEPENDENCIES += host-flex host-bison
 HOST_BINUTILS_DEPENDENCIES += host-flex host-bison
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
