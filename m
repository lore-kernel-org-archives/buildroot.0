Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43963D68BFF
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 18:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7DAC60A5A;
	Sun, 24 Nov 2024 18:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXUXlReAQ5uI; Sun, 24 Nov 2024 18:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00DDE60A69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00DDE60A69;
	Sun, 24 Nov 2024 18:43:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6B974961
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 18:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B289542C98
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 18:43:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9QV0i2AfjXw for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 18:43:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9CDF42C94
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9CDF42C94
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 18:43:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5D05865B3; Sun, 24 Nov 2024 18:43:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Nov 2024 19:41:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d49bc51e032b0d512741618dbec6596eac9d452
X-Git-Newrev: ed590a22e24bdc714d75005f7fe7a3ad3b001c4d
X-Patchwork-Hint: ignore
Message-Id: <20241124184316.A5D05865B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/doxygen: fix _SITE download URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed590a22e24bdc714d75005f7fe7a3ad3b001c4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Doxygen source archive download fails with a HTTP 404 Not Found
error.

The doxygen download page [1] mention that older versions can be
downloaded on SourceForge at [2].

This commit fixes the issue by changing _SITE to this new URL.

Fixes:
https://autobuild.buildroot.org/results/253450bf374ce858fe12712059c435fc773d52f8

[1] https://www.doxygen.nl/download.html
[2] https://sourceforge.net/projects/doxygen/files/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/doxygen/doxygen.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index b24c527a20..b3bcb34097 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -6,7 +6,7 @@
 
 DOXYGEN_VERSION = 1.8.18
 DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
-DOXYGEN_SITE = http://doxygen.nl/files
+DOXYGEN_SITE = https://sourceforge.net/projects/doxygen/files/rel-$(DOXYGEN_VERSION)
 DOXYGEN_LICENSE = GPL-2.0
 DOXYGEN_LICENSE_FILES = LICENSE
 DOXYGEN_CPE_ID_VENDOR = doxygen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
