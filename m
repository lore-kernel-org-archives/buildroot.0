Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE22C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E21885949;
	Fri, 28 Feb 2025 17:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbPDStMlxsfT; Fri, 28 Feb 2025 17:07:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DA838594B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DA838594B;
	Fri, 28 Feb 2025 17:07:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EC7768
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0D8942953
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQpxm7FMeiVk for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F23842954
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F23842954
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A2E2867B4; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 31 Jan 2025 22:17:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bec79ce8bbf0165463869dff5769eeddb6d7196a
X-Git-Newrev: 002a67c2443e8c4c3c18529ca14a7841b9a0ef71
X-Patchwork-Hint: ignore
Message-Id: <20250228163023.2A2E2867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libpng: bump version
 to 1.6.46
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

commit: https://git.buildroot.net/buildroot/commit/?id=002a67c2443e8c4c3c18529ca14a7841b9a0ef71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.45/ANNOUNCE
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.46/ANNOUNCE

Use sha1 hash from sourceforge.net and locally compute sha256 hash due to
missing release announcement:
https://sourceforge.net/p/png-mng/mailman/png-mng-announce/

Updated license hash due to copyright year bump:
https://github.com/pnggroup/libpng/commit/6f786ff0f6bf4b971a7159d2b4a95e8a0770892f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.hash | 7 ++++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 3fd4033f83..3fae82b5e7 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,4 +1,5 @@
-# From https://sourceforge.net/p/png-mng/mailman/message/58815959/
-sha256  60c4da1d5b7f0aa8d158da48e8f8afa9773c1c8baa5d21974df61f1886b8ce8e  libpng-1.6.44.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.46/
+sha1  11423f5ea270e7bb42dd2d519696adcd016d5df3  libpng-1.6.46.tar.xz
 # Locally computed:
-sha256  7317e078e2d3b5d7ba5a6159e650945153262b44b76f6700f8e9edb261c5143e  LICENSE
+sha256  f3aa8b7003998ab92a4e9906c18d19853e999f9d3bca9bd1668f54fa81707cb1  libpng-1.6.46.tar.xz
+sha256  16d9daaafbf63a31a5bdc91d4600972548fef5aaa1244202393288dbd079c49a  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index c0b3ad24d5..e73e0bb686 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.44
+LIBPNG_VERSION = 1.6.46
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
