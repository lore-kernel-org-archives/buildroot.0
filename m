Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DE7CCF9FF
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E68284023;
	Thu, 30 Oct 2025 08:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aC5zDM4ynUeo; Thu, 30 Oct 2025 08:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 186F683FB7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 186F683FB7;
	Thu, 30 Oct 2025 08:11:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D3312A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB76A41152
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6xdf_BPShWYR for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 068994115A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 068994115A
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 049D8842C6; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 08:56:14 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d7515eefc82bd862ea8e8168f5ba92094c08daee
X-Git-Newrev: baa6aaddf9123e3b1282f636faf8283f5ceedc99
X-Patchwork-Hint: ignore
Message-Id: <20251030081040.049D8842C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xerces: security
 bump to v3.2.5
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=baa6aaddf9123e3b1282f636faf8283f5ceedc99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

See the release notes:
https://issues.apache.org/jira/secure/ReleaseNote.jspa?version=12352411&projectId=10510

Also update the download site to https

This fixes the following vulnerability:
- CVE-2024-23807:
    The Apache Xerces C++ XML parser on versions 3.0.0 before 3.2.5
    contains a use-after-free error triggered during the scanning of
    external DTDs.  Users are recommended to upgrade to version 3.2.5
    which fixes the issue, or mitigate the issue by disabling DTD
    processing. This can be accomplished via the DOM using a standard
    parser feature, or via SAX using the XERCES_DISABLE_DTD environment
    variable.  This issue has been disclosed before as CVE-2018-1311, but
    unfortunately that advisory incorrectly stated the issue would be
    fixed in version 3.2.3 or 3.2.4.
    https://www.cve.org/CVERecord?id=CVE-2024-23807

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 246f2eca20b26f0c35ffc7eee72edf690815608d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/xerces/xerces.hash | 4 ++--
 package/xerces/xerces.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/xerces/xerces.hash b/package/xerces/xerces.hash
index e6b5b922d2..52c22ee826 100644
--- a/package/xerces/xerces.hash
+++ b/package/xerces/xerces.hash
@@ -1,5 +1,5 @@
-# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.4.tar.xz.sha256
-sha256  075bc57940da0f9be6dd183c550c8ce0b9833e4550dc382048377a1a5e3b2bd9  xerces-c-3.2.4.tar.xz
+# From https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-3.2.5.tar.gz.sha256
+sha256  545cfcce6c4e755207bd1f27e319241e50e37c0c27250f11cda116018f1ef0f5  xerces-c-3.2.5.tar.gz
 
 # Hash for license file
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 08efa6fb5c..7734cff0d2 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XERCES_VERSION = 3.2.4
-XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.xz
-XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
+XERCES_VERSION = 3.2.5
+XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.gz
+XERCES_SITE = https://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
 XERCES_LICENSE_FILES = LICENSE
 XERCES_CPE_ID_VENDOR = apache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
