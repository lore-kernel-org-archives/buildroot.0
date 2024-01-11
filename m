Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71071C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 10:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D81143852;
	Thu, 11 Jan 2024 10:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D81143852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhxki_L5GbQK; Thu, 11 Jan 2024 10:56:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 288B14384C;
	Thu, 11 Jan 2024 10:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 288B14384C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 347D91BF2F5
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DA8742464
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DA8742464
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0xGi06uyjCj3 for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 10:56:31 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0078342443
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 10:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0078342443
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71BA8C000E;
 Thu, 11 Jan 2024 10:56:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rNsjb-009k3S-2s;
 Thu, 11 Jan 2024 11:56:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 11:56:20 +0100
Message-Id: <20240111105621.2321957-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240111105621.2321957-1-peter@korsgaard.com>
References: <20240111105621.2321957-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH 2/2] package/micropython: drop GIT_DIR=.
 workaround
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that it is handled globally in TARGET_MAKE_ENV.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/micropython.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index e6eb536ea5..3d356c51d8 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -14,11 +14,6 @@ MICROPYTHON_LICENSE = MIT, BSD-1-Clause, BSD-3-Clause, Zlib
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
 
-# Set GIT_DIR so package won't use buildroot's version number
-MICROPYTHON_MAKE_ENV = \
-	$(TARGET_MAKE_ENV) \
-	GIT_DIR=.
-
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
 ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
