Return-Path: <SRS0=nfe+=NH=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39033C4338F
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 17:46:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D93960C3F
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 17:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D93960C3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58B9A4040E;
	Mon, 16 Aug 2021 17:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qzmVywOzD8Ic; Mon, 16 Aug 2021 17:46:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D52374040F;
	Mon, 16 Aug 2021 17:46:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3DEC1BF3F3
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 17:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E15E980E55
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 17:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UpKkaBFsual1 for <buildroot@lists.busybox.net>;
 Mon, 16 Aug 2021 17:45:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12141.aruba.it (smtpcmd12141.aruba.it [62.149.156.141])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CE2680E66
 for <buildroot@buildroot.org>; Mon, 16 Aug 2021 17:45:57 +0000 (UTC)
Received: from ubuntu.localdomain ([141.136.195.174])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FggMmYIKdnxSqFggOm3uv0; Mon, 16 Aug 2021 19:45:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629135956; bh=z6G6Y2qMhqjpf+XY/Uc7dqziIeEpOaxmSaVBLq8Nu28=;
 h=From:To:Subject:Date:MIME-Version;
 b=cxxLXO8J6mDPsPJybg4JUoLjDTJnuy5o3rVIVLPFI7Y2OAUtD+wcoyXfV1ZwLpUEQ
 Wa6WYoXjN/TRy1mt/l2MMCkuTdR5WK8JZIR810bWzfM3z7uHQiMIIEVe4vXgNGhtQJ
 Wr8xEdrBfirOaWHoBzjO88gVapBPBRv6FlJotvYtHd6lUsnWVeS7gKcyE3+CAVDH8n
 EWzjZoBWra0vf6fJWVno/yhK2Pc5fZqDHIo2GGIMQL1Ik4DwqWt76CWdynrWkFmUjK
 S3GgjlQT8Ppwe4JfrT4iBBkOOqWahIKQkUL96mckYLWBkQeB/etAJb6hi5c/s8LWOO
 weM8ata5flm5Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 16 Aug 2021 19:45:53 +0200
Message-Id: <20210816174553.3792860-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210816174553.3792860-1-giulio.benetti@benettiengineering.com>
References: <20210816174553.3792860-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGeCjEkY4+GnZa8Xl7DtvsQzE96YKCpWZjAeGRXKXYTgkhUxmkwCyFv5QeuKt9QufbqcObn08JnxB+VbAYeo/OSvpQBUEgEIrQSkIpeRBA8XhLPsolg3
 TANyHrD1/wJTovHQmRqF+GHytEHQtzAZyGq5dURr6BpZD16zjKolMOhoOlQh29CHxrYb2+t9ukyr+/EyCMar5mmZ75GP/flgC5J1Qc1ZQTStec+tR10SqEoq
 DF+RADjZfUnc59XKj04y9rIsYJOfFJO0lOrlNYGeLovfZBWYvMOAXyAtIVRlNkSf
Subject: [Buildroot] [PATCH 1/1] package/libnss: enable parallel building
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Parallel Makefile building has been fixed with version 3.62 on commit
[1], so enable parallel building by substituting $(MAKE1) with $(MAKE)
in libnss.mk.

[1]: https://hg.mozilla.org/projects/nss/rev/a5c857139b37476ca10032504ea876b97e066424

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 0db543e34b..100ce2f8aa 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -69,12 +69,12 @@ endif
 endif
 
 define LIBNSS_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss coreconf \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss coreconf \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
 		$(LIBNSS_BUILD_VARS)
-	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss lib/dbm all \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss lib/dbm all \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
@@ -129,12 +129,12 @@ HOST_LIBNSS_BUILD_VARS += USE_64=1
 endif
 
 define HOST_LIBNSS_BUILD_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss coreconf \
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss coreconf \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
 		$(HOST_LIBNSS_BUILD_VARS)
-	$(HOST_CONFIGURE_OPTS) $(MAKE1) -C $(@D)/nss lib/dbm all \
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/nss lib/dbm all \
 		SOURCE_MD_DIR=$(@D)/$(LIBNSS_DISTDIR) \
 		DIST=$(@D)/$(LIBNSS_DISTDIR) \
 		CHECKLOC= \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
