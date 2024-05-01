Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB021C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D17641777;
	Wed,  1 May 2024 20:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNgDS-mletGn; Wed,  1 May 2024 20:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B77441715
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B77441715;
	Wed,  1 May 2024 20:18:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 712791BF983
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DC2081DF9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id et53C36A73Cy for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89B5481BFA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89B5481BFA
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:18:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80BD67FE0C; Wed,  1 May 2024 20:18:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 22:15:29 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 907bbae1e4b146c47c4e48fbd43ecd12a55c7b1a
X-Git-Newrev: 2acbf5f16776e372c37b857ada883348640ee5f6
X-Patchwork-Hint: ignore
Message-Id: <20240501201812.80BD67FE0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libassuan: bump
 to version 2.5.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=2acbf5f16776e372c37b857ada883348640ee5f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 439525ced972299c8fa60d5e68e710075b9dce79)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libassuan/libassuan.hash | 4 ++--
 package/libassuan/libassuan.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index 084a09848c..6bb5022d13 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  b1e8754dbf89b3a3eb175f5df75048dbca1fce57  libassuan-2.5.6.tar.bz2
-sha256  e9fd27218d5394904e4e39788f9b1742711c3e6b41689a31aa3380bd5aa4f426  libassuan-2.5.6.tar.bz2
+sha1  b6ccd955085dac902a09871f94a3d41a7667d0c8  libassuan-2.5.7.tar.bz2
+sha256  0103081ffc27838a2e50479153ca105e873d3d65d8a9593282e9c94c7e6afb76  libassuan-2.5.7.tar.bz2
 # Locally calculated
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index fb95a6fd67..9553c630a2 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.5.6
+LIBASSUAN_VERSION = 2.5.7
 LIBASSUAN_SITE = https://gnupg.org/ftp/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPL-2.1+ (library), GPL-3.0 (tests, doc)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
