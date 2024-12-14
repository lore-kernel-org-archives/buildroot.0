Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002C1C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD3774F507;
	Fri, 28 Feb 2025 16:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPjpg8d2EM-G; Fri, 28 Feb 2025 16:39:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EAEA4F4FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EAEA4F4FA;
	Fri, 28 Feb 2025 16:39:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17A7568
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 983864252A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AB1ZItpH3rtu for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5A3341867
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5A3341867
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABB33820F8; Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 14:52:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 166387d2f521c7833611e7c4108b430ce3989bae
X-Git-Newrev: 9975d28aa3ffbda2b727979b2e322fc8986d6d1b
X-Patchwork-Hint: ignore
Message-Id: <20250228162939.ABB33820F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/subversion: security
 bump to version 1.14.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=9975d28aa3ffbda2b727979b2e322fc8986d6d1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following security vulnerabilities:

CVE-2024-46901: mod_dav_svn denial-of-service via control characters in
paths

It has been discovered that the patch for CVE-2013-1968 was incomplete
and unintentionally left mod_dav_svn vulnerable to control characters
in filenames.

https://subversion.apache.org/security/CVE-2024-46901-advisory.txt

Subversion 1.14.4 also fixed a Windows-only vulnerability:
https://subversion.apache.org/security/CVE-2024-45720-advisory.txt

For change log, see:
https://svn.apache.org/repos/asf/subversion/tags/1.14.5/CHANGES

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/subversion/subversion.hash | 4 ++--
 package/subversion/subversion.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index 2710e9e3f3..5950e9dccf 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,5 +1,5 @@
-# From https://www.apache.org/dist/subversion/subversion-1.14.3.tar.bz2.sha512
-sha512  40b172492005fd3b0cd9e457b4444af8ea5d8ff8fc161a9a0c6dc3a7314c6ad4ff75a4676f68a1919ae6273ae03e34d04eba8c1c37b8c0b4ec70d6731b527b41  subversion-1.14.3.tar.bz2
+# From https://www.apache.org/dist/subversion/subversion-1.14.5.tar.bz2.sha512
+sha512  e4800564d0cc68be98f19aa58d89181de83f237f0ccff10824d9237f8c65eb0071f7176ac54e9e8f8ecbf685849bd3e94be48f678f4c23ed6a5fd7fb6edd0321  subversion-1.14.5.tar.bz2
 
 # Locally calculated
 sha256  484aff0cfbb81155a10f903ed756e27e9fc65578c245a295bae295c4bb51eaad  LICENSE
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index bc0b9b45ab..b3daf013f0 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.14.3
+SUBVERSION_VERSION = 1.14.5
 SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = https://downloads.apache.org/subversion
 SUBVERSION_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
