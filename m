Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C84DD0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30C2082213;
	Wed,  7 Jan 2026 17:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JaqlAgSqiWrW; Wed,  7 Jan 2026 17:48:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42CDE8220A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808090;
	bh=Oi2LOqCY5cqwPOqYVEuBLPgFZm+jktBkJC2wF+PoiZQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AcfLPWDs0krdCDg6+ZsgAyMt36+H8QjWc7OcW841bAxJP+vPUXLFj1CauUAPiYBmI
	 mV1HSOlCB5J51JO6FCN+TBfVLc+53FkduC8A51sTauYu008caJgl2PvCKakVj/LxR4
	 4+x7TXX4vp0MzgHWRmhdkmUwYLENqoJ1V/aJOXgwkxykuE8V1gGg0AV3EjL8IqBt9j
	 Kh/YjbSVWDatgG7FH9eOW5pmqpMgo0l1Y/+K8y7sXBE8TCl2CGVG54pKfu3GskR/sX
	 KSwCRJDq8kzpclTXMM/VTWBQd+mP9qsXUJS/pUSiOdHH7t3A1zZ31FC9+YtV3xl7N3
	 zO+vBLl8dBr5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42CDE8220A;
	Wed,  7 Jan 2026 17:48:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A65F9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCBC760843
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLBiDBBztbQl for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EADFC608D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EADFC608D0
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA58D86FC2; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:49 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e285f646b14160e06f728501c29776924a5a2e17
X-Git-Newrev: 89b7e541ed765743a4d0d57ea9c4f1f22f0268db
X-Patchwork-Hint: ignore
Message-Id: <20260107174641.EA58D86FC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/matchbox-lib:
 switch to gz tarball
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

commit: https://git.buildroot.net/buildroot/commit/?id=89b7e541ed765743a4d0d57ea9c4f1f22f0268db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Switched _SOURCE to .gz, upstream does not provide bz2 tarballs anymore.

Fixes:

  https://autobuild.buildroot.net/results/66ac5ae4b1cd053122ccebad9f61af02fa5fe7f6/

Co-developed-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4b33839f12c4638ea148c4ac7ae2e85adf79f936)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/matchbox-lib/matchbox-lib.hash | 2 +-
 package/matchbox-lib/matchbox-lib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/matchbox-lib/matchbox-lib.hash b/package/matchbox-lib/matchbox-lib.hash
index 8144c10258..ecd02f7174 100644
--- a/package/matchbox-lib/matchbox-lib.hash
+++ b/package/matchbox-lib/matchbox-lib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5c7795e46c24d848a2b960f3b994911165d95e5d5731e39105ee0d808d2373eb  libmatchbox-1.12.tar.bz2
+sha256  648d7e1af82e69b79c0932ff9f85e6781584eada5da8662f70196916dd208f55  libmatchbox-1.12.tar.gz
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/matchbox-lib/matchbox-lib.mk b/package/matchbox-lib/matchbox-lib.mk
index 00ca4a0d15..b6e4584052 100644
--- a/package/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox-lib/matchbox-lib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MATCHBOX_LIB_VERSION = 1.12
-MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
+MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.gz
 MATCHBOX_LIB_SITE = http://git.yoctoproject.org/cgit/cgit.cgi/libmatchbox/snapshot
 MATCHBOX_LIB_LICENSE = LGPL-2.1+
 MATCHBOX_LIB_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
