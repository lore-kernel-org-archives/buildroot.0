Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CC8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A10DE82CC7;
	Mon, 16 May 2022 13:17:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LeyQcLFG4yaJ; Mon, 16 May 2022 13:17:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4B81819D1;
	Mon, 16 May 2022 13:17:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0A111BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCF1F40B44
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yrrzHUAQPGE for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:14:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E811840396
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:14:10 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r23so4454984wrr.2
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwvG7rNX0n8q8gwLTmVjjbizc8hMIPfwMOGQZaSseQQ=;
 b=K5+jWXoMxM5ZQUjbPIibn9gjiCQ+86pTQAdRcHJb8mWGC25q+jYG+OFNJQixw+fkDb
 ZdY+mtUFysB4PQNxtejN+WDOOZoapj30SIQxTTGN7aZce6KoPGmO5lpKnjC2ELuGxPkT
 ShxuqaZmJl+8cuJsfWz/i9MODvkpEVZUdNGBj9YKRIkjIXP2Ex7dOJRzg6XuP+tahRvd
 pf8Zyvrhu9Q+iobhAc/4HnlzcBOBvQXNes060aiCfro3xpjylrqaqo6B3yd1xEVD/34z
 hOn0XBaxaMGBaaIiOvZVVW3FsxyrjO7uV7pFZLRLF6Rt2jmIDa7miglP1P6MUdxdQGgg
 l66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwvG7rNX0n8q8gwLTmVjjbizc8hMIPfwMOGQZaSseQQ=;
 b=dPP8xM2etCTfUSGFmwrEfFBGJJpw7bbglAqQWHuPCMgfDDJgT0J8dFbxHIMxID5x9h
 xLE2wcL5usy0bf5bo3B7QJTZT/a0AOzrPHNZ5G6H/o8wq2p2qgWbFBFm3aGVm+E6fvak
 iOs1XmxIoDVqGxXLEOxhpgo83ON/CwBHCuzseZPww3cOuYhV8eoYCis6+YsSLurlqq2L
 SBqQDKIVlbJuIGrNOtGSR6GmHAsLSuu/4fGrQlyHGFJQ2xlqKEZcsTpen/z2m8rJb9gz
 a30Rq35T7SHuox2k7P5fIRd2FUhyMs3YoMnYCss8zLWKe8IgbfLWz9atkTIZjQAbDz1Q
 BFkQ==
X-Gm-Message-State: AOAM532O4+H6waPvKHaMoCS1VobzWLsyEYFzkAMx+qKhZ6LrdYF83cyh
 NO7+FJWJkdpg3zE9DLayxfzOvjw8boU=
X-Google-Smtp-Source: ABdhPJygrRzlu9vV3mUp8eaVmdVnGb8pjwsnoUWo3p61ZspfcuAU7cZmkBuQ+Q18rdo/DMwwv2jPMA==
X-Received: by 2002:adf:f012:0:b0:20d:80e:1170 with SMTP id
 j18-20020adff012000000b0020d080e1170mr4312641wro.401.1652706848838; 
 Mon, 16 May 2022 06:14:08 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:14:08 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:29 +0200
Message-Id: <20220516131334.1910858-16-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 15/20] package/erlang-jose: bump version to
 1.11.1
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
 package/erlang-jose/erlang-jose.hash | 4 ++--
 package/erlang-jose/erlang-jose.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-jose/erlang-jose.hash b/package/erlang-jose/erlang-jose.hash
index 71a1543d92..75e6f0a041 100644
--- a/package/erlang-jose/erlang-jose.hash
+++ b/package/erlang-jose/erlang-jose.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d55a9d3a1697833fed555a21f1aeb2727af88193995cb6ffa945d4b6749d0e8d erlang-jose-1.9.0.tar.gz
-sha256 6397e2bd9a35a64c1bb798b937071fbe49d90667f717e65c74a0d0fe93d5c1be LICENSE.md
+sha256  87cdcb9df6f943c97772e5d90bed87555a72c8957ce2cb901df259050e18e7bb  erlang-jose-1.11.1.tar.gz
+sha256  6397e2bd9a35a64c1bb798b937071fbe49d90667f717e65c74a0d0fe93d5c1be  LICENSE.md
diff --git a/package/erlang-jose/erlang-jose.mk b/package/erlang-jose/erlang-jose.mk
index 43ed22a9f7..b31a60aa3e 100644
--- a/package/erlang-jose/erlang-jose.mk
+++ b/package/erlang-jose/erlang-jose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JOSE_VERSION = 1.9.0
+ERLANG_JOSE_VERSION = 1.11.1
 ERLANG_JOSE_SITE = $(call github,potatosalad,erlang-jose,$(ERLANG_JOSE_VERSION))
 ERLANG_JOSE_LICENSE = MIT
 ERLANG_JOSE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
