Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522F0C5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:58:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1545F8118D;
	Fri, 31 Jul 2026 11:58:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxFv-PZ7dxWU; Fri, 31 Jul 2026 11:58:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA2788111F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499099;
	bh=GzWbmy6U+XH4jnSyUczM4Mu9/T1ng9Cac3Dpqs3/bvY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LeAYg57hZvqisaHj4Q5KsgJWPBPVxzk0siHmVjBtJs6UwCYDTxghi+CZHdphsNs05
	 KNjjU/AqaeZ2lu7x1PGzV9UTpzzQsQO0SLXs4x2NOb3frk2eX/v0Px9k0JmY7YK8ez
	 DnXSaiKut9pYCY3UX4cUGrI6a3GIiQnb3zABi5KiHYR+lv2Zfy1JbmYgvKM1gFZTBs
	 +lC9SglwrtuPv5o12UDyArYtRsJuK09A8cWIgKJIMicp4uqa2vX45oVdm7vGi5HcXB
	 0LnC6zapOqh6GhS7byQB8cI5XYYu5+L7zb3yp8ZMrQA5rYKY3Nyv+x6948EDPsYZDW
	 01KL5qcgynUNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA2788111F;
	Fri, 31 Jul 2026 11:58:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF20C23F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB5B3810A8
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Nr_gH6vyPoa for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFD4E810AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFD4E810AC
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1B898B742; Fri, 31 Jul 2026 11:57:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 12:18:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a2e883b3eecc686ad7d929c6abc84a0038654f7c
X-Git-Newrev: 617fe0289ec0132e060d37473aaab6dd95e4f06f
X-Patchwork-Hint: ignore
Message-Id: <20260731115729.E1B898B742@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/skeleton{,
 -init-*}: add license information
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/617fe0289ec0132e060d37473aaab6dd95e4f06f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

All these packages are part of Buildroot and thus under
GPL-2.0-or-later unless stated otherwise, as described in COPYING.

package/skeleton-custom is excluded because it provides a way to copy
skeleton data from any location chosen by the user, the license of
which is unknown to Buildroot.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 927c5759640ef626ab4507f91493a8242653d12b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/skeleton-init-common/skeleton-init-common.mk   | 2 ++
 package/skeleton-init-none/skeleton-init-none.mk       | 2 ++
 package/skeleton-init-openrc/skeleton-init-openrc.mk   | 2 ++
 package/skeleton-init-systemd/skeleton-init-systemd.mk | 2 ++
 package/skeleton-init-sysv/skeleton-init-sysv.mk       | 2 ++
 package/skeleton/skeleton.mk                           | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/package/skeleton-init-common/skeleton-init-common.mk b/package/skeleton-init-common/skeleton-init-common.mk
index 4a67f51c19..299f2643b4 100644
--- a/package/skeleton-init-common/skeleton-init-common.mk
+++ b/package/skeleton-init-common/skeleton-init-common.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+SKELETON_INIT_COMMON_LICENSE = GPL-2.0-or-later
+
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
diff --git a/package/skeleton-init-none/skeleton-init-none.mk b/package/skeleton-init-none/skeleton-init-none.mk
index 8181aa0354..d96af89e19 100644
--- a/package/skeleton-init-none/skeleton-init-none.mk
+++ b/package/skeleton-init-none/skeleton-init-none.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+SKELETON_INIT_NONE_LICENSE = GPL-2.0-or-later
+
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
diff --git a/package/skeleton-init-openrc/skeleton-init-openrc.mk b/package/skeleton-init-openrc/skeleton-init-openrc.mk
index b0538ad03f..b6b97a4e3e 100644
--- a/package/skeleton-init-openrc/skeleton-init-openrc.mk
+++ b/package/skeleton-init-openrc/skeleton-init-openrc.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+SKELETON_INIT_OPENRC_LICENSE = GPL-2.0-or-later
+
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index b312fe33e4..601285de28 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+SKELETON_INIT_SYSTEMD_LICENSE = GPL-2.0-or-later, LGPL-2.1-or-later (factory/var.mount)
+
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
diff --git a/package/skeleton-init-sysv/skeleton-init-sysv.mk b/package/skeleton-init-sysv/skeleton-init-sysv.mk
index 009dc100ea..dc9793d44f 100644
--- a/package/skeleton-init-sysv/skeleton-init-sysv.mk
+++ b/package/skeleton-init-sysv/skeleton-init-sysv.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+SKELETON_INIT_SYSV_LICENSE = GPL-2.0-or-later
+
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index dc754f1244..fd606c8085 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+SKELETON_LICENSE = GPL-2.0-or-later
+
 # The skeleton can't depend on the toolchain, since all packages depends on the
 # skeleton and the toolchain is a target package, as is skeleton.
 # Hence, skeleton would depends on the toolchain and the toolchain would depend
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
