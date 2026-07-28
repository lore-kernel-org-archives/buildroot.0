Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89520C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50E2860AD0;
	Fri, 31 Jul 2026 11:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RThl24oR8XRu; Fri, 31 Jul 2026 11:57:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F2C760AE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499024;
	bh=pV52T4gMq6AIQ9rA23EKcUgqZdWDQIIQ0s/WiX23g9Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KdsC5kTn8vS4RqdBHDk0QXOdLRrE3HuXllQ7hKxhgSFbf1XbpeMVlsBkrlQg0XOT7
	 r6nEPHrlaEdfedgHxp9DHaWzYOVOteKGwsrNTJwXhBTHkybaVHEKLteKLMQz2/faNV
	 GLsCDKW8M1ygjLdJOcfUE5f0mqKnQk1RDJgZPedHhsWrjoU2z5iJVJ6WF3sZX/DpaJ
	 TCcfZuMzylYie5UalfSAO7dGQ9L6aA74TNa82jK+AMWk3innAMQU20Od0qoMRf7SVc
	 2CJeUxNg6Jjw7L0KM9Iy3FgjKkwBDoEasDLHwAOfAWf5R+7R9vKMLmEpXt6fXkGG7Z
	 wCsqK9KdcRoBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F2C760AE5;
	Fri, 31 Jul 2026 11:57:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C6EC23F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EC8160825
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Ej3bPBV6ane for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDA9360AAC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDA9360AAC
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF41C8B741; Fri, 31 Jul 2026 11:56:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 12:18:19 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 3d8a7c665a138192ab412d968ae36e6ec61354c2
X-Git-Newrev: 92c296f00fafa075de682d74c0da43c361008a90
X-Patchwork-Hint: ignore
Message-Id: <20260731115605.AF41C8B741@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/skeleton{,
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/92c296f00fafa075de682d74c0da43c361008a90
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
