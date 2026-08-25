Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A534C5DF94
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 08:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A3FA403A1;
	Tue, 25 Aug 2026 08:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uYBEiXeHr9o7; Tue, 25 Aug 2026 08:27:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787646455;
	bh=b+5CSa9E7JMsU7u6jhe3Xsi0VAZpcrqRc0gJy0I9dZk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eDzD4gPyYnlmE5wFZ0UDQOqRNHrb+2t0oH6sN4gh5BkmMR6TpE49idMC1yntyqBJM
	 Kfl2ckdcheBQpWtMPHihwemhQd+/XadGvB8VVR8mDaBGxwQjJ5B7KUFUH4z9TWOt9R
	 Fk2jDXIs8Y0fN7tSEPV503/NVcmSu6AgAAGJyKG4N2kZcJdJHWdai5qKKV3EXxXbU9
	 jhC4jDHb8SQo4/W+78VLIFbMjRAaO9EEHjeyk87PR7HEYxujb3cd/rDT6GUQTYD4Uy
	 M6LPHNm0blc3wHEgKvmIsucMLYvoAQOcO8hQf15T6AIt59+/vWcfYTDyl7yIEVill5
	 72ZMLgHLFiEpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40732404A2;
	Tue, 25 Aug 2026 08:27:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D172E118
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD0BF6060B
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RvsaA38CvKko for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 08:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F328E605AF
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:27:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92A06911D4; Tue, 25 Aug 2026 08:26:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 10:26:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4efa90c5f3a8498747ea73578e86924f05225ad
X-Git-Newrev: 58f31377389dd2f5090e4dd69deb4d5f994f88c0
X-Patchwork-Hint: ignore
Message-Id: <20260825082638.92A06911D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
 localedef}: security bump version to 2.44-27-gae9225d55
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/58f31377389dd2f5090e4dd69deb4d5f994f88c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes CVE-2026-19542:
https://gitlab.com/gnutools/glibc/-/commit/d6ff274313d79feb864cc10eb775b91c817a67e9
https://sourceware.org/bugzilla/show_bug.cgi?id=34506

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index c6eadd5334..bfeb5ab6bd 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  a818ca8450ef1e19a2413b2c9a2882f381f05be07b31e9b38085b6ba193d0af2  glibc-2.44-23-g11ac3d78fc5e4f7f2846002e099f773ad8ff82fc-git4.tar.gz
+sha256  028aa13d6c0737aecf0ec6ac0fa842e3a18c82bcdaeeb800d42a65a76dcbfe91  glibc-2.44-27-gae9225d55963c4420c49ccfa3f2fafc416f92032-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 726cfaa6c5..e0332dadc4 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-23-g11ac3d78fc5e4f7f2846002e099f773ad8ff82fc
+GLIBC_VERSION = 2.44-27-gae9225d55963c4420c49ccfa3f2fafc416f92032
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 7a3dbef9a2..c88f3f1fa6 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-23-g11ac3d78fc5e4f7f2846002e099f773ad8ff82fc
+LOCALEDEF_VERSION = 2.44-27-gae9225d55963c4420c49ccfa3f2fafc416f92032
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
