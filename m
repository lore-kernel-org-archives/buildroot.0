Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A02C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D768140BFB;
	Thu, 19 May 2022 14:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f7VP38oHTXxs; Thu, 19 May 2022 14:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA5DA4063F;
	Thu, 19 May 2022 14:10:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C3401BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF6BE40124
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2T8lLUhul9X1 for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 161B5404D1
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u3so7367038wrg.3
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9CY+maYti+Z38QsGI73Unog9022tdK4QYp4CsbDSJHM=;
 b=SNPd2RZV0p36UEayefsv2hgyOIZzNOuzTANDZf8Kke3xBtMNCOpHxmc2PPmiwKFVyA
 4SGcd6AQlRc5J5fvWVpnNGufqa23r3vOUOiae2PcI/1/+SOw/w+HniySuDcj6J51bgyk
 v9unfGgZwWPU8Y2R3sx/xuzwyorbEfEM8gKtMnZL5hmGMU+kDZZPPP7rjmTZIEoZkTKf
 XWeTJDKomME4JLzfuBcncLZLZqAQRB6hQ9liMewd701W0aUjX+0jY8HebVXMPQ2J92rT
 +s3F/D1VTBVhGKCU7BY3E5emx7AIviphQKv0aC8YuIcjts7RmhYGn4mjdaw/NqATbJE+
 Asjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9CY+maYti+Z38QsGI73Unog9022tdK4QYp4CsbDSJHM=;
 b=eX/q2hkZBt+5vzYk0ZrBUP2IKMfT7zNgOkoZRVFC5PKd2i4BK+DJVtKHz2oof0nxL9
 l8codjFo/FDlJZzjynFbFs3ho4GTE+x86Ziu8JBSB3fGd6aqx3ovKNpEIrTkkBJvrGNP
 25bbKBdA6z30XmdmPixlHDPihEQXLwwUCI8dF03aFuheKQDAqxbkTzY7oQF9R4KX2sDV
 CB8eihgrEpdIlv9FYjUgFWY64fRzuUlHrEgppytWsxUZAAWn80rsRLe+s6lSgLBSBzKf
 SMbsmm0g4vS7d5ti8CqQxbW0GcpV+aTqSScHut5nhCLF9PU9OjDvl4a0jTgVZCe8qEBk
 c4tA==
X-Gm-Message-State: AOAM530YoaLl5PMBIxRKqOMD2bQ62MlgYk+v+Ne2NzqrWKnf42U83scn
 1f0bTwKG1C8Uy96vSA8s9lYSLsjvsfg=
X-Google-Smtp-Source: ABdhPJySSjdEjePD4ZA9a0V56QLgIwNw4VPsPMNvXf/SH3VZQpYCheDFgC706TorbTFprcgUc7FRrA==
X-Received: by 2002:adf:ee0c:0:b0:20e:5bf7:cb6b with SMTP id
 y12-20020adfee0c000000b0020e5bf7cb6bmr4270143wrn.514.1652969319015; 
 Thu, 19 May 2022 07:08:39 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:38 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:07:59 +0200
Message-Id: <20220519140810.1953601-10-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 09/20] package/erlang-p1-yaml: bump version
 to 1.0.32
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-yaml/erlang-p1-yaml.hash | 2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.hash b/package/erlang-p1-yaml/erlang-p1-yaml.hash
index 955a000930..89123dfd83 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.hash
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8f53308438e4d1613562acb586b4c4540569d8305097508c40e6f261fe4216cd  erlang-p1-yaml-1.0.28.tar.gz
+sha256  6d5c823dd895b736b98325d88893a63c054964d7bde9a8e150fc4df5f4165065  erlang-p1-yaml-1.0.32.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.mk b/package/erlang-p1-yaml/erlang-p1-yaml.mk
index e42ff5fe38..6acb6fe059 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.mk
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_YAML_VERSION = 1.0.28
+ERLANG_P1_YAML_VERSION = 1.0.32
 ERLANG_P1_YAML_SITE = $(call github,processone,fast_yaml,$(ERLANG_P1_YAML_VERSION))
 ERLANG_P1_YAML_LICENSE = Apache-2.0
 ERLANG_P1_YAML_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
