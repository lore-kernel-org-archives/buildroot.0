Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB5EEE3F3F
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 22:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 994A841B84;
	Tue, 12 Sep 2023 22:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 994A841B84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LHlsnsAbO77a; Tue, 12 Sep 2023 22:16:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CAC841B8C;
	Tue, 12 Sep 2023 22:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CAC841B8C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4ACAF1BF831
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 22:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8487B60E7A
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 22:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8487B60E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGEgM-Rtozal for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 22:15:56 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB2F960E6F
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 22:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB2F960E6F
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31c73c21113so5828863f8f.1
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 15:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694556955; x=1695161755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pYVgaplBMrSRYGjISsMcKFMKP3Mco222h5G/5p/KCJ0=;
 b=F1Irqo6DvKfZSVUbcje+vhpAlWdJV/Rp0HAGVPbBwSe6dRzem+5fxqPHafre20nLQv
 zdajm3ewqJPA10GXFE8Lj4I4YSEIqBC82eBEIauq99J4QPAxuhnccG2Ify+LukUGEQ56
 Q5qi8yFPccmFjs5krSLNsBnEMWlfyxccblGjnKdDlEYqEN5J1TfwIP1ueI+WT3R78XHk
 4tzjXTI0t8J1vpgcWveBzvgwAFKsTugRssXoBfd0XccE9bRajY0IIYYx1rucf1dSEt29
 urtj4fxGC8mwOsK+EjsFCZSXurX4vQWWTqyrnQaOzx78lvBDtQn6T3hyitO9XmKBqrMi
 c2PQ==
X-Gm-Message-State: AOJu0Yw4J8LvrPvgScz6dW/DY0Pw/Ic6n7pyQD5W6UZ/LXayvjI1e7Q3
 Y3mJ/3zT+A46O2IH+1IDYHJzTomrOOo=
X-Google-Smtp-Source: AGHT+IGPGnJdMEkEJLTNRqKX0P1DsI1s9nGPclEYQS02CMmzLAPaR2LUAMijMLDGwgU1hLORYTuxQw==
X-Received: by 2002:a5d:4bcb:0:b0:31c:8b99:47bf with SMTP id
 l11-20020a5d4bcb000000b0031c8b9947bfmr548525wrt.41.1694556954754; 
 Tue, 12 Sep 2023 15:15:54 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b44:b00:d377:8b3f:c881:5464])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a5d67c7000000b0031423a8f4f7sm13901170wrw.56.2023.09.12.15.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 15:15:54 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 00:15:50 +0200
Message-Id: <899835786b45f8576e62061b2a6a9a16751feb46.1694556946.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1694556946.git.yann.morin.1998@free.fr>
References: <cover.1694556946.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694556955; x=1695161755; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pYVgaplBMrSRYGjISsMcKFMKP3Mco222h5G/5p/KCJ0=;
 b=Z/YjhuKqJdtFUbsv48/JpNeOLRmyeWV7hGB+HKeo3dPJQKbAlwcAuSpR6cHIGANFeN
 Kv8ogr8KEV3HghDkZnq79dirUXRbLtwHCV7UE7wiouwT6JILWjGusfg0+4Vzk5rAWnL1
 C/HNR5mtF3FaQOpoMctgvPPjDAySCg41QHXmySYlne7jul+XZoCLp8f5iR7aCN5guZLA
 Ht5T8IaY+ZD72hTrl/vUK1wGt3FccnPZRfp8cj/Tq21vzM33I8hr8xXvUc2vzAxvUvC7
 fDNQJaYQF56Ts8bM+3rKYgfCks9/iYIZK4TAWBKe/7lXuIXp6siJrzLNrXwmjGJfO6lN
 9VBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Z/YjhuKq
Subject: [Buildroot] [PATCH 3/5] support/download/git: properly catch
 failures
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit b7efb43e86da (download/git: try to recover from
utterly-broken repositories), we catch errors through an ERR
trap, so we can try and recover from a broken repository. In
that commit, we switched from using "set -e" to "set -E", so
that trap is inherited in functions, command substitutions,
and subshells.

However, the trap is not defined until we have parsed the
options, created the cache directory, and eventually chdir()ed
into it. Athough improbable, it is possible for the git helper
to fail in any of those steps, and that would not get caught.

Fix that

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/download/git | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/download/git b/support/download/git
index 1a1c315f73..729c553f8f 100755
--- a/support/download/git
+++ b/support/download/git
@@ -5,8 +5,8 @@
 # (e.g. tar options, compression ratio or method)), we MUST update the format
 # version in the variable BR_FMT_VERSION_git, in package/pkg-download.mk.
 
-# We want to catch any unexpected failure, and exit immediately
-set -E
+# We want to catch any unexpected failure
+set -e
 
 # Download helper for git, to be called from the download wrapper script
 #
@@ -77,6 +77,7 @@ pushd "${git_cache}" >/dev/null
 
 # Any error now should try to recover
 trap _on_error ERR
+set -E
 
 # Caller needs to single-quote its arguments to prevent them from
 # being expanded a second time (in case there are spaces in them)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
