Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6413BCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 17:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D57C440888;
	Sun, 15 Oct 2023 17:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D57C440888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9CSW2D4CLEV4; Sun, 15 Oct 2023 17:37:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6255940905;
	Sun, 15 Oct 2023 17:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6255940905
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BA9A1BF5DD
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 17:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0492240905
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 17:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0492240905
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id loWsJbFQUwDr for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 17:37:10 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA5BD40888
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 17:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA5BD40888
Received: from fli4l.lan.fli4l (p54a1bf4b.dip0.t-ipconnect.de [84.161.191.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76422A4C019E;
 Sun, 15 Oct 2023 19:37:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35678)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qs534-0006qB-0C;
 Sun, 15 Oct 2023 19:37:06 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 19:37:06 +0200
Message-Id: <20231015173706.408993-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697391426;
 bh=5pOyB3LI9l/KfnvttU1t80odQAdBoYZbMt8Dderd3to=;
 h=From:To:Cc:Subject:Date:From;
 b=cLhAASkVyvx1n4jtTrhF1iChzqlLziysyT8uLW/UmhhQ82ebrxjlsKzaj4ppM74DA
 yocAO/VSq+QAo3qk9LRU88wE0aXOdBRySLV+sLc9sz0JoViSoALnN4E235QMCo9mLi
 1Piq2ZZjvqVKdPtYlswSynSwyVvgVb2V6QEt4uwly5RpQH+fiYj7D2koDi7Qn3cPSB
 81ayqOASAqL9WC3gs9Ltmpxy8hmx+/SfKIMlyR5TbKSr52BU6PLZPi6WuKX/ULBqJS
 5x29pzRaHUkEVv61RjWI32GDCyEREbi1lLjZgX91PtHhfvjp7v2KAMQI1eZW9+kC2k
 Q/Q28XXaYVuuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=cLhAASkV
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.96.2
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://seclists.org/oss-sec/2023/q4/107

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 6cdeea0614..e784bf7521 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  93ac0755c317e1fdbbea8ccb70a868876bdf3148692891c72ad0fe816767033d  exim-4.96.1.tar.xz
+sha256  038e327e8d1e93d005bac9bb06fd22aec44d5028930d6dbe8817ad44bbfc1de6  exim-4.96.2.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  ef1a0e57c59cdf4e915b3ac5dcdbc69f565b14dd92b0527f6796b2c46a9ec34f991f9790fb4171c99417f7e482cdd62d77e780cc71fab227c8bed876103f7fdd  exim-4.96.1.tar.xz
+sha512  dc9f6a114e64ac826489edff88d50a24195b64714428e691c10a7bfb119b3ebb6455bf80cbb34dfd0a4e2e44cbde72effb009357a8e0a6065e512fe32092e3ed  exim-4.96.2.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index f5695d048d..166a4ead54 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.96.1
+EXIM_VERSION = 4.96.2
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
