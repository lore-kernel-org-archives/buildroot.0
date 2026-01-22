Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE387D6CFA1
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8394F82207;
	Thu, 22 Jan 2026 19:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgxYUqhf95uN; Thu, 22 Jan 2026 19:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D4BD82209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769108814;
	bh=DGc5/Ev2AQQLe3ZWbqQBi9IdgkiPIrtfL4GK6Z7ayaE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PtIbNRA86box1uQRpvY+TjhJ9HtGtBXQSI22F/akRYp13MB2NS5vzB7BfcL36aV5J
	 iVGZBAtG1v7H+FD3CvccrCN0difFMfXoduS17p44psbr3Rk+TQM75c2SR5HP8c/ool
	 IZhNl3egXqipS561rYclNwozVLy8tdoFdwD4/h9bck2Fex2SxtCnOBsn5MmQGsrFuA
	 2MMWR6lPMEmsfQ0A8sDXqHK8edO0q6RLSqGhWwK3zYFUrW8jgQVBeTyH5BvdyF+Z8e
	 IludoTA5kn/+UK+EcNU/oTiHmGEvYcbbqwRhjOFO2+SM4YWzhlKpmZxXkAdps6DeHA
	 gojx5yn/PqKAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D4BD82209;
	Thu, 22 Jan 2026 19:06:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B64504DF
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98D05408EE
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_oR_JhLtHyd for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:06:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85BAC408EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85BAC408EB
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:06:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CB4B8750F; Thu, 22 Jan 2026 19:06:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:04:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0a6abc8b193e5bdab5326324d7299c19d5d8c67
X-Git-Newrev: 18de297a5ad3d1fc1b44f54ae69289ca10200ad5
X-Patchwork-Hint: ignore
Message-Id: <20260122190651.7CB4B8750F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
 localedef}: security bump to version 2.42-51-gcbf39c26b
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

commit: https://git.buildroot.net/buildroot/commit/?id=18de297a5ad3d1fc1b44f54ae69289ca10200ad5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes following CVE's:

- CVE-2025-15281
  wordexp with WRDE_REUSE and WRDE_APPEND may return uninitialized memory
  https://www.cve.org/CVERecord?id=CVE-2025-15281
  https://sourceware.org/cgit/glibc/tree/advisories/GLIBC-SA-2026-0003
  fixed by upstream commit:
  https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=cbf39c26b25801e9bc88499b4fd361ac172d4125

- CVE-2026-0861
  Integer overflow in memalign leads to heap corruption
  https://www.cve.org/CVERecord?id=CVE-2026-0861
  https://sourceware.org/cgit/glibc/tree/advisories/GLIBC-SA-2026-0001
  fixed by upstream commit:
  https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=b0ec8fb689df862171f0f78994a3bdeb51313545

- CVE-2026-0915
  getnetbyaddr and getnetbyaddr_r leak stack contents to DNS resovler
  https://www.cve.org/CVERecord?id=CVE-2026-0915
  https://sourceware.org/cgit/glibc/tree/advisories/GLIBC-SA-2026-0002
  fixed by upstream commit:
  https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=453e6b8dbab935257eb0802b0c97bca6b67ba30e

For a full list of changes, see:
https://sourceware.org/git/?p=glibc.git;a=shortlog;h=cbf39c26b25801e9bc88499b4fd361ac172d4125

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Julien: add extra info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 538f8b69a7..a58bb7b9a7 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  a364a548ebda9c570f5bf62bf5e4ad3240a90056455b9edfbf1472a7254bd1c0  glibc-2.42-3-gbc13db73937730401d592b33092db6df806d193e.tar.gz
+sha256  f63ffa06cd17ee8ff891f6de41de6e189b96edc6b2be2807ae597291f4464388  glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 9c3ff7124e..e3453b8cc2 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.42-3-gbc13db73937730401d592b33092db6df806d193e
+GLIBC_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
 
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index c34fe22b5e..254a79026a 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.42-3-gbc13db73937730401d592b33092db6df806d193e
+LOCALEDEF_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
