Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DB9E8FDBE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AA1040708;
	Sun, 28 Dec 2025 21:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ys1izIHeKmQj; Sun, 28 Dec 2025 21:00:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C51406EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766955637;
	bh=4/9zyYOJ3tJuGLWJm0pNLzs1ukS62B1zClrSV24y/Tg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WIaOB+n/oWViys+9FMKRLIERqMCuIjH3rSIJtocR7fQh2vlu948oc+T874LMRZZ07
	 x3QHKFTpiBFc30MTCqkMHO7ekqLz6+frm23UMLgkQny/vtbSNHZ8N0mcrOPDaCgRzF
	 0ndOuQg8oJyCuFosQEjrqkmATPon27pUQcRkpXooufgnRgRTMp+Y4FCU+rX9El6Gov
	 whG/emIXmuu9ezOy2Jt9KysejPlqmdrDAxAvfjEFrJMdkDcOBB4WwBgvFeROvcJR5p
	 UCiK0mPihnpgJ0QH/SGGKz8rs2J/jYQ8QNibJdCRlC+ZKYtp0oK2Frb6/0/ro5igxc
	 1icvnV5J2YUZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10C51406EA;
	Sun, 28 Dec 2025 21:00:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E8F8B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DA19405E2
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZYplS2O_qx8Q for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D740405DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D740405DF
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B05E879C6; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:00:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0669124d77f5b4980398a792914065736df676eb
X-Git-Newrev: d464e5e856cd3cf5c8e1802dc6bbb662f2329eb3
X-Patchwork-Hint: ignore
Message-Id: <20251228210024.5B05E879C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: add CVE trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=d464e5e856cd3cf5c8e1802dc6bbb662f2329eb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
