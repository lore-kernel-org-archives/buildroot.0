Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CC0E9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09EC2611B2;
	Wed,  4 Feb 2026 17:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GcycBEWTJy-i; Wed,  4 Feb 2026 17:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2741611B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224873;
	bh=XyFTKS/+TbTYnDQy7Adw6mtU8ewJazzqhetKSoFOGgs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q/C7uDymlw+sNbJLTelwMkQnHFCg+y5jTUjQdhXy0LEE8wMNnniYs6B6HYIuNYV8H
	 Hfuc+ZrokJiozsWLkpvgyiS6Jtg4vJzW5+q8rxCmYJOAktyKOxwYOuvke5igndde4l
	 7v2npmQdP2oDUCEcWQvCBfk3/SJBQYTlxPrmFAXO3Jn2QyuGtY/Mvfh/w88SayEN+l
	 NyQ4w+JiPq/4iWFGMiMNRHVFCz3GuaYNswqwQeg6jjsXMzmekBuUU9usCMzc1vx5So
	 mZSF3Gt7zqn9YEMQmr1cw6UMz3AmzdfxkTrHQlmxcnoEbH9k5/c31ipjicoMz6wso1
	 5vkqH3uO9aZkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2741611B3;
	Wed,  4 Feb 2026 17:07:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3BD6F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7686483F3C
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GFV_lCrgaI7 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AB2183E83
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AB2183E83
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2016986977; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:42:02 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d62f37e4057812b23e8c75769abe5c03dc5b8051
X-Git-Newrev: b63ea0d41b6f04f23d69de5b4292affd8a991d4a
X-Patchwork-Hint: ignore
Message-Id: <20260204170638.2016986977@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cryptsetup: bump
 version to 2.8.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b63ea0d41b6f04f23d69de5b4292affd8a991d4a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.3/docs/v2.8.3-ReleaseNotes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4cfcf627c061d590ccfd0557862d2a7b3de51594)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index e85607cdb6..bbc9171e77 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.8/sha256sums.asc
-sha256  dd9ede9875976cb25f3d29bfabf343b1c60f6186646b67ef5e40e60ab4935ec1  cryptsetup-2.8.2.tar.xz
+sha256  4a8a23b8b9d1a3250452e40acead4421a03e45a38954ad0595634f4266aa800f  cryptsetup-2.8.3.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  docs/licenses/COPYING.Apache-2.0
 sha256  28a9529c7d0bb4dc51f4bf5c116a3d16ef247a052f7591466768ddf563fd1cf5  docs/licenses/COPYING.CC-BY-SA-4.0
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 8421543f41..e8f2f1673a 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.8
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).2
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
