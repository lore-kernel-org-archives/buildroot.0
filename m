Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DCDCF9C5B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 01:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B325C605C0;
	Sun, 22 Sep 2024 01:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7vYkTGy-zls; Sun, 22 Sep 2024 01:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF2D06060B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF2D06060B;
	Sun, 22 Sep 2024 01:15:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 219E21BF575
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 01:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 104EA40698
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 01:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBznyMGXjfdj for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 01:15:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D493540695
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D493540695
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D493540695
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 01:15:32 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id C9C1C3534FCC; Sun, 22 Sep 2024 03:15:30 +0200 (CEST)
Date: Sun, 22 Sep 2024 03:15:30 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zu9vsjYJachGtBvN@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726967730; bh=fLgD5ivPknkkw8ipgUs4Fv+qwuyx87Sxr5CuJuAie+g=;
 h=Date:From:To:Subject:From;
 b=foiodYaHzG+GqSInIwOr+Y6IpObvWqfRcTZEAPcDuS2pjV+VwRbGnBPS/yW60LN6y
 9d7r95EA2DpZhTjCktUR5e5IbBqyhowKylvpY+KFqwWtUG6IxQZY66wruvNtVA6lBi
 RxVa13cBwHNRPSRsueAqoTUCzch+tTvHDZF/uhUynt9V07NKDOwqr9Env+y2uwnT1b
 HONDT7zPNq5R4lEtGr5sg1ezMpfUfwZEPRTvZWMJKnjECM5PsyH3lp+7IX8znyWpVr
 xnuUt4mJqIVUnDha92QCfFK9vqJsCrFvk/D2hrx/k5CXNrQcig1m+tzmaChWw3H6qQ
 hWM1mkTFrm4eA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=foiodYaH
Subject: [Buildroot] [PATCH] package/bind: update to 9.18.30
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

See here for a Changelog:
https://downloads.isc.org/isc/bind9/9.18.30/doc/arm/html/notes.html#notes-for-bind-9-18-30

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
That patch is on top of 9.18.29 bump which is not yet applied.
Should I sent a v2 which is directly bumping master to 8.18.30?
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 2d4e247932..dbffff05ea 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.29/bind-9.18.29.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.30/bind-9.18.30.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  c39ce5d09a8cb10108116fa533445de9f7fdfe0063e8d7c4c46ba1fd20d7bf6d  bind-9.18.29.tar.xz
+sha256  9f6817640970267317e5aa143ecf70531040f2155636b1a63ea45379aa09034a  bind-9.18.30.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 23687ec620..81e608380d 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.29
+BIND_VERSION = 9.18.30
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
