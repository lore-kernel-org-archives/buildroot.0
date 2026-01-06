Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CFCD0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6926440B1A;
	Wed,  7 Jan 2026 17:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgwzLQzweJBx; Wed,  7 Jan 2026 17:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B609C40AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808070;
	bh=Kn9pAG2fgSdWJ6vrcFP6jHNR1/OhnkbRl7iU1kf21n4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dcHtHPVUJTfLfa6h1GZJoFF/jFarBb9zO2mwjxFhWKfeRvp+LHnkcizCaijW7TzJ2
	 S7w3WBzrs6A6+KJpjSaf72VRW9blkf2Ns0qWV4N2OU7SuX1BQ2N9uUlz0PQ3d3lNXp
	 VW9hldn9HdQuKxllB9nkTSl4mYWgq/W6RucHYyLAP5zkos8GqNv8msBlNatCU18NHi
	 XlZlcLL2dbmG+a5F+DakUVoUy4BPu6KcMU64W81iJP70csrjzGdCYPRdFLf5kYqTq4
	 blpEnS+Knm8a2n0RAIeoXMt5vPcjqY0LWBgC4ZKJCoPYkH2fJ/GKtxESn4UD3R9BRM
	 anNmU4zovISFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B609C40AFF;
	Wed,  7 Jan 2026 17:47:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3658A9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F4FD60B94
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ClTI5H49Zssa for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BDB660AB6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BDB660AB6
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B48286FC2; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:18:11 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 39e201a1a1ca93883d37316f7e0472123c5cb28c
X-Git-Newrev: 8ca029e27a02bbfb5b81946f5fef00fe61356231
X-Patchwork-Hint: ignore
Message-Id: <20260107174642.7B48286FC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] boot/grub2: add CVE
 trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ca029e27a02bbfb5b81946f5fef00fe61356231
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d464e5e856cd3cf5c8e1802dc6bbb662f2329eb3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch     |  4 ++--
 .../0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch |  2 +-
 ...0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch |  2 +-
 boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch            |  4 ++--
 .../0044-fs-Disable-many-filesystems-under-lockdown.patch      | 10 +++++-----
 ...-fs-Prevent-overflows-when-allocating-memory-for-arra.patch |  4 ++--
 boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch         |  1 +
 7 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch b/boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch
index 40df727a60..3cffc80530 100644
--- a/boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch
+++ b/boot/grub2/0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch
@@ -5,8 +5,8 @@ Subject: [PATCH] fs/hfs: Fix stack OOB write with grub_strcpy()
 
 Replaced with grub_strlcpy().
 
-Fixes: CVE-2024-45782
-Fixes: CVE-2024-56737
+CVE: CVE-2024-45782
+CVE: CVE-2024-56737
 Fixes: https://savannah.gnu.org/bugs/?66599
 
 Reported-by: B Horn <b@horn.uk>
diff --git a/boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch b/boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch
index c3c845a50a..9d89bcd48f 100644
--- a/boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch
+++ b/boot/grub2/0006-fs-tar-Integer-overflow-leads-to-heap-OOB-write.patch
@@ -9,7 +9,7 @@ number parsed by read_number(). Later direct arithmetic calculation like
 grub_size_t leading to heap OOB write. This patch fixes the issue by
 using grub_add() and checking for an overflow.
 
-Fixes: CVE-2024-45780
+CVE: CVE-2024-45780
 
 Reported-by: Nils Langius <nils@langius.de>
 Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
diff --git a/boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch b/boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch
index bb3cfb1813..b9638caabb 100644
--- a/boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch
+++ b/boot/grub2/0037-gettext-Integer-overflow-leads-to-heap-OOB-write.patch
@@ -9,7 +9,7 @@ to 0 leading to heap OOB write. This patch fixes
 the issue by using grub_add() and checking for
 an overflow.
 
-Fixes: CVE-2024-45777
+CVE: CVE-2024-45777
 
 Reported-by: Nils Langius <nils@langius.de>
 Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
diff --git a/boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch b/boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch
index 58a63985cd..7598254496 100644
--- a/boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch
+++ b/boot/grub2/0043-fs-bfs-Disable-under-lockdown.patch
@@ -6,8 +6,8 @@ Subject: [PATCH] fs/bfs: Disable under lockdown
 The BFS is not fuzz-clean. Don't allow it to be loaded under lockdown.
 This will also disable the AFS.
 
-Fixes: CVE-2024-45778
-Fixes: CVE-2024-45779
+CVE: CVE-2024-45778
+CVE: CVE-2024-45779
 
 Reported-by: Nils Langius <nils@langius.de>
 Signed-off-by: Daniel Axtens <dja@axtens.net>
diff --git a/boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch b/boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch
index 9120f8c872..778903533d 100644
--- a/boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch
+++ b/boot/grub2/0044-fs-Disable-many-filesystems-under-lockdown.patch
@@ -9,11 +9,11 @@ hfsplus, iso9660, squash4, tar, xfs and zfs.
 The JFS, ReiserFS, romfs, UDF and UFS security vulnerabilities were
 reported by Jonathan Bar Or <jonathanbaror@gmail.com>.
 
-Fixes: CVE-2025-0677
-Fixes: CVE-2025-0684
-Fixes: CVE-2025-0685
-Fixes: CVE-2025-0686
-Fixes: CVE-2025-0689
+CVE: CVE-2025-0677
+CVE: CVE-2025-0684
+CVE: CVE-2025-0685
+CVE: CVE-2025-0686
+CVE: CVE-2025-0689
 
 Suggested-by: Daniel Axtens <dja@axtens.net>
 Signed-off-by: Daniel Axtens <dja@axtens.net>
diff --git a/boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch b/boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
index e7bf8d543b..ce84e677c3 100644
--- a/boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
+++ b/boot/grub2/0050-fs-Prevent-overflows-when-allocating-memory-for-arra.patch
@@ -9,8 +9,8 @@ overflow checks are in place.
 The HFS+ and squash4 security vulnerabilities were reported by
 Jonathan Bar Or <jonathanbaror@gmail.com>.
 
-Fixes: CVE-2025-0678
-Fixes: CVE-2025-1125
+CVE: CVE-2025-0678
+CVE: CVE-2025-1125
 
 Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
 Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
diff --git a/boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch b/boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch
index 7449e08191..e7d89e02e7 100644
--- a/boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch
+++ b/boot/grub2/0074-Constant-time-grub_crypto_memcmp.patch
@@ -9,6 +9,7 @@ The code is extracted from the upstream commit:
 
 Fix: bsc#1234959
 
+CVE: CVE-2024-56738
 Signed-off-by: Gary Lin <glin@suse.com>
 Upstream: not submitted upstream, as upstream has switched to gcrypt
 Taken-from: https://build.opensuse.org/projects/SUSE:SLE-15-SP5:Update/packages/grub2.39923/files/grub2-constant-time-grub_crypto_memcmp.patch?expand=0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
