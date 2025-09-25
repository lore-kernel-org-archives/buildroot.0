Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C5ACAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F8CC416D1;
	Thu, 25 Sep 2025 20:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 16LiezbwwVty; Thu, 25 Sep 2025 20:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB238416B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB238416B6;
	Thu, 25 Sep 2025 20:03:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63CFE1EB
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FC266152D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPiRi3ha0HUS for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4383B61518
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4383B61518
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41BE286441; Thu, 25 Sep 2025 20:02:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 21:57:52 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: c2145615737f1071a86dad1f47597469754440d1
X-Git-Newrev: 4da319907d8f73abf925d50287e7be721d8a87e6
X-Patchwork-Hint: ignore
Message-Id: <20250925200242.41BE286441@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/iputils: fix
 deprecated CPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=4da319907d8f73abf925d50287e7be721d8a87e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The CPE 'iputils_project:iputils' has been deprecated in favour of
'iputils:iputils'.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4ac3c1de5643f6b2f3d6f118313517d50d746ff3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/iputils/iputils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 842fdb8478..8e00513229 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -8,7 +8,7 @@ IPUTILS_VERSION = 20250605
 IPUTILS_SITE = https://github.com/iputils/iputils/releases/download/$(IPUTILS_VERSION)
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
-IPUTILS_CPE_ID_VALID = YES
+IPUTILS_CPE_ID_VENDOR = iputils
 IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # Selectively build binaries
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
