Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DBA10F2862
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 18:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37A9740204;
	Fri, 27 Mar 2026 18:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTOqnhDxcUsK; Fri, 27 Mar 2026 18:49:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 475004020A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774637397;
	bh=NIPPi+NAMOn/b6o9IzTB0PZ/q3dlLT+pYclKFPGDLFo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dh/XpjJmx3KREopAx7Z92cI2Y9c8Q6xNIO5F7v6bi6XbXlrLVVdIZ4DbQXiJBblFW
	 cnoodm+ERcurPRVhVM6EEqTCrjjvnEiSaoXRtH8wAOq6XBoyxRJS7wrpUGVVa33A7O
	 wPzUTc9MQlZ640thb8uhti6nfsbf0rHjtyxTx2yQE2vgHDS/r9p0QM09WzEdX0Qbz5
	 R0W6KUbGP5VS7D8/3ccqbTwdbGS9RjDkrP7VPwTArh8FmBAnT8yi5X7yo8mriZ7G/C
	 4R3VbaWiE7GdrbBjuBmpGyvvK91am4LO+ZRHjjgLy7ccbvw4JZdwzVionf5ECwjNTa
	 t+5vRpePYLzUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 475004020A;
	Fri, 27 Mar 2026 18:49:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D78E10F
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECB24401F0
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEoGHUFqj1SM for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 18:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DEC74007D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DEC74007D
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:49:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 821457FB6C; Fri, 27 Mar 2026 18:49:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 19:47:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9a4d0a7a568412193f5232904b51836759e0b3e
X-Git-Newrev: ef01d4fc78ffcca51380ba1d46ffe63d6d63d479
X-Patchwork-Hint: ignore
Message-Id: <20260327184954.821457FB6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
 localedef}: security bump to version 2.43-17-gdd9945c0b
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef01d4fc78ffcca51380ba1d46ffe63d6d63d479
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes CVE-2026-4437:
https://sourceware.org/git/?p=glibc.git;a=commit;h=5c6fca0c62ce5bd6e68e259f138097756cbafd4d

Fixes CVE-2026-4438:
https://sourceware.org/git/?p=glibc.git;a=commit;h=dd9945c0ba40d2dbc9eb7c99291ba6b69bd66718

For a full list of changes, see:
https://sourceware.org/git/?p=glibc.git;a=shortlog;h=dd9945c0ba40d2dbc9eb7c99291ba6b69bd66718

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add CVE-2026-443{7,8} to GLIBC_IGNORE_CVES]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 8 +++++++-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index ed6d69acc2..d7731eb280 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  5e21722755f466d15770574788394a4abb4fb1e02603a707beeb199706a26a46  glibc-2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160-git4.tar.gz
+sha256  742023f6c13500a56ae834f51c4453998b2dcd1ccb576fec457d49cdec3f22b3  glibc-2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 64a2c58377..1d9cd34cef 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160
+GLIBC_VERSION = 2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -31,6 +31,12 @@ GLIBC_IGNORE_CVES += CVE-2026-0915
 # Fixed by glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
 GLIBC_IGNORE_CVES += CVE-2025-15281
 
+# Fixed by glibc-2.43-16-g5c6fca0c62ce5bd6e68e259f138097756cbafd4d
+GLIBC_IGNORE_CVES += CVE-2026-4437
+
+# Fixed by glibc-2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
+GLIBC_IGNORE_CVES += CVE-2026-4438
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index aa746a9d70..28494364f4 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160
+LOCALEDEF_VERSION = 2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
