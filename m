Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326A7EDE997
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 04:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F325E608E6;
	Wed, 11 Sep 2024 04:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NOPq_WQHLPR; Wed, 11 Sep 2024 04:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C626608E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C626608E7;
	Wed, 11 Sep 2024 04:33:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7F571BF339
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 04:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96C16608E7
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 04:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmmhzhZ_bkBe for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 04:33:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B488608E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B488608E6
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B488608E6
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 04:33:06 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B4E3F3535C28; Wed, 11 Sep 2024 06:33:04 +0200 (CEST)
Date: Wed, 11 Sep 2024 06:33:04 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZuEdgLLG+xLSZz20@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726029184; bh=44xDuNlHtx6vXke+4Y13S/MLDD1SqHoF8w9zzOEm1GI=;
 h=Date:From:To:Subject:From;
 b=hKBR6eK/ekzdPqD/ueKeDtmyrsu4Vlf1WYtccO5WPxeDAWehprEUbvmFobQ2hWe4D
 hXptWNfrQH+0CWSuwAmLkVhUCZhb7RrvG4AlxoeuPG+OqFactpRKVAR7bYxBHHu+mn
 vkzIow8YWDoA/fIL7GNfji+I+y9vcvdyt2oJbZ97ZP0pRTAL6pO5m4mQMQu6SJ7RQl
 C34D1FGSP8dgEU/LgcbKKBmTKpTBj7UKq2HmZYQWyKmNoxcRnhRHH1B65tTqpJIS7l
 dUmcW9ETEfGP7Zsc01d+oCcIK0FQuz4YM1c9IYspz26cyfYDExNlSQYVD8xCenmjtx
 KBAbvG7L4D+zg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=hKBR6eK/
Subject: [Buildroot] [PATCH] package/asterisk: security update to 20.9.3
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

See here for the Changelog:
https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-20.9.3.md

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/asterisk/asterisk.hash | 2 +-
 package/asterisk/asterisk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 9889a18c9d..fe3e3642a4 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  6bc4d982a238397bf6b3bfa523f63a75a2d9b19edd6f33f79264f2385d05bc42  asterisk-20.9.2.tar.gz
+sha256  a15099a5c776045e96b0da2534606c8dbd13bc1ffcbe325f7cfd74dc1d29decb  asterisk-20.9.3.tar.gz
 
 # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
 # sha256 locally computed
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 9d44782a08..c7b97a1ad4 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 20.9.2
+ASTERISK_VERSION = 20.9.3
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
 ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
