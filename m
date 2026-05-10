Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32BFCD3427
	for <buildroot@archiver.kernel.org>; Sun, 10 May 2026 10:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 449B084E79;
	Sun, 10 May 2026 10:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gHtHZA8FMCh; Sun, 10 May 2026 10:08:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F330A84DD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778407724;
	bh=DvLqH3zCA+/uA9V4ideEc6rGLo12Ctsk+SLe+tU1hcQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=dhio/6xa9X+0Gs9LhkDQxmwDnJwL/XDza+dOO5dfx2+9sjQuOrR8XcikeIQtNqi4U
	 0bGZbyoztCQdX5d8eceyGxJpACkhRFr7InhRhv+ev8mj0BAgBymYg534xn0Je/FONs
	 b6VyR9a05kLzYvqBKvVtXTb5MIxFK47kXZyGRkzPRlaLFfuhbYA1HEACz/TQ+IzpwQ
	 Mzivq+9H50fXCx93plu/hGncPM41nTU3bWYYPmUBMZ4BzuekszImWa8id0gwt6Wgqv
	 KLbgBQ2EQP5vA/UMS/Afg7UQGgGqaScVdmBXhuYb6oDM/UbTc/oOA2VZ5c8+IGhEG7
	 SGxDpfiSMwrAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F330A84DD5;
	Sun, 10 May 2026 10:08:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BF9E6223
 for <buildroot@buildroot.org>; Sun, 10 May 2026 10:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4C064266A
 for <buildroot@buildroot.org>; Sun, 10 May 2026 10:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qj-EKetQgVZ4 for <buildroot@buildroot.org>;
 Sun, 10 May 2026 10:08:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C8F8342668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8F8342668
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8F8342668
 for <buildroot@buildroot.org>; Sun, 10 May 2026 10:08:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkHQh-1x6eR01mnJ-00bjql; Sun, 10
 May 2026 12:08:35 +0200
To: buildroot@buildroot.org
Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>,
	Andreas Mohr <and@gmx.li>
Date: Sun, 10 May 2026 10:08:23 +0000
Message-ID: <20260510100823.14567-1-and@gmx.li>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:20hk3KtAyvAW902PeyKTr1XI3v8d8G3YjO62l5kyskg+8TWj3iT
 k1v7pWAf/eOgOlU7ZY6HjBWq4jS1PTVI8hC+V+msNOmS0muJmELqL3GLfO/S3QraWMXNHdi
 /dQFicu2ppAlNnATQfMEf1m5PPKsnvOrvAT23cLaYiZPSDklt4k9gxyrCqzQ0oCd6dLszWg
 g+bQErmcEs0j231L8pbsg==
UI-OutboundReport: notjunk:1;M01:P0:EwvbbtNpQYo=;8kRZPNLvbfLbSCOZQyLznqjQqfE
 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
 kIeAxKNa6wtBIMA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1778407715; x=1779012515; i=and@gmx.li;
 bh=otC3BmuBzryvw0QVatyh3PywwzUjm88q+lIRUXfYYj0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=lLmOoGvbCJlpILctTCk4Nkfjw5/ob27CPh3rTIozwuuef+1cetDoZiIutbdKt3nb
 Gpne+qfaVHgyiJpDWJlkMx4vRPMxqn8aYeASdTS8bn4YhydMJwMlHJd2H2Zf6t/L9
 5rqrE1JviaSI5pGQBZELOzagUS+X26XZAerXGu+5S4ZEUw5r3OlyAR+CQT31lzAUB
 L0MAaCKsVIa/vHw8hHs2xAajTMrYkvz2kpfTL+O2cIxd8CnbpuCigDDeSCmcBAELp
 2/Aso4wA7pZcQ9tOWQxqP1JgVESJnv4/O46p/YRbbh2MfXeCzctIcX4xgPZkvCo9m
 N3ULmbiChduWOtqYhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.li header.i=and@gmx.li
 header.a=rsa-sha256 header.s=s31663417 header.b=lLmOoGvb
Subject: [Buildroot] [PATCH 1/1] package/libargon2: enable static-only build
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/libargon2/Config.in    | 5 -----
 package/libargon2/libargon2.mk | 4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libargon2/Config.in b/package/libargon2/Config.in
index 6bba74cfb2..73c1e0d777 100644
--- a/package/libargon2/Config.in
+++ b/package/libargon2/Config.in
@@ -1,12 +1,7 @@
 config BR2_PACKAGE_LIBARGON2
 	bool "libargon2"
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	help
 	  A modern password hashing algorithm
 
 	  https://password-hashing.net/#argon2
-
-comment "libargon needs a toolchain w/ dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
index b3f6e1b216..ec784a2d4a 100644
--- a/package/libargon2/libargon2.mk
+++ b/package/libargon2/libargon2.mk
@@ -23,6 +23,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 LIBARGON2_OPTS += NO_THREADS=1
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBARGON2_OPTS += LIB_SH= LINKED_LIB_SH=
+endif
+
 define LIBARGON2_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		$(LIBARGON2_OPTS)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
