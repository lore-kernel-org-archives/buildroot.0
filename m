Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BA1ECE564
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 07:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A693C41358;
	Tue, 10 Sep 2024 07:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cE_wsbGdNQkr; Tue, 10 Sep 2024 07:10:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DEAE40557
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DEAE40557;
	Tue, 10 Sep 2024 07:10:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 105F21BF954
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB12E40589
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fq_Q4FErYgJ6 for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 07:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B08A4052D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B08A4052D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B08A4052D
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6948B240006;
 Tue, 10 Sep 2024 07:08:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1snuzY-00HS3j-2x;
 Tue, 10 Sep 2024 09:08:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 09:08:08 +0200
Message-Id: <20240910070823.4158894-29-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910070823.4158894-1-peter@korsgaard.com>
References: <20240910070823.4158894-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 28/42] package/fcgiwrap: fix explicitly typo
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fcgiwrap/0001-use-LIBS-from-configure.patch | 2 +-
 package/fcgiwrap/fcgiwrap.mk                        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fcgiwrap/0001-use-LIBS-from-configure.patch b/package/fcgiwrap/0001-use-LIBS-from-configure.patch
index 12563c4275..3f8606945f 100644
--- a/package/fcgiwrap/0001-use-LIBS-from-configure.patch
+++ b/package/fcgiwrap/0001-use-LIBS-from-configure.patch
@@ -1,7 +1,7 @@
 Makefile.in: Use LIBS from configure rather than specifying -lfcgi manually.
 
 libfcgi needs libm and fcgiwrap does not use libtool or pkgconf to
-detect libfcgi, so we need to add -lm explicitely when using static
+detect libfcgi, so we need to add -lm explicitly when using static
 libs.  Buildroot does this by providing LIBS=-lm to configure when
 needed.  However fcgiwrap does not use Automake and its Makefile.in
 ignores LIBS from configure.  Fix it with this patch.
diff --git a/package/fcgiwrap/fcgiwrap.mk b/package/fcgiwrap/fcgiwrap.mk
index 62c4c1369d..4845f013fa 100644
--- a/package/fcgiwrap/fcgiwrap.mk
+++ b/package/fcgiwrap/fcgiwrap.mk
@@ -20,7 +20,7 @@ FCGIWRAP_CONF_OPTS += --without-systemd
 endif
 
 # libfcgi needs libm and fcgiwrap does not use libtool or pkgconf to
-# detect libfcgi, so we need to add -lm explicitely when using static
+# detect libfcgi, so we need to add -lm explicitly when using static
 # libs.
 ifeq ($(BR2_STATIC_LIBS),y)
 FCGIWRAP_CONF_OPTS += LIBS=-lm
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
