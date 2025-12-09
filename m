Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDC4D3B98E
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 18:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BF53608A2;
	Tue,  9 Dec 2025 18:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtOfkDCL230y; Tue,  9 Dec 2025 18:28:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C2EE608EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765304900;
	bh=15r12ZPR8jQCbwU2wkWIsLzFUckMfnVQCYpVk3mHwpw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PTpySyZnl1EI3DmNId5VK51a8lcY8y27clmB4lou6cegqmTrt+lT76O6TUvLVUd2X
	 m5K56F6JvJ7ofsDVrp9EiwxlaKEgF250qpOkpgRRQ9yUCrMahY+41JezkhtnOKsgvF
	 e6aCyuNpQZv3avsA5acfIyszyTPPgjRL83u17C7KOw8EPtjcK4nLB847Qqc4ipxPEH
	 QYBbbOrpbDNKfnRSja+UYnrKvStPyGEEx9r7jiuypKfQgFHa3Gh4Bd1S4tFmuPuTQE
	 ERE25oiKnNWxvsMJCbXnDVZ158lciNEYQL5guw/1RtjeKUc+4TnIQf4iDrrdtHEh4B
	 Thk1JI5cvN6gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C2EE608EE;
	Tue,  9 Dec 2025 18:28:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BCBB237
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90DED843F4
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRl3Mxoe3Y3T for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9261B84360
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9261B84360
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C90A86967; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b7134215e31c1507d0635e29c6a872d60c11b61e
X-Git-Newrev: 9b96ce2c80cb970fe282ddf84b1af597fb6e3e84
X-Patchwork-Hint: ignore
Message-Id: <20251209182817.8C90A86967@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/doxygen: bump version
 to 1.15.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9b96ce2c80cb970fe282ddf84b1af597fb6e3e84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog of this host-only package:
https://www.doxygen.nl/manual/changelog.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/doxygen/doxygen.hash | 2 +-
 package/doxygen/doxygen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/doxygen/doxygen.hash b/package/doxygen/doxygen.hash
index ff2fac7b9c..ec46705d29 100644
--- a/package/doxygen/doxygen.hash
+++ b/package/doxygen/doxygen.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  18173d9edc46d2d116c1f92a95d683ec76b6b4b45b817ac4f245bb1073d00656  doxygen-1.8.18.src.tar.gz
+sha256  a8cafe605867ad475aaf288a3852783076e1df83aabf16488bbfa958062e7440  doxygen-1.15.0.src.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index b3bcb34097..c31271197d 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOXYGEN_VERSION = 1.8.18
+DOXYGEN_VERSION = 1.15.0
 DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
 DOXYGEN_SITE = https://sourceforge.net/projects/doxygen/files/rel-$(DOXYGEN_VERSION)
 DOXYGEN_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
