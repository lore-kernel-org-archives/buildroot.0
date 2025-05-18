Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F34AC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02F64712ED;
	Mon, 19 May 2025 11:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18cLsHFz6FxN; Mon, 19 May 2025 11:06:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D659F712E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D659F712E4;
	Mon, 19 May 2025 11:06:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50E7A193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C0CA40E30
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zqMhnHFHWqUh for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 312E34123F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 312E34123F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E17781E90; Mon, 19 May 2025 10:40:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 23:06:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c09ee07b2c3b3167774c1d20c4685a7366b140cf
X-Git-Newrev: 06bb701217c9928995c72b001ad4e48441c46144
X-Patchwork-Hint: ignore
Message-Id: <20250519104011.2E17781E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/valgrind: bump to
 version 3.25.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=06bb701217c9928995c72b001ad4e48441c46144
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://valgrind.org/docs/manual/dist.news.html

Rebased patches for the new version.

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch                 | 2 +-
 .../0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch   | 2 +-
 package/valgrind/valgrind.hash                                        | 4 ++--
 package/valgrind/valgrind.mk                                          | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch b/package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch
index 8a6003cbae..7bc0dd02c6 100644
--- a/package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch
+++ b/package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch
@@ -16,7 +16,7 @@ diff --git a/coregrind/m_machine.c b/coregrind/m_machine.c
 index 6110c93..298a00e 100644
 --- a/coregrind/m_machine.c
 +++ b/coregrind/m_machine.c
-@@ -27,6 +27,10 @@
+@@ -25,6 +25,10 @@
     The GNU General Public License is contained in the file COPYING.
  */
  
diff --git a/package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch b/package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch
index 44adfc4190..5e168ad506 100644
--- a/package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch
+++ b/package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch
@@ -19,7 +19,7 @@ diff --git a/coregrind/vgdb-invoker-ptrace.c b/coregrind/vgdb-invoker-ptrace.c
 index d65f59a..bdefac2 100644
 --- a/coregrind/vgdb-invoker-ptrace.c
 +++ b/coregrind/vgdb-invoker-ptrace.c
-@@ -72,6 +72,12 @@
+@@ -81,6 +81,12 @@
  #   endif
  #endif
  
diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 203a0770e1..af45bce9a5 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-sha1  6fc0470fedc0d85dae3e042297cabd13c6100749  valgrind-3.24.0.tar.bz2
+sha1  5939b8360d272e89bc7b2fcf5213e57a2080afaf  valgrind-3.25.0.tar.bz2
 # locally computed
-sha256  71aee202bdef1ae73898ccf7e9c315134fa7db6c246063afc503aef702ec03bd  valgrind-3.24.0.tar.bz2
+sha256  295f60291d6b64c0d90c1ce645634bdc5361d39b0c50ecf9de6385ee77586ecc  valgrind-3.25.0.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index f0638f464b..791ba2b504 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.24.0
+VALGRIND_VERSION = 3.25.0
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
