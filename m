Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11C4F9D0F6
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 20:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26D8C84E02;
	Tue, 14 Apr 2026 20:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Zt4sS47vQ7N; Tue, 14 Apr 2026 20:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B76AD83BBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776198645;
	bh=qCRn/JhATLRB3WQVFVJOuuO1xAwmJ0EwBlqAQWVWLxs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W4dWRZPs+qtyuGnotf7lUBIQD+JntgVomuTuegdMtqnRBvpzVT1+nvdY68vIA9O1l
	 L0iKCO5+naZO2ch+LcKNhaYi3nE1ns3M7HiFeTMknO2g5hf6hPoanByiYv5lDgTCfL
	 EbATamWxd97uDO7QsrdfNTSwYuiL1bshdUlLTi5eYrcLry4KVoW+fNtrN1rmttzJWZ
	 AOIC52bNkaDuYbxAgEX5CoDAHyq4sLYKznsYozr8XywBgI4/PpbbJoXHyb+Hw0iVNj
	 9l7oyV7a1CZgJR7SwXyZN73aVFIlSxnrnQEhwgdNL1y4xKATw/EDT3wEEba/u2BbDR
	 QWTbn4d4dT+bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B76AD83BBB;
	Tue, 14 Apr 2026 20:30:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A369394
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 20:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 349B260690
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 20:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iSG-Xdd62My for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 20:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AEA960B24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AEA960B24
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 20:30:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D084D81520; Tue, 14 Apr 2026 20:30:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 21:46:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d6378db9dd83d46808cba4538a7412f71f88089
X-Git-Newrev: cc7c20d817c6cd949c0b48999092af161ca51e49
X-Patchwork-Hint: ignore
Message-Id: <20260414203038.D084D81520@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: security bump version
 to 6.0.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cc7c20d817c6cd949c0b48999092af161ca51e49
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strongswan/strongswan/releases/tag/6.0.5

Switched _SITE to https.

Fixes CVE-2026-25075.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/strongswan/strongswan.hash | 6 +++---
 package/strongswan/strongswan.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index 7a6939b979..44eadbaecf 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-6.0.4.tar.bz2.md5
-md5  f6b78a99e95179b6a65df218d75da7ca  strongswan-6.0.4.tar.bz2
+# From https://download.strongswan.org/strongswan-6.0.5.tar.bz2.md5
+md5  7049111627010dc02293970c82e43d28  strongswan-6.0.5.tar.bz2
 # Calculated based on the hash above
-sha256  79576bb61b9a406cea9eb73d0c565cc6254a6b6d2e7198f44758d2d7c61a7aec  strongswan-6.0.4.tar.bz2
+sha256  437460893655d6cfbc2def79d2da548cb5175b865520c507201ab2ec2e7895d9  strongswan-6.0.5.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index bb5fd2d217..2e20b244ad 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 6.0.4
+STRONGSWAN_VERSION = 6.0.5
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
-STRONGSWAN_SITE = http://download.strongswan.org
+STRONGSWAN_SITE = https://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
 STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_CPE_ID_VENDOR = strongswan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
