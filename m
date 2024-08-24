Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76384C52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 08:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2469E80EA3;
	Sat, 24 Aug 2024 08:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQoeUCKkeQgB; Sat, 24 Aug 2024 08:30:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2817E80EAC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2817E80EAC;
	Sat, 24 Aug 2024 08:30:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 759281BF339
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 08:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 639DA4034A
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 08:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11J4ZGATOyKU for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 08:30:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4630340346
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4630340346
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4630340346
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 08:29:59 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 722CB352115B; Sat, 24 Aug 2024 10:29:56 +0200 (CEST)
Date: Sat, 24 Aug 2024 10:29:56 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsmaBGJNjd4x9ymM@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724488196; bh=1kRO7lGF7mXvI0wnO4Bp6iA1wQ7+mdBoJpg23f5XkrQ=;
 h=Date:From:To:Subject:From;
 b=YUSx93Awq5zuHnovb4MYbLMcbeGFZZ5CqVSU7vasAqejATQmKG1Iwa1pUYIk5XaLc
 GQqnQExfctDfCRoOFE1F20FRkx+kex7N3Vk99aA9jtjSxBUiGAUR12TcNT+cEKcG6J
 JKexN9eroLmkshmPXUAAIKibc3VSjo8Zp6hlYdNtKSgvEh0GYFo0zQnoWbigv3Cxiv
 Uv0AyFUZbZ1SBGDYZU7U7rLVUDEMOEdNXfnwnkVjDHc+5schDvFAmQtOQ29ubRJPED
 gK/pGi5suV/ZPVNMcSz8qWATqIySIBI/Pt/K5Fh2+fxBeCstQpVl3+45UG2a93cTnq
 CXtaIkAdj6hwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=YUSx93Aw
Subject: [Buildroot] [PATCH] package/comix-cursors: update COMIX_CURSORS_SITE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The project moved to Gitlab and renamed it's archive.
Fix the download URL and update the hash.

Fixes:

 http://autobuild.buildroot.org/results/734/734917ff9f613f07e6995c1f333eab1ee8bc5760

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/comix-cursors/comix-cursors.hash | 2 +-
 package/comix-cursors/comix-cursors.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/comix-cursors/comix-cursors.hash b/package/comix-cursors/comix-cursors.hash
index b66a61423b..b3975e1e3e 100644
--- a/package/comix-cursors/comix-cursors.hash
+++ b/package/comix-cursors/comix-cursors.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9e68ea8ff230dcc793528aa5da9a38b9bf61c478cd6868b4e4f5da659746a019  ComixCursors-0.9.1.tar.bz2
+sha256  7248f2da98fea475e590aa657d8581593516530d014a9ddbac8667d1b5f3a02b  comixcursors-0.9.1.tar.bz2
diff --git a/package/comix-cursors/comix-cursors.mk b/package/comix-cursors/comix-cursors.mk
index 7b034ccee7..2f035b2d75 100644
--- a/package/comix-cursors/comix-cursors.mk
+++ b/package/comix-cursors/comix-cursors.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 COMIX_CURSORS_VERSION = 0.9.1
-COMIX_CURSORS_SITE = https://limitland.gitlab.io/comixcursors
-COMIX_CURSORS_SOURCE = ComixCursors-$(COMIX_CURSORS_VERSION).tar.bz2
+COMIX_CURSORS_SITE = https://gitlab.com/limitland/comixcursors/-/archive/$(COMIX_CURSORS_VERSION)
+COMIX_CURSORS_SOURCE = comixcursors-$(COMIX_CURSORS_VERSION).tar.bz2
 COMIX_CURSORS_LICENSE = GPL-3.0
 COMIX_CURSORS_STRIP_COMPONENTS = 0
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
