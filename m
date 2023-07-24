Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54D2C0015E
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 15:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FD4781E11;
	Mon, 24 Jul 2023 15:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FD4781E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SdDHTn8KpvdP; Mon, 24 Jul 2023 15:45:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79E8781BBD;
	Mon, 24 Jul 2023 15:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79E8781BBD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB8E21BF379
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 15:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84A5040443
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 15:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84A5040443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofvOYY7bvJgG for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 15:44:58 +0000 (UTC)
X-Greylist: delayed 317 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 24 Jul 2023 15:44:57 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D84D941461
Received: from mx.msync.work (mx.msync.work [62.182.159.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D84D941461
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 15:44:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1D9F3A3FFE; Mon, 24 Jul 2023 15:39:33 +0000 (UTC)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Jul 2023 18:38:47 +0300
Message-Id: <20230724153846.156586-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lexina.in; s=dkim; 
 t=1690213177; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=+hgr3GnPMOHBC0CEDFcwBVQHfkPFsh/jh7b9Bu+SEWY=;
 b=OENwCg18boUfm6glJ88I3e1DAUA9YqxoRVYORc+WmzwpnMGd2QxdbsztvOZEzRo1lZzad1
 EKvYZQdVeoOx2rbvk9jc4c17mKUaxJJjh4RbFmwb9KWjKPLRSZNnZB+sljdnu6hIa4d61+
 3fpdPsT6MwrbfcXFpGiEdYcDximyH4s+LabhF7hpaUnKp+cBe1GTO3b8hy/anaWhbQnxfO
 MbfpcekHD0CyzWPdlNr340RI6gH6+qET6vPKhtLq55BDY6RIZAkBxpqonEq3Ypjkluba5e
 riE1rtKvA077daZOtqYEgrfA/dCJyzla1HX42CQ/E7sMXxJOGrB0AFl5RNFp7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=lexina.in header.i=@lexina.in
 header.a=rsa-sha256 header.s=dkim header.b=OENwCg18
Subject: [Buildroot] [PATCH] package/rtl8822cs: Bump driver version
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
From: Viacheslav Bocharov via buildroot <buildroot@buildroot.org>
Reply-To: Viacheslav Bocharov <adeep@lexina.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump driver version. Fix build failures:
 sparc http://autobuild.buildroot.net/results/1773c307641fc7a04f1095325c7bfd44d58d3180
 sparc64 http://autobuild.buildroot.net/results/5bcb9d334add7d80f23f0585e67010d27aa8ef1f

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index c1ff470b27..aa3c86ce80 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  8ac5bc4d3fcec98eb06276552ffab020dd799a58bce6629cf55127c2ee1a89e6  rtl8822cs-b51ab22fffdbe4a8cbb88fcc04b00aa2ca87d0f3.tar.gz
+sha256  666b5312c372664b115d29fc2b2974244b0512db27ffa1c810fae30d1c714063  rtl8822cs-758d861bfa4d18d39e4297c550fd684c9817eb0d.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index 8c6c34ccbc..2db769aa69 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = b51ab22fffdbe4a8cbb88fcc04b00aa2ca87d0f3
+RTL8822CS_VERSION = 758d861bfa4d18d39e4297c550fd684c9817eb0d
 RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
