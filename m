Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC48EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C84E84401;
	Thu, 19 May 2022 14:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-eJkceiy08Z; Thu, 19 May 2022 14:10:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39921843F8;
	Thu, 19 May 2022 14:10:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1765D1BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D675D41986
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 18P0ozEEGNyY for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A98141D20
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 n6-20020a05600c3b8600b0039492b44ce7so2767709wms.5
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QUK39nQ6d1rRagZ0nwiBGCp7oSDam4aARmixmGvENVA=;
 b=Qf5IhCedmpVMLRg0om29gP49hZxKNuuao2eU+TvyRVdk4rKC61FjkYiu/tFmn4pV1b
 mYQVV5aTze3XWGXfFC4oGUKP7BwnekSTa1jllgj+6n1T9L4OwE1onVm1QxAY5mvy61+d
 9gUcFBizbfC3kfJipmfpl8CILQrl+2Db8JOsXgH3yclQDSymxQmPls+s4TuM2gWQ1m+U
 gl2c4qcfgvHC8BnWg8m4Fn6mwF8RYpn/UNnREgmWUHs1G5bLLqC+X9dsraVcux33zBDv
 c6p5j6WkIAQgfWhALS/GZpYYsqk76o7Ys6xAXnUngTS+rjxdL3GbiDwvf+TMComIGQf9
 pnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QUK39nQ6d1rRagZ0nwiBGCp7oSDam4aARmixmGvENVA=;
 b=0iR6/o50O2ePYacrt6RTPTqqicwx3AyTR8pr4aZ1ROHuzsH6uLXTqeW3HAQhNHod9/
 H555KgWXlNs7S0uJFzo65PpQPomfFr0JRYlGtVgJ0Aczy3bm5oD7khlpS1o/spPzq4AE
 NRM79wxv4n/b4RWgFnjjmnWk9VBJXWq+4ywR1Ai+dFCSaBfUFbDEd9paBGHZZ/vrQ0Fg
 JraSCiPoE05PgK+rDZzGG7DtIwEDJLLu5Y9FbVdyLGjVbj+KTXBshrsGNQTlMhsNTbQY
 gACAGuG4bEr8ZXQN4I0G9E3Tla7TKvVL4bSrAFtz46IbuIOhgwFhRwT/R4kmomRRf1Rr
 Sl/Q==
X-Gm-Message-State: AOAM533ZwnmkY4DNDbkXLc4H2E6BcCutLnG5BY6YsCKeQsRsNYlWxD1u
 ci/ObgTcl1QJIaiZCBk7g43budMM/2g=
X-Google-Smtp-Source: ABdhPJxl1BrmlcjD2KKMmOhzLMPA4cqaeYeO7awnHF7XPK178UVAdT+XbAy1sjsZa9S/Sv2aZhH6xg==
X-Received: by 2002:a05:600c:288:b0:394:31f9:68f with SMTP id
 8-20020a05600c028800b0039431f9068fmr4453949wmk.57.1652969317016; 
 Thu, 19 May 2022 07:08:37 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:36 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:07:57 +0200
Message-Id: <20220519140810.1953601-8-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 07/20] package/erlang-p1-xml: bump version to
 1.1.49
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
 package/erlang-p1-xml/erlang-p1-xml.hash | 2 +-
 package/erlang-p1-xml/erlang-p1-xml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-xml/erlang-p1-xml.hash b/package/erlang-p1-xml/erlang-p1-xml.hash
index f2a4ab83e0..379ca7ef88 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.hash
+++ b/package/erlang-p1-xml/erlang-p1-xml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  739f37a161a570071469ab1f3d8fc232f004ea616700fe7e46b6d8afa9d03a60  erlang-p1-xml-1.1.44.tar.gz
+sha256  02bcdb0a4350080a10b52de85c11de982e5f7cf2150f5b1b888f7a95ccb31265  erlang-p1-xml-1.1.49.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-xml/erlang-p1-xml.mk b/package/erlang-p1-xml/erlang-p1-xml.mk
index 5730181ac6..eee2c74c03 100644
--- a/package/erlang-p1-xml/erlang-p1-xml.mk
+++ b/package/erlang-p1-xml/erlang-p1-xml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_XML_VERSION = 1.1.44
+ERLANG_P1_XML_VERSION = 1.1.49
 ERLANG_P1_XML_SITE = $(call github,processone,fast_xml,$(ERLANG_P1_XML_VERSION))
 ERLANG_P1_XML_LICENSE = Apache-2.0
 ERLANG_P1_XML_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
