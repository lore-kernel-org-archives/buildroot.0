Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C3ED0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4770E41497;
	Wed,  7 Jan 2026 18:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KTn7_ogfNTpD; Wed,  7 Jan 2026 18:02:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBE3F4148E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808955;
	bh=wLeAxF2HpDgPmHLHAxE3Axjk88uAbMpVKg3WxL5dufo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kq975ztobeT6LajpR40Ee9ya6C0qSyva2zmHqQE0NTNAekbbD+4C/L1zISl7IVvUo
	 MGr7W41o36JOf7pYhR79+4yw5X0CrS8uaIkl1fs/MPJw3SC/dNsXxKA6poFCffq5Bg
	 ytLPhfZBI2LIMP0SMno2v08cT8xktqyaf0HEAeffAXZH+VaivXOTVAf3b41U+ijYYN
	 Pl4Vtg4ZO1TmE3EGtYvKUk1PTzUGUc8ZUBIEpu+AebneOJd9PRYWkwtALkEXK9VEl5
	 PhO0oYIeQkwpuXwS6qtdN32btgBLzwmGyMPKrUvDtB5lpxmsXYHNzIWrKqUwPavt2S
	 DiRRs3OIKd57A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBE3F4148E;
	Wed,  7 Jan 2026 18:02:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D9CF25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C710140D43
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIqQULcohgwN for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9611140981
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9611140981
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94D5081340; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:56:40 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 94e3d1a7414f896d8d2b2ca2dc3719d6a8ba46dd
X-Git-Newrev: 4618db63e0862d59b232b216174908dc502b9a89
X-Patchwork-Hint: ignore
Message-Id: <20260107180113.94D5081340@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/mupdf: remove
 stale IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=4618db63e0862d59b232b216174908dc502b9a89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

The fixes for the CVE-2024-24258 & CVE-2024-24259 were introduced in [1]
and targeted the package libfreeglut.

The patches that fixed CVE-2024-24258 & CVE-2024-24259 in libfreeglut
were removed in Buildroot commit [2]. With this bump the IGNORE_CVES
entries for mupdf were not removed.

[1] 0f4fef076f package/libfreeglut: add upstream security fix for CVE-2024-2425{8, 9}
[2] b1c77090ef package/libfreeglut: bump version to 3.6.0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f2e442a14d93fc99ab31e8eea96901500862f28a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mupdf/mupdf.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 6b666033eb..9eecb84232 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -21,12 +21,6 @@ MUPDF_DEPENDENCIES = \
 	lcms2 openjpeg \
 	zlib
 
-# libfreeglut/0001-Plug-memory-leak-that-happens-upon-error.patch
-# Fix is in libfreeglut, but CVE applied to mupdf.
-MUPDF_IGNORE_CVES = \
-	CVE-2024-24258 \
-	CVE-2024-24259
-
 # mupdf doesn't use CFLAGS and LIBS but XCFLAGS and XLIBS instead.
 # with USE_SYSTEM_LIBS it will try to use system libraries instead of the bundled ones.
 MUPDF_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
