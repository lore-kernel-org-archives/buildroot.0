Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F34C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 492BB40A9E;
	Mon,  6 Jun 2022 12:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bRMRfoTzro2f; Mon,  6 Jun 2022 12:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CA8F40122;
	Mon,  6 Jun 2022 12:31:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 533FD1BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4ECB183F16
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yc8e2qG2uBtz for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:30:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7352584014
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:30:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4FD5D86D11; Mon,  6 Jun 2022 12:18:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 14:28:36 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: b7b006373005d406d5aca2401bb4a2ed04c73aaa
X-Git-Newrev: 7f17a93ead47229fcd42407d812c6f2ca6368655
X-Patchwork-Hint: ignore
Message-Id: <20220606121859.4FD5D86D11@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rsyslog: security
 bump to version 8.2204.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f17a93ead47229fcd42407d812c6f2ca6368655
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix CVE-2022-24903: Modules for TCP syslog reception have a heap buffer
overflow when octet-counted framing is used. The attacker can corrupt
heap values, leading to data integrity issues and availability impact.
Remote code execution is unlikely to happen but not impossible.

https://github.com/rsyslog/rsyslog/security/advisories/GHSA-ggw7-xr6h-mmr8#advisory-comment-72243
https://github.com/rsyslog/rsyslog/blob/v8.2204.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bc469ee6329555284b2fe9162597917122fbbe3a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.hash | 2 +-
 package/rsyslog/rsyslog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rsyslog/rsyslog.hash b/package/rsyslog/rsyslog.hash
index f404098439..4049590bb8 100644
--- a/package/rsyslog/rsyslog.hash
+++ b/package/rsyslog/rsyslog.hash
@@ -1,5 +1,5 @@
 # From http://www.rsyslog.com/downloads/download-v8-stable/
-sha256  19b232f765c4ba7a35b91ef1f5f9af775f6ff78ef56bb7737a2ce79ccbb32b98  rsyslog-8.2010.0.tar.gz
+sha256  a6d731e46ad3d64f6ad4b19bbf1bf56ca4760a44a24bb96823189dc2e71f7028  rsyslog-8.2204.1.tar.gz
 
 # Locally calculated
 sha256  054b3a047d9232376a46b87356b19b0c0c2924cb5e6911ab96a01fc4b515f083  COPYING
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index afd1a5557e..ec0d405dc7 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYSLOG_VERSION = 8.2010.0
+RSYSLOG_VERSION = 8.2204.1
 RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog
 RSYSLOG_LICENSE = GPL-3.0, LGPL-3.0, Apache-2.0
 RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
