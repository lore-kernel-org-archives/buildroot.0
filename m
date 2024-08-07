Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07ABC52D71
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 14:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93E636070A;
	Wed,  7 Aug 2024 14:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1LuTQMzfI_P; Wed,  7 Aug 2024 14:34:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E8F260A45
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E8F260A45;
	Wed,  7 Aug 2024 14:34:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 412971BF2BC
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F10E40275
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 14:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgTogZROHMKF for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 14:34:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=johan.oudinet@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 107F640273
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 107F640273
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 107F640273
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 14:34:40 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-428085a3ad1so13785755e9.1
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 07:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723041279; x=1723646079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4aTYJZUUOGdxPilc7wM4kw4fLIiJ/wjCEowkQt/gJQs=;
 b=Ckyz4dPF/uPvutC1MaOgG9KlYp9wPpxQ6QMJRi3lfc+LGRK8vDMs5VqICOf3GLE53V
 esBLGzACEBtOi3Eb2WWXO3YuvIdXgqmW4AN5DAjoDdQE2Ms4iWzhKtrZOQNzQRQtEnhu
 Kc2YuEnD9gOUnm3G0Wt4VjQw1uZxpuLOVApIZ1W6pa8SxMlEjA9Y9Rn/0jk2uqZMKgpT
 pbcXyKxNwV9Jc020FIy+a4zhxRjASRG1YfJhU/z6c400/Qu/G/mIUQEwb7XwsO73ncQq
 xc/Z55VgOExLzatC7gHZqXd017zEWN9Q22pXUH438snxvy0x+NGRmefHj5JcEbyGt9mz
 aKXA==
X-Gm-Message-State: AOJu0YwNqw5jt6kx648ro1cwCcLqVcwdXlhxhccSu+af7OUIUCo6fBNS
 hCanyJvG9wgHlPJjw8pjhC7Dgd0umLGBYaw+pFr4lgoZX/UtLnQaI4qjqA==
X-Google-Smtp-Source: AGHT+IEH7YEOeRviaLFU7ZEKOwPXIATUxNKNQA3aNoKugK8sqkr3xtqLGMegAnRt8GnZc4y8hefh7Q==
X-Received: by 2002:a05:600c:4ece:b0:426:5ee5:3130 with SMTP id
 5b1f17b1804b1-428e6ae2802mr114719105e9.3.1723041278726; 
 Wed, 07 Aug 2024 07:34:38 -0700 (PDT)
Received: from shrek.. ([2a01:e0a:acf:1a32:b409:e7b0:306e:2d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42905796a29sm33289995e9.10.2024.08.07.07.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 07:34:38 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 16:33:10 +0200
Message-Id: <20240807143318.439619-11-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807143318.439619-1-johan.oudinet@gmail.com>
References: <20240807143318.439619-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723041279; x=1723646079; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4aTYJZUUOGdxPilc7wM4kw4fLIiJ/wjCEowkQt/gJQs=;
 b=iL0lRrzaKW0fVdTOPhF3DoKCuAFH81MCJAprrCMsrxnRYAcRRbQyDDIV4JZYlP0SrK
 7VpJ5s7StN/2GRF/W4E11G8r1DDj28gkEWmwIfN3uc366BYMu4dX2wfft0KR3pt1b/Kd
 nQHxQzsVPvqN7GzN75mlD1m1pitRuCu9uA9hp3wbeoehA4inz3c2dh+o5yp4ydeI32g8
 ijzv9GBnmlMWy2tJZ2bFfIWfiFRRJdZvQLCeGTl7G3vwd1AKDSVi/u5wS9XhQMeruSOa
 kPkBW02zGbkxj3tmBrPnwl1VYtjPR/rczAXnwlpTHlPo+8012NOorTQgG1zGoPoN8WYL
 1/Sg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iL0lRrza
Subject: [Buildroot] [PATCH 10/18] package/erlang-p1-oauth2: bump version to
 0.6.14
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
 package/erlang-p1-oauth2/erlang-p1-oauth2.hash | 2 +-
 package/erlang-p1-oauth2/erlang-p1-oauth2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
index ac87485d5b..dd2f8782b7 100644
--- a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2a33d96ab007b77759f48613a65794351569e7d2d800700b71e50448eed0e3b8  erlang-p1-oauth2-0.6.11.tar.gz
+sha256  6437184239ea3053584834771776062c4e055e897dc6ca94dd8f960f393d891c  erlang-p1-oauth2-0.6.14.tar.gz
 sha256  0ecddd0a5e35b7fcdab451f54c5bb688fac8365cdf6b0da0ac64b7895a0770f3  LICENSE
diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.mk b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
index b01a391963..09bb0e6752 100644
--- a/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_OAUTH2_VERSION = 0.6.11
+ERLANG_P1_OAUTH2_VERSION = 0.6.14
 ERLANG_P1_OAUTH2_SITE = $(call github,processone,p1_oauth2,$(ERLANG_P1_OAUTH2_VERSION))
 ERLANG_P1_OAUTH2_LICENSE = MIT
 ERLANG_P1_OAUTH2_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
