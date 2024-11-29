Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD817D72A14
	for <buildroot@archiver.kernel.org>; Fri, 29 Nov 2024 21:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7792A812AB;
	Fri, 29 Nov 2024 21:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5G05mLll2AG; Fri, 29 Nov 2024 21:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B174820B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B174820B2;
	Fri, 29 Nov 2024 21:16:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52F0571F
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 21:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38679813A1
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 21:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mp8p64nfLKln for <buildroot@buildroot.org>;
 Fri, 29 Nov 2024 21:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11AEA8595C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11AEA8595C
 for <buildroot@buildroot.org>; Fri, 29 Nov 2024 21:11:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54AA186727; Fri, 29 Nov 2024 21:11:25 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Nov 2024 21:59:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d33a2cd51a3f1860d3ef953cdbd9e01eec519b48
X-Git-Newrev: b0030fc93998275fd5533ea1fdca7a7665bbea86
X-Patchwork-Hint: ignore
Message-Id: <20241129211125.54AA186727@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/chrony: bump to
 version 4.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0030fc93998275fd5533ea1fdca7a7665bbea86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://chrony-project.org/news.html

This commit also updates the project's homepage and download URL.

The previous homepage URL http://chrony.tuxfamily.org/ now automatically
redirects to https://chrony-project.org/.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/chrony/Config.in   | 2 +-
 package/chrony/chrony.hash | 4 ++--
 package/chrony/chrony.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/chrony/Config.in b/package/chrony/Config.in
index c22b756c11..453e4f6c3f 100644
--- a/package/chrony/Config.in
+++ b/package/chrony/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_CHRONY
 	  Chrony is a pair of programs which are used to maintain the
 	  accuracy of the system clock.
 
-	  http://chrony.tuxfamily.org/
+	  https://chrony-project.org/
 
 if BR2_PACKAGE_CHRONY
 
diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 2cf6cca031..25535e723e 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://download.tuxfamily.org/chrony/chrony-4.4-tar-gz-asc.txt
-sha256  eafb07e6daf92b142200f478856dfed6efc9ea2d146eeded5edcb09b93127088  chrony-4.4.tar.gz
+# https://chrony-project.org/releases/chrony-4.6.1-tar-gz-asc.txt
+sha256  571ff73fbf0ae3097f0604eca2e00b1d8bb2e91affe1a3494785ff21d6199c5c  chrony-4.6.1.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index bcf69a59db..642e1d8fd6 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.4
-CHRONY_SITE = http://download.tuxfamily.org/chrony
+CHRONY_VERSION = 4.6.1
+CHRONY_SITE = https://chrony-project.org/releases
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
 CHRONY_CPE_ID_VENDOR = tuxfamily
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
