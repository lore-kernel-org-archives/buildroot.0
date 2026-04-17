Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325C9F436BA
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B85481769;
	Fri, 17 Apr 2026 15:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUWPsX3IAjmx; Fri, 17 Apr 2026 15:22:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0D5681773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439372;
	bh=iQNMxvg32NG03VkfmQ8f5so64kTDqTeOa9ahd8tghzQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Pqk18jlAfa5BQMpJllvXgQMnYRDAeV1MgnAw99L6MmtXLTSykrOCEYCTwSjUM/35k
	 Cj7BBLSdC0GsLamTbeBGNpUzkyhyDtgZYurNl67xQLfDEqFyu8WdfWJSPbA+F3Yern
	 y+RH8K/Vmh+4jREoxU+KGOXB9dSZ4bRoxiJX6ELlTknsZJQ80qhrqpO3A5C+xxa3p+
	 jgf4UQd5Hp294pV4N5rQ4ucVAxlSq3uJhLvS31gdsX6GEEYcy1qRNicVM9mI4U5Nue
	 x5fJniyxPFjeUSdcsNlbWF0voh8rmkJlht8t6zIK/D0L/SwxgWXQCxMc+LhITI2HDZ
	 HULs3oP3jmklQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0D5681773;
	Fri, 17 Apr 2026 15:22:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D9F5396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DD5D40DF6
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQLlI3j3eE5K for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D46C840DF0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D46C840DF0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 783C681DDA; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:21:08 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d29bfbd6a3e8b6101207971bbc127a796470647e
X-Git-Newrev: e714e38a87092d5cf288d7d6855411910a1a1ba8
X-Patchwork-Hint: ignore
Message-Id: <20260417152246.783C681DDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libglib2:
 security bump to version 2.86.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e714e38a87092d5cf288d7d6855411910a1a1ba8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fix several security vulnerabilities of varying severity.

Release Notes:
https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.3
https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.4
https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.5

Fixes:
- CVE-2025-13601
- CVE-2026-1484
- CVE-2026-1485
- CVE-2026-1489

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[Julien:
 - fix URL in hash file comment
 - add "security" in commit log title
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b9ea86b26a84b193a782007d559c899761364b21)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 6698db8389..09cd8e9979 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.86/glib-2.86.2.sha256sum
-sha256  8a724e970855357ea8101e27727202392a0ffd5410a98336aed54ec59113e611  glib-2.86.2.tar.xz
+# https://download.gnome.org/sources/glib/2.86/glib-2.86.5.sha256sum
+sha256  ce85a947bb8b3c0204dbeff79aec39bcb46371c6fafb64ba5b8726c71e038d5f  glib-2.86.5.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 1c5109f4ec..cae8a85a28 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.86
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).5
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
