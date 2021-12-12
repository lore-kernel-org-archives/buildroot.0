Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547CBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C86261CED;
	Sun, 12 Dec 2021 14:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGs8CGnZ9NiX; Sun, 12 Dec 2021 14:35:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BBC461CE4;
	Sun, 12 Dec 2021 14:35:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9051BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5111960E80
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K_MGxzKVHypC for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:35:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A20C760E8B
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:35:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BAB6D82AE4; Sun, 12 Dec 2021 14:29:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:26:37 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 531fbbd64593f4fcf67199c6cfa6214b61974de9
X-Git-Newrev: bad5728c98712babe3020404bb74aeec6feacc65
X-Patchwork-Hint: ignore
Message-Id: <20211212142951.BAB6D82AE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libnss: security
 bump to version 3.68.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=bad5728c98712babe3020404bb74aeec6feacc65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fixes the following security issue:

- CVE-2021-43527: Heap overflow in NSS when verifying DSA/RSA-PSS
  DER-encoded signatures

For more details, see the advisory:
https://www.mozilla.org/en-US/security/advisories/mfsa2021-51/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index b8c58e3425..5417d8dc28 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_68_RTM/src/SHA256SUMS
-sha256  c402b32cac83034ec1c3d826ef4306cd14a066d7d9a6f4c30d82b3bc043c725b  nss-3.68.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_68_1_RTM/src/SHA256SUMS
+sha256  d0b38f7c3f146211aacc5d55fb6383abcc11a4d7ca6a36be7cbceaaed2a9ea3b  nss-3.68.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 0db543e34b..1a6f8bc412 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.68
+LIBNSS_VERSION = 3.68.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
