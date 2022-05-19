Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73885C433EF
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FBC2843FD;
	Thu, 19 May 2022 14:12:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5kMfvSnvt8G; Thu, 19 May 2022 14:12:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 874FF842D5;
	Thu, 19 May 2022 14:12:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 502141BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D5DA41986
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PvRs36-Sx1cn for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57BD0415FA
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:48 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id f2so7391492wrc.0
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PaUbfKlMCCyxH+r+ZmKFA2/3cmizohWicIARkye0yTk=;
 b=CXJquPyFYU6Yu3gTH6Yr2Z6vDStX3Nc2SSax6PaaD2KJzsZUGRo6vezg2lYL868poK
 tri+e9Du07vmpi1wDp/3H1/Hdeay+W3SEGyai6Ea36XF/camQK3OEes7hgmMxhGjucnL
 TWjwvFjFc5NnGIpmmeUTA0WKfcsy+qjho5lplAopYHOKzz0EZ5DOsjuTICBjoS/ns0nS
 zIPHvBy3I3/+zG/rrtj3VeJ1ZKHD596TZcSWuPlLHbr4lVvch/qHMB5oRyIrjxN3MsuX
 at6c3pJGyt9tA1mQRadn6wubju1VRteoveHGDgZzd2xqDU++cJYFA5QhKqfbgTCx6IOS
 xFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PaUbfKlMCCyxH+r+ZmKFA2/3cmizohWicIARkye0yTk=;
 b=kNHQCQB9lwZjfzaegSNEyk4wGbwIJMvkXDqq1bW40IHHLT2tqpU77ZtlbujcW0rFmc
 t4YuM80/Mc0YiVvSVBw3V6dB+RbnReSFreH23G6BML2SQF6I5iWGUt9T20kpOp8ebHA2
 L5Af6mg+0LwLwqMa6YrpcfjvgFBAW7UN0jdunXnghYX137JEjZggUsED3IHrNYOVkVBk
 EAITacIta1M2B9QvlujQGj9aGHbvjPKlO2o2FDeVa56BV5qy3YVt2T7WdL2IsAmysm/O
 DNN8v31AAQrW5MCEy4HppmzuhBku5yCybyYg/bKSQ2QDe00y1o5owiLPFN6TZRSbtQ0w
 E/QA==
X-Gm-Message-State: AOAM532q8Elno1l7Ckd/Mo9uh65Wl20LWxk3VjfqBomLZEhoDEzySC6F
 TmSd1IHZDbgwNTnxFgL7UzAQXDBXD0g=
X-Google-Smtp-Source: ABdhPJwuSqZY+bT89AylmzdQWjEhhT20jThLNK5JJJQDDei8fQFYW90TKp7dztR201gp5s7UxzRHyQ==
X-Received: by 2002:a05:6000:38b:b0:20c:53af:747d with SMTP id
 u11-20020a056000038b00b0020c53af747dmr4077218wrf.22.1652969326293; 
 Thu, 19 May 2022 07:08:46 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:46 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:08:06 +0200
Message-Id: <20220519140810.1953601-17-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 16/20] package/erlang-p1-acme: bump version
 to 1.0.16
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

and remove the unnecessary patch.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 ...ipt-remove-extra-dependency-to-base6.patch | 26 -------------------
 package/erlang-p1-acme/erlang-p1-acme.hash    |  2 +-
 package/erlang-p1-acme/erlang-p1-acme.mk      |  2 +-
 3 files changed, 2 insertions(+), 28 deletions(-)
 delete mode 100644 package/erlang-p1-acme/0001-rebar.config.script-remove-extra-dependency-to-base6.patch

diff --git a/package/erlang-p1-acme/0001-rebar.config.script-remove-extra-dependency-to-base6.patch b/package/erlang-p1-acme/0001-rebar.config.script-remove-extra-dependency-to-base6.patch
deleted file mode 100644
index a27730e23c..0000000000
--- a/package/erlang-p1-acme/0001-rebar.config.script-remove-extra-dependency-to-base6.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a2422fdf4097d1f5f8c8f88bbe08b9a0f3c35fe6 Mon Sep 17 00:00:00 2001
-From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Wed, 25 Nov 2020 22:38:22 +0100
-Subject: [PATCH] rebar.config.script: remove extra dependency to base64url
-
-Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
----
- rebar.config.script | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/rebar.config.script b/rebar.config.script
-index a63895e..41b2970 100644
---- a/rebar.config.script
-+++ b/rebar.config.script
-@@ -62,7 +62,7 @@ Cfg2 = case IsRebar3 of
-                [{plugin_dir, filename:join([filename:dirname(SCRIPT),"plugins"])},
-                 {plugins, [override_deps_versions]}] ++
-                 ModCfg(CONFIG, [deps], fun(V) ->
--                   V ++ [{base64url, ".*", {git, "git://github.com/dvv/base64url.git", {tag, "v1.0"}}}]
-+                   V
-                 end, [])
-        end,
- 
--- 
-2.29.2
-
diff --git a/package/erlang-p1-acme/erlang-p1-acme.hash b/package/erlang-p1-acme/erlang-p1-acme.hash
index af13e88b1a..7cecb6dfc0 100644
--- a/package/erlang-p1-acme/erlang-p1-acme.hash
+++ b/package/erlang-p1-acme/erlang-p1-acme.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e17ba49f45b72200470bc2f176b315bec1028d07a4817859052f98c0a7259632  erlang-p1-acme-1.0.9.tar.gz
+sha256  58d4b7e97e677bd5a8aa3c1e52514a37cfa0985cad8b5f45cd05889843c4fdd9  erlang-p1-acme-1.0.16.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-acme/erlang-p1-acme.mk b/package/erlang-p1-acme/erlang-p1-acme.mk
index 21c155e206..c9cd1c4f33 100644
--- a/package/erlang-p1-acme/erlang-p1-acme.mk
+++ b/package/erlang-p1-acme/erlang-p1-acme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ACME_VERSION = 1.0.9
+ERLANG_P1_ACME_VERSION = 1.0.16
 ERLANG_P1_ACME_SITE = $(call github,processone,p1_acme,$(ERLANG_P1_ACME_VERSION))
 ERLANG_P1_ACME_LICENSE = Apache-2.0
 ERLANG_P1_ACME_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
