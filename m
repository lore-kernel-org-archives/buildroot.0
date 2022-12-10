Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2CAC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 12:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C94881CE1;
	Sat, 10 Dec 2022 12:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C94881CE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A8Q2Oiv5xCkt; Sat, 10 Dec 2022 12:31:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A704E81D3D;
	Sat, 10 Dec 2022 12:31:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A704E81D3D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9538E1BF399
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 12:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D41460B0C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 12:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D41460B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J0fribZ5QJuq for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 12:31:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C44E660A65
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C44E660A65
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 12:31:02 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.222.34])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2F42113F895;
 Sat, 10 Dec 2022 13:30:55 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 13:30:47 +0100
Message-Id: <20221210123048.306724-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670675459;
 bh=i0ETP8cjlLFx30q1eJQYC+f81lKo2xJo9xNSS4ubpv4=;
 h=From:To:Cc:Subject:Date:From;
 b=dQXh/Dsy8o5aEAGJWqiILvB/VC433fBFCrb1G0K2YnnrpVFaPaCBJqi2a+v/ExQEI
 3cTOVw1Ii0en+3EZxyNkMUGMdbuu6hdv3tBXBzKg5bGtGtFyeHltkCbrcYevZQ8vbE
 VGbuJXVCJRyCt8JpV5TpZime1yhjmgXPYAe08Qgi6Hi/G/rwCznjxFPtmGRPa1tlyw
 S4pipQKoWpWjSIjXiPECGlhFQpiQgSrkvXx0vswVYoTqx816MGhOoD+vBNQUQeAxF6
 xedZGmqXwYp4B64WvuovwZ1KXcIKOp3skutsSOb9G245uvFrH2W1nUs6iCEXOMSyWW
 COiI47XeDeKbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dQXh/Dsy
Subject: [Buildroot] [PATCH 1/2] package/ncdu: bump to version 1.18
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
Cc: Bogdan Radulescu <bogdan@nimblex.net>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 1.17, see:
- https://dev.yorhel.nl/ncdu/changes

This commit also adds md5 and sha1 hashes published on the web site.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ncdu/ncdu.hash | 4 +++-
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index c47b4f9bac..1e31eaea8e 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,5 +1,7 @@
 # From https://dev.yorhel.nl/ncdu
-sha256  810745a8ed1ab3788c87d3aea4cc1a14edf6ee226f764bcc383e024ba56adbf1  ncdu-1.17.tar.gz
+md5  4186b5be477cc3a0944619ade81f123b  ncdu-1.18.tar.gz
+sha1  d47ce3cdf317adadc1426817d07899c90b767aba  ncdu-1.18.tar.gz
+sha256  3c37a1a96580c9c5d2cc352dc3c5eef0d909158c05f1cc29db4712544c8b9f95  ncdu-1.18.tar.gz
 
 # computed locally
 sha256  4590cb935ff8a50cee76ce12c2cb0411c0b06e84c267b478579785dcf328660d  COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index acfd496ec8..240ef9d8ea 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.17
+NCDU_VERSION = 1.18
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
