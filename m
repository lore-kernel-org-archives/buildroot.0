Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89352C369CA
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40ECA60F2F;
	Wed, 16 Apr 2025 21:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGKCkwgOgz3Z; Wed, 16 Apr 2025 21:45:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B59A560F4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B59A560F4E;
	Wed, 16 Apr 2025 21:45:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 505E520E6
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7AB760E78
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZNurMaFIuxG for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:45:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B6FC60E50
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B6FC60E50
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:45:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39FB685538; Wed, 16 Apr 2025 21:45:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 10:52:11 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c531ecf79515cd54ad5c2a38240872ad412728f3
X-Git-Newrev: ee80a723e4774388224d7944764302fb0c4e493c
X-Patchwork-Hint: ignore
Message-Id: <20250416214539.39FB685538@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libndp: security
 bump to version 1.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee80a723e4774388224d7944764302fb0c4e493c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes: CVE-2024-5564 [1][2]

[1] https://www.cve.org/CVERecord?id=CVE-2024-5564
[2] https://github.com/jpirko/libndp/commit/05e4ba7b0d126eea4c04387dcf40596059ee24af

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 49c73215d327b7bb2fdfd3ecb72d196050b0f9f6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libndp/libndp.hash | 2 +-
 package/libndp/libndp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libndp/libndp.hash b/package/libndp/libndp.hash
index 389e0ba5fc..ee2b758919 100644
--- a/package/libndp/libndp.hash
+++ b/package/libndp/libndp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c3ea76e253def89869651686a827da75b56896fe94fabd87d8c14b1d4588fd05  libndp-1.8.tar.gz
+sha256  e564f5914a6b1b799c3afa64c258824a801c1b79a29e2fe6525b682249c65261  libndp-1.9.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
index db1de7b81c..30281627af 100644
--- a/package/libndp/libndp.mk
+++ b/package/libndp/libndp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNDP_VERSION = 1.8
+LIBNDP_VERSION = 1.9
 LIBNDP_SITE = $(call github,jpirko,libndp,v$(LIBNDP_VERSION))
 LIBNDP_LICENSE = LGPL-2.1+
 LIBNDP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
