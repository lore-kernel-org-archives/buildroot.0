Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49308C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F226C40B4C;
	Mon, 16 May 2022 13:17:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1yPy2HprA87H; Mon, 16 May 2022 13:17:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F13A840B47;
	Mon, 16 May 2022 13:17:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CF821BF97F
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B0C040B47
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R395y4utMv7H for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:14:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8CB240396
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:14:12 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h14so815735wrc.6
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PaUbfKlMCCyxH+r+ZmKFA2/3cmizohWicIARkye0yTk=;
 b=MsFzrO+LbraHBO8Q/6iw0GFdS6vemruK93Bv0H63US7YB4Ab1gQ++oqsDx+RTJNSOs
 z2g1Qz1LaPpMJ0X2P4FXVmWPa4rGFOBySjD+KOY7OUF6uqcBoePAdsPDBg8uIFb4rROq
 UvyrKEgWR9vBvTys5aLEaAh0cjRQ+pvb+wJyYyz6gSlmFp3uDq2862g+tMyjuHJE8pCH
 jrGjhcKOL2YOar0aIiWtI6Vyf/2PSD9F2m0BmOGG/YW2dkZAmcxSzT8Qb/cG8HxyNGy0
 E1JdlZjBr1NXHzf2aSLv0i46/Voj8ALW9Htafj7N6S2NAw521SflPVAI9qZpdi7Q5E75
 4Aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PaUbfKlMCCyxH+r+ZmKFA2/3cmizohWicIARkye0yTk=;
 b=XLDD3PDJslhkj3z75A8tinc0ZiZRT+2ZFGx3QN10TJSxJI0Fqdl179F9+2P8Z2AMRK
 i4KKecB9r2M5ZAijF3j4iRKVCnYYyjBIqGzlqNVFWmAJpOyBYWGAaoKzggcthRyLsHA6
 +Ddj5bUqt8v61aU+da/kGrFBJHWjfMZ3rmNdoo9eeOP97PjfbW/oDeGdC5waOIw3Z6lS
 cUDDQI3bKzMJ3QKcACmWETt472sQzmVvSXhybVHXu5PoCOh0GUbSwOvp+JiprmG+ms2G
 CzMuXElbR9DsFcTxCEw8VP5cUAYXPu94Y+e7J5f9JtBCmvH2FbQmDxpvYdVUmUgFiczS
 EHuA==
X-Gm-Message-State: AOAM533CkS+OuTm3Z2hKXsPkcTygKCZJRXGvz5rwFBLSJdWIMhfaVl8W
 Iopa7XbzTm1gPBexlcUSD5IMIG4V6jU=
X-Google-Smtp-Source: ABdhPJx+h67BbPcnGvdrAgVfRAkfLYgspd5o/ei2N1wH5amNthlSLfEbUtIA7gmh8CfxtzGRHZhvnA==
X-Received: by 2002:a5d:6351:0:b0:20d:1028:3c32 with SMTP id
 b17-20020a5d6351000000b0020d10283c32mr1457057wrw.331.1652706850773; 
 Mon, 16 May 2022 06:14:10 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:14:10 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:30 +0200
Message-Id: <20220516131334.1910858-17-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 16/20] package/erlang-p1-acme: bump version to
 1.0.16
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
