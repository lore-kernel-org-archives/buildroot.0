Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8B3CCFA05
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 12:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DD094076C;
	Wed,  5 Nov 2025 12:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNSHWQD5Aix9; Wed,  5 Nov 2025 12:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0F1040F76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0F1040F76;
	Wed,  5 Nov 2025 12:16:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33930462
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 12:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 310BC40F26
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 12:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwVU0QZNYipn for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 12:16:44 +0000 (UTC)
X-Greylist: delayed 376 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 05 Nov 2025 12:16:44 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5116B40F15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5116B40F15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.119.170.32;
 helo=aposti.net; envelope-from=paul@crapouillou.net; receiver=<UNKNOWN> 
Received: from aposti.net (aposti.net [185.119.170.32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5116B40F15
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 12:16:44 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: buildroot@buildroot.org
Cc: Paul Cercueil <paul@crapouillou.net>
Date: Wed,  5 Nov 2025 13:09:33 +0100
Message-ID: <20251105120933.289627-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; s=mail; t=1762344625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TmP4aaF3ksXITNLuPrzKdvPkJFuZyw1RDhJmLnAIxtA=;
 b=DDb8QKDubUmxlN5ZyDAF20RTxbb2q7J15/N2UmVh2cmSQqCmACTE3m3de9oL1PyjSk/Ahp
 Zaj4JljL/MhMKLp04dIhB0exc+tzarq+EPABh0S1kImBM9/kb12Op8PiVxp7brZ9W/kCy6
 Etv4N2vjOPlrpOYO3iSTT/DQl1V0rcM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=crapouillou.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=DDb8QKDu
Subject: [Buildroot] [PATCH 1/1] package/umtprd: bump to version 1.8.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/viveris/uMTP-Responder/blob/umtprd-1.8.1/Release-notes.txt

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/umtprd/umtprd.hash | 2 +-
 package/umtprd/umtprd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/umtprd/umtprd.hash b/package/umtprd/umtprd.hash
index f682dd6d84..3502d5f1ef 100644
--- a/package/umtprd/umtprd.hash
+++ b/package/umtprd/umtprd.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e0b3c308016595a5d956eaaa086d3bfe4c9af2270857181695338df9affb3574  umtprd-1.6.8.tar.gz
+sha256  6f57f61a1993059bcdd5f598d8c2a3888991497ef42ba3594947f00bd7746b1f  umtprd-1.8.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/umtprd/umtprd.mk b/package/umtprd/umtprd.mk
index 1f1f6bcd23..1a2b387219 100644
--- a/package/umtprd/umtprd.mk
+++ b/package/umtprd/umtprd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UMTPRD_VERSION = 1.6.8
+UMTPRD_VERSION = 1.8.1
 UMTPRD_SITE = https://github.com/viveris/uMTP-Responder/archive
 UMTPRD_LICENSE = GPL-3.0+
 UMTPRD_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
