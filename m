Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8272CCD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 10:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 365B9416B7;
	Wed,  3 Apr 2024 10:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wne9Xuu5pB9B; Wed,  3 Apr 2024 10:08:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A1B1416AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A1B1416AF;
	Wed,  3 Apr 2024 10:08:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD8EB1BF349
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 10:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9F41416AF
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 10:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JirMqdQCocKu for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 10:08:16 +0000 (UTC)
X-Greylist: delayed 419 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 03 Apr 2024 10:08:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F32E440127
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F32E440127
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F32E440127
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 10:08:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A45421814B9; Wed,  3 Apr 2024 12:01:13 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 12:00:59 +0200
Message-Id: <20240403100101.4183149-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1712138473; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=sFarVjo4pXPf5fAvJVtBMrDwzFkBdb08FH0Kp315dEk=;
 b=YAPs88S+nZGFC810UrW+j/ylY1NzpBcmCId68ygCJ2wjBc6O9n2HD9X6buWRHrHmyzpjhf
 VOxViCvlhj696yxs1XgDdCiUgHmRFxjd0HfTdoFV8wgXaz7bqRoKxZrPMmTUkfpRRkz/5c
 WI5PpHGPPkex/df9yIZQujr1gtbEDyM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=YAPs88S+
Subject: [Buildroot] [PATCH] package/re2: bump to version 2024-04-01
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/re2/re2.hash | 2 +-
 package/re2/re2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/re2/re2.hash b/package/re2/re2.hash
index 543c416087..1598d1ee1b 100644
--- a/package/re2/re2.hash
+++ b/package/re2/re2.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  cd191a311b84fcf37310e5cd876845b4bf5aee76fdd755008eef3b6478ce07bb  re2-2024-02-01.tar.gz
+sha256  3f6690c3393a613c3a0b566309cf04dc381d61470079b653afc47c67fb898198  re2-2024-04-01.tar.gz
 sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index b962b53e3f..75dfdbaf50 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RE2_VERSION = 2024-02-01
+RE2_VERSION = 2024-04-01
 RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
 RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
