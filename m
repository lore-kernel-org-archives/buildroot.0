Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DF6D116F5
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 21:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A9D5613C6;
	Tue,  2 Dec 2025 21:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F8pjtXoUlZTf; Tue,  2 Dec 2025 21:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D85C612E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764710169;
	bh=3v7Uqrg+ewiMGBQ8fI6/GE0ilOMkZJRZRRXUpwo8BK4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cd/2LKz6wlIGfLmBRA3qfGqtlsbMzDlDpeesYVBJIH3s583BH5tOuvMBLsCMm2BS9
	 Lqto/Tm8/O8e8FvlzbjVe2UvrKQzjjOWHe/d8Ndm3SBoAgZM6Vf5oP80ecYS9p03XX
	 0yTDw9UiVx3n/Vwd/30hGERdiOtzEdwQW5oArCzc+kVXlPnBoTNYLTkhHjkV5xsc5G
	 tB4JS9gLoQLDKvWtoWICdffFqL/mtt3V1a6ZLEiIZ9aBPw6ubVYmwtGdXrFLxRmVgv
	 t3DOubOdguYmhQPGqfJBUpq1/a1N4SY40zzZrYv4XfjuXhrz7TrtH8DA0J8s3Xr0hj
	 MAZnTy6nMoFZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D85C612E9;
	Tue,  2 Dec 2025 21:16:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92AAFE4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 789CB4045B
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bJfPgKznY8l for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 21:16:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D2714002C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D2714002C
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:16:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85835863E9; Tue,  2 Dec 2025 21:16:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Dec 2025 21:57:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2b9f195ffb5a61270125901107878767ff723b34
X-Git-Newrev: 6846a992fe8a87bdcf699405f410e32bb0fbef6f
X-Patchwork-Hint: ignore
Message-Id: <20251202211603.85835863E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/speechd: bump version
 to 0.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6846a992fe8a87bdcf699405f410e32bb0fbef6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://github.com/brailcom/speechd/blob/0.12.1/NEWS

Added configure option to disable newly added pipewire support.

Fixes:
https://autobuild.buildroot.net/results/271/271e44f5ce9be0a2e16dfa2d9ee65701422a49c5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/speechd/speechd.hash | 2 +-
 package/speechd/speechd.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/speechd/speechd.hash b/package/speechd/speechd.hash
index 0b02a35792..a16134deb6 100644
--- a/package/speechd/speechd.hash
+++ b/package/speechd/speechd.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  cc4b388fce40681eaff3545e9cc0642216c13c420d5676a4d28c957ddcb916de  speechd-0.11.5.tar.gz
+sha256  32a730f6fb5981b9bec7e04f3674fd7d29e54935f46cf6354dbb9ab1f9b23b2d  speechd-0.12.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPL-3
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index 669bec0634..5bb40bb570 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPEECHD_VERSION = 0.11.5
+SPEECHD_VERSION = 0.12.1
 SPEECHD_SITE = $(call github,brailcom,speechd,$(SPEECHD_VERSION))
 SPEECHD_LICENSE = GPL-2.0+, GPL-3.0+ (buildsystem), LGPL-2.1+
 SPEECHD_LICENSE_FILES = COPYING.GPL-2 COPYING.GPL-3 COPYING.LGPL
@@ -27,6 +27,7 @@ SPEECHD_CONF_OPTS = \
 	--without-voxin \
 	--without-ivona \
 	--without-pico \
+	--without-pipewire \
 	--without-baratinoo \
 	--without-kali \
 	--without-pulse \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
