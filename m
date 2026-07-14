Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63EAC43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 09:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A9BA608A8;
	Tue, 14 Jul 2026 09:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jNmWuMHIXlV; Tue, 14 Jul 2026 09:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93FA5608C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784021647;
	bh=ymCc13HPWOBRolboS+ZgmshFwAIRrkizk3DuYR/io+0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N1h+onwXu8vdY8PIPpjj21h/PCn+D1W6MOIrN+R/BDMLDhwrl8GhLIUtQZ1nW9jNV
	 5mh/wUpM1U2Lryv2TEgwMugrmCp0rDFTjTn7YqXXTJ9kqQfB35IMnwtF/Qd/BBCNd9
	 zbbBYRcqRH46KDIJmv2q6pg0HYIBmBjPgQWx74p6eL38HQ6ZmiVccH1vAhP48o7A+e
	 E+Qb5urISGBgsG6Mfve2pMi8OrYs9d1srN3KncuJr3LZjeW/E53ih7m8GquC6AcD3Q
	 YWG6PEYgieQprQDu+8qipN5sgccr98TmwYCFtEaZBPvHTjF7J0b+R1tVtvB5L5RDNv
	 8q0IVzwhKgaig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93FA5608C1;
	Tue, 14 Jul 2026 09:34:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 897AD9CF
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80363608C1
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTOPSTwNgtRs for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 09:34:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FC5A608A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FC5A608A8
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 09:34:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E827B8882F; Tue, 14 Jul 2026 09:33:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 11:32:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30dbef0e198d8b5e90c250c6f4cb3c061597c05f
X-Git-Newrev: 67b9534b382d251e6adea2fcbaa852fca9957633
X-Patchwork-Hint: ignore
Message-Id: <20260714093330.E827B8882F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvm-unit-tests: bump version to
 2026-04-17
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/67b9534b382d251e6adea2fcbaa852fca9957633
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This resolves the risc-v build failure [1].

[1] https://autobuild.buildroot.org/results/234eee7f3439fd78434bace87ba2390b74f038ae/

Signed-off-by: Joel Stanley <jms@oss.tenstorrent.com>
[Julien: reword commit log title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kvm-unit-tests/kvm-unit-tests.hash | 2 +-
 package/kvm-unit-tests/kvm-unit-tests.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index ad0922df59..f2f07a0731 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  60015b023f34261c134d714f4670926ac81483e286a16475eb4a5cedab00eefa  kvm-unit-tests-v2025-06-05.tar.bz2
+sha256  0d3b588163064be2188b668abdebb4183ac211eab83d0a3cdc9a93f463686bc3  kvm-unit-tests-v2026-04-17.tar.bz2
 sha256  b3c9ca9e257f2eaae070cf0ccdf8770764f05a947a39a835e633413750a5777b  COPYRIGHT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 1ed902b1a0..b5b1415744 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVM_UNIT_TESTS_VERSION = 2025-06-05
+KVM_UNIT_TESTS_VERSION = 2026-04-17
 KVM_UNIT_TESTS_SOURCE = kvm-unit-tests-v$(KVM_UNIT_TESTS_VERSION).tar.bz2
 KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive/v$(KVM_UNIT_TESTS_VERSION)
 KVM_UNIT_TESTS_LICENSE = GPL-2.0, LGPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
