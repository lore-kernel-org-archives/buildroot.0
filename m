Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C257EB64D7
	for <buildroot@archiver.kernel.org>; Wed, 21 Jun 2023 16:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3464E41EC6;
	Wed, 21 Jun 2023 16:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3464E41EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tuihZ6figvou; Wed, 21 Jun 2023 16:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4AC141EC4;
	Wed, 21 Jun 2023 16:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4AC141EC4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D68C11BF83B
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 16:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE90641ED7
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 16:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE90641ED7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLfm7I53cu3w for <buildroot@lists.busybox.net>;
 Wed, 21 Jun 2023 16:01:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBDCA41ECD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBDCA41ECD
 for <buildroot@buildroot.org>; Wed, 21 Jun 2023 16:01:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0f96.dip0.t-ipconnect.de [91.58.15.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A3ACBA4C02CC;
 Wed, 21 Jun 2023 18:00:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48700)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qC0GI-0004TI-12;
 Wed, 21 Jun 2023 18:00:50 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 21 Jun 2023 18:00:50 +0200
Message-Id: <20230621160050.359493-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621160050.359493-1-bernd@kuhls.net>
References: <20230621160050.359493-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687363250;
 bh=6advX7n6DDKnMqrxG32a31uTuA/pIz+Mq8VFoeC3zKs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=At6BbHPfiJnxghnByMV6Axj9S2bDm+s0815NwOlbmacSGoW0dV18LNFB0H+4zDjAv
 7aT/7v8YOeJmDQHxPkLVMYqwEd8bdLG4PkD3BPJ8KeTO+aorBEUSpUqd53e//jZpUF
 rLYgcU3zksCqvTRPEMccz9462PKEuEFO5zLJ9pSXboxhK/wvAlvUeNpL2GPabs7S2o
 BgX1zhKnyGlu8yx4RjAIjzGdojBP60ITk76Y+yalycFQg1nyEgKoOL685RS7qhctyh
 pf1ZNMfICFg9x/+TkLPU4kPLpqKFr6WsrqYGZyfDM1KzXlLtoMq6l/2GBtfSwTnAWb
 a7m8IP8SdGbyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=At6BbHPf
Subject: [Buildroot] [PATCH 2/2] package/gupnp: bump version to 1.4.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://download.gnome.org/sources/gupnp/1.4/gupnp-1.4.4.news

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gupnp/gupnp.hash | 4 ++--
 package/gupnp/gupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index 823dbd7927..aa32745b14 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.gnome.org/sources/gupnp/1.4/gupnp-1.4.3.sha256sum:
-sha256  14eda777934da2df743d072489933bd9811332b7b5bf41626b8032efb28b33ba  gupnp-1.4.3.tar.xz
+# From https://download.gnome.org/sources/gupnp/1.4/gupnp-1.4.4.sha256sum
+sha256  3761b15cb063621f847f3effb7d7637f0317500fca6bda1e1904f73921750a1f  gupnp-1.4.4.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index da04eae682..0e3d647710 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_VERSION_MAJOR = 1.4
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).3
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).4
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = https://download.gnome.org/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPL-2.1+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
