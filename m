Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF396D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8A70414F1;
	Thu, 27 Nov 2025 20:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlYkyWgzJQkA; Thu, 27 Nov 2025 20:36:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E06E1414F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E06E1414F4;
	Thu, 27 Nov 2025 20:36:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16CA22A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B444161ADD
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5k8k2sOOO91 for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:36:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED3EB61792
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED3EB61792
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC27A82386; Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:30:46 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 6a878b59905bdd7220e0a2adbe4dc2c3d2dcac25
X-Git-Newrev: 30c8bd4a51471b2bdbf4f2c4a75f730e8db2cab2
X-Patchwork-Hint: ignore
Message-Id: <20251127203602.EC27A82386@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/luksmeta:
 security bump to version 10
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

commit: https://git.buildroot.net/buildroot/commit/?id=30c8bd4a51471b2bdbf4f2c4a75f730e8db2cab2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes the following security issue:

CVE-2025-11568: A  data corruption vulnerability has been identified in the
luksmeta utility when used with the LUKS1 disk encryption format.

https://github.com/advisories/GHSA-pvmm-7c2r-wmp4
https://github.com/latchset/luksmeta/releases/tag/v10

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 80764d7208efe860bb35f146ea4962f15e21936f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/luksmeta/luksmeta.hash | 2 +-
 package/luksmeta/luksmeta.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luksmeta/luksmeta.hash b/package/luksmeta/luksmeta.hash
index b367f29a5c..5936fb56f3 100644
--- a/package/luksmeta/luksmeta.hash
+++ b/package/luksmeta/luksmeta.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2ca0c35b551b331ba1444fc9d36e8c48ff8cae53dd4e6155b028e8904edc202a  luksmeta-9.tar.bz2
+sha256  a842538ba39680c8319c41dac0bcc082fe40fb43342561761925c0daa1a48f28  luksmeta-10.tar.bz2
 sha256  4b72eb6b5a336cd3ec837cc2d6347c23bf7574168db6b4802267700b93021abf  COPYING
diff --git a/package/luksmeta/luksmeta.mk b/package/luksmeta/luksmeta.mk
index 129713aec8..bfbda9fb36 100644
--- a/package/luksmeta/luksmeta.mk
+++ b/package/luksmeta/luksmeta.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUKSMETA_VERSION = 9
+LUKSMETA_VERSION = 10
 LUKSMETA_SOURCE = luksmeta-$(LUKSMETA_VERSION).tar.bz2
 LUKSMETA_SITE = https://github.com/latchset/luksmeta/releases/download/v$(LUKSMETA_VERSION)
 LUKSMETA_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
