Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76233C53200
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 14:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 296D140B39;
	Fri, 24 Jul 2026 14:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNLZMvZSincz; Fri, 24 Jul 2026 14:13:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A40D40B3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784902435;
	bh=d4ZMaOqIcec8fNnGeW6cJZX5f2OmiWxvnK1eTZaBtqQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sQJg2PzPQzRPqP2zZimBNxLbh0HVzjNkpiKaHM5WZFjZs10/ddVULD/22ZDhFf6Zp
	 T6zT55a1b5A8Rr/moM2pl1BTIN5yvgvsKdVFhI6vvdfiOGHyt21gMSNsDr1xd50+OY
	 KnAVw7+jsKnWePs8FfSOxifXw0SO69tQdI7J9RDnaiDEEnHh5nhD/vFDfWWaUa9Lsz
	 hNH7c0Z791qpiBliI91zdzX9p5Z0pnxZw7DvK/dllbdZ1iL2kr0V8yO4W2FoxlnL6d
	 +U96SQ2fc2MXMPPLlrjxqJNyakO8ZWTYLZxFtW9ghF6XQB2U7u5rJJ/S1MSyQ4Vw5T
	 RTrtkba1fAqAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A40D40B3C;
	Fri, 24 Jul 2026 14:13:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF0ED3B1
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B486640152
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQX-9fKBYs9F for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 14:13:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D076F403CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D076F403CB
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:13:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 333808A4E0; Fri, 24 Jul 2026 14:13:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 14:40:30 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 3cb7a729940b8e674be407cca35d1fac3b3f2a50
X-Git-Newrev: 9b4559d6f10d1a1b3ba78506da33c64c190e9d91
X-Patchwork-Hint: ignore
Message-Id: <20260724141311.333808A4E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/ntfs-3g: security
 bump version to 2026.7.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b4559d6f10d1a1b3ba78506da33c64c190e9d91
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://github.com/tuxera/ntfs-3g/wiki/NTFS-3G-Release-History
https://seclists.org/oss-sec/2026/q3/152

  Multiple vulnerabilities have been discovered in ntfs-3g.
  A new version 2026.7.7 is now available at https://github.com/tuxera/ntfs-3g

    (ntfscat) Fix heap memory corruption when processing a corrupt or maliciously crafted filesystem. (CVE-2026-42616)
    Fix heap memory corruption when copying index data from root to an index block in a corrupt or maliciously crafted filesystem. (CVE-2026-42617)
    Fix single-byte heap buffer overflow when decompressing maliciously crafted compressed file data. (CVE-2026-42618)
    Fix heap buffer overflow when copying the tail data of an index block to a freshly allocated block. (CVE-2026-46569)
    Fix out-of-bounds read when processing symlink reparse data in a corrupt or maliciously crafted filesystem. (CVE-2026-46571)
    Fix heap memory corruption for maliciously crafted or corrupt index data descending to an out-of-bounds tree depth. (CVE-2026-46570)
    Fix heap buffer overflow for maliciously crafted or corrupt index data during a node split. (CVE-2026-46572)
    Fix heap buffer overflow when building inherited ACL data. (CVE-2026-56135)
    Fix out of bounds access when clearing an index root in maliciously crafted or corrupt index data. (CVE-2026-56136)

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 26811cb110217797fb44862aa401d68e73f9b1ae)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ntfs-3g/ntfs-3g.hash | 3 ++-
 package/ntfs-3g/ntfs-3g.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ntfs-3g/ntfs-3g.hash b/package/ntfs-3g/ntfs-3g.hash
index 3fcba6af4d..6c68f227a8 100644
--- a/package/ntfs-3g/ntfs-3g.hash
+++ b/package/ntfs-3g/ntfs-3g.hash
@@ -1,4 +1,5 @@
+# From https://github.com/tuxera/ntfs-3g/releases/tag/2026.7.7
+sha256  d67b769025d32860549d35c2147e45024d172f81c540d750390ce3602c059dab  ntfs-3g_ntfsprogs-2026.7.7.tgz
 # Locally calculated
-sha256  f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c  ntfs-3g_ntfsprogs-2022.10.3.tgz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  COPYING.LIB
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 62c515d50f..b44ad86290 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTFS_3G_VERSION = 2022.10.3
+NTFS_3G_VERSION = 2026.7.7
 NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
 NTFS_3G_SITE = http://tuxera.com/opensource
 NTFS_3G_CONF_OPTS = --disable-ldconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
