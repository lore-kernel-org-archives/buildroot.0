Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20672C433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D790F40C4E;
	Thu, 19 May 2022 14:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sKGgy7T2wYT6; Thu, 19 May 2022 14:10:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2A8540C44;
	Thu, 19 May 2022 14:10:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E3A81BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA26F40124
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AWPG2NElJjyY for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03F9C404D1
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:41 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h14so7365792wrc.6
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=67Ez8TZPnvD0ZjKP6DuJllUHVp1oHjwx3WYJEfIn8cs=;
 b=DGIYd+0/DORRPXp/aKnVog24n15BpFJdcYdjqHihr+hPWntUktsy6vI46oySXyefXT
 BYpoD3LS3w2Zn6DM6QeiVo0PpTMR2dwpk1CrG1BpvV1mD8vYD52fmLvlj+Zdf4c7FDj+
 vSvhFcVwz1oc7hUQO+PrQ/XxUS77ECfK+wy532b8AQK+kW4AevaLmYAXkblZf2J1hicr
 QjEGiKpgmH9NfVypCQFLozD5gcPqSixAwmn+q10ujKqcOp7cwLAokynaNuLMzuLGKC7Y
 QJ7aE/iNgJXjoprecQ7XEwo1kSqokmWMxyTocCvgtFxWXACodvX05LKTIDCoDTlLRMqU
 iUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=67Ez8TZPnvD0ZjKP6DuJllUHVp1oHjwx3WYJEfIn8cs=;
 b=siR9cnNSEc+rKmb3u3A9vt6HiDJ7IlIERXnkQ1VbHwXGPfPLyYOFFKRLlqv8bO2CbR
 4GUJ5A2Ge9zegZBiB2W2kSpNKhNt7Ed0FQwL8fa4yL/OudeIohQDcxHU8CC163/2JJgk
 TmqsCoqNj9i9Fnrl2ISudIRGHcShSqUEu0RCe1WDRPtJeivB9lpb5o0xCiDIkXOUZmeM
 dNNgtLDwTI1Z0uL5WZfae1uhlynWvAE/wS1LqpHjdwaKkwM93l9X0fqyuW9AN86Oas/G
 4w1zcvrLIp7DEEJCl3mAn8q1gy93AYbXlBn/9uYGaHkJVyPCkJoNxIodWrcl6/FR5C4o
 h6Kw==
X-Gm-Message-State: AOAM532jZCnaXlF+zXo+jEwETRhho3Qq3FgQFxjXq18bf79JBpVnJvkm
 O+JgEdhP+LujLlFq2T4jZ361td+Fbt0=
X-Google-Smtp-Source: ABdhPJypBZlVwBDTdjigRwTcJ/TWxu5AHpi6w3wTW1nwRZtlZ9PPJ+dStxH/7lHag/Wg1L77H3Uflw==
X-Received: by 2002:a5d:4f8c:0:b0:20e:5f7c:db32 with SMTP id
 d12-20020a5d4f8c000000b0020e5f7cdb32mr4185964wru.596.1652969320023; 
 Thu, 19 May 2022 07:08:40 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:39 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:08:00 +0200
Message-Id: <20220519140810.1953601-11-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 10/20] package/erlang-p1-yconf: bump version
 to 1.0.12
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
 package/erlang-p1-yconf/erlang-p1-yconf.hash | 2 +-
 package/erlang-p1-yconf/erlang-p1-yconf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.hash b/package/erlang-p1-yconf/erlang-p1-yconf.hash
index 97e71f85cd..990f08dce9 100644
--- a/package/erlang-p1-yconf/erlang-p1-yconf.hash
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ab0f7462b8d03d18be1587fa9cfb227923055f765fca4459b4bb42ccef971329  erlang-p1-yconf-1.0.8.tar.gz
+sha256  e88f74c3950630e0ca7be41cbe2332d3ca600241f37779a862bdcc46f9031877  erlang-p1-yconf-1.0.12.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.mk b/package/erlang-p1-yconf/erlang-p1-yconf.mk
index 3e3a10ae15..682ca08ff2 100644
--- a/package/erlang-p1-yconf/erlang-p1-yconf.mk
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_YCONF_VERSION = 1.0.8
+ERLANG_P1_YCONF_VERSION = 1.0.12
 ERLANG_P1_YCONF_SITE = $(call github,processone,yconf,$(ERLANG_P1_YCONF_VERSION))
 ERLANG_P1_YCONF_LICENSE = Apache-2.0
 ERLANG_P1_YCONF_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
