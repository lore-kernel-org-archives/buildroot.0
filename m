Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8430C7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 14:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47C7241DB6;
	Thu,  8 Jun 2023 14:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47C7241DB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVYKG1IedT6L; Thu,  8 Jun 2023 14:09:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35CDA410E3;
	Thu,  8 Jun 2023 14:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35CDA410E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55DCA1BF3A3
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 14:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 295D661478
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 14:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 295D661478
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYXEmfhLqDUE for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 14:09:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02F2661188
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02F2661188
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 14:09:40 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f7f4819256so4422105e9.1
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 07:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686233378; x=1688825378;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5QEsV7wOV6pmJIWQfq4lV0Uql+pbdt8rbsAqjKErPdg=;
 b=QrDuA/EUPUT+S2g1uF/EAOAikQ7NwIuuuYM9TsjqN5JMUwUn4d6se4kyPjiZWMzYS1
 4CSVhplbTOwmnOo3mxbP54FNG/gEziXS3yuUSY7zwrvKW2qo8nTBG4B5+RYGnf/vFWxx
 Un3yXJnzmyH21bT7wYJzRDbY07kKAlOtb3GA3O+R+UwgmYADWa0H9tFte0N2hAnSe6r3
 XPdSgADHbSWiwXlVAvvRhvpQ6FupMdIGANwofySDyQpeUSagjcRuwfDYMQ6y5Mis3QUd
 C/UmMuw61YCxvqxdB+CCBsThwuN3nfAZJovfg9Hl5q6MF3Lo7GCfRT0MQqBwMkdFnPK2
 cyig==
X-Gm-Message-State: AC+VfDxlmouXMqBXMZ1kjZ/p23gDEW1B5LoHMmfgk+VQml5CwN9cSMMg
 luRhtsPhn+WHp9LkSFnf4CO9T9dWT3VBxDkkIRM=
X-Google-Smtp-Source: ACHHUZ4fJ6OVCcRWxoec5PnqGiyb0akGEK/a3yKe272+HfePyyHVam0c6B8rHVw0P6OkjYQ5HPg7Uw==
X-Received: by 2002:a7b:cd19:0:b0:3f6:834:d33f with SMTP id
 f25-20020a7bcd19000000b003f60834d33fmr1431065wmj.24.1686233378547; 
 Thu, 08 Jun 2023 07:09:38 -0700 (PDT)
Received: from P-NAN-LIMA.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 20-20020a05600c025400b003f74eb308fasm2061525wmj.48.2023.06.08.07.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 07:09:38 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 16:09:33 +0200
Message-Id: <20230608140933.1814667-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686233378; x=1688825378;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5QEsV7wOV6pmJIWQfq4lV0Uql+pbdt8rbsAqjKErPdg=;
 b=CjOvUlrcLLZEs9vwUh2ESFUKqnD38Y1Aww8s6dR7zJc1nTPt8cR2LBjKE8dKTWm9Bf
 uAHO9/wCj1zWoOFBqVnbDfZuCNAWEdIF0QzDoX6NswXtwM5bgC9tmirhnxWAIha2kWce
 9UG1kNav8eYLJpeoBM2ws12QbjN1e0HkkXiFX6R6MaBKtIRuseOJMG4kGf4nLs0Xymgd
 IZtSDo8jaeQLZlkRmTj0KYwj2Ztp12bwncn5HXt5kGvuL/hGQ0QMIYAmufDYFMmzE1qS
 WkjT1RXNq46QjwJfdWW1exJr70C9nyinUkFvCqIh4Dd/S+OFIH6Q73gGMEJum0WoJMGM
 Ac9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=CjOvUlrc
Subject: [Buildroot] [PATCH v2 1/1] package/python-mako: add missing
 dependencies
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Sebastian Weyer <sebastian.weyer@smile.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mako imports pygments and markupsafe so it needs to be selected when
selecting BR2_PACKAGE_PYTHON_MAKO

Fixes:
- https://bugs.busybox.net/show_bug.cgi?id=15628

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
v2: fix typo in commit message header
---
 package/python-mako/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-mako/Config.in b/package/python-mako/Config.in
index 442e290efa..500137854f 100644
--- a/package/python-mako/Config.in
+++ b/package/python-mako/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_MAKO
 	bool "python-mako"
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
 	help
 	  Mako is a template library written in Python. It provides a
 	  familiar, non-XML syntax which compiles into Python modules
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
