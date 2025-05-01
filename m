Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F48CC3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D076780A75;
	Fri,  2 May 2025 11:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 81ORM9bJDfQB; Fri,  2 May 2025 11:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAB5C83DF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAB5C83DF7;
	Fri,  2 May 2025 11:11:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 066DF22A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E985F611FE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBV6za5GWq2X for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CDB260B9F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CDB260B9F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BE69864AD; Fri,  2 May 2025 11:11:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 May 2025 18:57:25 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7ae0284847395f70d34ac45e5f55902bebd16bd5
X-Git-Newrev: 071432a29e95896918b11fd548f94507a600cecb
X-Patchwork-Hint: ignore
Message-Id: <20250502111135.2BE69864AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sysklogd: bump to
 v2.7.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=071432a29e95896918b11fd548f94507a600cecb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

From https://github.com/troglobit/sysklogd/releases/tag/v2.7.2

 - logger: improved error handling for invalid arguments to -p and -o
 - Fix regression in v2.7.1,  allow '.' in tag names, eg. in.tftpd
 - Fix various typos in the documentation

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 81b049f829181b0bfef08db6f5c17e2482b4e5be)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sysklogd/sysklogd.hash | 4 ++--
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 645bc6a0ae..c74d7f9ba6 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,4 +1,4 @@
-# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.1
-sha256  69944b2227647bf47ee01c9f482d19a79dbf2b53b8ce8ded0486b08db8c68c40  sysklogd-2.7.1.tar.gz
+# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.2
+sha256  bc410ca64551a11fac6518b418fb6b8afbd888a70af2c5eb353334a706727bca  sysklogd-2.7.2.tar.gz
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index a3e27fd17b..baafc38083 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.7.1
+SYSKLOGD_VERSION = 2.7.2
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
